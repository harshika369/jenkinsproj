# Step 1: Use Java 17 (Matching your Ubuntu setup)
FROM eclipse-temurin:17-jdk-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy the .war file from the target folder to the container
# Jenkins Maven build creates this in the 'target' directory
COPY target/*.war app.war

# Step 4: Run the application
ENTRYPOINT ["java", "-jar", "app.war"]
