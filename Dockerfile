FROM postgres:alpine

ENV POSTGRES_DB=green_it
ENV POSTGRES_USER=green_it
ENV POSTGRES_PASSWORD=Sun7-Password

COPY sql /docker-entrypoint-initdb.d