apt update 
apt install -y dnsutils
# "defalut" NamespaceのPod一覧を取得
kubectl get pods
# image minikube にロード（minikube場合のみ必要)
minikube image load local/hello-world:v1
# pod定義yamlファイルをdeploy
kubectl apply -f .\k8s_yaml\hello-world-pod.yaml 
# "defalut" NamespaceのPod一覧を取得
kubectl get pods
# pod 詳細を見る
kubectl describe pod/hello-world
# podにアクセス
kubectl exec -it hello-world -- bash


#  "defalut" NamespaceのDeployments一覧を取得
kubectl get deploy
# image minikube にロード（minikube場合のみ必要)
minikube image load local/hello-world:v1
minikube image load local/hello-world:v2
# deployment定義yamlファイルをdeploy
kubectl apply -f k8s_yaml/hello-world-deployment.yaml
#  "defalut" NamespaceのDeployments一覧を取得
kubectl get deploy
# deployment 詳細を見る
kubectl describe deploy/hello-world
# "defalut" NamespaceのPod一覧を取得
kubectl get pods
# service をローカルに公開(portをメモし、次利用)
minikube service hello-world --url
# loopでcurl 実行
bash curl_get.sh <port>
# イメージ更新
kubectl set image deploy/hello-world hello-world=local/hello-world:v2


# pod定義yamlファイルをdeploy
kubectl apply -f k8s_yaml/hello-world-pod.yaml
# "defalut" NamespaceのService一覧を取得
kubectl get svc
# Service定義yamlファイルをdeploy
kubectl apply -f k8s_yaml/hello-world-service.yaml
# "defalut" NamespaceのService一覧を取得
kubectl get svc
# 各service のendpointを取得
kubectl get endpoints
# Service詳細
kubectl describe svc/<service名>
# Service削除
kubectl delete -f k8s_yaml/hello-world-service.yaml
# headless 作成
kubectl apply -f k8s_yaml/hello-world-statefulset.yaml 
# pod にアクセス
kubectl exec -it hello-world-0 -- bash
# headless service DNS詳細
dig hello-world-headless.default.svc.cluster.local
# podの固定DNS詳細
dig hello-world-0.hello-world-headless.default.svc.cluster.local
