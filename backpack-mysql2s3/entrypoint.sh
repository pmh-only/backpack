#!/bin/bash

export TZ="Asia/Seoul"

while true; do
  now=$(date +%s)
  target=$(date -d "03:00" +%s)

  if [ "$now" -ge "$target" ]; then
    target=$(date -d "tomorrow 03:00" +%s)
  fi

  sleep_sec=$(( target - now ))

  echo "Sleeping for $sleep_sec seconds until 03:00 KST"
  sleep "$sleep_sec"

  echo "Running task at $(date)"

  mysqldump \
    -h $DATABASE_HOST \
    -P $DATABASE_PORT \
    -p"$DATABASE_PASSWORD" \
    --all-databases --single-transaction --quick \
    --add-drop-table --complete-insert --system=users --flush-privileges > /tmp/dump.out

  aws s3 cp \
    /tmp/dump.out \
    s3://$S3_DUMP_URI/$(date +%Y-%m-%dT%H:%M:%S).sql \
    --endpoint-url $S3_ENDPOINT_URL

done
