FROM python:3.11.0a7-alpine3.14

WORKDIR /srv/app
ADD . ./
COPY requirements.txt ./
RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

CMD [ "python", "./web.py" ]

EXPOSE 80
