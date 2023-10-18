FROM gradle:8.1-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn-sailfish:3.11.0
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
