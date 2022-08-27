FROM debian:unstable-slim

RUN apt update

EXPOSE 53 8080
CMD tail -f /dev/null