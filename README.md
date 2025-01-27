# 🔒 mTLS Tutorial

In this tutorial I am going to show how to configue mTLS between two services

## Minkube

This tutorial is going to use [minikube][1] to deploy the services. So make sure to have it installed, and your [`kubectl`][2] (with [`kustomize`][3]) is pointing to your minikube cluster.

<details>
    <summary>Run minikube</summary>

```shell
> minikube start
> kubectl config get-contexts
> kubectl config set-context minikube
```
</details>


## 🗣 Deployment an echo-server 

Let's deploy an [echo-server](https://hub.docker.com/r/ealen/echo-server)
```shell
> kubectl apply -k ./echoserver
> minikube tunnel
```

This creates a Kubernetes `ConfigMap, Deployment and Service`. 

Before we explain what we made, let's check that we can access the echo-server directly, without [mTLS][4], at [localhost:8082](http://localhost:8082).
And with mTLS at 

### Echo-server Configuration

TODO: PlantUml of what it's deployed

![](./echoserver_envoy.svg)

## 📘 Resources

- [minikube][1]
- [kubectl][2]
- [kustomize][3]
- [mTLS][4]

[1]: https://minikube.sigs.k8s.io/docs/
[2]: https://kubernetes.io/docs/reference/kubectl/
[3]: https://kustomize.io/
[4]: https://en.wikipedia.org/wiki/Mutual_authentication