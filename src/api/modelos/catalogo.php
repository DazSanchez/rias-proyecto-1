<?php
    include_once("../helpers/mysql_helper.php");

    class Catalogo {
        private $pdo;

        function __construct() {
            $this->pdo = conectar();
        }

        function obtener_estilos() {
            $query = $this->pdo->prepare('SELECT * FROM CAT_ESTILO_MUEBLE');
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

        function obtener_materiales() {
            $query = $this->pdo->prepare('SELECT * FROM CAT_MATERIAL_MUEBLE');
            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        
        function obtener_mensajerias() {
            $query = $this->pdo->prepare('SELECT * FROM CAT_MENSAJERIA');
            $query->execute();
    
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

        function obtener_tipos() {
            $query = $this->pdo->prepare('SELECT * FROM CAT_TIPO_MUEBLE');
            $query->execute();
    
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
    }
?>