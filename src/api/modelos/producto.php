<?php 
    include_once("../utils/mysql_helper.php");

    class Producto {
        private $pdo;

        function __construct() {
            $this->pdo = conectar();
        }
        
        function obtener_productos($filtro) {
            $query = $this->pdo->prepare("SELECT * FROM MUEBLE WHERE ? = ?", [
                $filtro["tipo"],
                $filtro["q"]
            ]);

            $query->execute();

            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
    }
?>