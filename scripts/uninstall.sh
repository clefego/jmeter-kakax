echo "------------------- uninstall start --------------------"
echo "------------------- uninstall influxdb --------------------"
helm uninstall influxdb 

echo "------------------- uninstall grafana --------------------"
helm uninstall grafana 

echo "------------------- uninstall nfs --------------------"
helm uninstall svc 

echo "------------------- uninstall api service --------------------"
kubectl delete -f service/demo/deployment.yaml

echo "------------------- uninstall jmeter cluster --------------------"
kubectl delete -f jmeter/deployment.yaml

echo "------------------- uninstall files service --------------------"
kubectl delete -f service/files/deployment.yaml

echo "------------------- uninstall controller service --------------------"
kubectl delete -f service/controller/deployment.yaml

echo "------------------- uninstall pvc --------------------"
# kubectl delete -f deployment/nfs-pvc.yaml

echo "------------------- uninstall RBAC --------------------"
kubectl delete -f deployment/RBAC.yaml

echo "------------------- uninstall done --------------------"

