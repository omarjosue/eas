# eas
===========
Estructura:
===========

- EAS. Contenedor de proyectos Maven
       - EAS-ear. Contenedor de los módulos de negocio
       - EAS-ejb. Implementación de los EJBs (Facades)
       - EAS-model. Implementación de los Entity (JPA)
       - EAS-services. Interfases locales de los EJBs
       - EAS-rest. Subcontenedor de proyectos Maven
              * EAS-rest-ear. Contenedor de los módulos cliente
              * EAS-rest-ejb. Implementación de los servicios REST (Stateless)
              *      EAS-app. Módulo web (MVC) con JAX-RS
- dump. Esquema de la base de datos

=================
Especificaciones:
=================

* Los módulos fueron creados con NetBeans 8.1 IDE y JDK 1.8, para ser desplegados en un servidor de aplicaciones JBoss EAP 6.4, con especificación JEE 6

* La estructura de datos fue creada para el motor de base de datos MySQL 5.6.17-ndb-7.3.5-cluster-gpl

* El controlador JDBC utilizado fue mysql-connector-java-5.1.23-bin.jar
