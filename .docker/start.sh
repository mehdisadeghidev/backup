#!/bin/sh

set -e

pg_dump -Fc -Z9  --file=file.dump ${DATABASE_URL}

aws --endpoint-url ${AWS_ENDPOINT} s3 cp file.dump s3://${AWS_BUCKET}/$(date -u +"%Y-%m-%dT%H-%M").dump

rm file.dump
