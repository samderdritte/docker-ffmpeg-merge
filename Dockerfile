FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install ffmpeg python-dev python-pip -y && \
    apt-get clean

RUN pip install awscli

WORKDIR /tmp/workdir

COPY prepare_parts.sh /tmp/workdir

COPY upload_output.sh /tmp/workdir

RUN touch /tmp/workdir/filelist.txt

RUN ["chmod", "+x", "/tmp/workdir/prepare_parts.sh"]

RUN ["chmod", "+x", "/tmp/workdir/upload_output.sh"]

ENTRYPOINT ./prepare_parts.sh && ffmpeg -f concat -safe 0 -protocol_whitelist file,http,https,tcp,tls -i ./filelist.txt -map 0:v -map 0:a -c copy ${OUTPUT_FILE_NAME} && ./upload_output.sh
