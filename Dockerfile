FROM gradle:7.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn-sailfish:4.0.0-th2-5045-6024051369-54aaf6b
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
