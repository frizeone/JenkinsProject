#! /bin/bash
echo "Deploying the application..."

# Печатаем текущую директорию
echo "Current directory: $(pwd)"

# Пытаемся найти JAR-файл в директории target
JAR_FILE=$(find target -name "*.jar")

if [ -z "$JAR_FILE" ]; then
    echo "JAR file not found!"
    exit 1
else
    echo "Found JAR file: $JAR_FILE"
    java -jar "$JAR_FILE"  # Запускаем приложение
fi
