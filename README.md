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
Use your browser for view UI Consul interface on [localhost](http://localhost)
***
```bash
# List all members of cluster
docker-compose exec proxy consul members
```
