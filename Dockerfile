
FROM balenalib/raspberrypi3-alpine:latest-build
ENV VERSION=v4.22.1
ENV URL=https://github.com/v2ray/v2ray-core/releases/download/${VERSION}/v2ray-linux-arm.zip
RUN mkdir v2ray &&\ 
    wget $URL -O v2ray-linux-arm.zip &&\
    unzip -d v2ray v2ray-linux-arm.zip


FROM balenalib/raspberrypi3-alpine:latest-run
COPY --from=0 /v2ray/v2ray /usr/bin/v2ray
COPY --from=0 /v2ray/v2ctl /usr/bin/v2ctl
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]
