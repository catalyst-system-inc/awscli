FROM alpine:latest

ENV LANG C.UTF-8

# タイムゾーンの設定
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

RUN apk --update add tzdata \
	bash \
        git && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /aws && \
    apk -Uuv add groff less python py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \	
    rm /var/cache/apk/*

WORKDIR /aws
ENTRYPOINT ["aws"]
