echo "------------------- uninstall start --------------------"
echo "------------------- install pvc --------------------"
kubectl apply -f deployment/pvc.yaml

echo "------------------- install RBAC --------------------"
kubectl apply -f deployment/RBAC.yaml

echo "------------------- install influxdb --------------------"
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install influxdb bitnami/influxdb

echo "------------------- Get the influxdb credentials --------------------"
echo "User: admin"
echo "Password: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-password}" | base64 --decode)"
echo "Token: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-token}" | base64 --decode)"

echo "------------------- install grafana --------------------"
helm install grafana bitnami/grafana

echo "------------------- install demo service --------------------"
kubectl apply -f service/demo/deployment.yaml

echo "------------------- install jmeter cluster --------------------"
kubectl apply -f jmeter/deployment.yaml

echo "------------------- install files service --------------------"
kubectl apply -f service/files/deployment.yaml

echo "------------------- install controller service --------------------"
kubectl apply -f service/controller/deployment.yaml

echo "------------------- install  done --------------------"