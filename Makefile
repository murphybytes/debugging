.PHONY: 
all:
	docker build -t podtato-debug:0.0.1 .
	kubectl apply -f crds/deploy.yaml