##  commands for working with all stack (docker,kuber,terraform,aws)

##  --------===== git and github =====--------
git init
git status
git add
git commit -m "commit"
git push
##  --------===== docker =====--------
docker-compose up -d
(ngrock-up (./ngrock http 8080))
##  --------===== kuber =====--------
minikube start
kubectl apply -f mongo-config.yaml
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo.yaml
kubectl apply -f webapp.yaml
kubectl get all
minikube stop
minikube delete
##  --------===== terraform aws and datadog ======---------
sudo systemctl start datadog-agent
sudo systemctl restart datadog-agent.service
sudo systemctl stop datadog-agent