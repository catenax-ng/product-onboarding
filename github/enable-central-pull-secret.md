# Enable access to a private package (central pull secret)

- Create a PAT within GitHub user account (machine user)
  settings - Developer settings - Personal access token. Be sure to give just the needed rights (read:package will be
  sufficient to deploy)
- Now do a base64 encoding for the PAT $ echo -n "<username\>:<PAT\>" | base64
- Create a file `.dockerconfigjson` containing the base-64 encoded PAT

```json
  {
    "auths": {
      "ghcr.io": {
        "auth": "<base-64 encoded PAT>"
      }
    }
  }
```

- Do a base 64 encoding for the auth part

```shell
  echo -n'{"auths":{"ghcr.io":{"auth":"<base-64 encoded PAT>"}}}' | base64
```

If the output is divided into 2 lines, just add the second line to the first (without space)

- Create a file `dockerconfigjson.yaml`:

  ```yaml
  kind: Secret
  type: kubernetes.io/dockerconfigjson
  apiVersion: v1
  metadata:
    name: budapest-machine-user-read-package
    labels:
      app: app-name
  data:
    .dockerconfigjson: <base64 encoded auth part, output from second base64 encoding>
  ```

- Then add the secret to the cluster

  ```shell
  kubectl create -f dockerconfigjson.yaml
  ```

- Pull secret has to be added to the product´s code

  ```yaml
  imagePullSecrets:
    - name: <name of the pull secret>
  ```
  