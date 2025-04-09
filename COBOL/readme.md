## HELLO WORLD

```COBOL
       IDENTIFICATION DIVISION.
       PROGRAM-ID. A08APGMB.
       AUTHOR. ALEXANDRE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.
           DISPLAY 'HELLO WORLD'
           STOP RUN.
```
```
HILIGHT COBOL
```
### NOM DE PROGRAMME A UTILISER CORRESPONDENT AU REGLE DEFINIE
```
A08APGMB
```
### NOM DU COMPILATEUR
```
ACOBBTCH
```

### REMPLACEMENT D'UN MOT DANS TOUT UN FICHIER VIA COMMANDE 
```
C FORMB FORA08 all
```

### LIB D'EXECUTION DE PROGRAMME JCL
```
FORA99.LIB.LOAD
```

## COMPILATION DU PROGRAMME BATCH
```JCL
//FORA08C JOB ACCTFORA,'FORA08',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID
//*--------------------------------------------------------------*
//*---     PROCEDURE DE COMPILATION DES PROGRAMMES BATCH      ---*
//*--------------------------------------------------------------*
//COBBTCH EXEC ACOBBTCH,PGMB=A08APGMB
//SYSLINKDDDSN=FORA99.LIB.LOAD,DISP=SHR
//SYSLIB  DD DSN=FORA08.LIB.COPY,DISP=SHR
//LKED.SYSIN DD *
  ENTRY A08APGMB
  NAME  A08APGMB(R)
/*
```
## EXECUTION DE PROGRAMME BATCH
```jcl
//FORAXXE JOB ACCTFORA,'FORA00',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID 
//*--------------------------------------------------------------*
//*---      EXECUTION DE PROGRAMME BATCH                      ---* 
//*--------------------------------------------------------------*
//JOBLIB DD DSN=FORA99.LIB.LOAD,DISP=SHR                          
//STEP1   EXEC PGM=AXXAPGMT                                       
//SYSOUT DD SYSOUT=*                                              
//SYSPRINT DD SYSOUT=*                                            
```

![alt text](images/image.png)

## A08BPGMB

```COBOL
       IDENTIFICATION DIVISION.
       PROGRAM-ID. A08BPGMB.   
       AUTHOR. ALEXANDRE.      
       ENVIRONMENT DIVISION.   
       DATA DIVISION.          
       WORKING-STORAGE SECTION.
       01   CHAMP PIC X(80).   
       PROCEDURE DIVISION.     
           ACCEPT CHAMP        
           DISPLAY CHAMP       
           STOP RUN.           
```

```JCL
//FORA08E JOB ACCTFORA,'FORA08',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID 
//*--------------------------------------------------------------*
//*---      EXECUTION DE PROGRAMME BATCH                      ---*
//*--------------------------------------------------------------*
//JOBLIB DD DSN=FORA99.LIB.LOAD,DISP=SHR                          
//STEP1   EXEC PGM=A08BPGMB                                       
//SYSIN DD *                                                      
1000 DUPOND PARIS 2500                                            
//SYSOUT DD SYSOUT=*                                              
//SYSPRINT DD SYSOUT=*
```
![alt text](images/image-1.png)

## A08CPGMB

```COBOL
        IDENTIFICATION DIVISION.                
        PROGRAM-ID. A08CPGMB.                   
        AUTHOR. ALEXANDRE. 

        ENVIRONMENT DIVISION. 

        DATA DIVISION.                          
        WORKING-STORAGE SECTION.                
        01   CHAMP PIC X(80).  

        PROCEDURE DIVISION.                     
        DEBUT.                                  
            ACCEPT CHAMP.                       
        BOUCLE.                                 
            PERFORM LECTURE UNTIL CHAMP(1:4) = '9999'
            STOP RUN.                           
        LECTURE.                                
            DISPLAY CHAMP                       
            ACCEPT CHAMP.                                                                              
```

```JCL
//FORA08E JOB ACCTFORA,'FORA08',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID,
//        TIME=(,1) 
//*--------------------------------------------------------------*
//*---      EXECUTION DE PROGRAMME BATCH                      ---*
//*--------------------------------------------------------------*
//JOBLIB DD DSN=FORA99.LIB.LOAD,DISP=SHR                          
//STEP1   EXEC PGM=A08BPGMB                                       
//SYSIN DD *                                                      
1000 DUPOND PARIS 2500                                            
2000 DUPUIS PARIS 2000                                            
3000 TOTO   AIX   5250 
9999                                           
//SYSOUT DD SYSOUT=*                                              
//SYSPRINT DD SYSOUT=*                                            
```

![alt text](images/image-2.png)
