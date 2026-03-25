image-build:
	SERVICE_TAG=1.0.0 PSQL_TAG=13.20-alpine3.21 docker compose build resources-ms songs-ms songs-db resources-db

kube-apply:
	kubectl apply -f k8s/

cluster-start:
	$(MAKE) image-build
	$(MAKE) kube-apply

kube-init:
	minikube start
	# below needs manual execution to work in terminal
	eval $$(minikube docker-env)
	$(MAKE) cluster-start
	kubectl config set-context --current --namespace=microservices

kube-stop:
	kubectl delete -f k8s/
	echo "Y" | docker system prune -a
	minikube stop
