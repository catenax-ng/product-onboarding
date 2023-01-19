# ArgoCD notifications

Dev teams might request ArgoCD notifications for their Teams channel, in this case the following procedure will enable this for them

(T.B.D.)

Dev Team:
- Requests webhook for their Teams channel from the Admins
- Send webhook to DevSecOps Team

DevSecOps Team:
- Update [vault secret](https://vault.demo.catena-x.net/ui/vault/secrets/devsecops/show/apps/argocd/argocd-notifications-secret) with Dev Team’s web hook

```json
{
    "irs-teams-channel-url": "<webhook>",
    "NEW-teams-channel-url: "<new webhook>"
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

- Provide annotation for Dev Team so they can subscribe the application to the notification

Example as per request of 

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  annotations:
    notifications.argoproj.io/subscribe.on-health-degraded.teams.irs: irs-dev-teams
    notifications.argoproj.io/subscribe.on-sync-failed.teams.irs: irs-dev-teams
    notifications.argoproj.io/subscribe.on-sync-status-unknown.teams.irs: irs-dev-teams
```
