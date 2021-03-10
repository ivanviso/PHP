<html>

<head>
    <link rel="stylesheet" href="css/login.css">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
</head>

<body>
<table>
            <tr>
                <td class=title>
                <h1 onclick="location.href='/'">Bienvenido a nuestra pagina</h1>
                </td>
                <td class=boton>
                    <button onclick="location.href='/registro.php'">
                        Registro
                    </button>
                </td>
                <td class=boton>
                    <button onclick="location.href='/login.php'">
                        Iniciar Sesion
                    </button>
                </td>
            </tr>
        </table>
    <form action="registro.php" method="POST">
        <table class="formulario">
            <thead>
                <tr>
                    <td colspan="2">
                        <h1>Datos de registro</h1>
                    </td>
                </tr>

            </thead>
            <tr>
                <td>
                    <label for="fname">Nombre de usuario o correo electronico.</label>
                </td>
                <td>
                    <input type="text" id="username" name="username">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="fname">Contraseña</label>
                </td>
                <td>
                    <input type="password" id="pass" name="pass">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="fname">Nombre</label>
                </td>
                <td>
                    <input type="text" id="nombre" name="nombre">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="fname">Direccion</label>
                </td>
                <td>
                    <input type="text" id="addr" name="addr">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="fname">DNI o NIF</label>
                </td>
                <td>
                    <input type="text" id="dni" name="dni">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="fname">Telefono</label>
                </td>
                <td>
                    <input type="number" id="tlf" name="tlf">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                <input type="submit" name="submit">
                </td>
            </tr>
        </table>
    </form>

<h1 class=error> <?php
$error = false;
if ($error) {
    echo $error_text;
}
?></h1>

<?php
$errores = "";
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_REQUEST['username'];
    $pass = $_REQUEST['pass'];
    $hashpass = password_hash($pass, PASSWORD_DEFAULT); // hasheamos la contrasena
    $nombre = $_REQUEST['nombre'];
    $addr = $_REQUEST['addr'];
    $dni = $_REQUEST['dni'];
    $tlf = $_REQUEST['tlf'];
    include 'php/mysqlcon.php'; //nos conectamos a la base de datos
    include 'php/insert.php';
}

echo "<h3 class=error> $errores</h3>";

?>




</body>



</html>