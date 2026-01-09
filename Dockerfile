FROM debian:13.2

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y \
    golang-go \
    && apt-get clean

# Копируем deb-пакет
COPY PR_1.0.deb /PR_1.0.deb

# Устанавливаем пакет
RUN dpkg -i /PR_1.0.deb || apt-get install -f -y

# При запуске подаём "2" в stdin для выбора автозаполнения
CMD echo "2" | /usr/local/bin/TRRSPO

