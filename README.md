### 为开发节点添加污点
```
kubectl taint nodes node-dev app=dev:NoSchedule
```
### 从开发节点删除污点
```
kubectl taint nodes node-dev app:NoSchedule-
```

### 设置 helm repo
#### bitnami
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```