# ProAdminSys

## Installation
Deux paquets sont requis pour le bon fonctionnement des scripts (Désoler j'ai
pas trouver comment le faire depuis un script sans droits) :
 - zlib1g-dev
 - make

Pour les installer :
`$ sudo apt install zlib1g-dev make`

Une fois les paquets installer :
```
~/ $ git clone https://github.com/Gwe2B/ProAdminSys.git
~/ $ ./ProAdminSys/script.sh install
```
***/!\ ATTENTION :* N'oubliez pas de vérifier que les trois fichiers `.sh` est les droits en éxécutions.**

*Remarque : Le script va télécharger et installer (pour l'utilisateur locale uniquement) Python 3.10, openSSL et la version de pip correspondante. Il est donc possible que l'installation prenne du temps.*

## Construction du site
Il n'y à qu'une commande à taper :
```
~/ $ ./ProAdminSys/script.sh build <Dossier images sources>
```
Le répértoire `Dossier images sources` étant le dossier contenant les images pour la création du site vitrine. *Remarque : faites attention de bien renseigner un chemin relatif ou absolue de manière explicite. Ex: `./images` au lieu de `images`*

Par défaut le répértoire de sortie en chemin relatif est dans `./output`.

### Options supplémentaires
Il est possible de préciser le dossier de sortie pour la commande `build` avec l'option `-o` de la manière suivante :
```
~/ $ ProAdminSys/script.sh -o <répértoire de sortie> build <Dossier images sources>
```
En cas de difficulté l'option `ProAdminSys/script.sh -h` est présente et affichera l'aide. De la même manière l'aide s'affichera en cas de commande erronée ou d'options inconnues.