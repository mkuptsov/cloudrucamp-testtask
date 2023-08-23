IMAGE_NAME=test-app
TAG=latest
CONTAINER_NAME=app

run-playbook:
	./playbook/run_playbook.sh

run-flask:
	flask --app app/app run

build-docker-image:
	docker build -t $(IMAGE_NAME) ./app/

stop-docker:
	docker stop $(CONTAINER_NAME) 2>/dev/null || true

run-docker: stop-docker
	docker run -d --rm --name $(CONTAINER_NAME) -p 8000:8000 $(IMAGE_NAME)

build-k-image:
	minikube image build -t $(IMAGE_NAME):$(TAG) ./app/

delete-k:
	kubectl delete -f ./manifest 2>/dev/null || true

run-k: delete-k
	kubectl apply -f ./manifest

stop-busybox:
	kubectl delete bb 2>/dev/null || true

run-busybox: stop-busybox
	kubectl run bb -it --image=yauritux/busybox-curl

delete-helm:
	helm delete $(IMAGE_NAME) 2>/dev/null || true

install-helm:
	helm install $(IMAGE_NAME) ./helm/test-app