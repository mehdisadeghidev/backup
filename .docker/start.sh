#!/bin/sh

set -e

pg_dump ${DATABASE_URL} > /tmp/dump.sql

aws --endpoint-url ${AWS_ENDPOINT} s3 cp /tmp/dump.sql s3://${AWS_BUCKET}/$(date -u +"%Y-%m-%dT%H-%M").sql

rm /tmp/dump.sql
