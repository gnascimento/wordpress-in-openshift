#!/bin/bash

echo "Aplicando recursos do YAML..."
oc apply -f wordpress.yaml

echo "Aguardando pods ficarem prontos..."
oc wait --for=condition=available deployment/wordpress --timeout=120s
oc get all

echo "Aplicação implantada! Verifique a rota com:"
oc get route wordpress
