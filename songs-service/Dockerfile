# Smaller OS footprint using JRE
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

ADD build/libs/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]
