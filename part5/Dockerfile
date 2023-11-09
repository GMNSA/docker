# Используем официальный nginx образ в качестве базового образа
FROM alpine:3.14
HEALTHCHECK CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /home

# Копируем зависимости/пакеты проекта в образ
COPY ./server/nginx.conf                /etc/nginx/nginx.conf
COPY ./server/main.c                    /home/main.c
COPY ./compile_run_mini_server.sh       /home/compile_run_mini_server.sh

# Устанавливаем зависимости проекта
RUN apk update && apk add --no-cache nginx gcc spawn-fcgi fcgi-dev vim fcgi musl-dev

RUN chown -R nginx:nginx  /var/run/  /etc/nginx/ /home/ /var/lib/nginx/ /etc/nginx/
RUN chmod -R 0755  /var/run/  /etc/nginx/ /home/ /var/lib/nginx/ /etc/nginx/

# Переключаеся на нового юзера
USER nginx

# Запускаем compile_run_mini_server
CMD ["sh", "/home/compile_run_mini_server.sh"]
