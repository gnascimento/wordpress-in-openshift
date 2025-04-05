#!/bin/bash

# Nome do projeto
PROJECT_NAME="multilayer-app"

echo "Criando projeto: $PROJECT_NAME"
oc new-project $PROJECT_NAME || oc project $PROJECT_NAME

echo "Aplicando recursos do YAML..."
oc apply -f wordpress.yaml

echo "Aguardando pods ficarem prontos..."
oc wait --for=condition=available deployment/wordpress --timeout=120s
oc get all


echo "Criando a rota no OpenShift para export o serviço..."
oc expose svc wordpress --name=wordpress --port=8080 --path=/ --wildcard-policy=None

echo "Aplicação implantada! Verifique a rota com:"
oc get route wordpress
