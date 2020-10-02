docker build -t ryanzzff/docker-multi-containers-client:latest -t ryanzzff/docker-multi-containers-client:$SHA -f ./client/Dockerfile ./client
docker build -t ryanzzff/docker-multi-containers-server:latest -t ryanzzff/docker-multi-containers-server:$SHA -f ./server/Dockerfile ./server
docker build -t ryanzzff/docker-multi-containers-worker:latest -t ryanzzff/docker-multi-containers-worker:$SHA -f ./worker/Dockerfile ./worker
docker push ryanzzff/docker-multi-containers-client:latest
docker push ryanzzff/docker-multi-containers-server:latest
docker push ryanzzff/docker-multi-containers-worker:latest

docker push ryanzzff/docker-multi-containers-client:$SHA
docker push ryanzzff/docker-multi-containers-server:$SHA
docker push ryanzzff/docker-multi-containers-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ryanzzff/docker-multi-containers-server:$SHA
kubectl set image deployments/client-deployment client=ryanzzff/docker-multi-containers-client:$SHA
kubectl set image deployments/worker-deployment worker=ryanzzff/docker-multi-containers-worker:$SHA
