FROM alpine

RUN apk add --no-cache curl ca-certificates
ADD *.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
