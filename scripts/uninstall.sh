# uninstall api service
echo "------------------- uninstall api service --------------------"
kubectl delete -f service/demo/deployment.yaml

# uninstall jmeter
echo "------------------- uninstall jmeter cluster --------------------"
kubectl delete -f jmeter/deployment.yaml

echo "------------------- install files service --------------------"
kubectl delete -f service/files/deployment.yaml

# uninstall prometheus
#echo "------------------- uninstall prometheus --------------------"
#helm uninstall prometheus

# uninstall influxdb
echo "------------------- uninstall influxdb --------------------"
helm uninstall influxdb 
# uninstall grafana
echo "------------------- uninstall grafana --------------------"
helm uninstall grafana 

echo "------------------- uninstall done --------------------"

