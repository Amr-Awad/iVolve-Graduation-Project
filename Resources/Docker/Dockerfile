# Build stage
FROM gradle:jdk17-alpine AS builder
WORKDIR /app

# Copy Gradle wrapper and build files first (for better caching)
COPY build.gradle settings.gradle gradlew ./
COPY gradle ./gradle
COPY src ./src

# Ensure gradlew has correct Unix line endings, execute permissions for gradlew, Download dependencies first to leverage caching, and Build the application
RUN sed -i 's/\r$//' gradlew && chmod +x ./gradlew && ./gradlew dependencies --no-daemon && ./gradlew build --no-daemon

# Runtime stage - using JRE for smaller size
FROM eclipse-temurin:17-jre-alpine AS runtime
WORKDIR /app

# Copy only the built JAR to reduce image size
COPY --from=builder /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
