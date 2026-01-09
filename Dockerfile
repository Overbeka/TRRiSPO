FROM debian:13.2

# Обновление системы и установка зависимостей
RUN apt-get update && \
    apt-get install -y sudo dpkg curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Копируем deb-пакет внутрь контейнера
COPY PR_1.0.deb /tmp/PR_1.0.deb

# Устанавливаем пакет
RUN dpkg -i /tmp/PR_1.0.deb || apt-get install -fy

# Задаем рабочую директорию
WORKDIR /usr/local/bin

# Запуск по умолчанию
CMD ["TRRSPO"]

