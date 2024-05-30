#!/bin/bash

# Delete all deployments
kubectl delete deployment --all

# Delete all services
kubectl delete service --all

# Delete all persistent volume claims
kubectl delete pvc --all

kubectl delete pv --all
