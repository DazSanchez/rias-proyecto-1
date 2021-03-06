CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'user_password';
CREATE USER 'db_user'@'%' IDENTIFIED BY 'user_password';

GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.USUARIO TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.USUARIO TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_ROLES TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_ROLES TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CLIENTES TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CLIENTES TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.MUEBLE TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_TIPO_MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_TIPO_MUEBLE TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_ESTILO_MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_ESTILO_MUEBLE TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.MEDIDA_MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.MEDIDA_MUEBLE TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_MATERIAL_MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_MATERIAL_MUEBLE TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_COMPRA TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_COMPRA TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.INFO_TRANSACCION TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.INFO_TRANSACCION TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_ENVIO TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_ENVIO TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_MENSAJERIA TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.CAT_MENSAJERIA TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.TIENDA TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.TIENDA TO 'db_user'@'%';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_COMPRA_MUEBLE TO 'db_user'@'localhost';
GRANT INSERT, DELETE, SELECT, UPDATE ON muebleria_db.REGISTRO_COMPRA_MUEBLE TO 'db_user'@'%';