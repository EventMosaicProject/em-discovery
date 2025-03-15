# Этап сборки Eureka сервера (Service Discovery)
FROM openjdk:21-jdk-slim AS builder

WORKDIR /app

# Копируем файлы Gradle и конфигурации проекта
COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts .
COPY settings.gradle.kts .
COPY gradle.properties .

# Копируем исходный код сервиса
COPY src src

# Собираем jar-файл приложения
RUN chmod +x gradlew && ./gradlew bootJar

# Финальный этап: формирование образа для запуска Eureka сервера
FROM openjdk:21-jdk-slim
WORKDIR /app

# Создаем директорию для логов
RUN mkdir -p /app/logs && chmod 777 /app/logs

# Копируем собранный jar-файл
COPY --from=builder /app/build/libs/*.jar app.jar

# Порт для Eureka сервера
EXPOSE 8761

# Запуск Eureka сервера
CMD ["java", "-jar", "app.jar"]