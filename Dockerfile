FROM tomcat:latest

# Copy the WAR file into the webapps directory of Tomcat
COPY your_application.war /usr/local/tomcat/webapps/

# Optionally, you can expose the port your application runs on
EXPOSE 8080

# Optionally, you can define environment variables
# ENV ENVIRONMENT production

# Optionally, you can specify commands to run when the container starts
CMD ["catalina.sh", "run"]
