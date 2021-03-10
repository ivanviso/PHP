<style>
    
</style>
<?php

echo '
<link rel="stylesheet" type="text/css" href="/css/flexnav.css">

<body>
<div id="nav-background">
    <div id="nav-container">
        <header id="nav-header">
            <h1><a href="#" id="nav-logo">Admin Panel</a></h1>
            <div id="nav-menu-button">MENU</div>
        </header>
        <nav>
            <ul class="nav-ul hide-ul">
                <li><a class="nav-link" href="novousuario.php">Novos Usuarios</a></li>
                <li><a class="nav-link" href="libro_add.php">Engadir Libros</a></li>
                <li><a class="nav-link" href="libro_mod.php">Modificar Libros</a></li>

                <li><a class="nav-link"> Ola, ',$_SESSION['usuario'],'</a></li>


            </ul>
        </nav>
    </div>
</div>

<div id="main-content">
    <article class="main-article">'
?>

