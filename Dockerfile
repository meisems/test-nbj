# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application in Tomcat
FROM tomcat:9.0-jdk17-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the correct WAR file
COPY --from=build /target/NBJ-Repair-Center.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
