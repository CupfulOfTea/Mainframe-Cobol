 Date | Sujet
:---|:---
 20/03/2025 | Gestion des données


## Création d'un fichier sequential par TSO ISF

### Accès au menu DSUtility avec la commande ``3.2``

Le menu 3.2 est utiliser pour la création de fichier.

![alt text](images2/image-1.png)

### NAME
```
'FORA08.SEQ.ARTICLES'
```
![alt text](images2/image-3.png)

### Paramètres du fichier à créer

![alt text](images2/image-4.png)

### Consultation d'un fichier existant pour garder les paramètres de fichier sur mon nouveau fichier.

![alt text](images2/image-5.png)

### Quelque tests pour valider la bonne configuration d'un fichier ``sequential``

![alt text](images2/image-6.png)

![alt text](images2/image-7.png)

### Vérification des informations du fichier créer
![alt text](images2/image-9.png)

## Accès au menu DSList avec la commande ``3.4``

![alt text](images2/image-10.png)

![alt text](images2/image-11.png)

```
E       //Permet d'editer un fichier
```

![alt text](images2/image-12.png)

```
I       //Permet d'insert une ligne
```

```
COLS    // Permet d'afficher les nombre de collone
```
![alt text](images2/image-14.png)

## Création d'une  ``bibliothèque`` pour des ligne de ``80 octect``, de ``5 cylindres`` et ``3 cylindres secondaire``

### Accès au menu DSUtility avec la commande ``3.2``

### NAME
```
'FORA08.PGM.COBOL'
```

### Configuration

![alt text](images2/image-15.png)

### Vérification

![alt text](images2/image-16.png)

### AJOUT DU PREMIER MEMBRE GO TO ``EDIT``

![alt text](images2/image-17.png)

![alt text](images2/image-18.png)

![alt text](images2/image-19.png)

### Ajout d'autre membre

```
S PROG2
```
![alt text](images2/image-21.png)

## Création d'un fichier ``VSAM`` 

### Accès au menu DSUtility avec la commande ``3.2``

```
V       //Permet de choisir la creation d'un fichier VSAM 
```
### Menu VSAM Utilities 
![alt text](images2/image-22.png)

### Choix effectuer
![alt text](images2/image-23.png)

### Configuration

![alt text](images2/image-24.png)

### COMMANDE VSAM Générer

![alt text](images2/image-25.png)

```
EXEcute      //Permet d'executer le code generer 
```
### Si le code renvoyer est ``code 0`` le program s'est executer sans erreur
![alt text](images2/image-26.png) 


### Vérification de la création des trois fichier VSAM avec la commande ``3.4``

![alt text](images2/image-28.png)
