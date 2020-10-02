docker build -t ryanzzff/docker-multi-containers-client -f ./client/Dockerfile ./client
docker build -t ryanzzff/docker-multi-containers-server -f ./server/Dockerfile ./server
docker build -t ryanzzff/docker-multi-containers-worker -f ./worker/Dockerfile ./worker
docker push ryanzzff/docker-multi-containers-client
docker push ryanzzff/docker-multi-containers-server
docker push ryanzzff/docker-multi-containers-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ryanzzff/docker-multi-containers-server
