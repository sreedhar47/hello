# Stage 1: Build the application
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Stage 2: Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/HelloAPI.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]