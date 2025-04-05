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

echo "Aplicação implantada! Verifique a rota com:"
oc get route wordpress
