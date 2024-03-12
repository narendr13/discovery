FROM tomcat

# Copy the WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/workspace/sample/discovery-server/target/*SNAPSHOT.jar /usr/local/tomcat/webapps/

# Optionally, you can expose the port your application runs on
EXPOSE 8080

# Optionally, you can define environment variables
# ENV ENVIRONMENT production

# Optionally, you can specify commands to run when the container starts
CMD ["catalina.sh", "run"]
