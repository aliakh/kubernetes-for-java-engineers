# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Copy only the Jar from the current dir
ADD build/libs/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]
