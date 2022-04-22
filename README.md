# kakax

Distributed performance testing platform based on K8s

## architecture

![img.png](docs/images/architecture.jpg)

## required

- [docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Kubernetes](https://zh.wikipedia.org/zh-hans/Kubernetes)
- [kubectl](https://www.kubernetes.org.cn/installkubectl)
- [helm](https://helm.sh/zh/docs/intro/install/)

## install

### create Kubernetes with [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

```bash
git clone git@github.com:lunz1207/kakax.git
cd kakax
kind create cluster --config kind.yaml
```

### install into cluster

```bash
git clone git@github.com:lunz1207/kakax.git
cd kakax
sh scripts/install.sh 
```

## quick start

### test in cluster mode

```bash
# get jmeter-master pod
kubectl get  pod | grep jmeter-master

# exec pod
kubectl exec -it jmeter-master-84db88ff8f-vw4h7 -- bash

# run test
/apache-jmeter-5.4.3/bin/jmeter.sh -n -t pef-test.jmx -l log.jtl -R  jmeter-slave-0.jmeter-slave.default.svc.cluster.local:1099
```

### scale slave pod

```bash
kubectl scale --replicas=4 StatefulSet/jmeter-slave
```

### data explore

```bash
# get influxdb user/password and token
echo "User: admin"
echo "Password: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-password}" | base64 --decode)"
echo "Token: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-token}" | base64 --decode)"

# influxdb service port forward
kubectl port-forward svc/influxdb 8086:8086

# open url
open http://127.0.0.1:8086
```

![img.png](docs/images/data-explore.jpg)

### grafana dashboard

```bash
# get grafana user/password 
echo "User: admin"
echo "Password: $(kubectl get secret grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"

# grafana service port forward
kubectl port-forward svc/grafana 8080:3000

# open url
open http://127.0.0.1:8080
```

[grafana configuration](https://jmeter.apache.org/usermanual/realtime-results.html#grafana_configuration)

## write jmx

### Prometheus Listener for Jmeter

<https://github.com/johrstrom/jmeter-prometheus-plugin>

### InfluxBd Listener for Jmeter

<https://jmeter.apache.org/usermanual/realtime-results.html#influxdb_v2>

## REF

[Metrics exposed](https://jmeter.apache.org/usermanual/realtime-results.html#metrics)

## todo

- api service
- web ui
- CLI
- nfs
