# Argon Broker Deployment - developer guide

## Chart Repo
- We use [Chart Releaser Github Action](https://github.com/helm/chart-releaser-action)
- charts are released to branch gh-pages
- Updating version: currently manually in [charts/argon-broker/Chart.yaml](charts/argon-broker/Chart.yaml). Using [GitVersion](https://github.com/GitTools/GitVersion) - TBD

## Debug repo
```
helm template argon-broker ./charts/argon-broker -f values-test.yaml --output-dir out/
```



