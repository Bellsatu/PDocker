#!/bin/bash  

NOME_VOLUME="nginx_seu-primeiro-nome"  
CONTAINER_NAME="nginx_logs_container"  
PORTA_HOST=8080  

# Criar volume se não existir  
docker volume inspect $NOME_VOLUME > /dev/null 2>&1 || \
docker volume create $NOME_VOLUME  

# Rodar container com volume montado  
docker run -d --name $CONTAINER_NAME -p $PORTA_HOST:80 \
-v ${NOME_VOLUME}:/var/log/nginx nginx  

echo "Acesse http://localhost:${PORTA_HOST} e gere logs..."  

# Gerar logs acessando a página  
curl http://localhost:${PORTA_HOST}  

# Parar e remover o container  
docker stop $CONTAINER_NAME  
docker rm $CONTAINER_NAME  

# Criar novo container para verificar logs persistentes  
docker run -d --name $CONTAINER_NAME -p $PORTA_HOST:80 \
-v ${NOME_VOLUME}:/var/log/nginx nginx  

# Mostrar conteúdo do arquivo de log (ajuste caso precise)  
docker exec $CONTAINER_NAME cat /var/log/nginx/access.log  
