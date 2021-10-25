# Argon Broker Deployment

## Prerequisite
- Install [helm](https://github.com/helm/helm/releases) 
- obtain Argon Token
- url and credentials for Bitbucket server 

## Intallation / Upgrade
```
helm repo add argon https://argonsecurity.github.io/broker-deployment
HELM_RELEASE=argon-broker
helm upgrade -i $HELM_RELEASE argon/argon-broker --namespace argon --create-namespace \
   [ --set key1=val1,key2=val2 ] [ -f my-values.yaml ] [ <helm parameters> ] 
```

### Values
- refer to [values.yaml](helm-chart/values.yaml) and [templates](helm-chart/templates) 

| Value Key | Description | Mandatory |
| --- | --- | --- |
| global.argonServer | Address of Argong Broker Server, default https://app-broker.argon.io | yes |
| global.token | Argon Token | yes |
| bitbucket.url | Bitbucket URL, ex. https://bitbucket.example.com:7990 | yes, if Bitbucket Broker enabled |
| bitbucket.username | Bitbucket username | yes, if Bitbucket Broker enabled |
| bitbucket.password | Bitbucket password | yes, if Bitbucket Broker enabled |
| gitlab.url | Gitlab URL, ex. https://gitlab.example.com | yes, if Gitlab Broker enabled |
| gitlab.token | Bitbucket username | yes, if Gitlab Broker enabled |

### Example
- add helm repository
```
helm repo add argon https://argonsecurity.github.io/broker-deployment
```
#### Simple Connect to Bitbucket server
```
helm upgrade -i argon-broker argon/argon-broker --namespace argon --create-namespace \
  --set bitbucket.url="https://bitbucket.example.com" \
  --set bitbucket.username=bitbucket \
  --set bitbucket.password=******
```

#### Advanced run with HTTP_PROXY and nodeSelector
- create values file `my-env-values.yaml`:
```yaml
global:
  argonServer: https://app-broker.argon.io
  token: ***** 
  envs:
    http_proxy: proxy.example.com:3128
    https_proxy: proxy.example.com:3128
    no_proxy: .example.com

gitlab:
  url: https://gitlab.example.com
  token: *****
  ssl:
    ca: -|
      -----BEGIN CERTIFICATE-----
      ***** ca-cert-content
      -----END CERTIFICATE
    cert: -|
      -----BEGIN CERTIFICATE-----
      ***** client-cert
      -----END CERTIFICATE-----
    key: -|
      -----BEGIN RSA PRIVATE KEY-----
      ***** private-key-content
      -----END RSA PRIVATE KEY-----
```
- run helm
```
helm upgrade -i argon-broker argon/argon-broker --namespace argon --create-namespace -f my-env-values.yaml
```



