# NovaShop DevOps

Déploiement automatisé de l'environnement PREPROD de NovaShop.

- `app/` : application web
- `terraform/` : création du serveur AWS (EC2 + Security Group)
- `ansible/` : installation de Nginx et déploiement de l'application
- `.gitlab-ci.yml` : pipeline de validation exécuté par le GitLab Runner

REPONSES AUX QUESTIONS :
1.	Pourquoi Terraform est-il utilisé avant Ansible ?
Parce qu'Ansible a besoin d'un serveur existant auquel se connecter en SSH. Terraform crée l'infrastructure (le serveur EC2 et son pare-feu) et fournit son IP publique ; Ansible configure ensuite ce serveur (installation de Nginx, déploiement du site). On ne peut pas aménager une maison avant qu'elle soit construite.
2.	Quel est le rôle exact du GitLab Runner ?
C'est l'agent qui exécute les jobs définis dans le fichier .gitlab-ci.yml. GitLab stocke le code et déclenche le pipeline à chaque git push, mais n'exécute rien lui-même : le Runner récupère le code et lance les commandes (ici terraform init et terraform validate). Le tag devops permet de diriger le job vers le bon Runner.
3.	Que se passe-t-il si on exécute une deuxième fois le même playbook sans modifier le serveur ?
Rien n'est modifié : le récapitulatif affiche changed=0. Ansible compare l'état actuel du serveur à l'état décrit dans le playbook ; comme Nginx est déjà installé et démarré et que le fichier est identique, il n'a rien à faire. C'est le phénomène d'idempotence.
