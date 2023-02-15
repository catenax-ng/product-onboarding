# ArgoCD notifications

Dev teams might request ArgoCD notifications for their Teams channel, in this case the following procedure will enable this for them

Link how to integrate GitHub Teams notification into [Argo CD](https://argocd-notifications.readthedocs.io/en/stable/services/teams/)

## Information the product developer team has to deliver:

- Requests webhook for their MS Teams channel from the Admin of this channel
- Send webhook to DevSecOps Team

## Actions that we have do:

- Update [vault secret](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/apps/argocd/argocd-notifications-secret) with Dev Team’s web hook

    Example for the Hook
    ```json
    {
        "irs-teams-channel-url": "<webhook>",
        "NEW-teams-channel-url": "<new webhook>"
    }
    ```

- Update argocd-notifications-secret.yaml stringData with new vault secret entry
    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
      name: argocd-notifications-secret
      namespace: argocd
      avp.kubernetes.io/path: "devsecops/data/apps/argocd/argocd-notifications-secret"
    
    stringData:
      irs-teams-channel-url: <irs-teams-channel-url>
      NEW-teams-channel-url: <NEW-teams-channel-url>
    ```

- Update argocd-notifications-cm.yaml with a new service for the Dev Team

    ```yaml
    apiVersion: v1
    kind: ConfigMap
    metadata:
        name: argocd-notifications-cm
        namespace: argocd
    data:
        service.teams.irs: |
          recipientUrls:
            irs-dev-teams: $irs-teams-channel-url
            NEW-dev-teams: $NEW-teams-channel-url
    ```

- (Optional) Add their custom notification template to argocd-notifications-catalog.yaml if they provided one
- Provide annotation for Dev Team, so they can subscribe the application to the notification

Example annotation for Argo Cd application
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
    annotations:
      notifications.argoproj.io/subscribe.on-health-degraded.teams.irs: irs-dev-teams
      notifications.argoproj.io/subscribe.on-sync-failed.teams.irs: irs-dev-teams
      notifications.argoproj.io/subscribe.on-sync-status-unknown.teams.irs: irs-dev-teams
```

## Example Jira issue

[A1ODT-1097](https://jira.catena-x.net/browse/A1ODT-1097)
