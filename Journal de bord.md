### Journal de Bord

# 2 Avril 2024 : TRAVAIL SUR LA BDD & LOGICIEL INTERNE, INIT DU PROJET

Matin, environ 3h

- Reflexion sur la conception de la BDD pour ce projet 3H

Après-midi, environ 5h
Je vire la VM Linux de l'école, car trop de problème

- installation de DBeaver
- installation de WSL Ubuntu et de postgreSQL
  https://learn.microsoft.com/fr-fr/windows/wsl/tutorials/wsl-database

Problematique d'accès à la base de données

après de nombreuse tentative
succès avec la modification du fichier
pg_hba.conf
sudo nano /etc/postgresql/14/main/pg_hba.conf

TYPE DATABASE USER ADDRESS METHOD
local nomDeLaBase nomDeLUtilisateur md5

Malgré l'accés à la BDD, la modification bloque en terme de droits.

##RESSOURCES A GARDER
https://dbeaver.com/docs/dbeaver/Schema-compare/
https://www.numelion.com/dbeaver-gestion-de-bases-de-donnees.html
https://docs.postgresql.fr/13/ddl-schemas.html
Voir 5.9.4 pour revocation des droits de BDD public

# Jeudi 4 Avril : S'INFORMER SUR DOCKER

Après quelques échanges, Martial et Romain.
il me pousse à me diriger vers Docker.

Ressource trouver à ce sujet :
https://learn.microsoft.com/fr-fr/windows/wsl/tutorials/wsl-containers
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
https://www.cybertec-postgresql.com/en/postgresql-on-wsl2-for-windows-install-and-setup/

VIDEO
Tutoriel Docker pour débutants [COURS COMPLET en 1 heures] https://www.youtube.com/watch?v=sn6PlRf-UHk
KORBEN WINDOWS HOME - Comment installer WSL2 + Docker ? : https://www.youtube.com/watch?v=QIIjUpBPDLc

# Vendredi 5 Avril : REINSTALLATION COMPLETE

réinstallation complete de WSL 2
car compatible avec docker

réinstallation de Ubuntu 22, MAJ et upgrade
installation de docker desktop windows et création de comtpe Docker

RESSOURCE :
https://docs.docker.com/get-docker/

# Dimanche 7 Avril 24 : EXPLICATION RAPIDE & MAJ DU JOURNAL DE BORD DE LA SEMAINE

Explication rapide de docker par Martial
et de docker compose et du langage YAML

ATTENTION SENSIBLE QUE AU ESPACE, PAS DE TAB dans YAML

RESSOURCES A GARDER
https://fr.wikipedia.org/wiki/YAML
https://jsonformatter.org/yaml-to-json
https://github.com/felipewom/docker-compose-postgres/blob/main/docker-compose.yml

# OBJECTIFS : SEMAINE PROCHAINE 8 au 14 AVRIL

- FINIR VIDEO : utilisation de DOCKER
- SE FAMILIARISER AVEC LES COMMANDES DOCKER
- COMPRENDRE VRAIMENT le docker compose et lancer ses premiers conteneurs en autonomie

Dans un second temps, et si le temps le permet.
travailler le router, et controler pour ajout des depenses et des revenues dans l'app

# Mardi 9 AVRIL 24 :
