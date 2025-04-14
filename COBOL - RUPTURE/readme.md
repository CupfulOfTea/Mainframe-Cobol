## TP1 - RUPTURE

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. A08MPGMB.
       AUTHOR. ALEXANDRE.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FEMPLOYES ASSIGN TO DDENTREE
               FILE STATUS IS CR-EMP.

       DATA DIVISION.

       FILE SECTION.
       FD FEMPLOYES
           RECORDING MODE IS F
           DATA RECORD IS ENR-EMP.

       01 ENR-EMP.
           05 DEP-NUM         PIC X(3).
           05 FILLER          PIC X(2).
           05 NOM-PRENOM      PIC X(13).
           05 FILLER          PIC X(2).
           05 SALAIRE         PIC 9(5).
           05 FILLER          PIC X(55).

       WORKING-STORAGE SECTION.
       01 CR-EMP               PIC XX.
       01 TOTAL-SALAIRE        PIC 9(6) VALUE ZEROS.
       01 DEP-CURRENT          PIC X(3).
       01 DEP-PREVIOUS         PIC X(3) VALUE SPACES.

       01 TEXTE-TOTAL.
           05 FILLER           PIC X(14) VALUE 'TOTAL DEP '.
           05 TEXTE-DEP        PIC X(3).
           05 FILLER           PIC X(3) VALUE ' : '.
           05 TEXTE-MONTANT    PIC Z(6).

       PROCEDURE DIVISION.

       DEBUT.
           PERFORM INITIALISATION
           PERFORM TRAITEMENT UNTIL CR-EMP = '10'
           PERFORM AFFICHER-DERNIER-TOTAL
           PERFORM FIN
           STOP RUN.

       INITIALISATION.
           OPEN INPUT FEMPLOYES
           IF CR-EMP NOT = '00'
               DISPLAY 'ERREUR OUVERTURE FICHIER : ' CR-EMP
               MOVE '10' TO CR-EMP
           ELSE
               PERFORM LIRE-ENR
           END-IF.

       TRAITEMENT.
           IF CR-EMP = '10'
               EXIT PARAGRAPH
           END-IF

           MOVE DEP-NUM TO DEP-CURRENT

           IF DEP-CURRENT NOT = DEP-PREVIOUS AND DEP-PREVIOUS NOT = SPACES
               PERFORM AFFICHER-TOTAL
               MOVE 0 TO TOTAL-SALAIRE
           END-IF

           ADD SALAIRE TO TOTAL-SALAIRE
           MOVE DEP-CURRENT TO DEP-PREVIOUS

           PERFORM LIRE-ENR.

       LIRE-ENR.
           READ FEMPLOYES
           IF CR-EMP = '10'
               DISPLAY 'FIN DE FICHIER            ' CR-EMP
           ELSE
           IF CR-EMP NOT = '00'
               DISPLAY 'ERREUR LECTURE FICHIER     ' CR-EMP
               MOVE '10' TO CR-EMP
           END-IF
           END-IF.

       AFFICHER-TOTAL.
           MOVE DEP-PREVIOUS TO TEXTE-DEP
           MOVE TOTAL-SALAIRE TO TEXTE-MONTANT
           DISPLAY TEXTE-TOTAL.

       AFFICHER-DERNIER-TOTAL.
           IF DEP-PREVIOUS NOT = SPACES
               PERFORM AFFICHER-TOTAL
           END-IF.

       FIN.
           CLOSE FEMPLOYES
           IF CR-EMP NOT = '00'
               DISPLAY 'ERREUR FERMETURE FICHIER : ' CR-EMP
           END-IF.
```

### EXECUTION DU PROGRAMME 
```JCL
//FORA08E JOB ACCTFORA,'FORA08',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID,
//        TIME=(,1)                                               
//*--------------------------------------------------------------*
//*---      EXECUTION DE PROGRAMME BATCH                      ---*
//*--------------------------------------------------------------*
//JOBLIB DD DSN=FORA99.LIB.LOAD,DISP=SHR                          
//STEP1   EXEC PGM=A08EPGMB                                       
//SYSOUT DD SYSOUT=*                                              
//SYSPRINT DD SYSOUT=*                                            
//DDENTREE  DD DSN=FORA08.SEQ.RUPTURE1,DISP=SHR                    
```


## TP1 - RUPTURE AVEC FICHIER DE SORTIE

```cobol
       IDENTIFICATION DIVISION.               
       PROGRAM-ID. A08IPGMB.                  
       AUTHOR. ALEXANDRE.                     
                                              
       ENVIRONMENT DIVISION.                  
       CONFIGURATION SECTION.                 
                                              
       INPUT-OUTPUT SECTION.                  
       FILE-CONTROL.                          
           SELECT FEMPLOYES ASSIGN TO DDENTREE
               FILE STATUS IS CR-EMP.         
           SELECT FSORTIE ASSIGN TO DDSORTIE. 
                                              
       DATA DIVISION.                         
       FILE SECTION.                          
       FD FEMPLOYES                           
           RECORDING MODE IS F                
           DATA RECORD IS ENR-EMP.            
                                              
       01 ENR-EMP.                            
          05 DEP-NUM         PIC X(3).        
          05 FILLER          PIC X(2).        
          05 NOM-PRENOM      PIC X(13).       
          05 FILLER          PIC X(2).        
          05 SALAIRE         PIC 9(4).        
          05 FILLER          PIC X(56).       
                                              
       FD FSORTIE                             
           RECORDING MODE IS F                
           DATA RECORD IS SOR-EMP.            
                                              
       01 SOR-EMP.                            
          05 FILLER-TOTAL     PIC X(10).      
          05 TEXTE-DEP        PIC X(3).       
          05 FILLER-SEP       PIC X(3).       
          05 TEXTE-MONTANT    PIC Z(5)9.
          05 FILLER-TOTO      PIC X(58).                   
                                                           
       WORKING-STORAGE SECTION.                            
       77 FILLER-SPACES        PIC X(58) VALUE SPACES.
       01 CR-EMP               PIC XX.                     
       01 TOTAL-SALAIRE        PIC 9(6) VALUE ZEROS.       
       01 DEP-CURRENT          PIC X(3).                   
       01 DEP-PREVIOUS         PIC X(3) VALUE SPACES.      
                                                           
       PROCEDURE DIVISION.                                 
       DEBUT.                                              
           PERFORM INITIALISATION                          
           PERFORM TRAITEMENT UNTIL CR-EMP = '10'          
           PERFORM AFFICHER-DERNIER-TOTAL                  
           PERFORM FIN                                     
           STOP RUN.                                       
                                                           
       INITIALISATION.                                     
           OPEN INPUT FEMPLOYES                            
           OPEN OUTPUT FSORTIE                             
                                                           
           IF CR-EMP NOT = '00'                            
               DISPLAY 'ERREUR OUVERTURE FICHIER : ' CR-EMP
               MOVE '10' TO CR-EMP                         
           ELSE                                            
               PERFORM LIRE-ENR                            
           END-IF.                                         
                                                           
       TRAITEMENT.                                         
           IF CR-EMP = '10'                                
               EXIT PARAGRAPH                              
           END-IF                                          
                                                           
           MOVE DEP-NUM TO DEP-CURRENT                     

           IF DEP-CURRENT NOT = DEP-PREVIOUS               
               AND DEP-PREVIOUS NOT = SPACES               
               PERFORM AFFICHER-TOTAL                      
               MOVE 0 TO TOTAL-SALAIRE                     
           END-IF                                          
                                                           
           ADD SALAIRE TO TOTAL-SALAIRE                    
           MOVE DEP-CURRENT TO DEP-PREVIOUS                
           PERFORM LIRE-ENR.                               
                                                           
       LIRE-ENR.                                           
           READ FEMPLOYES                                  
           IF CR-EMP = '10'                                
               DISPLAY 'FIN DE FICHIER            ' CR-EMP 
           ELSE                                            
           IF CR-EMP NOT = '00'                            
               DISPLAY 'ERREUR LECTURE FICHIER     ' CR-EMP
               MOVE '10' TO CR-EMP                         
           END-IF                                          
           END-IF.                                         
                                                           
       AFFICHER-TOTAL.                                     
           MOVE 'TOTAL DEP ' TO FILLER-TOTAL               
           MOVE DEP-PREVIOUS TO TEXTE-DEP                  
           MOVE TOTAL-SALAIRE TO TEXTE-MONTANT             
           MOVE ' : ' TO FILLER-SEP
           MOVE FILLER-SPACES TO FILLER-TOTO             
           WRITE SOR-EMP.                                  
                                                           
       AFFICHER-DERNIER-TOTAL.                             
           IF DEP-PREVIOUS NOT = SPACES                    
               PERFORM AFFICHER-TOTAL                      
           END-IF.                                         
                                                           
       FIN.                                                
           CLOSE FEMPLOYES
           CLOSE FSORTIE.                               
```

### EXECUTION DU PROGRAMME 
```JCL
//FORA08E JOB ACCTFORA,'FORA08',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID,
//        TIME=(,1)                                               
//*--------------------------------------------------------------*
//*---      EXECUTION DE PROGRAMME BATCH                      ---*
//*--------------------------------------------------------------*
//JOBLIB DD DSN=FORA99.LIB.LOAD,DISP=SHR                          
//STEP1   EXEC PGM=A08EPGMB                                       
//SYSOUT DD SYSOUT=*                                              
//SYSPRINT DD SYSOUT=*                                            
//DDENTREE  DD DSN=FORA08.SEQ.RUPTURE1,DISP=SHR
//DDSORTIE DD DSN=FORA08.SEQ.SRUPTURE,                      
//            DISP=(NEW,CATLG,DELETE),                      
//            SPACE=(TRK,(1,1),RLSE),                       
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=23200,DSORG=PS)                  
```
