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
