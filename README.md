# Backpack
Some shell scripts for backing up my homelab services

## Images
All database related images require admistrative access

### clickhouse2s3
Backups clickhouse database dump to s3 api

```bash
docker run -it --net=host \
  -e TZ=Asia/Seoul \
  -e RUN_AT=03:00 \
  -e DATABASE_HOST=127.0.0.1 \
  -e DATABASE_PORT=8123 \
  -e DATABASE_USER=admin \
  -e DATABASE_PASSWORD=password \
  -e S3_ENDPOINT_URL=http://s3.internal:8080/bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-clickhouse2s3
```

or you can run backup now by appending `now` argument

```bash
docker run -it --net=host \
  -e DATABASE_HOST=127.0.0.1 \
  -e DATABASE_PORT=8123 \
  -e DATABASE_USER=admin \
  -e DATABASE_PASSWORD=password \
  -e S3_ENDPOINT_URL=http://s3.internal:8080/bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-clickhouse2s3 now
```

### mongo2s3
Backups mongo database dump to s3 api

```bash
docker run -it --net=host \
  -e TZ=Asia/Seoul \
  -e RUN_AT=03:00 \
  -e DATABASE_HOST=127.0.0.1 \
  -e DATABASE_PORT=27017 \
  -e DATABASE_USER=admin \
  -e DATABASE_PASSWORD=password \
  -e S3_ENDPOINT_URL=http://s3.internal:8080 \
  -e S3_DUMP_URI=bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-mongo2s3
```

or you can run backup now by appending `now` argument

### mysql2s3
Backups mysql database dump to s3 api

```bash
docker run -it --net=host \
  -e TZ=Asia/Seoul \
  -e RUN_AT=03:00 \
  -e DATABASE_HOST=127.0.0.1 \
  -e DATABASE_PORT=3306 \
  -e DATABASE_USER=admin \
  -e DATABASE_PASSWORD=password \
  -e S3_ENDPOINT_URL=http://s3.internal:8080 \
  -e S3_DUMP_URI=bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-mysql2s3
```

or you can run backup now by appending `now` argument

### pgsql2s3
Backups postgresql database dump to s3 api

```bash
docker run -it --net=host \
  -e TZ=Asia/Seoul \
  -e RUN_AT=03:00 \
  -e DATABASE_HOST=127.0.0.1 \
  -e DATABASE_PORT=5432 \
  -e DATABASE_USER=admin \
  -e DATABASE_PASSWORD=password \
  -e S3_ENDPOINT_URL=http://s3.internal:8080 \
  -e S3_DUMP_URI=bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-pgsql2s3
```

or you can run backup now by appending `now` argument

### bitwarden2s3
Backups postgresql database dump to s3 api

```bash
docker run -it --net=host \
  -e TZ=Asia/Seoul \
  -e RUN_AT=03:00 \
  -e BW_URL=https://bitwarden.internal:443 \
  -e BW_PASSWORD=masterpassword \
  -e BW_CLIENTID=clientid \
  -e BW_CLIENTSECRET=clientsecret \
  -e S3_ENDPOINT_URL=http://s3.internal:8080 \
  -e S3_DUMP_URI=bucket_name/prefix_without_last_slash \
  -e AWS_ACCESS_KEY_ID=accesskeyid \
  -e AWS_SECRET_ACCESS_KEY=secretaccesskey \
  -e AWS_REGION=us-east-1 \
  ghcr.io/pmh-only/backpack-bitwarden2s3
```

or you can run backup now by appending `now` argument
