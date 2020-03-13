# Container image that runs your code
FROM alpine

RUN apk --no-cache add curl wget git bash jq
COPY entrypoint.sh /entrypoint.sh


RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]