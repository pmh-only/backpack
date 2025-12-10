#!/bin/sh

dump() {
  mysqldump \
    -h $DATABASE_HOST \
    -u $DATABASE_USER \
    -P $DATABASE_PORT \
    -p"$DATABASE_PASSWORD" \
    --all-databases --single-transaction --quick \
    --add-drop-table --complete-insert --system=users --flush-privileges > /tmp/dump.out

  aws s3 cp \
    /tmp/dump.out \
    s3://$S3_DUMP_URI/$(date +%Y-%m-%dT%H:%M:%S).sql \
    --endpoint-url $S3_ENDPOINT_URL
}

if [[ $1 == "now" ]]; then
  echo "Wait 30 seconds for mysql bootstrap"
  sleep 30

  dump
  sleep infinity
fi

while true; do
  now_sec=$(date +%H)
  now_min=$(date +%M)
  now_sec=$((now_sec*3600 + now_min*60 + $(date +%S)))

  target_sec=$((3*3600))

  if [ "$now_sec" -lt "$target_sec" ]; then
    sleep_sec=$(( target_sec - now_sec ))
  else
    sleep_sec=$(( 24*3600 - now_sec + target_sec ))
  fi

  echo "Sleeping for $sleep_sec seconds until next 03:00"
  sleep "$sleep_sec"

  # Run your job
  echo "Running task at $(date)"
  dump
done
