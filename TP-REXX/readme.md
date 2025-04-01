## Exercice -TSO


1. Un IBM 3270 est un type de **Terminal** traditionnellement utilisé pour accéder à un mainframe.  
2. **TSO/E** est l'interface de ligne de commande utilisée pour accéder au système d'exploitation z/OS.  
3. **ISPF** est l'interface pilotée par menu utilisée pour accéder au système d'exploitation z/OS.  
4. **Function keys** peuvent être programmées pour exécuter des commandes spécifiques lorsqu'elles sont enfoncées.  
5. L’invite **READY** indique que TSO attend une commande.  
6. **PComm** est utilisé pour connecter un poste de travail à un ordinateur central à l’aide des informations TCP/IP.  
7. Un écran ISPF est appelé **panel**.  
8. Dans notre environnement de laboratoire, le système z/VM s’appellerait le système **guest** et le système z/OS serait appelé le système **host**.  


## TP - REXX
### MATH1
```
'FORA08.LIB.REXX(MATH1)'
```

```
/* REXX */
Say "Please enter two numbers:"
Parse Pull num1 num2   /* Récupère l'entrée de l'utilisateur */

Say "You entered" num1 "and" num2

/* Effectuer les opérations */
sum = num1 + num2
diff = num1 - num2
prod = num1 * num2
div1 = num1 / num2
intDiv = num1 % num2
remainder = num1 // num2

/* Affichage des résultats */
Say num1 "+" num2 "=" sum
Say num1 "-" num2 "=" diff
Say num1 "*" num2 "=" prod
Say num1 "/" num2 "=" div1
Say num1 "divided by" num2 "is" intDiv "with a remainder of" remainder
```
### MATH2
```
'FORA08.LIB.REXX(MATH2)'
```

```
/* REXX */
Say "Please enter two numbers:"
Parse Pull num1 num2   /* Récupère l'entrée de l'utilisateur */

Say "You entered" num1 "and" num2

/* Affichage des résultats */
Say num1 "+" num2 "=" num1 + num2
Say num1 "-" num2 "=" num1 - num2
Say num1 "*" num2 "=" num1 * num2


if num2 = 0 then
    "The second number is 0: division cannot be done."
else
DO
    Say num1 "/" num2 "=" = num1 / num2 
    Say num1 "divided by" num2 "is" num1 % num2 "with a remainder of" num1 // num2
END
```

### MYMATH

1. Demande à l'utilisateur de choisir une opération (addition, soustraction, multiplication ou division).

2. Récupère l'opération choisie.

3. Demande à l'utilisateur d'entrer deux nombres.

4. Effectue l'opération et affiche le résultat.

5. Gère la division par zéro.

```
/* REXX */
Say "Do you wish to add, subtract, multiply, or divide?"
Parse Pull operation  /* Lire le choix de l'utilisateur */

Say "Please enter two numbers:"
Pull num1 num2  /* Lire les deux nombres */


/* Vérifier l'opération et effectuer le calcul */
Select
   When operation = "add" Then
      result = num1 + num2
   When operation = "subtract" Then
      result = num1 - num2
   When operation = "multiply" Then
      result = num1 * num2
   When operation = "divide" Then Do
      If num2 = 0 Then
         Say "Error: Cannot divide by zero!"
      Else
         result = num1 / num2
   End
   Otherwise
      Say "Invalid operation. Please enter add, subtract, multiply, or divide."
End

/* Affichage du résultat si l'opération est valide */
If operation = "add" | operation = "subtract" | operation = "multiply" | (operation = "divide" & num2 \= 0) Then
   Say num1 operation num2 "=" result

```
 
```
/* REXX */                                                              
Say "Do you wish to add, subtract, multiply, or divide?"                
Parse Pull operation  /* Lire le choix de l'utilisateur */                    
Say "Please enter two numbers:"                                         
Pull num1 num2  /* Lire les deux nombres */                             
/* Vérifier l'opération et effectuer le calcul */                       
Select                                                                  
   When operation = "add" Then                                          
      Say num1 "+" num2 "=" num1 + num2                                 
   When operation = "subtract" Then                                     
      Say num1 "-" num2 "=" num1 - num2                                 
   When operation = "multiply" Then                                     
      Say num1 "*" num2 "=" num1 * num2                                 
   When operation = "divide" Then Do                                    
      If num2 = 0 Then                                                  
         Say "Error: Cannot divide by zero!"                            
      Else                                                              
         Say num1 "/" num2 "=" num1 / num2                              
   End                                                                  
   Otherwise                                                            
      Say "Invalid operation. Please enter add, subtract, multiply, 
      "or divide."                                                                 
End                                                                     
```

### MATH3

```
/* REXX - MATH3 */
Say "Welcome to MATH3. Type 'exit' to quit."

Do Forever   /* Boucle infinie, jusqu'à ce que l'utilisateur entre 'exit' */

   /* Demander et valider l'entrée */
   Do Forever
      Say "Please enter two numbers:"
      Parse Pull input
      If input = "exit" Then Do
         Say "Goodbye."
         Exit
      End
      Parse Var input num1 num2
      
      /* Vérifier si exactement deux nombres sont entrés */
      If DATATYPE(num1, "N") & DATATYPE(num2, "N") Then
        Leave   /* Sort de la boucle si l'entrée est correcte */
      Else
        Say "At least one variable is not an integer."
   End


   /* Afficher les nombres saisis */
   Say "You entered" num1 "and" num2 "."

   /* Effectuer les calculs */
   Say num1 "+" num2 "=" num1 + num2
   Say num1 "-" num2 "=" num1 - num2
   Say num1 "*" num2 "=" num1 * num2

   /* Gestion de la division */
   If num2 = 0 Then
      Say "Second number is 0: division cannot be done."
   Else Do
      Say num1 "/" num2 "=" num1 / num2
      Say num1 "divided by" num2 "is" num1 % num2 "with a remainder of",
          num1 // num2
   End

End  /* Fin de la boucle principale */

```

### MYMATH2
```
/* REXX */
Do Forever
   Say "Do you wish to add, subtract, multiply, divide, or exit?"
   Parse Pull operation
   
   /* Vérifier si l'utilisateur veut quitter */
   If operation = "exit" Then Do
      Say "Goodbye."
      Exit
   End
   
   Say "Please enter two numbers:"
   Pull num1 num2

   /* Vérifier si num1 et num2 sont bien numériques */
   If Datatype(num1, "N") = 0 | Datatype(num2, "N") = 0 Then Do
      Say "Error: Both inputs must be numeric."
      Iterate
   End
   
   Select
      When operation = "add" Then
         Say num1 "+" num2 "=" num1 + num2
      When operation = "subtract" Then
         Say num1 "-" num2 "=" num1 - num2
      When operation = "multiply" Then
         Say num1 "*" num2 "=" num1 * num2
      When operation = "divide" Then Do
         If num2 = 0 Then
            Say "Error: Cannot divide by zero!"
         Else
            Say num1 "/" num2 "=" num1 / num2
      End
      Otherwise                                                            
        Say "Invalid operation. Please enter add, subtract, multiply", 
            "or divide."
   End     
End
```
