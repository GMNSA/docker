# Используем официальный nginx образ в качестве базового образа
FROM alpine:latest
HEALTHCHECK CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /home

# Копируем зависимости/пакеты проекта в образ
COPY ./server/nginx/nginx.conf          /etc/nginx/nginx.conf
COPY ./server/main.c                    /home/
COPY ./compile_run_mini_server.sh       /home/

# Устанавливаем зависимости проекта
RUN apk update && apk add --no-cache nginx gcc spawn-fcgi fcgi-dev vim
USER user_part5

# Запускаем compile_run_mini_server
CMD ["/home/compile_run_mini_server.sh"]
