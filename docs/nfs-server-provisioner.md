
# nfs-server-provisioner

## required

- nfs-common

## install

```bash
# nfs-common in all node
apt install nfs-common

# install nfs
helm repo add nfs-ganesha-server-and-external-provisioner https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/
helm insatll nfs nfs-ganesha-server-and-external-provisioner/nfs-server-provisioner

```

## notion

1.`persistence.enabled='true'` config persistence, default hostpath type
2.PersistentVolume must be created for each replica to use. `claimRef.name = pvc name`

、、、yaml

apiVersion: v1
kind: PersistentVolume
metadata:
  name: nfs-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /srv/volumes/data-nfs-server-provisioner-0
  claimRef:
    namespace: default
    name: data-nfs-nfs-server-provisioner-0

、、、
3.set `nodeSelector: { kubernetes.io/hostname: worker-p003 }`，spec nfs pod node
