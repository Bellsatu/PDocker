#!/bin/bash  

case "$1" in  
  start)  
    docker pull nginx  
    docker run --name meu-servidor -d -p 80:80 nginx  
    echo "Nginx iniciado e rodando na porta 80."  
    ;;  
  list)  
    docker ps  
    ;;  
  stop)  
    docker stop meu-servidor  
    echo "Contêiner parado."  
    ;;  
  remove)  
    docker rm meu-servidor  
    echo "Contêiner removido."  
    ;;  
  all)  
    docker pull nginx  
    docker run --name meu-servidor -d -p 80:80 nginx  
    docker ps  
    docker stop meu-servidor  
    docker rm meu-servidor  
    ;;  
  *)  
    echo "Uso: $0 {start|list|stop|remove|all}"  
    exit 1  
    ;;  
esac  
