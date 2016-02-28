FROM python:3.5-alpine

RUN mkdir -p /usr/src/app/gdom
WORKDIR /usr/src/app/gdom

COPY . /usr/src/app/gdom

RUN apk --update add libxslt && \
    apk --update add --virtual build-dependencies libxml2-dev libxslt-dev build-base && \
    pip install --upgrade --no-cache-dir -r requirements.txt && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

CMD [ "python", "gdom/cmd.py", "--test" ]
