<?php
echo '
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    header {
        text-align: center;
        padding: 20px 0;
        background-color: #3399ff;
        color: #fff;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    form {
        text-align: center;
    }
    input[type="submit"], button {
        background-color: #3399ff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }
    input[type="submit"]:hover, button:hover {
        background-color: #1a75ff;
    }
</style>
';
echo'<left><img src="https://img.freepik.com/vector-gratis/logotipo-viaje-detallado_23-2148616611.jpg" width="100px" height="100px"></left>';
$conexion = new mysqli("localhost","root","","place");
if ($conexion->connect_error) {
die("Error de conexión: " . $conexion->connect_error);
}
    //Consulta sql desde la base de datos
    $sql= "SELECT ID_turista,Nombre,Nacionalidad,Edad,Intereses	FROM turistas";
      $resultado = $conexion->query($sql);
      if ($resultado->num_rows > 0) {
        // Comenzar la tabla
        echo " <center> <h1>Informacion sobre turistas</h1>
        <table border='1';
        <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Nacionalidad</th>
        <th>Edad</th>
        <th>Intereses</th> </center </tr>>";
        // Mostrar los datos de cada fila
    while($fila = $resultado->fetch_assoc()) {
        echo "<tr><td>" . $fila["ID_turista"] . "</td><td>" . $fila["Nombre"] . "</td><td>" . $fila["Nacionalidad"] . "</td><td>" . $fila["Edad"] . "</td><td>" . $fila["Intereses"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 resultados";
}

// Cerrar la conexión
$conexion->close();
      
?>