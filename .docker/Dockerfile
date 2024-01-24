FROM alpine:3.19

WORKDIR /src

RUN apk add --no-cache \
    postgresql-client \
    aws-cli

COPY .docker/start.sh .
RUN chmod +x start.sh

RUN crontab -l | { cat; echo "0 */6 * * * /src/start.sh"; } | crontab -

CMD ["crond", "-f"]
