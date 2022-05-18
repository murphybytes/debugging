.PHONY: 
all:
	docker build -t podtato:0.0.1 .
	kubectl apply -f crds/deploy.yaml