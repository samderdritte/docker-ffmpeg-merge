#!/usr/bin/env bash

echo "Fetching file names from ${S3_BUCKET_NAME}/${S3_PREFIX} ..."

file_list=()
while IFS= read -r line; do
    file_list+=( "$line" )
done < <( aws s3api list-objects-v2 --bucket ${S3_BUCKET_NAME} --prefix ${S3_PREFIX} --output text --query "Contents[].{Key: Key}" )
#done < <( aws s3api list-objects --bucket 'streaming-cloud-crec-test' --prefix 'output/20230614' --output text --query "Contents[].{Key: Key}" )

echo "Preparing signed s3 urls ..."

signed_file_list=()
for t in ${file_list[@]}; do
    while IFS= read -r line; do
        signed_file_list+=( "$line" )
    done < <(aws s3 presign s3://${S3_BUCKET_NAME}/$t --region ${AWS_REGION})
done

echo "Saving files to filelist.txt ..."

for s in ${signed_file_list[@]}; do
    echo file \'$s\' >> ./filelist.txt
done