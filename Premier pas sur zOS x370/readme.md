 Date | Sujet
:---|:---
 19/03/2025 | Gestion des données


## Premier pas sur z/OS x370

### ``Utilitie`` > ``Library`` est accesible directement avec la commande `3.1`
![alt text](images/image-1.png)

![alt text](images/image-2.png)

### Puis `DA` pour lister l'activiter des utilisateur

![alt text](images/image-3.png)

### Application d'un filtre pour la liste d'activiter par ``Job name`` commencent par ``FORA`` 
```
PREFIX FORA*
```

### Pour ``CANCEL`` une activiter ecrire ``C``dans la colonne ``NP``

![alt text](images/image-4.png)

 Menu initial > F3 > 2 > ``LOGOFF`` pour une déconnexion

### ``I`` permet de voir les programe en file d'attente.



## Programme Cobol

````c
profile          //permet d'afficher le profile du fichier cobol
````

```c
AUTOSAVE ON      //permet d'activer la sauvegarde auto sur le fichier
```

```c
HILITE COBOL     //permet une lecture du code en style COBOL
```

```c
Undo             //permet de restauré les dernières modification
```


![alt text](images/image.png)
