# docker-swarm-demo
A simple Swarm demo using Docker Swarm, Vagrant, and VirtualBox.

Here we construct a small cluster consisting of

 * Primary Master
 * Failover Master
 * External Loadbalancer
 * 2 worker nodes
 
# Dependencies
Before running the demo, install

 * [Docker Engine](https://docs.docker.com/engine/installation)
 * [Docker Compose](https://docs.docker.com/compose/install)
 * [Vagrant](https://www.vagrantup.com/docs/installation)
 * [VirtualBox](https://www.virtualbox.org/manual/ch01.html#intro-installing)
 
Alternatively, on ArchLinux

    pacman -S docker docker-compose vagrant virtualbox
 
# Running the demo

Launch the cluster

    git clone https://github.com/sgillespie/docker-swarm-demo.git
    cd docker-swarm-demo
    docker-compose up --build

Point your browser at `http://localhost:8000`
