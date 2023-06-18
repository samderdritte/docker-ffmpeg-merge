#!/usr/bin/env bash

echo "Uploading ${OUTPUT_FILE_NAME} to S3 at ${S3_BUCKET_NAME}/${S3_PREFIX}${OUTPUT_FILE_NAME} ..."
aws s3 cp ./${OUTPUT_FILE_NAME} s3://${S3_BUCKET_NAME}/${S3_PREFIX}${OUTPUT_FILE_NAME} --region ${AWS_REGION}