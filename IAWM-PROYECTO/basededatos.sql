CREATE TABLE `usuario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `usuario` varchar(24) UNIQUE,
  `contrasinal` char(60),
  `nome` varchar(60),
  `direccion` varchar(90),
  `telefono` int,
  `nifdni` varchar(9),
  `fecha_registro` datetime
);

CREATE TABLE `novo_rexistro` (
  `usuario` varchar(24),
  `contrasinal` char(60),
  `nome` varchar(60),
  `direccion` varchar(90),
  `telefono` int,
  `nifdni` varchar(9)
);

CREATE TABLE `libro_aluguer` (
  `ISBN` varchar(18) PRIMARY KEY,
  `titulo` varchar(50),
  `cantidade` int,
  `descripcion` varchar(100),
  `editorial` varchar(24),
  `prezo` int,
  `prezo_aluguer` int,
  `foto` varchar(1000)
);

CREATE TABLE `libro_alugado` (
  `id_aluguer` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(18),
  `prezo_aluguer` int,
  `alugado_en` datetime,
  `usuario` varchar(24)
);

CREATE TABLE `libro_devolto` (
  `id_devolucion` int PRIMARY KEY AUTO_INCREMENT,
  `id_aluguer` int,
  `usuario` varchar(24),
  `titulo` varchar(50),
  `prezo` int,
  `devolto_en` datetime
);

CREATE TABLE `libro_venda` (
  `id_venta` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(18),
  `usuario` varchar(24),
  `prezo` int,
  `vendido_en` datetime
);


/*
ALTER TABLE `libro_alugado` ADD FOREIGN KEY (`ISBN`) REFERENCES `libro_aluguer` (`ISBN`);
ALTER TABLE `libro_alugado` ADD FOREIGN KEY (`prezo_aluguer`) REFERENCES `libro_aluguer` (`prezo_aluguer`);
ALTER TABLE `libro_alugado` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
ALTER TABLE `libro_devolto` ADD FOREIGN KEY (`id_aluguer`) REFERENCES `libro_alugado` (`id_aluguer`);
ALTER TABLE `libro_devolto` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
ALTER TABLE `libro_venda` ADD FOREIGN KEY (`ISBN`) REFERENCES `libro_aluguer` (`ISBN`);
ALTER TABLE `libro_venda` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
*/ 