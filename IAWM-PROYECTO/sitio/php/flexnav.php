<?php

echo '
<link rel="stylesheet" type="text/css" href="/css/flexnav.css">
<body>
<div id="nav-background">
    <div id="nav-container">
        <header id="nav-header">
            <h1><a href="#" id="nav-logo">Vivir Outras Vidas</a></h1>
            <div id="nav-menu-button">MENU</div>
        </header>
        <nav>
            <ul class="nav-ul hide-ul">
                <li><a class="nav-link" href="/alquiler.php">Alquiler</a></li>
                <li><a class="nav-link" href="/venta.php">Venta</a></li>
                <li><a class="nav-link" href="/usuario/perfil.php">Perfil</a></li>
                <li><a class="nav-link" href="/devolver.php">Devolucion</a></li>
                <li><a class="nav-link" href="/panel_usuario.php">Catalogo</a></li>
                <li><a class="nav-link" href="/carrito.php">Carrito</a></li>
                <li><a class="nav-link" href="/php/justificante.php">Justificante</a></li>
                <li><a class="nav-link">Ola\t',$_SESSION['usuario'],'</a></li>


            </ul>
        </nav>
    </div>
</div>

<div id="main-content">
    <article class="main-article">'
?>