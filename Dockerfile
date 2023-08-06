FROM alpine:3.18.2

LABEL maintainer="petr@slajchrt.cz"

ENV USER=minidlna \
    GROUP=minidlna \
    UID=1000 \
    GID=1000

RUN addgroup --gid "$GID" "$GROUP" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "/var/run/minidlna" \
    --ingroup "$GROUP" \
    --no-create-home \
    --uid "$UID" \
    "$USER"

RUN apk update && apk add --no-cache minidlna

RUN mkdir -p /var/run/minidlna
RUN chown -R "$USER":"$GROUP" /var/run/minidlna

USER $USER
WORKDIR /var/run/minidlna

EXPOSE 8200

CMD [ "minidlnad", "-d" ]
