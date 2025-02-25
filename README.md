# Transformación de la estructura de clases sociales en Honduras durante el modelo de acumulación neoliberal (2006, 2010 y 2013).

*Este proyecto contiene la programación utilizada para el procesamiento de las bases de datos de la Encuesta Permanente de Hogares de Propósitos Múltiples (EPHPM) de Honduras de los años 2013, 2010 y 2006.
El objetivo de este proyecto fue 
Se incluyen recodificaciones, creación de variables y construcción de escalas para análisis laboral y de ciudadanía social*

# Descripción general 
Este script en SPSS Syntax procesa bases de datos de encuestas para la construcción de variables relacionadas con empleo, precariedad laboral, credenciales educativas y ciudadanía social.
Se recodifican variables, se calculan nuevas escalas y se realizan análisis de frecuencias para evaluar los datos.

## Instalación

Para ejecutar este código, necesitas un software de análisis estadístico como **SPSS**. Asegúrate de contar con las bases de datos correspondientes y configuradas en el entorno de trabajo.

1. Instala SPSS en tu computadora.
2. Carga las bases de datos en formato compatible.
3. Abre el archivo de sintaxis en SPSS y ejecútalo.

## Uso

El código realiza diversas transformaciones sobre las bases de datos, incluyendo:

- Activación/desactivación de ponderaciones por factor de expansión.
- Creación y recodificación de variables clave.
- Construcción de escalas para análisis de precariedad laboral, credenciales educativas, autoempleo y ciudadanía social.
- Construcción de la estructura de clases sociales a partir del enfoque neoweberiano y neomarxista, pero considerando algunos elementos aplicables para América Latina.

# Análisis de Precariedad Laboral y Ciudadanía Social en Honduras

Este repositorio contiene los scripts de procesamiento y análisis de las Encuestas Permanentes de Hogares de Propósitos Múltiples (EPHPM) de Honduras para los años 2013, 2010, 2006 y 2001. Se implementan constructos teóricos relacionados con la precariedad laboral y la ciudadanía social a partir de diversas variables y escalas.

## Tabla de Contenidos
- [Instalación](#instalación)
- [Uso](#uso)
- [Variables Principales](#variables-principales)
- [Metodología](#metodología)
- [Ejemplos de Uso](#ejemplos-de-uso)
- [Licencia](#licencia)

## Instalación

1. **Requisitos previos**:  
   - Tener instalado **IBM SPSS Statistics**.
   - Contar con las bases de datos de las EPHPM de Honduras en formato compatible con SPSS.

2. **Ejecución del código**:  
   - Importar las bases de datos en SPSS.
   - Copiar y pegar el código en la ventana de sintaxis de SPSS.
   - Ejecutar los comandos según sea necesario.

## Uso

Este código permite realizar la recodificación de variables y la creación de escalas para analizar la precariedad laboral y la ciudadanía social en Honduras. Está diseñado para ser utilizado por investigadores, académicos y profesionales en ciencias sociales y economía laboral.

## Variables Principales

### **Precariedad Laboral**
- **Sector_REC**: Distingue entre sector público y privado.
- **Tipo_insercion**: Clasificación del tipo de inserción laboral.
- **Jornada_labo**: Evalúa si se cumple la jornada laboral.
- **Salario_minimo_final**: Determina el cumplimiento del salario mínimo según criterios de la STSS.
- **Estabilidad**: Evalúa la estabilidad laboral.

### **Ciudadanía Social**
- **IHSS**: Afiliación al Instituto Hondureño de Seguridad Social.
- **Pensión**: Determina si el trabajador cuenta con pensión.
- **Accidente**: Seguro por accidentes laborales.
- **Vacaciones**: Derecho a vacaciones pagadas.
- **Prestaciones**: Derecho a prestaciones laborales.

### **Credenciales Educativas**
- **Escala_credenciales_educ**: Nivel de educación alcanzado.
- **Rezago**: Diferencia entre nivel educativo y edad esperada.
- **Proba_ingreso**: Probabilidad de ingreso al mercado laboral.

### **Tipología de Autoempleo**
- **IngresoAutoempleo**: Clasifica los niveles de ingresos de autoempleados.
- **Ubicación**: Identifica si el negocio está dentro o fuera del hogar.
- **Capacidad_contratacion**: Evalúa la capacidad de contratación de personal.

## Metodología

El análisis se basa en la creación de variables derivadas mediante recodificación, cálculos de medias y pruebas estadísticas en SPSS. Se construyen escalas de medición para evaluar diferentes dimensiones del empleo y la ciudadanía social.

## Ejemplos de Uso

### **Cálculo de Precariedad Laboral**
```spss
COMPUTE SUB_ESCALA_PRECARIEDAD=(Jornada_labo + Estabilidad + IHSS + Salario_minimo_final)*2.5.
EXECUTE.

RECODE SUB_ESCALA_PRECARIEDAD (0=0) (2.5=1) (5=2) (7.5=3) (10=4) INTO Precariedad_niveles.
EXECUTE.
