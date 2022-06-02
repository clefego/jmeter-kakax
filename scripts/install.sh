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

echo "------------------- Get the admin credentials --------------------"
echo "User: admin"
echo "Password: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-password}" | base64 --decode)"
echo "Token: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-token}" | base64 --decode)"

# install grafana
echo "------------------- install grafana --------------------"
helm install grafana bitnami/grafana

echo "------------------- install  done --------------------"