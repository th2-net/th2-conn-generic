FROM gradle:6.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn:3.11.0-TH2-4641-adding-retry-onStart-4241007377-5a6bf32
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .