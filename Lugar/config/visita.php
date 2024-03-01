<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <left><img src="https://img.freepik.com/vector-gratis/logotipo-viaje-detallado_23-2148616611.jpg" width="100px" height="100px"> </left>
    <title>Añadir Visita</title>
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

        input[type="submit"] {
            background-color: #3399ff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1a75ff;
        }

        button {
            background-color: #3399ff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1a75ff;
        }
    </style>
</head>
<body>
    <h1 align="center">Añadir Visita</h1>
    <form action="visita.php" method="post">
        <label for="turista">Turista:</label>
        <select name="id_turista" id="turista">
            <?php
            // Conexión a la base de datos
            $conexion = new mysqli("localhost", "root", "", "place");
            if ($conexion->connect_error) {
                die("Error de conexión: " . $conexion->connect_error);
            }

            // Consulta para obtener la lista de turistas
            $sql_turistas = "SELECT ID_turista, Nombre FROM turistas";
            $result_turistas = $conexion->query($sql_turistas);

            // Generar opciones del select para cada turista
            if ($result_turistas->num_rows > 0) {
                while($fila = $result_turistas->fetch_assoc()) {
                    echo "<option value='" . $fila["ID_turista"] . "'>" . $fila["Nombre"] . "</option>";
                }
            }

            // Cerrar conexión
            $conexion->close();
            ?>
        </select><br><br>

        <label for="ciudad">Ciudad:</label>
        <select name="id_ciudad" id="ciudad">
            <?php
            // Conexión a la base de datos (puedes reutilizar la conexión si ya está establecida)
            $conexion = new mysqli("localhost", "root", "", "place");
            if ($conexion->connect_error) {
                die("Error de conexión: " . $conexion->connect_error);
            }

            // Consulta para obtener la lista de ciudades
            $sql_ciudades = "SELECT ID_ciudad, Nombre FROM ciudad";
            $result_ciudades = $conexion->query($sql_ciudades);

            // Generar opciones del select para cada ciudad
            if ($result_ciudades->num_rows > 0) {
                while($fila = $result_ciudades->fetch_assoc()) {
                    echo "<option value='" . $fila["ID_ciudad"] . "'>" . $fila["Nombre"] . "</option>";
                }
            }
               // Prepara la consulta para insertar la visita
        $sql = "INSERT INTO visita (ID_turista, ID_ciudad, Fecha_visita) VALUES (?, ?, NOW())";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ii", $id_turista, $id_ciudad);

        // Ejecuta la consulta
        if ($stmt->execute()) {
            echo "Visita añadida correctamente.";
        } else {
            echo "Error al añadir visita: " . $conexion->error;
        }

        // Cierra la conexión
        $conexion->close();
    

      
            ?>
        </select><br><br>

        <input type="submit" value="Añadir Visita">
    </form>
</body>
</html>









