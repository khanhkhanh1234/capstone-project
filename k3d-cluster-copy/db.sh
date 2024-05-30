# Delete resources related to MongoDB
kubectl delete deployment mongodb
kubectl delete service mongodb
kubectl delete pvc mongo-pvc
kubectl delete deployment mongo-express
kubectl delete service mongo-express

# Delete resources related to PostgreSQL
kubectl delete deployment postgres
kubectl delete service postgres
kubectl delete pvc postgres-pvc

find kubernetes-manifests -type f -name "*.yaml" | xargs -n 1 kubectl apply -f