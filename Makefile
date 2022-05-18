.PHONY: 
all:
	docker build -t podtato:0.0.2 .
	kubectl apply -f crds/deploy.yaml