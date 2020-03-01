#!/bin/bash

SUB_PYTHON_IP=$(docker inspect sub-python  | jq -r '.[0].NetworkSettings.IPAddress')
MUL_JAVA_IP=$(docker inspect mul-java  | jq -r '.[0].NetworkSettings.IPAddress')
DIV_GO_IP=$(docker inspect div-go  | jq -r '.[0].NetworkSettings.IPAddress')
SUM_RUST_IP=$(docker inspect sum-rust  | jq -r '.[0].NetworkSettings.IPAddress')

export SUB_SERVICE_URL=http://$SUB_PYTHON_IP:8081/service/sub
export MUL_SERVICE_URL=http://$MUL_JAVA_IP:8082/service/mul
export DIV_SERVICE_URL=http://$DIV_GO_IP:8083/service/div
export SUM_SERVICE_URL=http://$SUM_RUST_IP:8084/service/sum
sbt run
