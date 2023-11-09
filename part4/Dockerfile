# Используем официальный nginx образ в качестве базового образа
FROM nginx

USER root

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /home

# Копируем зависимости/пакеты проекта в образ
COPY ./server/nginx/nginx.conf           /etc/nginx/nginx.conf
COPY ./server/main.c              /home/
COPY ./compile_run_mini_server.sh /home/

# Устанавливаем зависимости проекта
RUN apt-get update && apt-get install --yes gcc spawn-fcgi libfcgi-dev vim

# Запускаем compile_run_mini_server
CMD ["/home/compile_run_mini_server.sh"]
