FROM eclipse-temurin:11-jdk-alpine AS builder
# FROM openjdk:8-alpine AS builder
WORKDIR /app
COPY gradle gradle
COPY src src
COPY build.gradle .
COPY elasticsearch-jaso-analyzer.iml .
COPY gradlew .
COPY gradlew.bat .
RUN sh gradlew clean build buildPluginZip

FROM scratch AS output
COPY --from=builder /app/build/distributions .