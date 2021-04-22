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
