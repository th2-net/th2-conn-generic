FROM gradle:7.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn-sailfish:4.0.1-fix-sending-6479293231-a5d94c6
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
