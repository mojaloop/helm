# ml-operator

`ml-operator` is a tool for managing and updating the images of a running Mojaloop deployment.

See [mojaloop/ml-operator](https://github.com/mojaloop/ml-operator) for more information on running this application.

## Installing with Helm

```bash
# from project root (./helm)
./package.sh ml-operator

# create and edit the .env file:
cd ml-operator
cp .env.example .env
vim .env
# fill in the SLACK_WEBHOOK_URL appropriately

# create a generic secret
kubectl create secret generic ml-operator-secrets --from-env-file=.env

# install ml-operator from this directory
helm upgrade --install ml-operator ./

# install ml-operator from the published mojaloop charts, overriding the secret name
helm upgrade --install {release-name} mojaloop/ml-operator --set secret-name=ml-operator-secrets
```

## Pod Components

- `ml-operator` - the actual operator that does all of the heavy lifting
- `image-watcher` - a simple service which repeatedly pings at docker hub or some other docker registry and looks for image updates that may be available. We use this service as an abstraction layer to prevent us from getting rate limited by Docker Hub
- `redis` - a redis instance that helps image-watcher to cache its results. It's non mission critical as it's state can be recreated by `image-watcher` after it talks to Docker Hub

You can of course bring your own redis if you'd like, by simply setting `values.redis.enabled=false`, and updating `./configs/image-watcher.json` to point to your own fantastic redis instance.


## Other handy snippets:

```bash
# render the templates to `/tmp/template`
helm template . --debug > /tmp/template
```
