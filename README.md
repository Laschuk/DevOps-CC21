##  commands for working with all stack (docker,kuber,terraform,aws)

##  --------===== git and github =====--------

##  --------===== docker =====--------
docker-compose up -d
(ngrock-up (./ngrock http 8080))
##  --------===== kuber =====--------
minikube start
kubectl apply -f mongo-config.yaml
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo.yaml
kubectl apply -f webapp.yaml

minikube stop
minikube delete
##  --------===== terraform and aws =====--------


# DevOps-CC21
DevOps-CC21
