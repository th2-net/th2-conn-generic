FROM gradle:7.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn-sailfish:4.0.0-fix-double-subscribe-6448945047-5bff294
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
