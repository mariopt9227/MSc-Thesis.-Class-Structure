
*****************PROGRAMACION DE LAS BASES 2013, 2010, 2006 Y 2001 DE LAS EPHPM DE HONDURAS*************

***Ponderacion por Factor de Expansion***

**Comando para desactivar ponderación por factor de expansión**

WEIGHT OFF.

**Comando para activar ponderación por factor de expansión**

WEIGHT BY factor.

******************CONSTRUCCION Y PROGRAMACION DE LOS CONSTRUCTOS TEÓRICOS: A) DIMENSION LABORAL Y B) CIUDADANIA SOCIAL*********************

************************ I. DIMENSION DE LA INSERCIÓN LABORAL************************************

********************SUB ESCALA DE PRECARIEDAD LABORAL*****************
**PRIMER PASO**
*** Recodificación de la variable categoría ocupacional*** 

***Creación de la variable SECTOR_REC***  **Permite distinguir entre sector público y no público**

RECODE CE31 (1=0) (2 thru 13=1) (ELSE=SYSMIS) INTO Sector_REC.
EXECUTE.

**SEGUNDO PASO**
**Creación de la variabale tipo de inserción laboral. Para todas las BASES**
**Creación de la variable tipo de inserción laboral**

RECODE CE31 (1 thru 3=1) (4=2) (5=2) (8=2) (9=2) (6=3) (7=3) (10=3) (11=3) (12=4) (13=4)  INTO 
    Tipo_insercion.
EXECUTE.

FREQUENCIES VARIABLES=Tipo_insercion.

**TERCER PASO**
***Creación de la variable Jornada Laboral***

**Se les cumple la Jornada Laboral**

IF  ((Sector_REC =  0 & thoras <= 40) | (Sector_REC = 1 & thoras <= 44)  & (tipo_insercion=1)) Jornada_labo=0.
EXECUTE.

**Tambien se les cumple a quienes en ocupación principal, tenían el puesto de Directores, Gerentes y Administradores Generales**(ESTE CRITERIO SOLO SE APLICO A 2010)**

DO IF (ocupaop = 1).
RECODE Jornada_labo (1=0).
END IF.
EXECUTE.

**No se les cumple la Jornada**

DO IF (Tipo_insercion = 1).
RECODE Jornada_labo (SYSMIS=1).
END IF.
EXECUTE.

***Frecuencia de la variable Jornada laboral***

FREQUENCIES VARIABLES=Jornada_labo
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**CUARTO PASO**
***Construcción de la variable Salario Mínimo. BASE 2013****
***Se construyó siguiendo los criterios de la STSS sobre el monto del salario mínimo según tamaño de establcimiento y rama de actividad***

**Recodificación de la variable Tamaño**

RECODE CE32_CANTIDAD (SYSMIS=SYSMIS) (0 thru 10=1) (11 thru 50=2) (51 thru 150=3) (151 thru 
    4000=4) INTO Tamaño.
EXECUTE.

**Frecuencia Tamaño**

FREQUENCIES VARIABLES=Tamaño
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

****Salario mínimo Base 2013****

COMPUTE Salario_minimo_final=0.
EXECUTE.

DO IF ((Ramaop = 1 & Tamaño = 1 & ysmop < 4870)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 1 & Tamaño = 2 & ysmop < 5125)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 1 & Tamaño = 3 & ysmop < 5187)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 1 & Tamaño = 4 & ysmop < 5286)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 2 & Tamaño = 1 & ysmop < 6654)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 2 & Tamaño = 2 & ysmop < 6854)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 2 & Tamaño = 3 & ysmop < 7208)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 2 & Tamaño = 4 & ysmop < 7345)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 3 & Tamaño = 1 & ysmop < 6535)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 3 & Tamaño = 2 & ysmop < 6948)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 3 & Tamaño = 3 & ysmop < 7307)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 3 & Tamaño = 4 & ysmop < 7447)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 4 & Tamaño = 1 & ysmop < 6869)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 4 & Tamaño = 2 & ysmop < 7075)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 4 & Tamaño = 3 & ysmop < 7440)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 4 & Tamaño = 4 & ysmop < 7582)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 5 & Tamaño = 1 & ysmop < 6746)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 5 & Tamaño = 2 & ysmop < 6948)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 5 & Tamaño = 3 & ysmop < 7307 )).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 5 & Tamaño = 4 & ysmop < 7447)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 6 & Tamaño = 1 & ysmop < 6746)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 6 & Tamaño = 2 & ysmop < 6948)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 6 & Tamaño = 3 & ysmop < 7307)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 6 & Tamaño = 4 & ysmop < 7447)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 7 & Tamaño = 1 & ysmop < 6807)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 7 & Tamaño = 2 & ysmop < 7012)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 7 & Tamaño = 3 & ysmop < 7374)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 7 & Tamaño = 4 & ysmop < 7515)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 8 & Tamaño = 1 & ysmop < 6930)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 8 & Tamaño = 2 & ysmop < 7138)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 8 & Tamaño = 3 & ysmop < 7507)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 8 & Tamaño = 4 & ysmop < 7650)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 9 & Tamaño = 1 & ysmop < 6623)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 9 & Tamaño = 2 & ysmop < 6623)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 9 & Tamaño = 3 & ysmop < 7174)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Ramaop = 9 & Tamaño = 4 & ysmop < 7312)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF (Tipo_insercion ~= 1).
RECODE Salario_minimo_final (0=SYSMIS).
END IF.
EXECUTE.

**Frecuencia salario mínimo**

FREQUENCIES VARIABLES=Salario_minimo_final
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**QUINTO PASO**
***Construcción de la variable Salario Mínimo. BASE 2010****
***Se construyó siguiendo los criterios de la STSS sobre el monto del salario mínimo según tamaño de establecimiento y zona: urbana o rural***

**Recodificación de la variable Tamaño. Siguiendo los criterios de la legislación laboral de 2010 de la STSS**

RECODE CE32_CANTIDAD (1 thru 20=1) (21 thru 50=2) (51 thru 5000=3) (SYSMIS=SYSMIS) INTO Tamaño.
EXECUTE.

**Frecuencia Tamaño**

FREQUENCIES VARIABLES=Tamaño
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**Salario Mínimo 2010**
***Los criterios y condiciones han sido guiados por la normativa laboral vigente, considerando TAMAÑO, ZONA: URBANA-RURAL E INGRESO MONETARIO Ocupación Principal**

COMPUTE Salario_minimo_final=0.
EXECUTE.

DO IF ((Tamaño = 1 & ur = 2 & ysmop < 4055)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Tamaño = 2 & ur = 1 & ysmop < 5665)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Tamaño = 2 & ur = 2 & ysmop < 4176)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Tamaño = 3 & ur = 1 & ysmop < 5886)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF ((Tamaño = 3 & ur = 2 & ysmop < 4339.50)).
RECODE Salario_minimo_final (0=1).
END IF.
EXECUTE.

DO IF (Tipo_insercion ~= 1).
RECODE Salario_minimo_final (0=SYSMIS).
END IF.
EXECUTE.

FREQUENCIES VARIABLES=Salario_minimo_final
  /ORDER=ANALYSIS.

********Construcción de la variable Salario Mínimo. BASE 2006*******
**Recodificación de la variable Tamaño**

RECODE P45 (SYSMIS=SYSMIS) (1=0) (2=1) INTO Tamaño.
EXECUTE.

***Imputación de datos***

DO IF (Tipo_insercion = 1).
RECODE Tamaño (SYSMIS=1).
END IF.
EXECUTE.

FREQUENCIES VARIABLES=Tamaño
  /ORDER=ANALYSIS.

****Salario mínimo Base 2006**

COMPUTE Salario_minimo_final=99.
EXECUTE.

DO IF ((Tipo_insercion = 2)).
RECODE Salario_minimo_final (99=SYSMIS).
END IF.
EXECUTE.

DO IF ((Tipo_insercion = 3)).
RECODE Salario_minimo_final (99=SYSMIS).
END IF.
EXECUTE.

DO IF ((Tipo_insercion = 4)).
RECODE Salario_minimo_final (99=SYSMIS).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=1 & ysmop<2040)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=1 & ysmop>=2040)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.
 
 
DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=1 & ysmop<2578.8)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=1 & ysmop>=2578.8)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.


DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=2  | Ramaop=3 | Ramaop=4 | Ramaop=5 | Ramaop=6 | Ramaop=9 & ysmop<2241.3)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=2  | Ramaop=3 | Ramaop=4 | Ramaop=5 | Ramaop=6 | Ramaop=9 & ysmop>=2241.3)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=2  | Ramaop=3 | Ramaop=4 | Ramaop=5 | Ramaop=6 | Ramaop=9 & ysmop<2743.8)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=2  | Ramaop=3 | Ramaop=4 | Ramaop=5 | Ramaop=6 | Ramaop=9 & ysmop>=2743.8)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=7 & ysmop<2551.2)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=7 & ysmop>=2551.2)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=7 & ysmop<2660.1)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=7 & ysmop>=2660.1)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=8 & ysmop<3211.8)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=0 & Ramaop=8 & ysmop>=3211.8)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=8 & ysmop<3211.8)).
RECODE Salario_minimo_final (99=1).
END IF.
EXECUTE.

DO IF ((Tipo_insercion=1 & Tamaño=1 & Ramaop=8 & ysmop>=3211.8)).
RECODE Salario_minimo_final (99=0).
END IF.
EXECUTE.

RECODE Salario_minimo_final (99=SYSMIS).
EXECUTE.


FREQUENCIES VARIABLES=Salario_minimo_final
  /ORDER=ANALYSIS.



**SEXTO PASO**
****Creación estabilidad laboral. BASE 2013*****

COMPUTE Estabilidad=99.
EXECUTE.

**No cumple**

DO IF (CE34 = 1 | CE34 = 4).
RECODE Estabilidad (99=1).
END IF.
EXECUTE.

*Sí cumple*

DO IF (CE34 = 2 | CE34 = 3 | CE34 = 9).
RECODE Estabilidad (99=0).
END IF.
EXECUTE.

**Los demás valores perdidos**

RECODE Estabilidad (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable Estabilidad Laboral. BASE 2013**

FREQUENCIES VARIABLES=Estabilidad
  /FORMAT=AFREQ
  /ORDER=ANALYSIS.

**SÉTIMO PASO**
**Creación de la variable Estabilidad Laboral. BASE 2010 y 2006**
***Se realizó otra recodificacion porque los valores de la variable original eran distintos en la 2013 en compración a 2010 y 2006***
**Se le puse el mismo nombre de la variable CE34 (base 2010) a la variable p47 (base 2006) para utilizar la misma sintaxis**


COMPUTE Estabilidad=99.
EXECUTE.

**No cumple**

DO IF (CE34 = 2).
RECODE Estabilidad (99=1).
END IF.
EXECUTE.

*Sí cumple*

DO IF (CE34 = 1).
RECODE Estabilidad (99=0).
END IF.
EXECUTE.

**Los demás valores perdidos**

RECODE Estabilidad (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable Estabilidad Laboral. BASES 2006 Y 2010**

FREQUENCIES VARIABLES=Estabilidad
  /FORMAT=AFREQ
  /ORDER=ANALYSIS.


**OCTAVO PASO**
***Construcción de la variable IHSS para asalariados. BASE 2013***

DO IF  (Tipo_insercion = 1).
RECODE CE23_5 (5=0) (SYSMIS=1) INTO IHSS.
END IF.
EXECUTE.

**NOVENO PASO**
**Construcción de la variable IHSS para asalariados. BASE 2010**
**Por la forma en como se digitó la respuesta, todos los registos que tuviesen el numero 5 eran quienes cotizan al IHSS**

DO IF  (Tipo_insercion = 1).
RECODE CE23 (5=0)(15=0)(25=0)(35=0)(45=0)(56 thru 59=0)(125=0)(135=0)(45=0)(156 thru 159=0)(235=0)(245=0)(256 thru 259=0)(357 thru 359=0)(457 thru 459=0)(578=0)(589=0) 
(1256 thru 1259=0)(1567 thru 1569=0)(1579=0)(1589=0)(2345=0)(2359=0)(2457 thru 2458=0)(2578 thru 2579=0)(2589=0)(3569=0)(3579=0) (3579=0)(3589=0)(4567=0) 
(5678=0) (12456=0)(13578=0) (24567=0) (25679=0) (25689=0) (25789=0) (56789=0) (124567=0) (1234567=0)(SYSMIS=1)INTO IHSS. 
END IF.
EXECUTE.

***Construcción de la variable IHSS para asalariados. BASE 2006**
**Se utilizó la mima sintaxis que 2013**
**Se le puso el mismo nombre de la variable de 2013 a 2006**

DO IF  (Tipo_insercion = 1).
RECODE CE23_5 (1=0) (SYSMIS=1) INTO IHSS.
END IF.
EXECUTE.

********************************************************************************************************************************************************************************************************
**NO SE DEBE CORRER ESTO**
*********************************************************************************************************************************************************************************************************
**PASO 10**
**Creación de la variable Pensión. BASE 2013**

RECODE CE40_1 (0=5).
EXECUTE.

COMPUTE Pension=Tipo_insercion + CE40_1.
EXECUTE.

RECODE Pension (6=1) (2=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Pension
  /FORMAT=AFREQ
  /ORDER=ANALYSIS.

**PASO 11**
**Creación de la variable Pensión. BASE 2010**
**Se recodificó en una nueva variable la CE40 y se les asignará 0 a los número que tenga un 1 a pesar del número de dígitos, porque esos son quienes cotizan***

DO IF  (Tipo_insercion = 1).
RECODE CE40 (1=0) (137=0) (167=0) (1267=0) (1357=0) (1367=0) (1567=0) (1569=0) (12367=0) (12378=0) (12467=0) (13567=0) (13678=0) (13679=0) (123467=0) (123567=0) 
(123678=0) (123679=0) (125789=0) (135678=0) (136789=0) (1234567=0) (1234569=0) (1234678=0) (1234679=0) (1235678=0) (1235679=0) (1236789=0) (1345679=0) (1356789=0) 
(12345678=0) (12345679=0) (12346789=0) (1345679=0) (12356789=0) (123456789=0) (ELSE=1) INTO Pension.
END IF.
EXECUTE.

**Frecuencia de la variable pension. BASE 2010***

FREQUENCIES VARIABLES=Pension
  /ORDER=ANALYSIS.

**PASO 12**
**Creación de la variable Seguro por Accidente. BASE 2013**

RECODE CE40_5 (SYSMIS=6).
EXECUTE.

COMPUTE Accidente=Tipo_insercion + CE40_5.
EXECUTE.


RECODE Accidente (7=1) (6=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Accidente
  /ORDER=ANALYSIS.

**PASO 13**
**Creacion de la variable Seguro por Accidente. BASE 2010**
**Se recodificó de igual manera que la variable pensión, expuesta anteriormente**

DO IF (Tipo_insercion = 1).
RECODE CE40 (45=0)(56=0)(57=0)(245=0)(256=0)(257=0)(356=0)(357=0)(358=0)(456=0)(567=0)(1357=0)(1567=0)(1569=0)(2356=0)(2357=0)(2457=0)(2567=0)(3567=0)
(3569=0)(4567=0)(13567=0)(23456=0)(23457=0)(24567=0)(24569=0)(25679=0)(34567=0)(34589=0)(35679=0)(123567=0)(125789=0)(135678=0)(234567=0)(234578=0)
(235678=0)(235679=0)(235689=0)(235789=0)(245678=0)(245679=0)(256789=0)(345679=0)(356789=0)(1234567=0)(1234569=0)(1235678=0)(1235679=0)(12356789=0)
(23456789=0)(123456789=0) (ELSE=1) INTO Accidente.
END IF.
EXECUTE.

**Frecuencia de la variable Seguro por accidente. BASE 2010**

FREQUENCIES VARIABLES=Accidente
  /ORDER=ANALYSIS.

**PASO 14**
***Creación de la variable vacaciones. BASE 2013***

RECODE CE40_3 (SYSMIS=5).
EXECUTE.

COMPUTE Vacaciones=Tipo_insercion + CE40_3.
EXECUTE.

RECODE Vacaciones (6=1) (4=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Vacaciones
  /ORDER=ANALYSIS.

**PASO 15**
***Creacion de la variable Vacaciones para la BASE 2010***

DO IF (Tipo_insercion = 1).
RECODE CE40 (3=0)(23=0)(36=0)(37=0)(38=0)(234=0)(236=0)(237=0)(300=0)(356=0)(357=0)(358=0)(367=0)(378=0)(379=0)(1357=0)(1367=0)(2346=0)(2347=0)(2356=0)
(2357=0)(2367=0)(2368=0)(2378=0)(2379=0)(3467=0)(3567=0)(3569=0)(3678=0)(3679=0)(12367=0)(12378=0)(13567=0)(13678=0)(13679=0)(23456=0)(23457=0)(23467=0)
(23478=0)(23567=0)(23568=0)(23578=0)(23678=0)(23679=0)(23789=0)(34567=0)(34589=0)(34679=0)(35679=0)(36789=0)(123467=0)(123567=0)(123678=0)(123679=0)(135678=0)
(136789=0)(234567=0)(234578=0)(234678=0)(234679=0)(235678=0)(235679=0)(235689=0)(235789=0)(236789=0)(345679=0)(346789=0)(356789=0)(1234567=0)(1234569=0)
(1234678=0)(1234679=0)(1235678=0)(1235679=0)(1236789=0)(1345679=0)(1356789=0)(2345678=0)(2345679=0)(2346789=0)(2356789=0)(12345678=0)(12345679=0)
(12346789=0)(12356789=0)(23456789=0)(123456789=0)(ELSE=1) INTO Vacaciones.
END IF.
EXECUTE.

***Frecuencia de la variable able Vacaciones. BASE 2010***

FREQUENCIES VARIABLES=Vacaciones
  /ORDER=ANALYSIS.

**PASO 16**
****Creación de la variable Prestaciones Laborales. BASE 2013****

RECODE CE40_2 (SYSMIS=5).
EXECUTE.

COMPUTE Prestaciones=Tipo_insercion + CE40_2.
EXECUTE.

RECODE Prestaciones (6=1) (3=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Prestaciones
  /ORDER=ANALYSIS.

**PASO 17**
**Creación de la variable Prestaciones Laborales. BASE 2010**
**Se Recodificó  CE40 y se les asignará 0 a los número que tenga un 2 a pesar del número de dígitos, porque esos son quienes gozan de prestraciones laborales***

DO IF (Tipo_insercion = 1).
RECODE CE40 (2=0) (23=0) (24=0) (26=0) (27=0) (234=0) (236=0) (237=0) (245=0) (246=0) (256=0) (257=0) (267=0) (278=0) (1267=0) (2346=0) (2347=0) (2356=0) (2357=0) (2367=0)
(2368=0) (2378=0) (2379=0) (2457=0) (2467=0) (2567=0) (2678=0)(2679=0)(12367=0)(12378=0)(12467=0)(23456=0)(23457=0)(23467=0)(23478=0)(23567=0)(23568=0)(23578=0)
(3678=0)(23679=0)(23789=0)(24567=0)(24569=0)(24678=0)(24679=0)(25679=0)(123467=0)(123567=0)(123678=0)(123679=0)(125789=0)(234567=0)(234578=0)(234678=0)(234679=0)
(235678=0)(235679=0)(235689=0)(235789=0)(236789=0)(245678=0)(245679=0)(246789=0)(256789=0)(1234567=0)(1234569=0)(1234678=0)(1234679=0)(1235678=0)(1235679=0)
(1236789=0)(2345678=0)(2345679=0)(2346789=0)(2356789=0)(12345678=0)(12345679=0)(12346789=0)(12356789=0)(23456789=0)(123456789=0)(ELSE=1) INTO Prestaciones. 
END IF.
EXECUTE.

***Frecuencia de la variable Prestaciones. BASE 2010***

FREQUENCIES VARIABLES=Prestaciones
  /ORDER=ANALYSIS.

**PASO 18**
**Creación de la varaible pago de horas extras. BASE 2013**

RECODE CE40_4 (SYSMIS=5).
EXECUTE.

COMPUTE HorasExtras=Tipo_insercion + CE40_4.
EXECUTE.

RECODE HorasExtras (6=1) (5=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=HorasExtras
  /ORDER=ANALYSIS.

**PASO 19**
***Creacion de la variable Pago de Horas Extras BASE 2010***

DO IF (Tipo_insercion = 1).
RECODE CE40 (4=0)(24=0)(45=0)(47=0)(234=0)(245=0)(246=0)(456=0)(467=0)(2346=0)(2347=0)(2457=0)(2467=0)(3467=0)(4567=0)(4678=0)(12467=0)(23456=0)(23457=0)
(23467=0)(23478=0)(24567=0)(24569=0)(24678=0)(24679=0)(34567=0)(34589=0)(34679=0)(123467=0)(234567=0)(234578=0)(234678=0)(234679=0)(245678=0)(245679=0)
(246789=0)(345679=0)(346789=0)(1234567=0)(1234569=0)(1234678=0)(1234679=0)(12346789=0)(23456789=0)(123456789=0) (ELSE=1) INTO HorasExtras.
END IF.
EXECUTE.

***Frecuencia variable Horas Extras. BASE 2010***

FREQUENCIES VARIABLES=HorasExtras
  /ORDER=ANALYSIS.

**PASO 20**
**Creación de la varaible aguinaldo. BASE 2013**

RECODE CE40_6 (SYSMIS=8).
EXECUTE.

COMPUTE Aguinaldo=Tipo_insercion + CE40_6.
EXECUTE.

RECODE Aguinaldo (9=1) (7=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Aguinaldo
  /ORDER=ANALYSIS.

**PASO 21**
**Creación de la variable Aguinaldo. BASE 2010**

DO IF (Tipo_insercion = 1).
RECODE CE40 (6=0)(26=0)(36=0)(56=0)(67=0)(236=0)(246=0)(256=0)(267=0)(356=0)(367=0)(456=0)(467=0)(567=0)(678=0)(679=0)(1267=0)(1367=0)(1567=0)(1569=0)(2346=0)
(2356=0)(2367=0)(2368=0)(2467=0)(2567=0)(2678=0)(2679=0)(3467=0)(3567=0)(3569=0)(3678=0)(3679=0)(4567=0)(4678=0)(12367=0)(12467=0)(13567=0)(13678=0)(13679=0)
(23456=0)(23467=0)(23567=0)(23568=0)(23678=0)(23679=0)(24567=0)(24569=0)(24678=0)(24679=0)(25679=0)(34567=0)(34679=0)(35679=0)(36789=0)(123467=0)(123567=0)
(123678=0)(123679=0)(135678=0)(136789=0)(234567=0)(234678=0)(234679=0)(235678=0)(235679=0)(235689=0)(236789=0)(245678=0)(245679=0)(246789=0)(256789=0)
(345679=0)(346789=0)(356789=0)(1234567=0)(1234569=0)(1234678=0)(1234679=0)(1235678=0)(1235679=0)(1236789=0)(1345679=0)(1356789=0)(2345678=0)(2345679=0)
(2346789=0)(2356789=0)(12345678=0)(12345679=0)(12346789=0)(12356789=0)(23456789=0)(123456789=0) (ELSE=1) INTO Aguinaldo.
END IF.
EXECUTE.

**Frecuencia de la variable Aguinaldo. BASE 2010**

FREQUENCIES VARIABLES=Aguinaldo
  /ORDER=ANALYSIS.

**PASO 22**
**Creación de la variable Decimocuarto Salario. BASE 2013**

RECODE CE40_7 (SYSMIS=10).
EXECUTE.

COMPUTE Decimocuarto=Tipo_insercion + CE40_7.
EXECUTE.

RECODE Decimocuarto (11=1) (8=0) (ELSE=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=Decimocuarto
  /ORDER=ANALYSIS.

**PASO 23**
**Creación de la variable Decimocuarto Salario. BASE 2010**

DO IF (Tipo_insercion = 1).
RECODE CE40 (7=0)(27=0)(37=0)(47=0)(57=0)(67=0)(137=0)(167=0)(237=0)(257=0)(267=0)(278=0)(357=0)(367=0)(378=0)(379=0)(467=0)(567=0)(678=0)(679=0)(1267=0)(1357=0)
(1367=0)(1567=0)(2347=0)(2357=0)(2367=0)(2378=0)(2379=0)(2457=0)(2467=0)(2567=0)(2678=0)(2679=0)(3467=0)(3567=0)(3678=0)(3679=0)(4567=0)(4678=0)(12367=0)(12378=0)
(12467=0)(13567=0)(13678=0)(13679=0)(23457=0)(23467=0)(23478=0)(23567=0)(23578=0)(23678=0)(23679=0)(23789=0)(24567=0)(24678=0)(24679=0)(25679=0)(34567=0)
(34679=0)(35679=0)(36789=0)(123467=0)(123567=0)(123678=0)(123679=0)(125789=0)(135678=0)(136789=0)(234567=0)(234578=0)(234678=0)(234679=0)(235678=0)
(235679=0)(235789=0)(236789=0)(245678=0)(245679=0)(246789=0)(256789=0)(345679=0)(346789=0)(356789=0)(1234567=0)(1234678=0)(1234679=0)(1235678=0)
(1235679=0)(1236789=0)(1345679=0)(1356789=0)(2345678=0)(2345679=0)(2346789=0)(2356789=0)(12345678=0)(12345679=0)(12346789=0)(12356789=0)(23456789=0)
(123456789=0) (ELSE=1) INTO Decimocuarto.
END IF.
EXECUTE.

**Frecuencia de la variable Decimocuarto Salario. BASE 2010**

FREQUENCIES VARIABLES=Decimocuarto
  /ORDER=ANALYSIS.

****************************************************************************************************************************************************************************************************
****************************************************************************************************************************************************************************************************
**PASO 24** 
*********************************************************CONSTRUCCION DE LA SUB-ESCALA DE PRECARIEDAD LABORAL**************************************************************
***Sub Escala de Precariedad Laboral***
********SUB ESCALA DE PRECARIEDAD LABORAL.*******
***PARA TODAS LAS BASES***

COMPUTE SUB_ESCALA_PRECARIEDAD=(Jornada_labo + Estabilidad + IHSS + Salario_minimo_final)*2.5.
EXECUTE.

RECODE SUB_ESCALA_PRECARIEDAD (0=0) (2.5=1) (5=2) (7.5=3) (10=4) INTO Precariedad_niveles.
EXECUTE.

FREQUENCIES VARIABLES=Precariedad_niveles
  /ORDER=ANALYSIS.


*******************************************************************************************************************************************************************************************************
**NO SE DEBE CORRER ESTO**
*******************************************************************************************************************************************************************************************************
***SUB ESCALA DE PRECARIEDAD PONDERADA. (NO SERA UTILIZADA)***

COMPUTE SUB_ESCALA_PRECARIEDAD=(Salario_minimo_final * 2 + Estabilidad * 2 + Jornada_labo * 2 + 
    IHSS * 2 + Pension * 1.5 + Accidente * 1.5 + Vacaciones * 1.5 + Aguinaldo * 1 + Decimocuarto * 1 + 
    Prestaciones * 0.5 + HorasExtras * 0.5)/1.55.
EXECUTE.

**Frecuencia de la SUB ESCALA DE PRECARIEDAD PONDERADA***

FREQUENCIES VARIABLES=SUB_ESCALA_PRECARIEDAD
  /STATISTICS=STDDEV VARIANCE MEDIAN
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

**PASO 25**
**Construcción de la variable Niveles de precariedad laboral: a partir de la Sub Escala de Precariedad Laboral**
***Los niveles fueron definidos utilizando el recurso de la desviación estándar de la escala de precariedad laboral***
**La mediana de la Sub escala es de 6.69** 
**La desviación estándar (S) de la Sub_ escala es de 2.67 y 1/2(S) es 1.33**
** -1/2 (S) es igual a 5.36 en la campana de Gauss, y +1/2 (S) ES 8.02** 

RECODE SUB_ESCALA_PRECARIEDAD (Lowest thru 2.69=0) (2.70 thru 5.36=1) (5.37 thru 8.02=2) (8.03 thru 
    Highest=3) INTO Niveles_precariedad.
EXECUTE.

**Percentiles 33 y 66 de la sub escala de precariedad laboral**

FREQUENCIES VARIABLES=SUB_ESCALA_PRECARIEDAD
  /PERCENTILES=33.0 66.0 
  /ORDER=ANALYSIS.

** Frecuencia de la variable Niveles de Precariedad**

FREQUENCIES VARIABLES=Niveles_precariedad
  /ORDER=ANALYSIS.
******************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************

********************CONSTRUCCIÓN DE LA SUB ESCALA DE CREDENCIALES EDUCATIVAS PARA TODAS LAS BASES******************************************
**PASO 26**
**Construcción de la Sub Escala de Credenciales Educativas**

COMPUTE Escala_credenciales_educ=88.
EXECUTE.

*Primera recodificación: primaria incompleta y menos de primaria*

DO IF ((ED05 <= 3) | (ED10 <= 3)).
RECODE Escala_credenciales_educ (88=8).
END IF.
EXECUTE.

*Segunda recodificación: primaria completa*

DO IF ((ED05 = 4 & ED08 <= 9) | (ED10 = 4)).
RECODE Escala_credenciales_educ (88=7).
END IF.
EXECUTE.

*Tercera recodificación: ciclo común incompleto y primaria completa*

DO IF ((ED05 = 5 & (ED08 <= 3)) | (ED10 = 5)).
RECODE Escala_credenciales_educ (88=6).
END IF.
EXECUTE.

*Cuarta recodificación: ciclo común completo y diversificado incompleto*

DO IF ((ED05 = 6 & (ED08 <= 4)) | (ED10 = 6)).
RECODE Escala_credenciales_educ (88=5).
END IF.
EXECUTE.

*Quinta recodificación: diversificado completo y técnico superior incompleto*

DO IF ((ED05 = 7 | ED05 = 8) | (ED10 = 7)).
RECODE Escala_credenciales_educ (88=4).
END IF.
EXECUTE.

*Sexta recodificación: grado universitario incompleto*

DO IF ((ED05 = 9 & ED07 = 2) | (ED10= 9 & ED15 <= 8)).
RECODE Escala_credenciales_educ (88=3).
END IF.
EXECUTE.

*Séptima recodificación: grado universitario completo*

DO IF ((ED05 = 9 & ED07 = 1) | (ED10= 10 & ED15 <= 1)).
RECODE Escala_credenciales_educ (88=2).
END IF.
EXECUTE.

*Octava recodificación: postgrado incompleto*

DO IF ((ED05 = 10 & ED07 = 0) | (ED10 >= 1)).
RECODE Escala_credenciales_educ (88=1).
END IF.
EXECUTE.

*Novena recodificación: postgrado completo*

DO IF ((ED05 = 10 & ED07 = 1)).
RECODE Escala_credenciales_educ (88=0).
END IF.
EXECUTE.

**Frecuencia de la sub-escala de credenciales educativas 2013**

FREQUENCIES VARIABLES=Escala_credenciales_educ
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**PASO 27**
***Creación de la variable REZAGO con la cual se ajustó la Sub Escala de Credenciales Educativas***

COMPUTE Rezago=88.
EXECUTE.

DO IF ((NIVEL = 1 & EDAD <= 5)).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (NIVEL = 1 & (EDAD  >= 6  &  EDAD <= 9)).
RECODE Rezago (88=1).
END IF.
EXECUTE.

DO IF (NIVEL = 1 & (EDAD  >= 10  &  EDAD <= 13)).
RECODE Rezago (88=2).
END IF.
EXECUTE.

DO IF (NIVEL = 1 & EDAD  >= 14).
RECODE Rezago (88=3).
END IF.
EXECUTE.

DO IF (NIVEL = 2 & EDAD <= 12).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (NIVEL = 2 & (EDAD  >= 13  &  EDAD <= 16)).
RECODE Rezago (88=1).
END IF.
EXECUTE.

DO IF (NIVEL = 2 & (EDAD  >= 17  &  EDAD <= 20)).
RECODE Rezago (88=2).
END IF.
EXECUTE.

DO IF (NIVEL = 2 & EDAD  >= 21).
RECODE Rezago (88=3).
END IF.
EXECUTE.

DO IF (NIVEL = 3 & EDAD <= 18).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (NIVEL = 3 & (EDAD  >= 19  &  EDAD <= 22)).
RECODE Rezago (88=1).
END IF.
EXECUTE.

DO IF (NIVEL = 3 & (EDAD  >= 23  &  EDAD <= 26)).
RECODE Rezago (88=2).
END IF.
EXECUTE.

DO IF (NIVEL = 3 & EDAD  >= 27).
RECODE Rezago (88=3).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 3 & (EDAD >= 25 & EDAD <= 28)).
RECODE Rezago (88=1).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 3 & (EDAD >= 29 & EDAD <= 32)).
RECODE Rezago (88=2).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 3 & EDAD >= 33).
RECODE Rezago (88=3).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 0 | Escala_credenciales_educ = 1 | Escala_credenciales_educ = 2).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 3 & EDAD <= 24).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 4 & EDAD >= 20).
RECODE Rezago (88=0).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 4 & (EDAD >= 21 & EDAD <= 24)).
RECODE Rezago (88=1).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 4 & (EDAD >= 25 & EDAD <= 28)).
RECODE Rezago (88=2).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 4 & (EDAD >=  29)).
RECODE Rezago (88=3).
END IF.
EXECUTE.

RECODE Rezago (88=SYSMIS).
EXECUTE.

**Frecuencia de la variable Rezago**

FREQUENCIES VARIABLES=Rezago
  /ORDER=ANALYSIS.

**PASO 28**
***Creación de la variable  Probabilidad de Ingreso al Mercado laboral, a través de la cual, se ajustó la Sub Escala de Credenciales Educativas***
****Creación de la variable Probabilidad de Ingreso al Mercado laboral***

COMPUTE Proba_ingreso=88.
EXECUTE.

DO IF (Escala_credenciales_educ = 8 | Escala_credenciales_educ = 6 | Escala_credenciales_educ = 4 | 
    Escala_credenciales_educ = 3 | Escala_credenciales_educ = 1).
RECODE Proba_ingreso (88=0).
END IF.
EXECUTE.

DO IF (Escala_credenciales_educ = 7 | Escala_credenciales_educ = 5 | Escala_credenciales_educ = 2 | 
    Escala_credenciales_educ = 0).
RECODE Proba_ingreso (88=1).
END IF.
EXECUTE.

RECODE Proba_ingreso (88=SYSMIS).
EXECUTE.

**Frecuencia de la variable Probabilidad de Ingreso al Mercado de Trabajo**

FREQUENCIES VARIABLES=Proba_ingreso
  /ORDER=ANALYSIS.

**PASO 29**
**Creación de la variable Credenciales Ponderada. Construida a partir Rezago y la Probabilidad de Insertarse al Mercado de Trabajo**

COMPUTE Ponde_credenciales=99.
EXECUTE.

DO IF ((Rezago = 0 & Proba_ingreso = 1)).
RECODE Ponde_credenciales (99=0).
END IF.
EXECUTE.

DO IF ((Rezago = 0 & Proba_ingreso = 0)).
RECODE Ponde_credenciales (99=1).
END IF.
EXECUTE.

DO IF ((Rezago = 1 & Proba_ingreso = 1)).
RECODE Ponde_credenciales (99=2).
END IF.
EXECUTE.

DO IF ((Rezago = 1 & Proba_ingreso = 0)).
RECODE Ponde_credenciales (99=3).
END IF.
EXECUTE.

DO IF ((Rezago = 2 & Proba_ingreso = 1)).
RECODE Ponde_credenciales (99=4).
END IF.
EXECUTE.

DO IF ((Rezago = 2 & Proba_ingreso = 0)).
RECODE Ponde_credenciales (99=5).
END IF.
EXECUTE.

DO IF ((Rezago = 3 & Proba_ingreso = 1)).
RECODE Ponde_credenciales (99=6).
END IF.
EXECUTE.

DO IF ((Rezago = 3 & Proba_ingreso = 0)).
RECODE Ponde_credenciales (99=7).
END IF.
EXECUTE.

RECODE Ponde_credenciales (99=SYSMIS).
EXECUTE.

**Frecuecia de la variable Ponderación Credenciales**

FREQUENCIES VARIABLES=Ponde_credenciales
  /ORDER=ANALYSIS.

**PASO 30**
**Creación de la SUB ESCALA DE CREDENCIALES EDUCATIVAS**

COMPUTE SUB_ESCALA_CREDENCIALES=(Escala_credenciales_educ * Ponde_credenciales) / 8.
EXECUTE.

**Frecuencia de la Sub Escala de Credenciales Educativas**

FREQUENCIES VARIABLES=SUB_ESCALA_CREDENCIALES
  /STATISTICS=STDDEV VARIANCE MEDIAN
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

**Aplicación de la prueba de normalidad a la Sub-escala de credenciales educativas**Kolmogorov**

NPAR TESTS
  /K-S(NORMAL)=SUB_ESCALA_CREDENCIALES
  /MISSING ANALYSIS.

**PASO 31**
**Creación de la variable Niveles de Credenciales Educativas. BASE 2013**
**Los puntos de corte se obtuvieron a partir de la desviación estandar de la distribución de la variable Sub Escala de Credenciales**
**La mediana de la Sub escala de credenciales educativas era de 2.5 y luego se tomó 1/2 (S) para cada lado para obtener los puntos de corte (VER APUNTES CUADERNO)**

COMPUTE Niveles_credenciales_educ=99.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES <= 1.3).
RECODE Niveles_credenciales_educ (99=3).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES  > 1.3 &  SUB_ESCALA_CREDENCIALES  <= 3.7).
RECODE Niveles_credenciales_educ (99=2).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES > 3.7).
RECODE Niveles_credenciales_educ (99=1).
END IF.
EXECUTE.

RECODE Niveles_credenciales_educ (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable Niveles de Credeenciales Educativas**

FREQUENCIES VARIABLES=Niveles_credenciales_educ
  /ORDER=ANALYSIS.

**PASO 32**
**Creación de la variable Niveles de Credenciales Educativas. BASE 2010**
**Los puntos de corte se obtuvieron a partir de la desviación estandar de la distribución de la variable Sub Escala de Credenciales**
**La mediana de la Sub escala de credenciales educativas era de 2.5 y luego se tomó 1/2 (S) para cada lado para obtener los puntos de corte (VER APUNTES CUADERNO)**
**Los puntos de corte varían por muy poco en ambas bases**

COMPUTE Niveles_credenciales_educ=99.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES <= 1.29).
RECODE Niveles_credenciales_educ (99=3).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES  > 1.29 &  SUB_ESCALA_CREDENCIALES  <= 3.71).
RECODE Niveles_credenciales_educ (99=2).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES > 3.71).
RECODE Niveles_credenciales_educ (99=1).
END IF.
EXECUTE.

RECODE Niveles_credenciales_educ (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable Niveles de Credeenciales Educativas**

FREQUENCIES VARIABLES=Niveles_credenciales_educ
  /ORDER=ANALYSIS.


**Creación de la variable Niveles de Credenciales Educativas. BASE 2006**
**Los puntos de corte se obtuvieron a partir de la desviación estandar de la distribución de la variable Sub Escala de Credenciales**
**La mediana de la Sub escala de credenciales educativas era de 2.43 y luego se tomó 1/2 (S) para cada lado para obtener los puntos de corte (VER APUNTES CUADERNO)**
**Los puntos de corte varían por muy poco en las tres bases bases**

COMPUTE Niveles_credenciales_educ=99.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES <=0.66).
RECODE Niveles_credenciales_educ (99=3).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES  > 0.66 &  SUB_ESCALA_CREDENCIALES  <= 3.085).
RECODE Niveles_credenciales_educ (99=2).
END IF.
EXECUTE.

DO IF (SUB_ESCALA_CREDENCIALES > 3.085).
RECODE Niveles_credenciales_educ (99=1).
END IF.
EXECUTE.

RECODE Niveles_credenciales_educ (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable Niveles de Credeenciales Educativas**

FREQUENCIES VARIABLES=Niveles_credenciales_educ
  /ORDER=ANALYSIS.



**************************************************CONSTRUCCIÓN DE LA SUB ESCALA DE TIPOLOGÍA DE AUTOEMPLEO**************************************************************

**PASO 34**
**Creación de la variable ubicación del establecimiento. BASE 2013, 2010 y 2006**
**Se colocó el mismo nombre a las variables para que fuese la misma codificación para las bases**

RECODE CE65 (3=0) (SYSMIS=SYSMIS) (ELSE=1) INTO ubicacion.
EXECUTE.

**PASO 35**

**PASO 37**
***PRUEBAS PREVIAS PARA LA ELABORACIÓN DE LA VARIABLE INGRESO DE AUTOEMPLEO***

***Test de Kolmogorov Smirnov para normalidad de la variable Ingreso Total por Trabajo***

NPAR TESTS
  /K-S(NORMAL)=ytrab
  /MISSING ANALYSIS.

**Percentiles 33 y 66 de la variable Ingreso Total por Trabajo**

FREQUENCIES VARIABLES=ytrab
  /PERCENTILES=33.0 66.0 
  /STATISTICS=STDDEV VARIANCE MEAN MEDIAN
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

**PASO 38**
***Construcción de la variable Ingreso Autoempleo y para Patronos. BASE 2013***

**NOTA: a partir de los intervalos de la desviación estándar no se puede hacer porque brinda un número negativo el primer corte**
**NOTA: la definición de los tres niveles de Ingreso de los Autoempleados se hizo a través del percentil 33 y 66**


**Niveles de Ingreso de Autoempleo. BASE 2013**

COMPUTE IngresoAutoempleo=0.
EXECUTE.

**INGRESO BAJO**

DO IF (ytrab < 1865.86 & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=1).
END IF.
EXECUTE.

**INGRESO MEDIO**

DO IF ((ytrab >=1865.86 & ytrab < 5500) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=2).
END IF.
EXECUTE.

**INGRESO ALTO**

DO IF ((ytrab >=5500) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=3).
END IF.
EXECUTE.

RECODE IngresoAutoempleo (0=SYSMIS).
EXECUTE.

**Frecuencia de la Variable Ingreso de Autoempleo**

FREQUENCIES VARIABLES=IngresoAutoempleo
  /PERCENTILES=33.0 66.0 
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**PASO 39**
***Construcción de la variable Ingreso Autoempleo y para Patronos.BASE 2010***
**NOTA: la definición de los tres niveles de Ingreso de los Autoempleados se hizo a través del percentil 33 y 66**
**Percentil 33 de la variable Ytrab= 1820 y percentil 66 de la variable Ytrab=5200**

**Niveles de Ingreso de Autoempleo. BASE 2010**

COMPUTE IngresoAutoempleo=0.
EXECUTE.

**INGRESO BAJO**

DO IF (ytrab < 1820 & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=1).
END IF.
EXECUTE.

**INGRESO MEDIO**

DO IF ((ytrab >=1820 & ytrab < 5200) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=2).
END IF.
EXECUTE.

**INGRESO ALTO**

DO IF ((ytrab >=5200) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=3).
END IF.
EXECUTE.

RECODE IngresoAutoempleo (0=SYSMIS).
EXECUTE.

**Frecuencia de la Variable Ingreso de Autoempleo**

FREQUENCIES VARIABLES=IngresoAutoempleo
  /PERCENTILES=33.0 66.0 
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

***Construcción de la variable Ingreso Autoempleo y para Patronos.BASE 2006***
**NOTA: la definición de los tres niveles de Ingreso de los Autoempleados se hizo a través del percentil 33 y 66**
**Percentil 33 de la variable Ytrab= 1500 y percentil 66 de la variable Ytrab=3600**

COMPUTE IngresoAutoempleo=0.
EXECUTE.

**INGRESO BAJO**

DO IF (ytrab < 1500 & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=1).
END IF.
EXECUTE.

**INGRESO MEDIO**

DO IF ((ytrab >=1500 & ytrab < 3600) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=2).
END IF.
EXECUTE.

**INGRESO ALTO**

DO IF ((ytrab >=3600) & Tipo_insercion = 2).
RECODE IngresoAutoempleo (0=3).
END IF.
EXECUTE.

RECODE IngresoAutoempleo (0=SYSMIS).
EXECUTE.

**Frecuencia de la Variable Ingreso de Autoempleo**

FREQUENCIES VARIABLES=IngresoAutoempleo
  /PERCENTILES=33.0 66.0 
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

***Construccion de la Sub Escala de Tipologia de Autoempleo. PARA TODAS LAS BASES DE DATOS***
**Construccion de la Sub Escala de Autoempleo (UTILIZADA)**

COMPUTE SUB_ESCALA_AUTOEMPLEO=88.
EXECUTE.

**Nivel de ingresos: alto; nivel de crdenciales: alto y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 0 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=0).
END IF.
EXECUTE.

**Nivel de ingreso: alto; nivel de credenciales:medio y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 0 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=1).
END IF.
EXECUTE.

**Nivel de ingreso: alto; nivel de credenciales: bajo y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 0 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=2).
END IF.
EXECUTE.

**Nivel de ingreso: alto; nivel de credenciales: alto y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 1 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=3).
END IF.
EXECUTE.

**Nivel de ingreso: alto, nivel de credenciales medio y ubicacion: dentro del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 1 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=4).
END IF.
EXECUTE.

**Nivel de ingreso: alto; nivel de credenciales: medio y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 3 & ubicacion = 1 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=5).
END IF.
EXECUTE.

**Nivel de ingreso: alto, nivel de credenciales alto y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 0 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=6).
END IF.
EXECUTE.

**Nivel de ingreso: medio, nivel de credenciales: medio y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 0 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=7).
END IF.
EXECUTE.

**Nivel de ingreso: medio, nivel de credenciales: bajo y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 0 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=8).
END IF.
EXECUTE.

**Nivel de ingreso: medio, nivel de credenciales: altas y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 1 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=9).
END IF.
EXECUTE.

**Nivel de ingreso: medio, nivel de credenciales: medio y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 1 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=10).
END IF.
EXECUTE.

**Nivel de ingreso: medio, nivel de credenciales: bajo y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 2 & ubicacion = 1 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=11).
END IF.
EXECUTE.

**Nivel de ingreso:bajo, nivel de credenciales: alto y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 0 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=12).
END IF.
EXECUTE.

**Nivel de ingreso: bajo, nivel de credenciales: medio y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 0 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=13).
END IF.
EXECUTE.

**Nivel de ingreso: bajo, nivel de credenciales: bajo y ubicación: fuera del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 0 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=14).
END IF.
EXECUTE.

**Nivel de ingreso: bajo, nivel de credenciales: alto y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 1 & Niveles_credenciales_educ = 3)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=15).
END IF.
EXECUTE.

**Nivel de ingreso: bajo, nivel de credenciales: medio y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 1 & Niveles_credenciales_educ = 2)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=16).
END IF.
EXECUTE.

**Nivel de ingreso: bajo, nivel de credenciales: bajo y ubicación: dentro del hogar**

DO IF ((IngresoAutoempleo = 1 & ubicacion = 1 & Niveles_credenciales_educ = 1)).
RECODE SUB_ESCALA_AUTOEMPLEO (88=17).
END IF.
EXECUTE.

RECODE SUB_ESCALA_AUTOEMPLEO (88=SYSMIS).
EXECUTE.

***Sub_escala de autoempleo final dividida entre 1.7, para que asumuise valores entre (0-10)***

COMPUTE SUB_ESCALA_AUTOEMPLEO2=SUB_ESCALA_AUTOEMPLEO / 1.7.
EXECUTE.

**Frecuencia de la Sub escala de autoempleo**

FREQUENCIES VARIABLES=SUB_ESCALA_AUTOEMPLEO2
  /ORDER=ANALYSIS.

***************************************************SUB ESCALA DE PATRONOS************************************************************************

***Creación de la variable capacidad de contratación de mano de obra: Para Patronos. TODAS LAS BASE***

RECODE CE80 (1=1) (2=1) (3=2) (4=3) INTO Capacidad_contratacion.
EXECUTE.

**Creación de la variable Patronos a partir de capacidad de contratación y nivel de ingreso (mismo que se utilizo para autoempleados). PARA las bases 2013 y 2010**

COMPUTE SUB_ESCALA_PATRONOS=99.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoAutoempleo = 1).
RECODE SUB_ESCALA_PATRONOS (99=8).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoAutoempleo = 1).
RECODE SUB_ESCALA_PATRONOS (99=7).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoAutoempleo = 1).
RECODE SUB_ESCALA_PATRONOS (99=6).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoAutoempleo = 2).
RECODE SUB_ESCALA_PATRONOS (99=5).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoAutoempleo = 2).
RECODE SUB_ESCALA_PATRONOS (99=4).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoAutoempleo = 2).
RECODE SUB_ESCALA_PATRONOS (99=3).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoAutoempleo = 3).
RECODE SUB_ESCALA_PATRONOS (99=2).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoAutoempleo = 3).
RECODE SUB_ESCALA_PATRONOS (99=1).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoAutoempleo = 3).
RECODE SUB_ESCALA_PATRONOS (99=0).
END IF.
EXECUTE.

**Pérdidos**

RECODE SUB_ESCALA_PATRONOS (99=SYSMIS).
EXECUTE.


COMPUTE SUB_ESCALA_PATRONOS2=(SUB_ESCALA_PATRONOS) * 0.8.
EXECUTE.

FREQUENCIES VARIABLES=SUB_ESCALA_PATRONOS2
  /ORDER=ANALYSIS.


*********2006*****
***Creación de nivel de IngresoPatronos para la base 2006**
**Para la base 2006 se utilizará la variable Ingreso Por Cuenta Propia Monetario (Ocupación Principal); 
**Debido a que el Ingreso por Trabajo estaba especificado solo para los autoempleados**

FREQUENCIES VARIABLES=ycmop
  /PERCENTILES=33.0 66.0 
  /STATISTICS=STDDEV VARIANCE MEAN MEDIAN
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

**Creacion ingreso**

COMPUTE IngresoPatronos=0.
EXECUTE.

**INGRESO BAJO**

DO IF (ycmop < 1100 & Tipo_insercion = 3).
RECODE IngresoPatronos (0=1).
END IF.
EXECUTE.

**INGRESO MEDIO**

DO IF ((ycmop >=1100 & ycmop < 3200) & Tipo_insercion = 3).
RECODE IngresoPatronos (0=2).
END IF.
EXECUTE.

**INGRESO ALTO**

DO IF ((ycmop >=3200) & Tipo_insercion = 3).
RECODE IngresoPatronos (0=3).
END IF.
EXECUTE.

RECODE IngresoPatronos (0=SYSMIS).
EXECUTE.

**Frecuencia de la Variable Ingreso de Autoempleo**

FREQUENCIES VARIABLES=IngresoPatronos
  /PERCENTILES=33.0 66.0 
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**Creación de la variable Patronos a partir de capacidad de contratación y nivel de ingreso. PARA BASE 2006**

COMPUTE SUB_ESCALA_PATRONOS=99.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoPatronos = 1).
RECODE SUB_ESCALA_PATRONOS (99=8).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoPatronos = 1).
RECODE SUB_ESCALA_PATRONOS (99=7).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoPatronos = 1).
RECODE SUB_ESCALA_PATRONOS (99=6).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoPatronos = 2).
RECODE SUB_ESCALA_PATRONOS (99=5).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoPatronos = 2).
RECODE SUB_ESCALA_PATRONOS (99=4).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoPatronos = 2).
RECODE SUB_ESCALA_PATRONOS (99=3).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 1 & IngresoPatronos = 3).
RECODE SUB_ESCALA_PATRONOS (99=2).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 2 & IngresoPatronos = 3).
RECODE SUB_ESCALA_PATRONOS (99=1).
END IF.
EXECUTE.

DO IF (Tipo_insercion = 3 & Capacidad_contratacion = 3 & IngresoPatronos = 3).
RECODE SUB_ESCALA_PATRONOS (99=0).
END IF.
EXECUTE.

**Pérdidos**

RECODE SUB_ESCALA_PATRONOS (99=SYSMIS).
EXECUTE.

COMPUTE SUB_ESCALA_PATRONOS2=(SUB_ESCALA_PATRONOS) /0.8.
EXECUTE.

FREQUENCIES VARIABLES=SUB_ESCALA_PATRONOS2
  /ORDER=ANALYSIS.

******************************************************************************ESCALA DE PRODUCTIVIDAD************************************************************************


COMPUTE Escala_productiva=SUB_PRECARIEDAD_LABORAL +  SUB_ESCALA_AUTOEMPLEO2 +  
    SUB_ESCALA_FUENTE_INGRESOS.
EXECUTE.

FREQUENCIES VARIABLES=Escala_productiva
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Ciudadania_social
  /ORDER=ANALYSIS.

***************************************************************************************************************************************************************************************************
*****************************CONSTRUCCIÓN DE LA SUB-ESCALA DE FUENTES DE INGRESO PARA INACTIVOS (NO SE UTILIZARÁ)*****************************************

**PASO 39**
***Creación de la variable: INTERESESES O ALQUILERES. BASE 2013***

IF  (Tipo_insercion = 3)  | (Tipo_insercion = 4) Alquileres_intereses=(OIH3_LPS) + (OIH3_US) + (OIH6_LPS) + (OIH6_US).
EXECUTE.

RECODE Alquileres_intereses (0=0.5) (SYSMIS=SYSMIS) (ELSE=0).
EXECUTE.

FREQUENCIES VARIABLES=Alquileres_intereses
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**PASO 40**
***Jubilación y pensión: tanto en lempiras como en dólares*** Se sumaron 6 varriables**
**Calcular en una nueva variable con la condición de que se aplique solo a los inactivos**

IF  (Tipo_insercion = 3)  | (Tipo_insercion = 4) OIH_pension=(OIH1_LPS) + (OIH1_US) + (OIH2_LPS) + (OIH2_US) + (OIH7_LPS) + 
    (OIH7_US) .
EXECUTE.

RECODE OIH_pension (0=1) (SYSMIS=SYSMIS) (ELSE=0).
EXECUTE.

FREQUENCIES VARIABLES=OIH_pension
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**PASO 41**
***Creación de la variable: Remesas, se incluyen ambas, dólaresy lempiras***

IF  (Tipo_insercion = 3)  | (Tipo_insercion = 4) Remesas=(OIH14_LPS) + (OIH14_US).
EXECUTE.

RECODE Remesas (0=1.5) (SYSMIS=SYSMIS) (ELSE=0).
EXECUTE.

FREQUENCIES VARIABLES=Remesas
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**PASO 42**
*****Creación de la variable: Otras transferencias en dinero*****

IF  (Tipo_insercion = 3)  | (Tipo_insercion = 4) Otras_transferencias=(OIH8_LPS) + (OIH8_US) + (OIH4) + (OIH5) + (OIH10) + (OIH11) + (OIH12) + (OIH13_LPS) + 
    (OIH13_US) + (OIH15_LPS) + (OIH16_LPS) + (OIH17_LPS) + (OIH17_US) + 
    (OIH18_LPS) + (OIH18_US).
EXECUTE.

RECODE Otras_transferencias (0=2) (SYSMIS=SYSMIS) (ELSE=0).
EXECUTE.

FREQUENCIES VARIABLES=Otras_transferencias
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

**paso 43**
**SUB-ESCALA SOBRE FUENTES DE INGRESO**

COMPUTE SUB_ESCALA_FUENTE_INGRESOS=(OIH_pension + Alquileres_intereses + Remesas + 
    Otras_transferencias) * 1.80.
EXECUTE.

FREQUENCIES VARIABLES=SUB_ESCALA_FUENTE_INGRESOS
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=ytrab
  /PERCENTILES=33.0 66.0 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=ycmop
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=ytrab
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Tipo_insercion
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

SORT CASES BY Tipo_insercion(A) ytrab(A).

FREQUENCIES VARIABLES=ytrab
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Escala_credenciales_educ
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

RECODE Escala_credenciales_educ (6 thru 8=1) (4 thru 5=2) (0 thru 3=3) INTO 
    Niveles_credenciales_educ.
EXECUTE.

FREQUENCIES VARIABLES=Niveles_credenciales_educ
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

****************************************************************************************************************************************************************************************************
***Recodificación de la variable tamaño de establecimiento (para autoempleados)***
**Se realizó así porque se necesita distinguir entre los que emplean menos de 9 personas y los que emplean más de 9**

RECODE CE32_CANTIDAD (1 thru 9=0) (10 thru 9270=1) (ELSE=SYSMIS) INTO tamaño_autoempleo.
EXECUTE.
****************************************************************************************************************************************************************************************************

*************************************************************ESCALA DE CIUDADANÍA SOCIAL*****************************************************************************************

**Creación de la variable seguridad social. Base 2006**

RECODE CE23_5 (1=0) (SYSMIS=1) INTO Seguridad_social.
EXECUTE.

RECODE Seguridad_social (0=1) (1=0) (SYSMIS=SYSMIS) INTO SS2.
EXECUTE.

COMPUTE HOGAR_2=99.
EXECUTE.

RECODE HOGAR_2 
(1000111=1)
(1000121=1)
(1000122=1)
(1000211=1)
(1000221=1)
(1000251=1)
(1000341=1)
(1000411=1)
(1000421=1)
(1000441=1)
(1000451=1)
(1000511=1)
(1000521=1)
(1000611=1)
(1000631=1)
(1000641=1)
(1000711=1)
(1000731=1)
(1000741=1)
(1000751=1)
(1000811=1)
(1000821=1)
(1000931=1)
(1000941=1)
(1001121=1)
(1001211=1)
(1001221=1)
(1001241=1)
(1001311=1)
(1001321=1)
(1001331=1)
(1001341=1)
(1001411=1)
(1001421=1)
(1001431=1)
(1001441=1)
(1001531=1)
(1001551=1)
(1001621=1)
(1001631=1)
(1001641=1)
(1001711=1)
(1001731=1)
(1001741=1)
(1005441=1)
(1005521=1)
(1005531=1)
(1005551=1)
(1005731=1)
(1005741=1)
(1005751=1)
(1005841=1)
(1005911=1)
(1005941=1)
(1006021=1)
(1006051=1)
(1006121=1)
(1006131=1)
(1006211=1)
(1006241=1)
(1006331=1)
(1006441=1)
(1008221=1)
(1008231=1)
(1008321=1)
(1008331=1)
(1008341=1)
(1008451=1)
(1008511=1)
(1008521=1)
(1008651=1)
(1008731=1)
(1008751=1)
(1008811=1)
(1008821=1)
(1009541=1)
(1009611=1)
(1009721=1)
(1009751=1)
(1009831=1)
(1009911=1)
(1009921=1)
(1010011=1)
(1010021=1)
(1010041=1)
(1010051=1)
(1010111=1)
(1010121=1)
(1010141=1)
(1034121=1)
(1034131=1)
(1034211=1)
(1034221=1)
(1034231=1)
(1034241=1)
(1034251=1)
(1034311=1)
(1034331=1)
(1034341=1)
(1034351=1)
(1034451=1)
(1034621=1)
(1034651=1)
(1034711=1)
(1034721=1)
(1034751=1)
(1036651=1)
(1036711=1)
(1036731=1)
(1036741=1)
(1036751=1)
(1036811=1)
(1036831=1)
(1036851=1)
(1036941=1)
(1036951=1)
(1037031=1)
(1037111=1)
(1037151=1)
(1037211=1)
(1037221=1)
(1037441=1)
(1037451=1)
(1037531=1)
(1037641=1)
(1037651=1)
(1037711=1)
(1037712=1)
(1037731=1)
(1037821=1)
(1037851=1)
(1037911=1)
(1037941=1)
(1037951=1)
(1038021=1)
(1038031=1)
(1038041=1)
(3001131=1)
(3001221=1)
(3001231=1)
(3001311=1)
(3001341=1)
(3001431=1)
(3001441=1)
(3001451=1)
(3001511=1)
(3001531=1)
(3001612=1)
(3001621=1)
(3003631=1)
(3003651=1)
(3003721=1)
(3003731=1)
(3003831=1)
(3003841=1)
(3003851=1)
(3003911=1)
(3004011=1)
(3004021=1)
(3004041=1)
(3004051=1)
(3004131=1)
(3004141=1)
(3004151=1)
(3004251=1)
(3004311=1)
(3004431=1)
(3004551=1)
(3004611=1)
(3004651=1)
(3004711=1)
(3004731=1)
(3004911=1)
(3004921=1)
(3005011=1)
(3005041=1)
(3005151=1)
(3005211=1)
(3005221=1)
(3005251=1)
(3028851=1)
(3028911=1)
(3028931=1)
(3029031=1)
(3029041=1)
(3029051=1)
(3029121=1)
(3029151=1)
(3029211=1)
(3029221=1)
(3032821=1)
(3032831=1)
(3032841=1)
(3032911=1)
(3032921=1)
(3032931=1)
(3032941=1)
(3032951=1)
(3033011=1)
(3033021=1)
(3033041=1)
(3033151=1)
(3033211=1)
(3033231=1)
(3033241=1)
(3033242=1)
(3033331=1)
(3033411=1)
(3033421=1)
(3033441=1)
(3033451=1)
(3033621=1)
(3033631=1)
(3033641=1)
(3033651=1)
(3033821=1)
(3033831=1)
(3033841=1)
(3033851=1)
(3035151=1)
(3035211=1)
(3035231=1)
(3035241=1)
(3035331=1)
(3035341=1)
(3035411=1)
(3035421=1)
(3035431=1)
(3035441=1)
(3035451=1)
(3035511=1)
(3035521=1)
(3035531=1)
(5044511=1)
(5044551=1)
(5044611=1)
(5044721=1)
(5044731=1)
(5044841=1)
(5044851=1)
(5044911=1)
(5044941=1)
(5044951=1)
(5045031=1)
(5045041=1)
(5045151=1)
(5045321=1)
(5045341=1)
(5045351=1)
(5045441=1)
(5050641=1)
(5050651=1)
(5050711=1)
(5050721=1)
(5050731=1)
(5050751=1)
(5050821=1)
(5050921=1)
(5050941=1)
(5051041=1)
(5051051=1)
(5051131=1)
(5051151=1)
(5051211=1)
(5051221=1)
(5051231=1)
(5051331=1)
(5051341=1)
(5051451=1)
(5051511=1)
(5051521=1)
(5051611=1)
(5051631=1)
(5051641=1)
(5051651=1)
(5051941=1)
(5052021=1)
(5052151=1)
(5052351=1)
(5052441=1)
(5052511=1)
(5052731=1)
(5052951=1)
(5053011=1)
(5053131=1)
(5053451=1)
(5053521=1)
(5053941=1)
(5054011=1)
(5054021=1)
(5054051=1)
(5054131=1)
(5054241=1)
(5054311=1)
(5054321=1)
(5054351=1)
(5054421=1)
(5054431=1)
(5054451=1)
(5054511=1)
(5054531=1)
(5054541=1)
(5054551=1)
(5054611=1)
(5054741=1)
(5054931=1)
(5055031=1)
(5055111=1)
(5055141=1)
(5055241=1)
(5055331=1)
(5055351=1)
(5055431=1)
(5055441=1)
(5055451=1)
(5055521=1)
(5055541=1)
(5055551=1)
(5055611=1)
(5055621=1)
(5055641=1)
(5055711=1)
(5055721=1)
(5055821=1)
(5055831=1)
(5055931=1)
(5055941=1)
(5055951=1)
(5056011=1)
(5056021=1)
(5056031=1)
(5056051=1)
(5056121=1)
(5056241=1)
(5056311=1)
(5056411=1)
(5056511=1)
(5056531=1)
(5056541=1)
(5056631=1)
(5057051=1)
(5057141=1)
(5057311=1)
(5057351=1)
(5057421=1)
(5057431=1)
(5057631=1)
(5057731=1)
(5057741=1)
(5058122=1)
(5058441=1)
(5058551=1)
(5058611=1)
(5058631=1)
(5058651=1)
(5058841=1)
(5059241=1)
(5059411=1)
(5059421=1)
(5059431=1)
(5059441=1)
(5059451=1)
(5059541=1)
(5059711=1)
(5059811=1)
(5059821=1)
(5059841=1)
(5059851=1)
(5059911=1)
(5059921=1)
(5059941=1)
(5059951=1)
(5060021=1)
(5060031=1)
(5060051=1)
(5060121=1)
(5060131=1)
(5060141=1)
(5060151=1)
(5060241=1)
(5060331=1)
(5060341=1)
(5060411=1)
(5060441=1)
(5060521=1)
(5060531=1)
(5060551=1)
(5060631=1)
(5060641=1)
(5060651=1)
(5060711=1)
(5060741=1)
(5060751=1)
(5060821=1)
(5060831=1)
(5060841=1)
(5060851=1)
(5060911=1)
(5060921=1)
(5060931=1)
(5060941=1)
(5060951=1)
(5061011=1)
(5061041=1)
(5061121=1)
(5061131=1)
(5061141=1)
(5061231=1)
(5061241=1)
(5061251=1)
(5061311=1)
(5061321=1)
(5061331=1)
(5061341=1)
(5061351=1)
(5061431=1)
(5061451=1)
(5061531=1)
(5061541=1)
(5061551=1)
(5061631=1)
(5061641=1)
(5061711=1)
(5061741=1)
(5061821=1)
(5061851=1)
(5061921=1)
(5061941=1)
(5061951=1)
(5062111=1)
(5062121=1)
(5062211=1)
(5062231=1)
(5062241=1)
(5062251=1)
(5062411=1)
(5062441=1)
(5062451=1)
(5062511=1)
(5062521=1)
(5062531=1)
(5062541=1)
(5062551=1)
(5062611=1)
(5062621=1)
(5062711=1)
(5062731=1)
(5062741=1)
(5062811=1)
(5062821=1)
(5062831=1)
(5062841=1)
(5062851=1)
(5062911=1)
(5062921=1)
(5062931=1)
(5062941=1)
(5063111=1)
(5063151=1)
(5063211=1)
(5063241=1)
(5063251=1)
(5063311=1)
(5063331=1)
(5063631=1)
(5063651=1)
(5063931=1)
(5064241=1)
(5064321=1)
(5064411=1)
(5064531=1)
(5064541=1)
(5064551=1)
(5064611=1)
(5064651=1)
(5064831=1)
(5065011=1)
(5065031=1)
(5065041=1)
(5065311=1)
(5065851=1)
(5066041=1)
(5066131=1)
(5066751=1)
(5066911=1)
(5070211=1)
(5071111=1)
(5071831=1)
(5071951=1)
(5072842=1)
(5073441=1)
(5073721=1)
(5073831=1)
(5073931=1)
(5073941=1)
(5074121=1)
(5074321=1)
(5074531=1)
(5074541=1)
(5074551=1)
(5077341=1)
(5077551=1)
(5077851=1)
(5078021=1)
(5078341=1)
(5078811=1)
(5078931=1)
(5079741=1)
(5079851=1)
(5079931=1)
(5080011=1)
(5080131=1)
(5080141=1)
(5080621=1)
(5080841=1)
(5080931=1)
(5081111=1)
(5082911=1)
(5083211=1)
(5083221=1)
(5083231=1)
(5084511=1)
(5085511=1)
(5086921=1)
(5087151=1)
(5087521=1)
(5089531=1)
(5091241=1)
(5091321=1)
(5091331=1)
(5091451=1)
(5091831=1)
(5091851=1)
(5092111=1)
(5092141=1)
(5092211=1)
(5092221=1)
(5092321=1)
(5092411=1)
(5092541=1)
(5092711=1)
(5092951=1)
(5093031=1)
(5093411=1)
(5093451=1)
(5093511=1)
(5093612=1)
(5093621=1)
(5093631=1)
(5093641=1)
(5093721=1)
(5093731=1)
(5093741=1)
(5093751=1)
(5093941=1)
(5094011=1)
(5094321=1)
(5094341=1)
(5094411=1)
(5094421=1)
(5094441=1)
(5094451=1)
(5094621=1)
(5094651=1)
(5094711=1)
(5094821=1)
(5094831=1)
(5095741=1)
(5095831=1)
(5095841=1)
(5096021=1)
(5096041=1)
(5096051=1)
(5096111=1)
(5096121=1)
(5096131=1)
(5096151=1)
(5096341=1)
(5096411=1)
(5096431=1)
(5096611=1)
(5096851=1)
(5096911=1)
(5096931=1)
(5097041=1)
(5097131=1)
(5097351=1)
(5098351=1)
(5100811=1)
(5103841=1)
(5103851=1)
(5103931=1)
(5104111=1)
(5104451=1)
(5104711=1)
(5104811=1)
(5105031=1)
(5105131=1)
(5105331=1)
(5106011=1)
(5106031=1)
(5106041=1)
(5106111=1)
(5106121=1)
(5106131=1)
(5106251=1)
(5106321=1)
(5106441=1)
(5106511=1)
(5106531=1)
(5106541=1)
(5106551=1)
(5106651=1)
(5107111=1)
(5107421=1)
(5107721=1)
(5107731=1)
(5114741=1)
(5115721=1)
(5115751=1)
(5116131=1)
(5116531=1)
(5117241=1)
(5117651=1)
(5118321=1)
(5118341=1)
(5121811=1)
(5125921=1)
(5129341=1)
(5131131=1)
(5133711=1)
(5134211=1)
(5135431=1)
(5135921=1)
(5136011=1)
(5136311=1)
(5138221=1)
(5138711=1)
(5140041=1)
(5142841=1)
(5147131=1)
(5150551=1)
(5151051=1)
(5152041=1)
(5152151=1)
(5153011=1)
(5153031=1)
(5154941=1)
(5155311=1)
(5155511=1)
(5155531=1)
(5155711=1)
(5155721=1)
(5156921=1)
(5157541=1)
(5158331=1)
(5158351=1)
(5158511=1)
(5159021=1)
(5159851=1)
(5161431=1)
(5161741=1)
(5162911=1)
(5163041=1)
(5163611=1)
(5163841=1)
(5165021=1)
(5165041=1)
(5166031=1)
(5167431=1)
(5168441=1)
(5168631=1)
(5169711=1)
(5172041=1)
(5172941=1)
(5173021=1)
(5173051=1)
(5173221=1)
(5173311=1)
(5173631=1)
(5173641=1)
(5173711=1)
(5173921=1)
(5174251=1)
(5174411=1)
(5174511=1)
(5174521=1)
(5174551=1)
(5174611=1)
(5174741=1)
(5174841=1)
(5174931=1)
(5174951=1)
(5175021=1)
(5175121=1)
(5175241=1)
(5175341=1)
(5175441=1)
(5175451=1)
(5175641=1)
(5175741=1)
(5175751=1)
(5175911=1)
(5175931=1)
(5176031=1)
(5176051=1)
(5176321=1)
(5176511=1)
(5176631=1)
(5176751=1)
(5176831=1)
(5177351=1)
(5177421=1)
(5177451=1)
(5177651=1)
(5177711=1)
(5177821=1)
(5178041=1)
(5178051=1)
(5178841=1)
(5180031=1)
(5180051=1)
(5180141=1)
(5180211=1)
(5180221=1)
(5180231=1)
(5180241=1)
(5180251=1)
(5180311=1)
(5180321=1)
(5180331=1)
(5180341=1)
(5180351=1)
(5180411=1)
(5180451=1)
(5180611=1)
(5180631=1)
(5180651=1)
(5181141=1)
(5181151=1)
(5181451=1)
(5182721=1)
(5183031=1)
(5183211=1)
(5185021=1).
EXECUTE.

**Creación de la variable Hogar 2**

RECODE HOGAR_2 (1=1) (ELSE=0).
EXECUTE.

*Recodificaicón de la variable Hogar 2**

RECODE HOGAR_2 (0=2).
EXECUTE.

**Recodificación ubicándole 3 para que se pudiera sumar con la otra variable y encontrar a los asegurados indirectos**

RECODE Seguridad_social (SYSMIS=3).
EXECUTE.

COMPUTE IHSS_2=Seguridad_social + HOGAR_2.
EXECUTE.

FREQUENCIES VARIABLES=IHSS_2
  /ORDER=ANALYSIS.

**Recodificación de la Variable IHSS2 para ver asegurados directos e indirectos**

RECODE IHSS_2 (1=0) (2=1) (4=1) (3=2) (5=2).
EXECUTE.

**Frecuencia de la variable IHSS_2**

FREQUENCIES VARIABLES=IHSS_2
  /ORDER=ANALYSIS.





**Creación de la  SUB ESCALA de seguridad social. base 2013**

RECODE CE23_5 (5=0) (SYSMIS=1) INTO Seguridad_social.
EXECUTE.

**Condición para los ocupados**
**Solo se puede saber si cotizan o no si están ocupados, por lo tanto no se cuentan a los inactivos y a los No remunerados**

DO IF (Tipo_insersion >= 3).
RECODE Seguridad_social (1=SYSMIS).
END IF.
EXECUTE.

**Frecuencia Seguridad social**

FREQUENCIES VARIABLES=Seguridad_social
  /FORMAT=DFREQ
  /ORDER=ANALYSIS.

***Seguridad social****

RECODE Seguridad_social (0=1) (1=0) (SYSMIS=SYSMIS) INTO SS2.
EXECUTE.


RECODE HOGAR_2 (1100300062=1)
(1100460011=1)
(1100460021=1)
(1100460031=1)
(1100460041=1)
(1100460051=1)
(1100460061=1)
(1100620011=1)
(1100620021=1)
(1100620041=1)
(1100780011=1)
(1100780031=1)
(1100780041=1)
(1100940011=1)
(1100940041=1)
(1100940051=1)
(1100940061=1)
(1101090021=1)
(1101240021=1)
(1101240051=1)
(1101390011=1)
(1101550021=1)
(1101700011=1)
(1101700051=1)
(1101850031=1)
(1101850041=1)
(1101850051=1)
(1101990051=1)
(1101990061=1)
(1102150021=1)
(1102470021=1)
(1102470051=1)
(1102630021=1)
(1102630051=1)
(1102790011=1)
(1102790041=1)
(1102790051=1)
(1102950011=1)
(1102950021=1)
(1102950041=1)
(1103100031=1)
(1103100041=1)
(1103260041=1)
(1103420021=1)
(1103420031=1)
(1103420051=1)
(1103590021=1)
(1103590051=1)
(1103590061=1)
(1103750011=1)
(1103750031=1)
(1103910011=1)
(1103910021=1)
(1103910051=1)
(1103910061=1)
(1104070021=1)
(1104230021=1)
(1104230031=1)
(1104230041=1)
(1104390021=1)
(1104390031=1)
(1104390051=1)
(1104540011=1)
(1104700011=1)
(1104700021=1)
(1104700041=1)
(1104700051=1)
(1104840021=1)
(1104840031=1)
(1104840041=1)
(1104840051=1)
(1104840061=1)
(1104990021=1)
(1104990031=1)
(1105150011=1)
(1105150031=1)
(1105310011=1)
(1105310021=1)
(1105310041=1)
(1105310061=1)
(1105460011=1)
(1105460021=1)
(1105460031=1)
(1105460051=1)
(1105460061=1)
(1105600011=1)
(1105600031=1)
(1105600051=1)
(1105600061=1)
(1105770051=1)
(1105930011=1)
(1105930031=1)
(1105930041=1)
(1105930061=1)
(1106090011=1)
(1106090021=1)
(1106090041=1)
(1106090051=1)
(1106090061=1)
(1106250011=1)
(1106250021=1)
(1106410051=1)
(1106570031=1)
(1106570061=1)
(1106720021=1)
(1106720031=1)
(1106880041=1)
(1106880061=1)
(1107040021=1)
(1107040041=1)
(1107040061=1)
(1107210021=1)
(1107210031=1)
(1107210051=1)
(1107360011=1)
(1107360021=1)
(1107520011=1)
(1107520021=1)
(1107520041=1)
(1107520051=1)
(1107520061=1)
(1107680031=1)
(1107680041=1)
(1107680051=1)
(1107680061=1)
(1107830021=1)
(1108000021=1)
(1108000031=1)
(1108000051=1)
(1108150011=1)
(1108150061=1)
(1108310011=1)
(1108310021=1)
(1108310022=1)
(1108310041=1)
(1108310051=1)
(1108310061=1)
(1108470051=1)
(1108630011=1)
(1108630021=1)
(1108790021=1)
(1108950021=1)
(1108950031=1)
(1109110021=1)
(1109110051=1)
(1109110061=1)
(1109270011=1)
(1109270021=1)
(1109270031=1)
(1109270051=1)
(1109270061=1)
(1109270062=1)
(1109270063=1)
(1109420021=1)
(1109420031=1)
(1109420042=1)
(1109420051=1)
(1109590021=1)
(1109590022=1)
(1109740011=1)
(1109740051=1)
(1109900011=1)
(1109900021=1)
(1110070011=1)
(1110070021=1)
(1110070031=1)
(1110070051=1)
(1110070061=1)
(1110250011=1)
(1110250021=1)
(1110250041=1)
(1110250051=1)
(1110420011=1)
(1110420041=1)
(1110420051=1)
(1110420061=1)
(1110580021=1)
(1110580061=1)
(1110740021=1)
(1110890011=1)
(1110890051=1)
(1111060061=1)
(1111220031=1)
(1111220051=1)
(1111220061=1)
(1111370011=1)
(1111370021=1)
(1111370031=1)
(1111370051=1)
(1111370061=1)
(1111540011=1)
(1111540051=1)
(1111540061=1)
(1111700011=1)
(1111700021=1)
(1111700031=1)
(1111700061=1)
(1111860011=1)
(1111860021=1)
(1111860031=1)
(1111860061=1)
(1112020011=1)
(1112020031=1)
(1112020041=1)
(1112020051=1)
(1112020061=1)
(1112190011=1)
(1112190021=1)
(1112190031=1)
(1112190051=1)
(1112190061=1)
(1112360011=1)
(1112360031=1)
(1112360051=1)
(1112520021=1)
(1112520031=1)
(1112520041=1)
(1112520051=1)
(1112520061=1)
(1112670031=1)
(1112830011=1)
(1112830031=1)
(1112830041=1)
(1112830051=1)
(1112990011=1)
(1112990051=1)
(1113140051=1)
(1113140061=1)
(1113380041=1)
(1113380061=1)
(1113540021=1)
(1113540031=1)
(1113540041=1)
(1113750031=1)
(1113750051=1)
(1113910021=1)
(1113910041=1)
(1114080011=1)
(1114080021=1)
(1114080031=1)
(1114080061=1)
(1114250021=1)
(1114250031=1)
(1114250051=1)
(1114420011=1)
(1114420021=1)
(1114580011=1)
(1114580021=1)
(1114580041=1)
(1114580051=1)
(1114740011=1)
(1114740021=1)
(1114740031=1)
(1114740032=1)
(1114740041=1)
(1114740061=1)
(1114900011=1)
(1114900021=1)
(1114900031=1)
(1114900061=1)
(1115060041=1)
(1115060051=1)
(1115220021=1)
(1115370011=1)
(1115370021=1)
(1115370031=1)
(1115370041=1)
(1115370051=1)
(1115370061=1)
(1115540011=1)
(1115540021=1)
(1115540031=1)
(1115540061=1)
(1115690011=1)
(1115690031=1)
(1115690041=1)
(1115690061=1)
(1115840031=1)
(1115840041=1)
(1115840061=1)
(1116000011=1)
(1116000021=1)
(1116000031=1)
(1116000061=1)
(1116160011=1)
(1116160051=1)
(1116310021=1)
(1116310031=1)
(1116310041=1)
(1116500021=1)
(1116500031=1)
(1116500041=1)
(1116500051=1)
(1116660021=1)
(1116660041=1)
(1116660051=1)
(1116980031=1)
(1116980051=1)
(1117150011=1)
(1117150041=1)
(1117150051=1)
(1117150061=1)
(1117320031=1)
(1117320041=1)
(1117320061=1)
(1117480011=1)
(1117480061=1)
(1117640011=1)
(1117640031=1)
(1117640051=1)
(1117790011=1)
(1117790021=1)
(1117790031=1)
(1117790041=1)
(1117960031=1)
(1117960051=1)
(1117960061=1)
(1118270011=1)
(1118270061=1)
(1118430011=1)
(1118430021=1)
(1118430061=1)
(1118730011=1)
(1118730021=1)
(1118730031=1)
(1118900011=1)
(1118900021=1)
(1118900031=1)
(1119070011=1)
(1119230061=1)
(1119380031=1)
(1119380041=1)
(1119380051=1)
(1119380061=1)
(1119530061=1)
(1119690011=1)
(1119690021=1)
(1119690051=1)
(1119990011=1)
(1119990021=1)
(1120150011=1)
(1120150031=1)
(1120150051=1)
(1120300041=1)
(1120300051=1)
(1120450011=1)
(1120450021=1)
(1120450031=1)
(1120450051=1)
(1120450061=1)
(1120610011=1)
(1120610021=1)
(1120610031=1)
(1120610051=1)
(1120610061=1)
(1120770041=1)
(1120920021=1)
(1121090011=1)
(1121240031=1)
(1121390011=1)
(1121390021=1)
(1121390031=1)
(1121390041=1)
(1121390051=1)
(1121390061=1)
(1121540011=1)
(1121540031=1)
(1121540041=1)
(1121540051=1)
(1121680041=1)
(1121840031=1)
(1121840061=1)
(1122000031=1)
(1122000051=1)
(1122160011=1)
(1122160051=1)
(1122160061=1)
(1122320011=1)
(1122320021=1)
(1122320031=1)
(1122320041=1)
(1122320051=1)
(1122480021=1)
(1122480031=1)
(1122480041=1)
(1122480051=1)
(1122650031=1)
(1122810011=1)
(1122810021=1)
(1122810031=1)
(1122810041=1)
(1122810051=1)
(1122810061=1)
(1122970011=1)
(1122970041=1)
(1122970051=1)
(1122970061=1)
(1123130031=1)
(1123130041=1)
(1123130051=1)
(1123300031=1)
(1123300041=1)
(1123460031=1)
(1123620021=1)
(1123620031=1)
(1123620051=1)
(1123780041=1)
(1123780061=1)
(1123920011=1)
(1123920031=1)
(1123920041=1)
(1123920051=1)
(1123920061=1)
(1124080051=1)
(1124080061=1)
(1124230031=1)
(1124230061=1)
(1124390021=1)
(1124390041=1)
(1124550011=1)
(1124550061=1)
(1124720031=1)
(1124880031=1)
(1124880041=1)
(1124880061=1)
(1125030021=1)
(1125030052=1)
(1125030061=1)
(1125190051=1)
(1125360021=1)
(1125360061=1)
(1125520051=1)
(1125680021=1)
(1125680031=1)
(1125680061=1)
(1125840021=1)
(1125990011=1)
(1125990031=1)
(1125990051=1)
(1125990061=1)
(1126150021=1)
(1126150041=1)
(1126150051=1)
(1126320011=1)
(1126320021=1)
(1126320041=1)
(1126320051=1)
(1126320061=1)
(1126640031=1)
(1126640061=1)
(1126800011=1)
(1126800031=1)
(1126800041=1)
(2037500021=1)
(2037500031=1)
(2037500041=1)
(2037500051=1)
(2037620011=1)
(2037620031=1)
(2037620041=1)
(2037620051=1)
(2037730021=1)
(2037730031=1)
(2037730061=1)
(2037840011=1)
(2037840021=1)
(2037840031=1)
(2037840041=1)
(2037960012=1)
(2037960021=1)
(2037960031=1)
(2037960061=1)
(2038070021=1)
(2038070031=1)
(2038070041=1)
(2038070051=1)
(2038070061=1)
(2038190011=1)
(2038190021=1)
(2038190041=1)
(2038190061=1)
(2038310011=1)
(2038310031=1)
(2038310041=1)
(2038310051=1)
(2038550041=1)
(2038660021=1)
(2038660031=1)
(2038660041=1)
(2038660051=1)
(2038660061=1)
(2038890011=1)
(2038890021=1)
(2038890031=1)
(2038890041=1)
(2038890051=1)
(2038890061=1)
(2039000031=1)
(2039000041=1)
(2039000051=1)
(2039000061=1)
(2039120021=1)
(2039120031=1)
(2039120041=1)
(2039120051=1)
(2039120061=1)
(2039240021=1)
(2039240041=1)
(2039240061=1)
(2039360021=1)
(2039360031=1)
(2039360041=1)
(2039360051=1)
(2039360061=1)
(2039470031=1)
(2039470061=1)
(2039590011=1)
(2039590031=1)
(2039590051=1)
(2039700011=1)
(2039700041=1)
(2039700061=1)
(2039820021=1)
(2039820031=1)
(2039820041=1)
(2039820061=1)
(2039920011=1)
(2039920021=1)
(2039920031=1)
(2039920051=1)
(2040040021=1)
(2040170011=1)
(2040170041=1)
(2040170051=1)
(2040170061=1)
(2040280011=1)
(2040280021=1)
(2040280041=1)
(2040280051=1)
(2040280061=1)
(2040400021=1)
(2040400031=1)
(2040530011=1)
(2040530031=1)
(2040530051=1)
(2040630021=1)
(2040630051=1)
(2040630061=1)
(2040740031=1)
(2040740061=1)
(2040860011=1)
(2040860021=1)
(2040860041=1)
(2040980011=1)
(2040980041=1)
(2040980061=1)
(2041110011=1)
(2041110021=1)
(2041110031=1)
(2041110041=1)
(2041110051=1)
(2041220011=1)
(2041220031=1)
(2041220041=1)
(2041220051=1)
(2041220061=1)
(2041330031=1)
(2041330041=1)
(2041330051=1)
(2041440021=1)
(2041440061=1)
(2041560021=1)
(2041560041=1)
(2041560051=1)
(2041560061=1)
(2041780011=1)
(2041780051=1)
(2041900011=1)
(2041900021=1)
(2041900031=1)
(2041900041=1)
(2041900051=1)
(2042020011=1)
(2042020021=1)
(2042020031=1)
(2042130021=1)
(2042130041=1)
(2042130051=1)
(2042130061=1)
(2042240011=1)
(2042240021=1)
(2042240031=1)
(2042240051=1)
(2042240061=1)
(2042350061=1)
(2042460021=1)
(2042460031=1)
(2042580041=1)
(2042580061=1)
(2042690011=1)
(2042690021=1)
(2042690031=1)
(2042690061=1)
(2042800031=1)
(2042800041=1)
(2042910021=1)
(2043020021=1)
(2043020051=1)
(2043020061=1)
(2043120011=1)
(2043120041=1)
(2043120051=1)
(2043120061=1)
(2043240011=1)
(2043240031=1)
(2043350021=1)
(2043350031=1)
(2043350041=1)
(2043350061=1)
(2043470011=1)
(2043470021=1)
(2043470031=1)
(2043470041=1)
(2043470061=1)
(2043570011=1)
(2043570021=1)
(2043570031=1)
(2043690031=1)
(2043690041=1)
(2043690051=1)
(2043800011=1)
(2043800021=1)
(2043800031=1)
(2043800041=1)
(2043800051=1)
(2043910011=1)
(2043910031=1)
(2043910051=1)
(2043910061=1)
(2044030011=1)
(2044030021=1)
(2044030041=1)
(2044140011=1)
(2044140021=1)
(2044140031=1)
(2044140041=1)
(2044140051=1)
(2044260021=1)
(2044260031=1)
(2044260041=1)
(2044260061=1)
(2044360011=1)
(2044360031=1)
(2044360041=1)
(2044360051=1)
(2044360061=1)
(2044490011=1)
(2044490031=1)
(2044490041=1)
(2044600011=1)
(2044710011=1)
(2044830011=1)
(2044830031=1)
(2044830041=1)
(2044830051=1)
(2045060011=1)
(2045060031=1)
(2045180011=1)
(2045180021=1)
(2045180041=1)
(2045290021=1)
(2045290031=1)
(2045290051=1)
(2045290061=1)
(2045410011=1)
(2045410021=1)
(2045410041=1)
(2045410051=1)
(2045520011=1)
(2045520051=1)
(2045630011=1)
(2045630031=1)
(2045630041=1)
(2045630061=1)
(2045740041=1)
(2045860031=1)
(2045860041=1)
(2045860051=1)
(2045860061=1)
(2045990041=1)
(2046090011=1)
(2046090021=1)
(2046090041=1)
(2046200011=1)
(2046200021=1)
(2046200061=1)
(2046340011=1)
(2046450011=1)
(2046450061=1)
(2046540011=1)
(2046540021=1)
(2046540061=1)
(2046670011=1)
(2046670021=1)
(2046670051=1)
(2046790021=1)
(2046920011=1)
(2046920021=1)
(2046920031=1)
(2047040021=1)
(2047040061=1)
(2047160031=1)
(2047160051=1)
(2047160061=1)
(2047270021=1)
(2047270031=1)
(2047270051=1)
(2047270061=1)
(2047390041=1)
(2047390061=1)
(2047500021=1)
(2047500031=1)
(2047610011=1)
(2047610021=1)
(2047730011=1)
(2047730021=1)
(2047730031=1)
(2047730041=1)
(2047730051=1)
(2047840011=1)
(2048060051=1)
(2048170011=1)
(2048170021=1)
(2048170031=1)
(2048170051=1)
(2048280061=1)
(2048380021=1)
(2048380051=1)
(2048490011=1)
(2048490031=1)
(2048490041=1)
(2048490051=1)
(2048490061=1)
(2048600031=1)
(2048600041=1)
(2048600051=1)
(2048600061=1)
(2048710041=1)
(2048710061=1)
(2048930011=1)
(2048930021=1)
(2048930031=1)
(2048930041=1)
(2048930051=1)
(2048930061=1)
(2049040031=1)
(2049040051=1)
(2049040061=1)
(2049160041=1)
(2049160051=1)
(2049160061=1)
(2049270011=1)
(2049270031=1)
(2049270041=1)
(2049270061=1)
(2049380051=1)
(2049490011=1)
(2049490031=1)
(2049490061=1)
(2049590021=1)
(2049590041=1)
(2049710041=1)
(2049710051=1)
(2049820011=1)
(2049820031=1)
(2049820041=1)
(2049820051=1)
(2049920031=1)
(2049920061=1)
(2050030021=1)
(2050030031=1)
(2050030041=1)
(2050160021=1)
(2050160051=1)
(2050260011=1)
(2050260021=1)
(2050260031=1)
(2050260051=1)
(2050380051=1)
(2050380061=1)
(2050490011=1)
(2050490031=1)
(2050490041=1)
(2050490051=1)
(2050600011=1)
(2050600021=1)
(2050600051=1)
(2050600061=1)
(2050730061=1)
(2050830011=1)
(2050830021=1)
(2050830041=1)
(2050830061=1)
(2050940011=1)
(2050940021=1)
(2050940031=1)
(2050940051=1)
(2050940061=1)
(2051050061=1)
(2051170011=1)
(2051170021=1)
(2051170031=1)
(2051170041=1)
(2051300011=1)
(2051300051=1)
(2051300061=1)
(2051400031=1)
(2051400041=1)
(2051400051=1)
(2051400061=1)
(2051750021=1)
(2051750041=1)
(2051750051=1)
(2051750061=1)
(2051860031=1)
(2051980011=1)
(2051980021=1)
(2051980051=1)
(2051980061=1)
(2052110021=1)
(2052210061=1)
(2052330021=1)
(2052330031=1)
(2052330051=1)
(2052440041=1)
(2052550041=1)
(2052550051=1)
(2052680011=1)
(2052680061=1)
(2052780031=1)
(2052910011=1)
(2052910021=1)
(2052910041=1)
(2052910051=1)
(2052910061=1)
(2053010041=1)
(2053130011=1)
(2053130041=1)
(2053130051=1)
(2053250021=1)
(2053250041=1)
(2053250051=1)
(2053370031=1)
(2053370041=1)
(2053490011=1)
(2053490021=1)
(2053490061=1)
(2053610011=1)
(2053610021=1)
(2053610041=1)
(2053610061=1)
(2053730031=1)
(2053730041=1)
(2053850011=1)
(2053850021=1)
(2053850031=1)
(2053980011=1)
(2053980012=1)
(2053980041=1)
(2053980061=1)
(2054090011=1)
(2054090021=1)
(2054090041=1)
(2054090061=1)
(2054210011=1)
(2054210021=1)
(2054210031=1)
(2054210061=1)
(2054450021=1)
(2054450031=1)
(2054450051=1)
(2054450061=1)
(2054560011=1)
(2054560031=1)
(2054680011=1)
(2054680021=1)
(2054680041=1)
(3000340011=1)
(3000340031=1)
(3000340051=1)
(3000750011=1)
(3000750031=1)
(3000750051=1)
(3000960021=1)
(3000960041=1)
(3000960051=1)
(3001160011=1)
(3001160031=1)
(3001160041=1)
(3001360021=1)
(3001360031=1)
(3001360041=1)
(3001360051=1)
(3001570011=1)
(3001570021=1)
(3001570041=1)
(3001570061=1)
(3001770021=1)
(3001770031=1)
(3001770051=1)
(3001970021=1)
(3001970041=1)
(3001970061=1)
(3002170051=1)
(3002370041=1)
(3002580021=1)
(3002780021=1)
(3002780031=1)
(3002780061=1)
(3002980011=1)
(3002980051=1)
(3003180011=1)
(3003180031=1)
(3003180041=1)
(3003380031=1)
(3003380051=1)
(3003380061=1)
(3003580011=1)
(3003580021=1)
(3003580031=1)
(3003580051=1)
(3003990041=1)
(3003990061=1)
(3007780031=1)
(3007990011=1)
(3007990021=1)
(3007990041=1)
(3008200011=1)
(3008200031=1)
(3008200041=1)
(3008410031=1)
(3008410041=1)
(3008410051=1)
(3008620031=1)
(3016090011=1)
(3016090031=1)
(3016090061=1)
(3016290051=1)
(3016290061=1)
(3016500031=1)
(3016500051=1)
(3016710021=1)
(3016920011=1)
(3016920031=1)
(3018910061=1)
(3019110021=1)
(3019110041=1)
(3019110051=1)
(3019110061=1)
(3019310011=1)
(3019510021=1)
(3019930011=1)
(3020330031=1)
(3020330051=1)
(3020330061=1)
(3025830051=1)
(3026040011=1)
(3026040041=1)
(3026240021=1)
(3026450011=1)
(3026450021=1)
(3026450061=1)
(3026660031=1)
(3026660041=1)
(3026660051=1)
(3027070021=1)
(3027070031=1)
(3027070041=1)
(3027070061=1)
(3029280051=1)
(3029490051=1)
(3029700011=1)
(3029700051=1)
(3029920031=1)
(3029920041=1)
(3034440021=1)
(3034440061=1)
(3034870061=1)
(3057640031=1)
(3057640041=1)
(3057840041=1)
(3058050011=1)
(3058050021=1)
(3058050031=1)
(3058050051=1)
(3058050061=1)
(3058240011=1)
(3058240021=1)
(3058240031=1)
(3058240041=1)
(3058240051=1)
(3058240061=1)
(3058440011=1)
(3058440021=1)
(3058440031=1)
(3058440041=1)
(3058440051=1)
(3058640011=1)
(3058640051=1)
(3058640061=1)
(3058850011=1)
(3058850021=1)
(3058850031=1)
(3058850041=1)
(3058850061=1)
(3059040011=1)
(3059040021=1)
(3059040031=1)
(3059040061=1)
(3059230011=1)
(3059230021=1)
(3059230031=1)
(3059230041=1)
(3059230051=1)
(3059230061=1)
(3059430011=1)
(3059430021=1)
(3059430031=1)
(3059430041=1)
(3059430051=1)
(3059620021=1)
(3059620031=1)
(3059620041=1)
(3059620051=1)
(3059620061=1)
(3059820041=1)
(3059820061=1)
(3060020011=1)
(3060020031=1)
(3060020061=1)
(3060220011=1)
(3060220041=1)
(3060220061=1)
(3060420021=1)
(3060420041=1)
(3060420051=1)
(3060630021=1)
(3060630031=1)
(3060630041=1)
(3060830011=1)
(3060830031=1)
(3060830051=1)
(3061030011=1)
(3061030041=1)
(3061030061=1)
(3061230011=1)
(3061230021=1)
(3061230031=1)
(3061230041=1)
(3061230051=1)
(3061430031=1)
(3061430041=1)
(3061430051=1)
(3061430061=1)
(3061630021=1)
(3061630031=1)
(3061630051=1)
(3061830011=1)
(3061830031=1)
(3061830041=1)
(3061830051=1)
(3065130011=1)
(3065130021=1)
(3065130031=1)
(3065130041=1)
(3065130051=1)
(3065340011=1)
(3065340021=1)
(3065340031=1)
(3065340041=1)
(3065680031=1)
(3065880031=1)
(3066090011=1)
(3066090021=1)
(3066090061=1)
(3066300011=1)
(3066300021=1)
(3066300031=1)
(3066300041=1)
(3066500011=1)
(3066500021=1)
(3066500041=1)
(3066500051=1)
(3066700061=1)
(3066910031=1)
(3066910051=1)
(3067120011=1)
(3067530051=1)
(3067530061=1)
(3073740031=1)
(3073740051=1)
(3073950021=1)
(3073950051=1)
(3073950061=1)
(3074160051=1)
(3074360031=1)
(3074360041=1)
(3074570011=1)
(3074570061=1)
(3076900011=1)
(3076900061=1)
(3077120011=1)
(3077120031=1)
(3077120041=1)
(3077120061=1)
(3077310011=1)
(3077310051=1)
(3077530011=1)
(3077530041=1)
(3077530051=1)
(3077730041=1)
(3077730051=1)
(3077940011=1)
(3077940031=1)
(3077940041=1)
(3077940051=1)
(3078140031=1)
(3078140061=1)
(3078340021=1)
(3078340041=1)
(3078340061=1)
(3079150031=1)
(3079150041=1)
(3079150051=1)
(3079150061=1)
(3079360011=1)
(3079360051=1)
(3079560031=1)
(3079780031=1)
(3079780041=1)
(3080180021=1)
(3080180051=1)
(3080390061=1)
(3080590031=1)
(3080590041=1)
(3080590051=1)
(3080590061=1)
(3081000041=1)
(3081200021=1)
(3081200031=1)
(3081200061=1)
(3090930041=1)
(3090930051=1)
(3091120011=1)
(3091120021=1)
(3091120041=1)
(3091340011=1)
(3091340031=1)
(3091340051=1)
(3091730031=1)
(3091730041=1)
(3091730061=1)
(3091930011=1)
(3091930021=1)
(3091930041=1)
(3091930051=1)
(3094800011=1)
(3094800051=1)
(3095010011=1)
(3095010061=1)
(3095220011=1)
(3136700011=1)
(3136700061=1)
(3146520041=1)
(3160250011=1)
(3160250021=1)
(3160250041=1)
(3160640011=1)
(3160640021=1)
(3160850031=1)
(3163660051=1)
(3164060021=1)
(3164060041=1)
(3164060051=1)
(3164260041=1)
(3164260061=1)
(3172210051=1)
(3172410011=1)
(3172620051=1)
(3183000041=1)
(3186590031=1)
(3186590061=1)
(3187210011=1)
(3187650051=1)
(3187860041=1)
(3190810011=1)
(3190810021=1)
(3190810031=1)
(3190810051=1)
(3191020011=1)
(3191020021=1)
(3191230011=1)
(3191230031=1)
(3191430011=1)
(3191430031=1)
(3191430041=1)
(3191430061=1)
(3191640021=1)
(3191850021=1)
(3191850041=1)
(3191850051=1)
(3192070061=1)
(3192270031=1)
(3192270051=1)
(3192470011=1)
(3192680021=1)
(3192890011=1)
(3192890051=1)
(3193100011=1)
(3193100021=1)
(3193100031=1)
(3193100041=1)
(3193510011=1)
(3193510021=1)
(3193710031=1)
(3193710041=1)
(3193710051=1)
(3193920011=1)
(3193920021=1)
(3193920031=1)
(3193920041=1)
(3193920061=1)
(3197460011=1)
(4006660021=1)
(4006660031=1)
(4006780051=1)
(4011220011=1)
(4011220031=1)
(4011330011=1)
(4011330021=1)
(4011450011=1)
(4014070011=1)
(4014070021=1)
(4014070031=1)
(4015190011=1)
(4021470031=1)
(4021590041=1)
(4021590061=1)
(4022330031=1)
(4022330041=1)
(4023390021=1)
(4023690021=1)
(4023690051=1)
(4024630011=1)
(4027880011=1)
(4027880021=1)
(4032020051=1)
(4033220051=1)
(4036400011=1)
(4036400061=1)
(4063590011=1)
(4063590051=1)
(4064650031=1)
(4064650041=1)
(4069350061=1)
(4069460031=1)
(4070450041=1)
(4070450061=1)
(4070570021=1)
(4070570031=1)
(4070570051=1)
(4071600011=1)
(4071600021=1)
(4071600031=1)
(4071600041=1)
(4071720021=1)
(4071720041=1)
(4071840031=1)
(4071840041=1)
(4083820041=1)
(4087600051=1)
(4088150011=1)
(4088150041=1)
(4088150051=1)
(4088150061=1)
(4089330031=1)
(4089330041=1)
(4089450031=1)
(4095770031=1)
(4096080023=1)
(4096440021=1)
(4096440051=1)
(4096440061=1)
(4097880031=1)
(4098000051=1)
(4098000061=1)
(4099320011=1)
(4131740041=1)
(4131740061=1)
(4133500011=1)
(4133500021=1)
(4133780021=1)
(4133780051=1)
(4135660031=1)
(4135660041=1)
(4135660061=1)
(4136260011=1)
(4136260033=1)
(4137620021=1)
(4137750011=1)
(4137750041=1)
(4138100031=1)
(4138220021=1)
(4140280031=1)
(4141320041=1)
(4142280061=1)
(4143480041=1)
(4148100021=1)
(4148100031=1)
(4150010031=1)
(4150700011=1)
(4150700021=1)
(4151870021=1)
(4153190031=1)
(4157050051=1)
(4158090031=1)
(4159260031=1)
(4159260051=1)
(4160110061=1)
(4166740051=1)
(4168520061=1)
(4170940011=1)
(4170940061=1)
(4173230061=1)
(4173900021=1)
(4175390011=1)
(4176980011=1)
(4176980061=1)
(4177690041=1)
(4181430011=1)
(4181910041=1)
(4182490041=1)
(4184810031=1)
(4189870041=1)
(4199760041=1)
(4199870051=1)
(4199990041=1)
(5004610011=1)
(5004870031=1)
(5005050011=1)
(5005050031=1)
(5005050061=1)
(5005220062=1)
(5006290031=1)
(5007160031=1)
(5007630031=1)
(5007630061=1)
(5008830031=1)
(5009010041=1)
(5009910021=1)
(5009910052=1)
(5009910061=1)
(5010090021=1)
(5010090031=1)
(5010090051=1)
(5010090061=1)
(5010600011=1)
(5010970041=1)
(5014420011=1)
(5015630031=1)
(5017720011=1)
(5018380041=1)
(5018380061=1)
(5020570011=1)
(5020570051=1)
(5027380051=1)
(5027560021=1)
(5028090021=1)
(5028090041=1)
(5028270021=1)
(5028270031=1)
(5029060061=1)
(5035150011=1)
(5036470021=1)
(5055120031=1)
(5055300051=1)
(5055300061=1)
(5055470031=1)
(5055470051=1)
(5055650011=1)
(5055650061=1)
(5055840021=1)
(5055840031=1)
(5056020021=1)
(5056200011=1)
(5056380011=1)
(5056380021=1)
(5056380041=1)
(5056380061=1)
(5056560011=1)
(5056740011=1)
(5056740031=1)
(5056920021=1)
(5057100011=1)
(5057100021=1)
(5057100031=1)
(5057100051=1)
(5057280011=1)
(5057280021=1)
(5057280041=1)
(5057280061=1)
(5057460021=1)
(5057460051=1)
(5057460061=1)
(5062060011=1)
(5062060031=1)
(5062240031=1)
(5062240051=1)
(5062240061=1)
(5062420051=1)
(5062600041=1)
(5062600051=1)
(5062780011=1)
(5062780041=1)
(5062780061=1)
(5062970011=1)
(5062970031=1)
(5062970051=1)
(5062970061=1)
(5063130031=1)
(5063310011=1)
(5063310021=1)
(5063310031=1)
(5063310061=1)
(5063660041=1)
(5063660051=1)
(5064360031=1)
(5064360061=1)
(5065020061=1)
(5067600041=1)
(5067600051=1)
(5067600061=1)
(5067780011=1)
(5067780021=1)
(5067780041=1)
(5067980011=1)
(5068350021=1)
(5068350041=1)
(5068350061=1)
(5068530052=1)
(5069090011=1)
(5069090021=1)
(5069090031=1)
(5069090041=1)
(5069090051=1)
(5069090061=1)
(5069270021=1)
(5069600031=1)
(5070060021=1)
(5070240011=1)
(5070240031=1)
(5070240041=1)
(5070240051=1)
(5070640031=1)
(5070640041=1)
(5070640051=1)
(5070820011=1)
(5070820021=1)
(5070820031=1)
(5070820051=1)
(5070820061=1)
(5071000011=1)
(5071180051=1)
(5071370011=1)
(5071890051=1)
(5072440061=1)
(5072630031=1)
(5073010011=1)
(5073010041=1)
(5073370031=1)
(5074660021=1)
(5074840061=1)
(5075030011=1)
(5075030021=1)
(5075030031=1)
(5075030051=1)
(5075210021=1)
(5075210031=1)
(5075420021=1)
(5075420031=1)
(5075420041=1)
(5075420051=1)
(5075420061=1)
(5075590031=1)
(5075590041=1)
(5075590051=1)
(5075590061=1)
(5075770041=1)
(5075960011=1)
(5075960041=1)
(5075960061=1)
(5076160011=1)
(5076160041=1)
(5076160051=1)
(5076350021=1)
(5076350033=1)
(5076350041=1)
(5076350051=1)
(5076350061=1)
(5076540031=1)
(5076540051=1)
(5076730021=1)
(5076730041=1)
(5076730061=1)
(5078580031=1)
(5078580051=1)
(5078770011=1)
(5078770021=1)
(5078770051=1)
(5081810011=1)
(5081810041=1)
(5081810051=1)
(5082270031=1)
(5082460021=1)
(5082460051=1)
(5082460061=1)
(5082730011=1)
(5082730031=1)
(5085410011=1)
(5085670041=1)
(5085860011=1)
(5086620021=1)
(5086620041=1)
(5086620051=1)
(5087120031=1)
(5087120041=1)
(5087120061=1)
(5087290021=1)
(5087290051=1)
(5088210041=1)
(5088760061=1)
(5089680011=1)
(5090090051=1)
(5090330051=1)
(5094460041=1)
(5094460051=1)
(5095700031=1)
(5095700061=1)
(5096780041=1)
(5126820021=1)
(5127000021=1)
(5127000031=1)
(5127180011=1)
(5127180021=1)
(5127180041=1)
(5127180051=1)
(5127360011=1)
(5127360061=1)
(5127910021=1)
(5128090011=1)
(5128090021=1)
(5128090031=1)
(5128090061=1)
(5128260011=1)
(5128260041=1)
(5128470021=1)
(5128660021=1)
(5128660051=1)
(5129010011=1)
(5129010044=1)
(5129010051=1)
(5129010061=1)
(5129370011=1)
(5129830061=1)
(5131330041=1)
(5132420031=1)
(5133640021=1)
(5133640031=1)
(5133640041=1)
(5133640051=1)
(5134990061=1)
(5135820051=1)
(5136060041=1)
(5136060051=1)
(5136060061=1)
(5136240011=1)
(5137970011=1)
(5142550021=1)
(5148300011=1)
(5148680011=1)
(5149770041=1)
(5151250041=1)
(5156460061=1)
(5157390051=1)
(5158120051=1)
(5171260021=1)
(5173160051=1)
(5174450041=1)
(5174660031=1)
(5175630061=1)
(5177920021=1)
(5178100021=1)
(5178100031=1)
(5178100041=1)
(5180120021=1)
(5181770061=1)
(5182380041=1)
(5183960061=1)
(5184550011=1)
(5184840031=1)
(5185020031=1)
(5185020041=1)
(5185990011=1)
(5187320041=1)
(5188000021=1)
(5188750031=1)
(5188950061=1)
(5190000031=1)
(5190190021=1)
(5190190051=1)
(5190190061=1)
(5190360051=1)
(5194300011=1)
(5194470061=1)
(5194670041=1)
(5194670061=1)
(5194850011=1)
(5194850031=1)
(5195040021=1)
(5195040041=1)
(5195210041=1)
(5195210051=1)
(5195410011=1)
(5195410051=1)
(5195780021=1)
(5195780041=1)
(5198240051=1)
(5198600041=1)
(5198600061=1)
(5199150021=1)
(5199150031=1)
(5202170011=1)
(5202170061=1).
EXECUTE.

**Creación de la variable Hogar 2**

RECODE HOGAR_2 (1=1) (ELSE=0).
EXECUTE.

*Recodificaicón de la variable Hogar 2**

RECODE HOGAR_2 (0=2).
EXECUTE.

**Recodificación ubicándole 3 para que se pudiera sumar con la otra variable y encontrar a los asegurados indirectos**

RECODE Seguridad_social (SYSMIS=3).
EXECUTE.

COMPUTE IHSS_2=Seguridad_social + HOGAR_2.
EXECUTE.

FREQUENCIES VARIABLES=IHSS_2
  /ORDER=ANALYSIS.

**Recodificación de la Variable IHSS2 para ver asegurados directos e indirectos**

RECODE IHSS_2 (1=0) (2=1) (4=1) (3=2) (5=2).
EXECUTE.

**Frecuencia de la variable IHSS_2**

FREQUENCIES VARIABLES=IHSS_2
  /ORDER=ANALYSIS.

*******************************************************************************ESCALA DE CIUDADANÍA SOCIAL********************************************************************

COMPUTE ESCALA_CIUDADANIA=(SUB_ESCALA_CREDENCIALES + IHSS_2)/0.9.
EXECUTE.

FREQUENCIES VARIABLES=ESCALA_CIUDADANIA.

**Frecuencia de la Escala de ciudadanía social**

FREQUENCIES VARIABLES=ESCALA_CIUDADANIA
  /PERCENTILES=33.0 66.0 
  /STATISTICS=STDDEV VARIANCE MEAN MEDIAN
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

NPAR TESTS
  /K-S(NORMAL)=ESCALA_CIUDADANIA
  /MISSING ANALYSIS.

**Creación de la variable Niveles de Ciudadanía Social**

COMPUTE Niveles_ciudadania=99.
EXECUTE.

DO IF (ESCALA_CIUDADANIA  > 5.01).
RECODE Niveles_ciudadania (99=1).
END IF.
EXECUTE.

DO IF (ESCALA_CIUDADANIA  > 2.49 & ESCALA_CIUDADANIA <= 5.01).
RECODE Niveles_ciudadania (99=2).
END IF.
EXECUTE.

DO IF  (ESCALA_CIUDADANIA <= 2.49).
RECODE Niveles_ciudadania (99=3) INTO Niveles_ciudadania.
END IF.
EXECUTE.


RECODE Niveles_ciudadania (99=SYSMIS).
EXECUTE.

**Frecuencia de la variable niveles de ciudadanía social**

FREQUENCIES VARIABLES=Niveles_ciudadania
  /ORDER=ANALYSIS.

*************************************************************************************ZONAS DE ECLUSIÓN/INCLUSIÓN*******************************************************************************

COMPUTE ZONA_EXCLUSION2=88.
EXECUTE.

DO IF ((Escala_productiva <  3.67) & (Escala_credenciales_educ  <= 3)).
RECODE ZONA_EXCLUSION2 (88=3).
END IF.
EXECUTE.

DO IF ((Escala_productiva > 3.67) & (Escala_credenciales_educ <= 3)).
RECODE ZONA_EXCLUSION2 (88=2).
END IF.
EXECUTE.

DO IF ((Escala_productiva < 3.67) & (Escala_credenciales_educ >= 3)).
RECODE ZONA_EXCLUSION2 (88=1).
END IF.
EXECUTE.


DO IF ((Escala_productiva > 3.67) & (Escala_credenciales_educ >= 3)).
RECODE ZONA_EXCLUSION2 (88=0).
END IF.
EXECUTE.

****PRUEBA CON NUEVAS ESCALAS***

COMPUTE ZONA_EXCLUSION3=88.
EXECUTE.

DO IF ((ESCALA_PRODUCTIVIDAD < 3.67) & (ESCALA_CIUDADANIA <= 3)).
RECODE ZONA_EXCLUSION3 (88=3).
END IF.
EXECUTE.

DO IF ((ESCALA_PRODUCTIVIDAD > 3.67) & (ESCALA_CIUDADANIA <= 3)).
RECODE ZONA_EXCLUSION3 (88=2).
END IF.
EXECUTE.

DO IF ((ESCALA_PRODUCTIVIDAD < 3.67) & (ESCALA_CIUDADANIA >= 3)).
RECODE ZONA_EXCLUSION3 (88=1).
END IF.
EXECUTE.

DO IF ((ESCALA_PRODUCTIVIDAD  > 3.67) & (ESCALA_CIUDADANIA >= 3)).
RECODE ZONA_EXCLUSION3 (88=0).
END IF.
EXECUTE.

RECODE ZONA_EXCLUSION3 (88=SYSMIS).
EXECUTE.

FREQUENCIES VARIABLES=ZONA_EXCLUSION3
  /ORDER=ANALYSIS.













