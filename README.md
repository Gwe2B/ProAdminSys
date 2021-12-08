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
~/ $ ./ProAdminSys/main.sh install
```
***/!\ ATTENTION :* N'oubliez pas de vérifier que les trois fichiers `.sh` est les droits en éxécutions.**

*Remarque : Le script va télécharger et installer (pour l'utilisateur locale uniquement) Python 3.10, openSSL et la version de pip correspondante. Il est donc possible que l'installation prenne du temps.*

## Construction du site
Il n'y à qu'une commande à taper :
```
~/ $ ./ProAdminSys/main.sh build <Dossier images sources>
```
Le répértoire `Dossier images sources` étant le dossier contenant les images pour la création du site vitrine. *Remarque : faites attention de bien renseigner un chemin relatif ou absolue de manière explicite. Ex: `./images` au lieu de `images`*

Par défaut le répértoire de sortie en chemin relatif est dans `./output`.

## Options supplémentaires

### Préciser le répértoire de sortie
Il est possible de préciser le dossier de sortie pour la commande `build` avec l'option `-o` ou `--output` de la manière suivante :
```
~/ $ ProAdminSys/main.sh build -o <répértoire de sortie> <Dossier images sources>
```
**OU**
```
~/ $ ProAdminSys/main.sh build --output=<répértoire de sortie> <Dossier images sources>
```

### Ajouter une authentification
Il est possible de mettre en place un système d'authentification basique grâce à l'option `--auth`. Le script vous demandera alors de saisir un nom d'utilisateur ainsi qu'un mot de passe.
```
~/ $ ProAdminSys/main.sh build --auth <Dossier images sources>
Username: toto
Password:
Confirmation password: 
```

### Afficher l'aide
En cas de difficulté l'option `ProAdminSys/main.sh -h` ou `ProAdminSys/main.sh --help` est présente et affichera l'aide. De la même manière l'aide s'affichera en cas de commande erronée ou d'options inconnues. Il est également possible d'afficher l'aide des sous commande comme suis `ProAdminSys/main.sh build -h` ou `ProAdminSys/main.sh build --help`.
