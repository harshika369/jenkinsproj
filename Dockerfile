# Step 1: Use Tomcat instead of just Java
FROM tomcat:9.0-jdk17-corretto

# Step 2: Remove the default Tomcat web apps to keep it clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your .war file into the Tomcat webapps folder
# Tomcat will automatically "explode" (unzip) and run this file
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Step 4: Expose the default Tomcat port
EXPOSE 8080

# Tomcat starts automatically, so we don't need a complex ENTRYPOINT
CMD ["catalina.sh", "run"]
