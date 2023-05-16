/bin/bash

# Deploy mongoDB
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
