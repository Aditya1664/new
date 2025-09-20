# Stage 1: Build the Java application
FROM openjdk:11-jdk-slim as builder
WORKDIR /app
COPY . .
RUN javac Main.java

# Stage 2: Create the final, lightweight image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/Main.class .

CMD ["java", "Main"]