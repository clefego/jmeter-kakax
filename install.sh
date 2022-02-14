# 创建集群
echo "------------------- 创建 k8s 集群 --------------------"
kind create cluster --config kind.yaml


# 安装被测 app
echo "------------------- 安装 pythonapp --------------------"
kubectl apply -f service/demo/deployment.yaml

# 安装jmeter
echo "------------------- 安装 jmeter --------------------"
kubectl apply -f jmeter/deployment.yaml


# 安装 prometheus
echo "------------------- 安装 prometheus --------------------"
# helm install prometheus prometheus-community/prometheus
helm install prometheus -f deployment/values-prometheus.yaml prometheus-community/prometheus


# 安装 grafana
echo "------------------- 安装 grafana --------------------"
helm install grafana bitnami/grafana

echo "User: admin"
echo "Password: $(kubectl get secret grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"




# .5 grafana
admin / oAYyqTS368



# 本地  grafana
# admin / x8QIbrWwWQ
# http://127.0.0.1:8080/?orgId=1