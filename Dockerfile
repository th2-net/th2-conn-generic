FROM gradle:7.3.2-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn:3.9.0
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
