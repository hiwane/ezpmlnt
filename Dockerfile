FROM alpine:latest

COPY hreftgt.sh /hreftgt.sh
COPY html5.sh html5.sh
COPY main.sh main.sh

ENTRYPOINT ["/main.sh"]


