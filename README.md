## Express.js hello-world
### 依存関係インストール
```
npm i
```
### 起動
```
npm run start
```
### アクセス
`http://localhost:3000`

### docker build
```
docker build  . -t local/hello-world:v1
```
### minikube load image
```
minikube image load local/hello-world:v1
```
### minikube内起動
```
kubectl apply -f .\k8s_yaml\hello-world-pod.yaml
```