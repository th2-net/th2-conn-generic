FROM gradle:6.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn:4.0.0-TH2-4572-do-not-publish-event-when-message-is-sent-3759790452-ad9de99
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
