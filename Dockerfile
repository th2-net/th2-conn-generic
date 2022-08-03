FROM gradle:6.6-jdk11 AS build
COPY ./ .
RUN gradle --no-daemon clean dockerPrepare

FROM ghcr.io/th2-net/th2-conn:4.0.0-th2-2150-books-pages-3758167560-216e4e8
ARG project_name
WORKDIR /home
COPY --from=build /home/gradle/${project_name}/build/docker .
