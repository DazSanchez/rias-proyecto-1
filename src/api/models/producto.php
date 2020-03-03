<?
    include_once("../helpers/mysql_helper.php");

    class Producto {
        private $pdo;

        function __construct() {
            $this->pdo = get_connection();
        }

        public function get_products($category, $limit) {
        }

        public function crear_producto($producto) {
            $sql_medidas = 'INSERT INTO MEDIDA_MUEBLE(ALTO, ANCHO, LARGO, PESO) VALUES(:alto, :ancho, :largo, :peso)';
            $sql_producto = 'INSERT INTO MUEBLES (MODELO, PRECIO, DESCRIPCION, ACTIVO, ID_TIPO, ID_ESTILO, ID_MEDIDAS, ID_MATERIAL, EXISTENCIAS)'.
                    'VALUES (:nombre, :precio, :descripcion, 1, :tipo, :estilo, :medidas, :cantidad)';

            $medidas = $producto["medidas"];

            $this->pdo->prepare($sql_medidas)->execute([
                "alto" => $medidas["alto"],
                "ancho" => $medidas["ancho"],
                "largo" => $medidas["largo"],
                "peso" => $medidas["peso"]
            ]);

            $medida = $this->pdo->fetch(PDO::FETCH_ASSOC);
            $id_medida = $medida["ID"];

            $this->pdo->prepare($sql_producto)->execute([
                "nombre" => $producto["nombre"],
                "precio" => $producto["precio"],
                "descripcion" => $producto["descripcion"],
                "tipo" => $producto["tipo"],
                "medidas" => $producto["medidas"],
                "cantidad" => $producto["cantidad"]
            ]);
        }
    }
?>