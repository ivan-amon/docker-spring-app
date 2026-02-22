# STAGE 1: Compilation (Builder with JDK)
FROM eclipse-temurin:25-jdk AS builder

WORKDIR /app

COPY mvnw pom.xml ./
COPY .mvn .mvn/

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw clean package -DskipTests

# STAGE 2: Prod (Runtime with JRE)
FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]

