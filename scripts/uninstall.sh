# 卸载 api service
echo "------------------- 卸载 api service --------------------"
kubectl delete -f service/demo/deployment.yaml

# 卸载jmeter
echo "------------------- 卸载 jmeter cluster --------------------"
kubectl delete -f jmeter/deployment.yaml

# 卸载 prometheus
#echo "------------------- 卸载 prometheus --------------------"
#helm uninstall prometheus

# 卸载 influxdb
echo "------------------- 卸载 influxdb --------------------"
helm uninstall influxdb 
# 卸载 grafana
echo "------------------- 卸载 grafana --------------------"
helm uninstall grafana 

echo "------------------- uninstall done --------------------"

