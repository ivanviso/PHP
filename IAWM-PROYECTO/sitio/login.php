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
    <form action="login.php" method="POST">
        <table class="formulario">
            <thead>
                <tr>
                    <td colspan="2">
                        <h1>Datos de inicio de sesion</h1>
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
                <td></td>
                <td>
                <input type="submit" name="submit">
                </td>
            </tr>
        </table>
    </form>
    </body>
    <?php
    if ($_SERVER['REQUEST_METHOD']=='POST') { // para que solo se ejecute despues de enviar el formulario. 
        $username=$_REQUEST['username'];
        $contrasinal=$_REQUEST['pass'];
        include 'php/auth.php';
        include 'php/redirect.php';
        echo $login;
        $admin=false;
        if ($login==true) {
            if ($admin==true) {
                js_redirect("/panel_admin.php");
            } else {
                js_redirect("/panel_usuario.php");
            }
        } else {
            echo "<h3 class=error>Contraseña incorrecta</h3>";

        }
}
    ?>

</html>
