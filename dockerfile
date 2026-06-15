#syntax=docker/dockerfile:1

FROM nickblah/lua:5.4

WORKDIR /src/app/

COPY ./src/ /src/app/src/

CMD lua ./src/main.lua
