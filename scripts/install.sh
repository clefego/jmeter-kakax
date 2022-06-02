echo "------------------- install demo service --------------------"
kubectl apply -f service/demo/deployment.yaml

echo "------------------- install jmeter cluster --------------------"
kubectl apply -f jmeter/deployment.yaml

echo "------------------- install files service --------------------"
kubectl apply -f service/files/deployment.yaml


# install prometheus
#echo "------------------- install prometheus --------------------"
# helm install prometheus prometheus-community/prometheus
#helm install prometheus -f deployment/values-prometheus.yaml prometheus-community/prometheus

# install influxdb
echo "------------------- install influxdb --------------------"
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install influxdb bitnami/influxdb

echo "User: admin"
echo "Password: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-password}" | base64 --decode)"
echo "Token: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-token}" | base64 --decode)"

# install grafana
echo "------------------- install grafana --------------------"
helm install grafana bitnami/grafana

echo "Grafana User: admin"
echo "Grafana Password: $(kubectl get secret grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"

echo "------------------- install  done --------------------"

# .5 grafana
#admin / oAYyqTS368

# 本地  grafana
# admin / x8QIbrWwWQ
# http://127.0.0.1:8080/?orgId=1

# 本地 influxdb 3HRVFCqPAr
