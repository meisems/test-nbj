# Stage 1: Build the WAR using Maven
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run in Tomcat 10
FROM tomcat:10.1-jdk17-openjdk-slim

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file to the webapps folder as ROOT.war
# This ensures your site opens at the base URL (e.g., your-app.onrender.com)
COPY --from=build /target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
