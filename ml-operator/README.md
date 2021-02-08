# ml-operator

`ml-operator` is a tool for managing and updating the images of a running Mojaloop deployment.

See [mojaloop/ml-operator](https://github.com/mojaloop/ml-operator) for more information on running this application.

## Installing with Helm



```bash
# from project root (./helm)
./package.sh

# create and edit the .env file:
cd ml-operator
mv .env.example .env
vim .env
# fill in the SLACK_WEBHOOK_URL appropriately

# create a generic secret
kubectl create secret generic ml-operator-secrets --from-env-file=.env

# install ml-operator
helm upgrade --install ml-operator ./
```