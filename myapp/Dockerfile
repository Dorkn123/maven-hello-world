# Start with a base image containing Java runtime
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file to the container
COPY target/*.jar app.jar

# Run the jar file 
ENTRYPOINT ["java","-jar","app.jar"]
