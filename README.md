# rp_node_alpine

Steps to publish:

1. `$ export RP_NODE_ALPINE_VERSION=node-v<REPLACE ME>_yarn-v<REPLACE ME>`
1. `$ export RP_NODE_ALPINE_REPO=rentpath/rp_node_alpine`
1. `$ export RP_NODE_ALPINE_IMAGE=$RP_NODE_ALPINE_REPO:$RP_NODE_ALPINE_VERSION`
1. `$ export RP_NODE_ALPINE_LATEST=$RP_NODE_ALPINE_REPO:latest`
1. `$ docker build . -t $RP_NODE_ALPINE_IMAGE`
1. `$ docker trust sign $RP_NODE_ALPINE_IMAGE`
1. `$ docker tag $RP_NODE_ALPINE_IMAGE $RP_NODE_ALPINE_LATEST
1. `$ docker trust sign $RP_NODE_ALPINE_LATEST`
1. `$ docker push $RP_NODE_ALPINE_LATEST`
