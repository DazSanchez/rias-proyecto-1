CREATE DATABASE muebleria_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE muebleria_db;

CREATE TABLE USUARIO (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE_USUARIO varchar(255) NOT NULL UNIQUE, 
  CLAVE_ACCESO   varchar(255) NOT NULL, 
  ID_ROL         int(1) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE CAT_ROLES (
  ID     int(1) NOT NULL AUTO_INCREMENT, 
  NOMBRE varchar(255) NOT NULL, 
  PRIMARY KEY (ID))  ;
CREATE TABLE CLIENTES (
  ID               int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE           varchar(255) NOT NULL, 
  PRIMER_APELLIDO  varchar(255) NOT NULL, 
  SEGUNDO_APELLIDO varchar(255) NOT NULL, 
  TEL_OFICINA      varchar(10) NOT NULL, 
  TEL_CELULAR      varchar(10), 
  EMAIL            varchar(255) NOT NULL, 
  DIRECCION_FISCAL varchar(255) NOT NULL, 
  ID_USUARIO       int(10) NOT NULL, 
  ID_TIENDA        int(11) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE MUEBLE (
  ID          int(10) NOT NULL AUTO_INCREMENT, 
  MODELO      varchar(255) NOT NULL, 
  PRECIO      double NOT NULL, 
  DESCRIPCION varchar(255) NOT NULL, 
  ACTIVO      tinyint(1) NOT NULL, 
  ID_TIPO     int(10) NOT NULL, 
  ID_ESTILO   int(10) NOT NULL, 
  ID_MEDIDAS  int(10) NOT NULL, 
  ID_MATERIAL int(10) NOT NULL, 
  EXISTENCIAS int(11) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE CAT_TIPO_MUEBLE (
  ID     int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE varchar(255), 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE CAT_ESTILO_MUEBLE (
  ID     int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE varchar(255) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE MEDIDA_MUEBLE (
  ID    int(10) NOT NULL AUTO_INCREMENT, 
  ALTO  double NOT NULL, 
  ANCHO double NOT NULL, 
  LARGO double NOT NULL, 
  PESO  double NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE CAT_MATERIAL_MUEBLE (
  ID     int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE varchar(255) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE REGISTRO_COMPRA (
  ID                        int(10) NOT NULL AUTO_INCREMENT, 
  ID_INFO_TRANSACCION         int(10) NOT NULL, 
  ID_REGISTRO_COMPRA_MUEBLE int(10) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE INFO_TRANSACCION (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  TIPO         varchar(255) NOT NULL, 
  AUTORIZACION tinyint(1) NOT NULL, 
  TARJETA      varchar(16), 
  MONTO        double NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE REGISTRO_ENVIO (
  ID                 int(10) NOT NULL AUTO_INCREMENT, 
  DIRECCION_ENVIO    varchar(255) NOT NULL, 
  ID_REGISTRO_COMPRA int(10) NOT NULL, 
  ID_MENSAJERIA      int(10) NOT NULL, 
  ID_CLIENTE         int(10) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE CAT_MENSAJERIA (
  ID     int(10) NOT NULL AUTO_INCREMENT, 
  NOMBRE varchar(255) NOT NULL, 
  COSTO  double NOT NULL, 
  TIEMPO int(10) NOT NULL, 
  PRIMARY KEY (ID))  ;
CREATE TABLE TIENDA (
  ID     int(11) NOT NULL AUTO_INCREMENT, 
  RFC    varchar(13) NOT NULL UNIQUE, 
  NOMBRE varchar(255) NOT NULL, 
  PRIMARY KEY (ID), 
  UNIQUE INDEX (ID))  ;
CREATE TABLE REGISTRO_COMPRA_MUEBLE (
  ID                 int(10) NOT NULL AUTO_INCREMENT, 
  ID_REGISTRO_COMPRA int(10) NOT NULL, 
  ID_MUEBLE          int(10) NOT NULL, 
  CANTIDAD           int(10) NOT NULL, 
  PRIMARY KEY (ID))  ;
CREATE TABLE MUEBLE_MATERIAL_MUEBLE (
  MATERIAL_ID int(10) NOT NULL, 
  MUEBLE_ID              int(10) NOT NULL, 
  PRIMARY KEY (MATERIAL_ID, MUEBLE_ID));
ALTER TABLE USUARIO ADD INDEX FKUSUARIO206814 (ID_ROL), ADD CONSTRAINT FKUSUARIO206814 FOREIGN KEY (ID_ROL) REFERENCES CAT_ROLES (ID);
ALTER TABLE MUEBLE ADD INDEX FKMUEBLE63988 (ID_TIPO), ADD CONSTRAINT FKMUEBLE63988 FOREIGN KEY (ID_TIPO) REFERENCES CAT_TIPO_MUEBLE (ID);
ALTER TABLE MUEBLE ADD INDEX FKMUEBLE208427 (ID_ESTILO), ADD CONSTRAINT FKMUEBLE208427 FOREIGN KEY (ID_ESTILO) REFERENCES CAT_ESTILO_MUEBLE (ID);
ALTER TABLE MUEBLE ADD INDEX FKMUEBLE275927 (ID_MEDIDAS), ADD CONSTRAINT FKMUEBLE275927 FOREIGN KEY (ID_MEDIDAS) REFERENCES MEDIDA_MUEBLE (ID);
ALTER TABLE MUEBLE ADD INDEX FKMUEBLE82259 (ID_MATERIAL), ADD CONSTRAINT FKMUEBLE82259 FOREIGN KEY (ID_MATERIAL) REFERENCES CAT_MATERIAL_MUEBLE (ID);
ALTER TABLE REGISTRO_COMPRA ADD INDEX FKREGISTRO_C581302 (ID_INFO_TRANSACCION), ADD CONSTRAINT FKREGISTRO_C581302 FOREIGN KEY (ID_INFO_TRANSACCION) REFERENCES INFO_TRANSACCION (ID);
ALTER TABLE REGISTRO_ENVIO ADD INDEX FKREGISTRO_E23006 (ID_REGISTRO_COMPRA), ADD CONSTRAINT FKREGISTRO_E23006 FOREIGN KEY (ID_REGISTRO_COMPRA) REFERENCES REGISTRO_COMPRA (ID);
ALTER TABLE REGISTRO_ENVIO ADD INDEX FKREGISTRO_E924866 (ID_MENSAJERIA), ADD CONSTRAINT FKREGISTRO_E924866 FOREIGN KEY (ID_MENSAJERIA) REFERENCES CAT_MENSAJERIA (ID);
ALTER TABLE CLIENTES ADD INDEX FKCLIENTES136803 (ID_USUARIO), ADD CONSTRAINT FKCLIENTES136803 FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID);
ALTER TABLE CLIENTES ADD INDEX FKCLIENTES200832 (ID_TIENDA), ADD CONSTRAINT FKCLIENTES200832 FOREIGN KEY (ID_TIENDA) REFERENCES TIENDA (ID);
ALTER TABLE REGISTRO_ENVIO ADD INDEX FKREGISTRO_E432624 (ID_CLIENTE), ADD CONSTRAINT FKREGISTRO_E432624 FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID);
ALTER TABLE REGISTRO_COMPRA_MUEBLE ADD INDEX FKREGISTRO_C878534 (ID_MUEBLE), ADD CONSTRAINT FKREGISTRO_C878534 FOREIGN KEY (ID_MUEBLE) REFERENCES MUEBLE (ID);
ALTER TABLE REGISTRO_COMPRA_MUEBLE ADD INDEX FKREGISTRO_C505465 (ID_REGISTRO_COMPRA), ADD CONSTRAINT FKREGISTRO_C505465 FOREIGN KEY (ID_REGISTRO_COMPRA) REFERENCES REGISTRO_COMPRA (ID);
