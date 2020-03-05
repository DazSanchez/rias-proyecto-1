<?php
    function es_metodo($metodo) {
        if($_SERVER['REQUEST_METHOD'] != $metodo) {
            http_response_code(405);
            echo json_encode([
                "codigo" => 405,
                "mensaje" => "El verbo http no es aceptado."
            ]);
            exit();
        }
    }
?>