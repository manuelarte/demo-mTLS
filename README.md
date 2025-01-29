# 🔒 mTLS Tutorial

In this tutorial I am going to show how to configure mTLS for a service using [envoy][5].

## Minkube

This tutorial is going to use [minikube][1] to deploy the service. So make sure to have it installed, and your [`kubectl`][2] (with [`kustomize`][3]) is pointing to your minikube cluster.

<details>
    <summary>Run minikube</summary>

```shell
> minikube start
> kubectl config get-contexts
> kubectl config set-context minikube
```
</details>


## 🗣 Deployment An echo-server With mTLS 

### Generate certificate

We need to generate the Certificate Authority, sign the server and client certificates. I created two scripts to do that

> sh generate-ca-and-server-certs.sh
> sh generate-clients-certs.sh

We should have created the following files:

+ ca.crt - The Root Certificate Authority certificate, that is going to be used to verify the requests.
+ cert.pem - The intermediate certificate
+ key.pem - The private server key

+ client.crt - The client certificate
+ client.key - The client private key

### Deploy the echo-server/envoy

Let's deploy an [echo-server](https://hub.docker.com/r/ealen/echo-server), we are using kustomize for it:

```shell
> kubectl apply -k ./echoserver
> minikube tunnel
```

This creates all the Kubernetes `resources` needed to deploy echo-server/envoy with mTLS. 

Before we explain what we made, let's check that we can access the echo-server directly, without [mTLS][4], at [localhost:8082](http://localhost:8082). This service is only for "debugging" purposes, and it should not be allow in production.
And with mTLS at [localhost:8080](http://localhost:8080)
You should not get a response at `localhost:8080` because we did not add the client certificates in our request.

To test the client certificates using [cURL][6]:

> curl -k -v --cacert <path_to_project>/echoserver/certs/ca.crt --cert <path_to_project>/echoserver/certs/client.crt --key <path_to_project>/echoserver/certs/client.key https://localhost:8080

### Echo-server Configuration

TODO: PlantUml of what it's deployed

![](./echoserver_envoy.svg)

## 📘 Resources

- [minikube][1]
- [kubectl][2]
- [kustomize][3]
- [mTLS][4]
- [envoy][5]
- [cURL][6]

[1]: https://minikube.sigs.k8s.io/docs/
[2]: https://kubernetes.io/docs/reference/kubectl/
[3]: https://kustomize.io/
[4]: https://en.wikipedia.org/wiki/Mutual_authentication
[5]: https://www.envoyproxy.io/
[6]: https://curl.se/