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
C FORMB FORA08
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
