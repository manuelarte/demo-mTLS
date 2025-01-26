# mTLS Tutorial

In this tutorial I am going to show how to configue mTLS between two services

## Minkube

This tutorial is going to use [minikube][1] to deploy the services. So make sure to have it installed, and your [`kubectl`][2] (with [`kustomize`][3]) is pointing to your minikube cluster.

<details>
    <summary>Run minikube</summary>

```
> minikube start
> kubectl config get-contexts
> kubectl config set-context minikube
```
</details>


## Deployment an echo server 

Let's deploy the [echo-server](https://hub.docker.com/r/ealen/echo-server)

> kubectl apply -k ./echoserver
> minikube tunnel

This creates a Kubernetes ConfigMap, Deployment and Service. Then the echoserver will be available at [http://localhost:8082](http://localhost:8082).

## Resources

- [minikube][1]
- [kustomize][3]

[1]: https://minikube.sigs.k8s.io/docs/
[2]: https://kubernetes.io/docs/reference/kubectl/
[3]: https://kustomize.io/