# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application in Tomcat
FROM tomcat:9.0-jdk17-openjdk-slim
# Remove default Tomcat apps to stay lightweight
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy the WAR file from the build stage to the Tomcat webapps folder
# Replace 'NBJ-Repair-Center.war' with the actual name of your generated WAR file
COPY --from=build /target/NBJ-Repair-Center.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
