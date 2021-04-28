# kube-vitess

Remember to revise nginx.conf before deploying

## TODO

List by priority

- auto update nginx config per deployment
  - kubectl get service | grep azure-vtgate
  - sed
- Test docker in different disk 
  - /etc/docker/daemon.json

Modify the file like this:

```
{
  "data-root": "/mnt/docker-data"
  "storage-driver": "overlay2"
}
```

## MongoDB ACID & Aggregation

ACID in MongoDB (Transaction)
- Single Document
- Read Write Concern
- Transaction
- Session (Maybe not)
- Restrictions
- Production Considerations

Data Model
- Data model design 
- Lockdown models 

Aggregation Framework
- How it works
- Methods
- Examples
- Mapping to SQL Syntax

Ref:
- https://zh.wikipedia.org/wiki/ACID
- https://docs.mongodb.com/manual/core/transactions-production-consideration/
- https://docs.mongodb.com/manual/core/transactions/
- https://developer.mongodb.com/quickstart/golang-multi-document-acid-transactions/
- https://developer.mongodb.com/quickstart/introduction-aggregation-framework/
- https://www.mongodb.com/blog/post/json-schema-validation--locking-down-your-model-the-smart-way


```
planetscale/vitess-operator               latest        0a8259f0ce65   11 days ago     188MB
vitess/lite                               v10.0.0-rc1   ed9d81dd878a   3 weeks ago     1.05GB
hello-world                               latest        d1165f221234   7 weeks ago     13.3kB
k8s.gcr.io/kube-proxy                     v1.20.2       43154ddb57a8   3 months ago    118MB
k8s.gcr.io/kube-apiserver                 v1.20.2       a8c2fdb8bf76   3 months ago    122MB
k8s.gcr.io/kube-controller-manager        v1.20.2       a27166429d98   3 months ago    116MB
k8s.gcr.io/kube-scheduler                 v1.20.2       ed2c44fbdd78   3 months ago    46.4MB
gcr.io/k8s-minikube/storage-provisioner   v4            85069258b98a   4 months ago    29.7MB
k8s.gcr.io/etcd                           3.4.13-0      0369cf4303ff   8 months ago    253MB
k8s.gcr.io/coredns                        1.7.0         bfe3a36ebd25   10 months ago   45.2MB
k8s.gcr.io/pause                          3.2           80d28bedfe5d   14 months ago   683kB
quay.io/coreos/etcd                       v3.3.13       1e3509b14de0   24 months ago   36MB
prom/mysqld-exporter                      v0.11.0       e80442e91b90   2 years ago     17MB

```
