FROM alpine:3.10 as runtime

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh
COPY test.sh /test.sh

ENTRYPOINT ["/entrypoint.sh"]
