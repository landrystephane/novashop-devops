# NovaShop DevOps

Déploiement automatisé de l'environnement PREPROD de NovaShop.

- `app/` : application web
- `terraform/` : création du serveur AWS (EC2 + Security Group)
- `ansible/` : installation de Nginx et déploiement de l'application
- `.gitlab-ci.yml` : pipeline de validation exécuté par le GitLab Runner