<?php
$server="localhost";
$user="root";
$password="";
$db="place";
             //Establecer la conexion a la base de datos
             $conexion=new mysqli($server,$user,$password, $db);
             //Verificar la conexion
        if($conexion->connect_errno){
            die(" Error: " .$conexion->connect_errno);
        }else{
            echo "Conexion Exitosa";
        }    $conexion-> close();
?>