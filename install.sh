helm install grafana bitnami/grafana
helm install prometheus prometheus-community/prometheus

helm install prometheus -f prometheus-community/prometheus



helm install kafka -f values.yaml bitnami/kafka



admin / oAYyqTS368
podName=k get pod | grep -Eo 'jmeter-master-.*\z'


kubectl run my-test-kafka-client --restart='Never' --image docker.io/bitnami/kafka:2.8.1-debian-10-r31 --namespace keel-system --command -- sleep infinity



kafka-topics.sh --create --partitions 20 --replication-factor 2 --topic test-1 --bootstrap-server kafka.keel-system.svc.cluster.local:9092


kafka-run-class.sh kafka.tools.GetOffsetShell --topic test-1 --time -1 --broker-list kafka.keel-system.svc.cluster.local:9092 --partitions 0

kafka-producer-perf-test.sh --topic test-1 --throughput -1 --num-records 30000000 --record-size 1024 --producer-props acks=all bootstrap.servers=kafka.keel-system.svc.cluster.local:9092
