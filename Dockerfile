FROM gradle:6.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn-sailfish:4.0.0-dev-version-4-4113294770-6d25069
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
