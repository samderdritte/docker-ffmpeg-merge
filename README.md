# docker-ffmpeg-merge

Docker container which uses ffmpeg to merge multiple files in an AWS S3 bucket. Uses FFmpeg to do the video conversion

## Build image

```bash
docker build -t spychers/docker-ffmpeg-merge .
```

## Run
```bash
docker run \
    -e OUTPUT_FILE_NAME='output.mp4' \
    -e S3_BUCKET_NAME='s3-bucket-name' \
    -e S3_PREFIX='directory/subdirectory/' \
    -e AWS_REGION='eu-central-1' \
    -e AWS_ACCESS_KEY_ID='XXXXXXXXXXXX' \
    -e AWS_SECRET_ACCESS_KEY='XXXXXXXXXXXX' \
    -e AWS_SESSION_TOKEN='XXXXXXXXXXXX' \
    spychers/docker-ffmpeg-merge
```
After running the above command, the script merges all video files in the designated S3 bucket+prefix and stores them in the same location.
