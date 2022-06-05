
# nfs-server-provisioner

## required

- nfs-common

## install

```bash
# nfs-common in all node
apt install nfs-common

# install by helm & set persistence
helm repo add nfs-ganesha-server-and-external-provisioner https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/
helm insatll nfs nfs-ganesha-server-and-external-provisioner/nfs-server-provisioner --set persistence.enable=true

```
