#! /bin/bash
echo "Deploying the application..."

# Печатаем текущую директорию
echo "Current directory: $(pwd)"

# Проверка наличия директории target
if [ ! -d "target" ]; then
    echo "Target directory not found!"
    exit 1
fi

# Пытаемся найти JAR-файл в директории target
JAR_FILE=$(find target -name "*.jar" -print -quit)

if [ -z "$JAR_FILE" ]; then
    echo "JAR file not found!"
    exit 1
else
    echo "Found JAR file: $JAR_FILE"
    # Запуск JAR-файла в фоновом режиме
    java -jar "$JAR_FILE" > deploy.log 2>&1 &

    # Проверка успешности запуска
    if [ $? -eq 0 ]; then
        echo "Application started successfully."
    else
        echo "Application failed to start."
        exit 1
    fi
fi

exit 0
