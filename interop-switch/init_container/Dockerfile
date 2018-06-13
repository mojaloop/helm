FROM alpine:3.7

RUN apk add --no-cache postgresql-client

RUN mkdir /db-init
COPY setup.sh /db-init/setup.sh
COPY create_tables.sql /db-init/create_tables.sql
RUN chmod 755 /db-init/*.*

WORKDIR /db-init
CMD sh setup.sh