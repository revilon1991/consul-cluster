### Consul Cluster
This repository provide knowledge test environment consul cluster.
Contains three api backend node with balance traffic between that.

### Installation
You must prepend install [Docker Desktop](https://www.docker.com/get-started).
```bash
git clone https://github.com/revilon1991/consul-cluster.git
cd consul-cluster
cp .env.dist .env
docker-compose up -d
```

### Usage
Use your browser for view UI Consul interface on [localhost:8585](http://localhost:8585)
***
```bash
# List all members of cluster
docker-compose exec proxy consul members
```
***
Use your browser for view work api backend balance [localhost](http://localhost)
```
Hello, visitor! This first node
```
or
```
Hello, visitor! This second node
```
or
```
Hello, visitor! This third node
```
***
Kill one of the nodes and you will feel freedom from the downtime of the share of your users.
```bash
docker-compose stop node_second
```
Consul Template instantly changes config of nginx and output is only first or second node without 5xx error.
```
Hello, visitor! This first node
```
or
```
Hello, visitor! This third node
```
After restore second node it will be again added to config nginx. 