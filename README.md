# Argon Broker Deployment

## Prerequisite
- Install [helm](https://github.com/helm/helm/releases) 
- obtain Argon Token
- url and credentials for Bitbucket server 

## Intallation / Upgrade
```
helm repo add argon https://charts.argon.io
HELM_RELEASE=argon-broker
helm upgrade -i $HELM_RELEASE argon/argon-broker --namespace argon-broker --create-namespace \
   [ --set key1=val1,key2=val2 ] [ -f my-values.yaml ] [ <helm parameters> ] 
```

### Values
- refer to [values.yaml](helm-chart/values.yaml) and [templates](helm-chart/templates) 

| Value Key | Description | Mandatory |
| --- | --- | --- |
| global.argonServer | Address of Argong Broker Server, default https://app-broker.argon.io | yes |
| global.token | Argon Token | yes |
| bitbucket.url | Bitbucket URL, ex. https://bitbucket.example.com:7990 | yes, if bitbucketBroker enabled |
| bitbucket.username | Bitbucket username | yes, if bitbucketBroker enabled |
| bitbucket.password | Bitbucket password | yes, if bitbucketBroker enabled |

### Example
- create values file `my-env-values.yaml`:
```yaml
global:
  argonServer: https://app-broker.argon.io
  token: ***** 
bitbucket:
  url: https://bitbucket.example.com
  username: admin
  password: *****
```
- add argon helm repository 
```
helm repo add argon https://charts.argon.io

helm upgrade -i argon-broker argon/argon-broker --namespace argon-broker --create-namespace -f my-env-values.yaml
```



