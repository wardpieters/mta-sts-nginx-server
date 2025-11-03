#!/bin/sh

if [ -z "${MTA_STS_MX}" ]; then
    echo "Error: MTA_STS_MX environment variable is not set."
    exit 1
fi

MTA_STS_FILE="/app/.well-known/mta-sts.txt"

mkdir -p /app/.well-known && \
    echo "version: ${MTA_STS_VERSION:-STSv1}" >> $MTA_STS_FILE && \
    echo "mode: ${MTA_STS_MODE:-enforce}" >> $MTA_STS_FILE

for mx in $(echo ${MTA_STS_MX} | tr ',' ' '); do
    echo "mx: ${mx}" >> $MTA_STS_FILE
done

echo "max_age: ${MTA_STS_MAX_AGE:-86400}" >> $MTA_STS_FILE

exec "$@"
