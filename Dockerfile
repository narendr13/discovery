FROM tomcat:latest

# Copy the WAR file into the webapps directory of Tomcat
COPY *.war /usr/local/tomcat/webapps/

# Optionally, expose the port your application runs on
# EXPOSE 8080
