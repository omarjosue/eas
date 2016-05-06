# eas
===========
Estructura:
===========

- EAS. Carpeta principal que contiene los proyectos Maven
       - EAS-ear. Contenedor de los módulos de negocio
       		   + EAS-ejb
                  + EAS-model
                  + EAS-services
       - EAS-rest. Carpeta secundaria que contiene los proyectos Maven
                  + EAS-rest-ear. Contenedor del consumidor y cliente web
                  + EAS-rest-ejb
                  + EAS-app
- DB. Diagrama Entidad-Relación y Estructura de Datos
- Screenshots. Imágenes de la estructura del proyecto y configuraciones


=================
Especificaciones:
=================

Los módulos fueron creados con el IDE NetBeans 8.1 y JDK 1.8, para ser desplegados en un servidor de aplicaciones JBoss EAP 6.4, bajo la especificación JEE 6

La estructura de datos fue creada para el motor de base de datos MySQL 5.6.17-ndb-7.3.5-cluster-gpl

El controlador JDBC utilizado fue mysql-connector-java-5.1.23-bin.jar
