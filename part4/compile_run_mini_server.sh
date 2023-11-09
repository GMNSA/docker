#!/bin/bash

function compile_mini_server() {
    echo [Creating mini_server...]
    gcc main.c -o mini_server.out -lfcgi
    printf "\33[92m[OK] compile_mini_server\33[0m\n"
}

function run_mini_server() {
    echo [run mini_server...]
    spawn-fcgi -p 8080 ./mini_server.out
    nginx -g "daemon off;"
    printf "\33[92m[OK] run_mini_server\33[0m\n"
}

function start() {
    compile_mini_server
    run_mini_server

    echo "..[START].."
}

start

printf "\33[92m<<<---[OK]--->>>\33[0m\n"
