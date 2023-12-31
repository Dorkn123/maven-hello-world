# Stage 1: Build the application
FROM maven:3.6.3-jdk-11 as build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create the final runtime image
FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
