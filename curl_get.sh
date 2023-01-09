#!/bin/bash
# kubectl port-forward svc/hello-world 3000:3000
# kubectl port-forward hello-world 3000:3000
# minikube service hello-world --url
port=$1
if [ -z "$port" ]
then
      port=3000
fi
echo "Start GET http://localhost:$port"
echo "Press [CTRL+C] to stop.."
while :
do
    echo $(time curl -s --location --request GET "http://localhost:$port" -w " %{http_code}")
	sleep 1
done