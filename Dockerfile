FROM gradle:6.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn:3.10.1-dev-1934500025
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
