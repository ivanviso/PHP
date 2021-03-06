CREATE database viviroutrasvidas;
use viviroutrasvidas;
CREATE TABLE `usuario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `usuario` varchar(24) UNIQUE,
  `contrasinal` char(60),
  `nome` varchar(60),
  `direccion` varchar(90),
  `telefono` int,
  `nifdni` varchar(9),
  `admin` BOOL,
  `fecha_registro` datetime
);

CREATE TABLE `novo_rexistro` (
  `usuario` varchar(24) UNIQUE,
  `contrasinal` char(60),
  `nome` varchar(60),
  `direccion` varchar(90),
  `telefono` int,
  `nifdni` varchar(9)
);

CREATE TABLE `libro_aluguer` (
  `ISBN` varchar(18) PRIMARY KEY,
  `titulo` varchar(60),
  `cantidade` int,
  `descripcion` varchar(100),
  `editorial` varchar(24),
  `prezo` int,
  `prezo_aluguer` int,
  `foto` varchar(1000),
  `venda` boolean DEFAULT TRUE,
  `aluguer` boolean DEFAULT TRUE
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
  `ISBN` varchar(18),
  `id_aluguer` int,
  `usuario` varchar(24),
  `devolto_en` datetime,
  `confirmado` BOOL DEFAULT FALSE
);

CREATE TABLE `libro_venda` (
  `id_venta` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(18),
  `prezo` int,
  `usuario` varchar(24),
  `vendido_en` datetime
);

/* Marcan las relaciones de las tablas. Funcionan, pero no hay razon para añadir posibles puntos de fallo si no se requieren.
ALTER TABLE `libro_alugado` ADD FOREIGN KEY (`ISBN`) REFERENCES `libro_aluguer` (`ISBN`);
ALTER TABLE `libro_devolto` ADD FOREIGN KEY (`ISBN`) REFERENCES `libro_aluguer` (`ISBN`);
ALTER TABLE `libro_alugado` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
ALTER TABLE `libro_devolto` ADD FOREIGN KEY (`id_aluguer`) REFERENCES `libro_alugado` (`id_aluguer`);
ALTER TABLE `libro_devolto` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);
ALTER TABLE `libro_venda` ADD FOREIGN KEY (`ISBN`) REFERENCES `libro_aluguer` (`ISBN`);
ALTER TABLE `libro_venda` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);

Lo siguiente son valores de ejemplo para nuestra base de datos. 
*/
REPLACE INTO `usuario` VALUES (1,'ivanviso123@gmail.com','$2y$10$Rz0wzGPuwDx1ns79wv7aaeK4Vfnl7FkR3I/z1btnQQRu66rlLqom6','ivan','Calle Montesainas 37',666666666,'77970072A',NULL,'2021-02-26 16:28:13'),(2,'admin','$2y$10$SFw.xbzfG.2cG07b2Wo3venRtnGqf62dX/VJDHxlAQlqH26SrBBQG',NULL,NULL,NULL,NULL,1,NULL);
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7432056412715,'20000 Leagues Under the Sea','fiction novel Verne, Jules',NULL,3,15,5,'img/libros/placeholder/170.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1740801504275,'Age of Discontuinity, The','nonfiction economics Drucker, Peter','Random House',76,17,2,'img/libros/placeholder/100.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3875186732186,'Age of Wrath, The','nonfiction history Eraly, Abraham','Penguin',98,23,4,'img/libros/placeholder/16.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6945785084725,'Age of the Warrior, The','nonfiction history Fisk, Robert',NULL,24,13,2,'img/libros/placeholder/139.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1369115192332,'Aghal Paghal','nonfiction misc Deshpande, P L','Mauj',83,29,1,'img/libros/placeholder/80.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8114237469611,'Ahe Manohar Tari','nonfiction autobiography Deshpande, Sunita','Mauj',86,27,5,'img/libros/placeholder/75.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9528915606393,'All the President''s Men','nonfiction history Woodward, Bob','Random House',73,19,4,'img/libros/placeholder/72.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5662691570341,'Amulet of Samarkand, The','fiction novel Stroud, Jonathan','Random House',25,22,3,'img/libros/placeholder/65.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3574241330267,'Analysis, Vol I','tech mathematics Tao, Terence','HBA',62,30,3,'img/libros/placeholder/23.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1943145591029,'Angels & Demons','fiction novel Brown, Dan',NULL,67,30,3,'img/libros/placeholder/197.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5617812122152,'Angels & Demons','fiction novel Brown, Dan','Random House',27,26,1,'img/libros/placeholder/67.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2575065035897,'Animal Farm','fiction classic Orwell, George',NULL,88,28,4,'img/libros/placeholder/210.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3548585387965,'Apulki','nonfiction misc Deshpande, P L',NULL,30,26,4,'img/libros/placeholder/124.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1654992664182,'Argumentative Indian, The','nonfiction history Sen, Amartya','Picador',31,11,4,'img/libros/placeholder/68.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2423730542137,'Arthashastra, The','philosophy philosophy Kautiyla',NULL,84,18,2,'img/libros/placeholder/187.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2942099834889,'Artist and the Mathematician, The','science mathematics Aczel, Amir','HighStakes',75,27,4,'img/libros/placeholder/113.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1023594759793,'Asami Asami','fiction novel Deshpande, P L','Mauj',58,22,4,'img/libros/placeholder/48.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9689514911451,'Ashenden of The British Agent','fiction classic Maugham, William S','Vintage',3,30,3,'img/libros/placeholder/109.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1625310816090,'Attorney, The','fiction novel',NULL,17,13,2,'img/libros/placeholder/199.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8958126721481,'Ayn Rand Answers','philosophy objectivism Rand, Ayn',NULL,32,25,1,'img/libros/placeholder/179.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2043931685520,'Batatyachi Chal','fiction novel Deshpande P L',NULL,67,18,4,'img/libros/placeholder/171.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3615002300471,'Batman Earth One','fiction comic',NULL,11,15,1,'img/libros/placeholder/143.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1239205070144,'Batman Handbook','fiction comic',NULL,81,23,4,'img/libros/placeholder/206.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3362322707851,'Batman: The Long Halloween','fiction comic',NULL,21,27,5,'img/libros/placeholder/152.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8038113397666,'Beautiful and the Damned, The','nonfiction history Deb, Siddhartha','Penguin',90,11,2,'img/libros/placeholder/28.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2919111419451,'Beyond Degrees','philosophy education','HarperCollins',32,27,1,'img/libros/placeholder/82.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9069536212626,'Beyond the Three Seas','nonfiction history Dalrymple, William','Random House',76,14,2,'img/libros/placeholder/104.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6591322910984,'Birth of a Theorem','science mathematics Villani, Cedric','Bodley Head',79,27,2,'img/libros/placeholder/14.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1111991461335,'Bookless in Baghdad','nonfiction history Tharoor, Shashi','Penguin',80,29,3,'img/libros/placeholder/93.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4267048287627,'Brethren, The','fiction novel Grisham, John','Random House',67,24,5,'img/libros/placeholder/52.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7254519094200,'Broca''s Brain','science physics Sagan, Carl',NULL,94,24,2,'img/libros/placeholder/183.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1034991918273,'Burning Bright','fiction classic Steinbeck, John','Penguin',74,27,3,'img/libros/placeholder/99.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3933038705893,'Case of the Lame Canary, The','fiction novel Gardner, Earle Stanley',NULL,31,22,3,'img/libros/placeholder/94.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2088931067449,'Catch 22','fiction classic Heller, Joseph','Random House',34,29,2,'img/libros/placeholder/54.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2744192078734,'Cathedral and the Bazaar, The','tech computer_science Raymond, Eric',NULL,7,22,3,'img/libros/placeholder/175.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3320685930643,'Char Shabda','nonfiction misc Deshpande, P L',NULL,40,28,3,'img/libros/placeholder/128.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4323287838104,'Christmas Carol, A','fiction classic Dickens, Charles',NULL,96,11,1,'img/libros/placeholder/212.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3349878292838,'City of Djinns','nonfiction history Dalrymple, William',NULL,54,29,1,'img/libros/placeholder/193.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1069785119337,'City of Joy, The','fiction novel Lapierre, Dominique','vikas',26,16,3,'img/libros/placeholder/88.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1866627483091,'Clash of Civilizations and Remaking of the World Order','nonfiction history Huntington, Samuel','Simon&Schuster',14,23,1,'img/libros/placeholder/117.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5884962751335,'Code Book, The','science mathematics Singh, Simon',NULL,57,22,5,'img/libros/placeholder/138.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1561735584710,'Complete Mastermind, The','nonfiction trivia BBC','BBC',25,28,1,'img/libros/placeholder/55.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6891821802591,'Complete Sherlock Holmes, The - Vol I','fiction classic Doyle, Arthur Conan','Random House',77,21,3,'img/libros/placeholder/30.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2315993068735,'Complete Sherlock Holmes, The - Vol II','fiction classic Doyle, Arthur Conan','Random House',5,30,4,'img/libros/placeholder/31.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6015425074083,'Computer Vision, A Modern Approach','tech signal_processing Forsyth, David','Pearson',88,13,5,'img/libros/placeholder/62.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5778084293592,'Courtroom Genius, The','nonfiction autobiography Sorabjee',NULL,82,27,2,'img/libros/placeholder/190.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9447560737958,'Crime and Punishment','fiction classic Dostoevsky, Fyodor','Penguin',1,19,2,'img/libros/placeholder/66.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1797871376490,'Crisis on Infinite Earths','fiction comic',NULL,51,26,5,'img/libros/placeholder/144.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6672478919217,'Data Analysis with Open Source Tools','tech data_science Janert, Phillip',NULL,60,20,3,'img/libros/placeholder/182.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8135603247628,'Data Mining Handbook','tech data_science Nisbet, Robert','Apress',53,21,2,'img/libros/placeholder/19.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2915775268370,'Data Scientists at Work','tech data_science Sebastian Gutierrez','Apress',11,24,4,'img/libros/placeholder/12.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4537819252747,'Data Smart','tech data_science Foreman, John','Wiley',8,23,1,'img/libros/placeholder/3.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4191866018589,'Data Structures Using C & C++','tech computer_science Tanenbaum, Andrew','Prentice Hall',58,24,2,'img/libros/placeholder/61.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6084520509235,'Death of Superman, The','fiction comic',NULL,30,29,4,'img/libros/placeholder/150.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4978410508265,'Deceiver, The','fiction novel Forsyth, Frederick',NULL,37,22,5,'img/libros/placeholder/126.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7866895584939,'Design with OpAmps','tech computer_science Franco, Sergio',NULL,53,23,4,'img/libros/placeholder/176.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4356352380814,'Devil''s Advocate, The','fiction novel West, Morris',NULL,54,28,4,'img/libros/placeholder/178.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8945961148478,'Discovery of India, The','nonfiction history Nehru, Jawaharlal',NULL,52,17,3,'img/libros/placeholder/123.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6947066609349,'Doctor in the Nude','fiction novel Gordon, Richard','Penguin',43,26,3,'img/libros/placeholder/101.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2453862617006,'Doctor on the Brain','fiction novel Gordon, Richard',NULL,17,12,1,'img/libros/placeholder/134.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9205240381314,'Dongri to Dubai','nonfiction history Zaidi, Hussain',NULL,12,24,4,'img/libros/placeholder/191.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2565871568480,'Down and Out in Paris & London','nonfiction autobiography Orwell, George','Penguin',67,23,3,'img/libros/placeholder/102.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7724783402885,'Drunkard''s Walk, The','science mathematics Mlodinow, Leonard','Penguin',84,21,4,'img/libros/placeholder/9.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5586352897485,'Dylan on Dylan','nonfiction autobiography Dylan, Bob','Random House',40,18,1,'img/libros/placeholder/56.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5385923978331,'Econometric Analysis','tech economics Greene, W. H.','Pearson',87,11,5,'img/libros/placeholder/59.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4109212352198,'Electric Universe','science physics Bodanis, David','Penguin',42,20,3,'img/libros/placeholder/97.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9811739582092,'Elements of Information Theory','tech signal_processing Thomas, Joy',NULL,17,27,1,'img/libros/placeholder/156.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2087548319582,'Empire of the Mughal - Brothers at War','nonfiction history Rutherford, Alex',NULL,69,18,2,'img/libros/placeholder/164.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1350397371966,'Empire of the Mughal - Raiders from the North','nonfiction history Rutherford, Alex',NULL,58,20,2,'img/libros/placeholder/167.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9901053319736,'Empire of the Mughal - Ruler of the World','nonfiction history Rutherford, Alex',NULL,81,11,4,'img/libros/placeholder/165.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2153267209295,'Empire of the Mughal - The Serpent''s Tooth','nonfiction history Rutherford, Alex',NULL,50,13,4,'img/libros/placeholder/166.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5685709443700,'Empire of the Mughal - The Tainted Throne','nonfiction history Rutherford, Alex',NULL,81,23,1,'img/libros/placeholder/163.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3118446721690,'Eyeless in Gaza','fiction novel Huxley, Aldous',NULL,58,24,3,'img/libros/placeholder/201.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5002870352814,'False Impressions','fiction novel Archer, Jeffery','Pan',77,26,1,'img/libros/placeholder/39.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4147807242535,'Farewell to Arms, A','fiction classic Hemingway, Ernest','Rupa',49,24,3,'img/libros/placeholder/37.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5397628639527,'Final Crisis','fiction comic',NULL,74,19,4,'img/libros/placeholder/140.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2243699155654,'Flashpoint','fiction comic',NULL,17,13,2,'img/libros/placeholder/142.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5571919122348,'Freakonomics','science economics Dubner, Stephen','Penguin',9,16,2,'img/libros/placeholder/45.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5850805882923,'Free Will','nonfiction psychology Harris, Sam','FreePress',52,22,1,'img/libros/placeholder/92.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4015462583303,'Freedom at Midnight','nonfiction history Lapierre, Dominique','vikas',56,23,3,'img/libros/placeholder/89.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4949092550744,'From Beirut to Jerusalem','nonfiction history Friedman, Thomas',NULL,77,19,3,'img/libros/placeholder/137.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6938291890836,'Fundamentals of Wavelets','tech signal_processing Goswami, Jaideva','Wiley',67,18,5,'img/libros/placeholder/2.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2552283146164,'Girl who kicked the Hornet''s Nest','fiction novel Larsson, Steig',NULL,30,25,2,'img/libros/placeholder/204.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6192499547622,'Girl who played with Fire','fiction novel Larsson, Steig',NULL,5,22,1,'img/libros/placeholder/205.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1683846950999,'Girl with the Dragon Tattoo','fiction novel Larsson, Steig',NULL,65,30,4,'img/libros/placeholder/203.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2858762994808,'God Created the Integers','tech mathematics Hawking, Stephen','Penguin',82,29,4,'img/libros/placeholder/4.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5186665907602,'Grapes of Wrath, The','fiction classic Steinbeck, John',NULL,69,16,5,'img/libros/placeholder/160.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5350875762755,'Great Indian Novel, The','fiction novel Tharoor, Shashi','Penguin',73,19,4,'img/libros/placeholder/86.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7661866257180,'Great War for Civilization, The','nonfiction history Fisk, Robert','HarperCollins',48,23,1,'img/libros/placeholder/111.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5926383611368,'Gun Gayin Awadi','nonfiction misc Deshpande, P L','Mauj',17,21,3,'img/libros/placeholder/79.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1699007644151,'Hafasavnuk','fiction novel Deshpande P L',NULL,20,29,4,'img/libros/placeholder/172.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1474185388683,'Half A Life','fiction novel Naipaul, V S',NULL,13,24,3,'img/libros/placeholder/122.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3596179040433,'Hidden Connections, The','science physics Capra, Fritjof','HarperCollins',68,12,5,'img/libros/placeholder/46.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4613424848112,'History of England, Foundation','nonfiction history Ackroyd, Peter',NULL,59,13,4,'img/libros/placeholder/192.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9493240650085,'History of Western Philosophy','philosophy philosophy Russell, Bertrand','Routledge',37,19,3,'img/libros/placeholder/114.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2395280448147,'History of the DC Universe','fiction comic',NULL,19,11,2,'img/libros/placeholder/151.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9819884454230,'How to Think Like Sherlock Holmes','nonfiction psychology Konnikova, Maria','Penguin',42,23,3,'img/libros/placeholder/11.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4810609029003,'Hunchback of Notre Dame, The','fiction classic Hugo, Victor','Random House',90,14,3,'img/libros/placeholder/98.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8416150516033,'Idea of Justice, The','philosophy economics Sen, Amartya','Penguin',80,11,3,'img/libros/placeholder/70.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1260917554290,'Identity & Violence','philosophy philosophy Sen, Amartya','Penguin',89,14,5,'img/libros/placeholder/103.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2290074510192,'Idiot, The','fiction classic Dostoevsky, Fyodor',NULL,72,22,3,'img/libros/placeholder/211.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4249083281921,'Image Processing & Mathematical Morphology','tech signal_processing Shih, Frank','CRC',18,26,2,'img/libros/placeholder/10.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2891088405736,'Image Processing with MATLAB','tech signal_processing Eddins, Steve',NULL,86,17,4,'img/libros/placeholder/209.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7592111127798,'In a Free State','fiction novel Naipaul, V. S.','Rupa',83,16,3,'img/libros/placeholder/53.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5595878788240,'India from Midnight to Milennium','nonfiction history Tharoor, Shashi','Penguin',83,18,1,'img/libros/placeholder/84.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3953899985951,'India''s Legal System','nonfiction legal Nariman',NULL,64,10,3,'img/libros/placeholder/194.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7426505374502,'Information, The','science mathematics Gleick, James',NULL,16,28,3,'img/libros/placeholder/154.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7101354579569,'Integration of the Indian States','nonfiction history Menon, V P','Orient Blackswan',18,22,1,'img/libros/placeholder/8.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7894911694245,'Introduction to Algorithms','tech computer_science Cormen, Thomas','MIT Press',65,17,1,'img/libros/placeholder/27.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5368892008588,'Jim Corbett Omnibus','nonfiction history Corbett, Jim',NULL,70,20,4,'img/libros/placeholder/169.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3323727249684,'Journal of Economics, vol 106 No 3','science economics',NULL,97,20,1,'img/libros/placeholder/155.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4768866588297,'Journal of a Novel','fiction classic Steinbeck, John','Penguin',78,11,2,'img/libros/placeholder/49.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6363926958752,'Judge, The','fiction novel',NULL,26,22,5,'img/libros/placeholder/198.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9061370051761,'Jurassic Park','fiction novel Crichton, Michael','Random House',66,29,2,'img/libros/placeholder/42.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3260312471475,'Justice League: The Villain''s Journey','fiction comic',NULL,80,14,4,'img/libros/placeholder/149.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4905204591773,'Justice League: Throne of Atlantis','fiction comic',NULL,28,25,4,'img/libros/placeholder/148.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4249437943217,'Justice, Judiciary and Democracy','nonfiction legal Ranjan, Sudhanshu',NULL,81,26,5,'img/libros/placeholder/186.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2369276794405,'Karl Marx Biography','nonfiction autobiography',NULL,51,20,3,'img/libros/placeholder/120.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3286453639800,'Killing Joke, The','fiction comic',NULL,92,26,1,'img/libros/placeholder/141.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1248132824403,'Last Lecture, The','nonfiction autobiography Pausch, Randy','Hyperion',99,16,4,'img/libros/placeholder/40.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4181000184825,'Last Mughal, The','nonfiction history Dalrymple, William','Penguin',61,15,5,'img/libros/placeholder/76.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2778544735910,'Learning OpenCV','tech signal_processing Bradsky, Gary','O''Reilly',19,11,3,'img/libros/placeholder/60.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3503195788082,'Let Us C','tech computer_science Kanetkar, Yashwant','Prentice Hall',92,10,1,'img/libros/placeholder/64.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3470995029859,'Life in Letters, A','nonfiction autobiography Steinbeck, John',NULL,67,24,3,'img/libros/placeholder/153.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3636261366871,'Machine Learning for Hackers','tech data_science Conway, Drew','O''Reilly',100,21,2,'img/libros/placeholder/24.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5032026702359,'Making Software','tech computer_science Oram, Andy','O''Reilly',75,23,4,'img/libros/placeholder/22.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3545466085695,'Manasa','nonfiction misc Kale, V P','Mauj',92,17,3,'img/libros/placeholder/83.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7107707818709,'Maqta-e-Ghalib','nonfiction poetry Garg, Sanjay','Mauj',64,20,4,'img/libros/placeholder/81.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3120130167298,'Maugham''s Collected Short Stories, Vol 3','fiction classic Maugham, William S','Vintage',55,18,1,'img/libros/placeholder/107.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5041247003919,'Mein Kampf','nonfiction autobiography Hitler, Adolf','Rupa',26,30,3,'img/libros/placeholder/34.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8604201980426,'Men of Mathematics','science mathematics Bell, E T',NULL,43,11,3,'img/libros/placeholder/184.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9862979936969,'Moon and Sixpence, The','fiction classic Maugham, William S',NULL,55,18,1,'img/libros/placeholder/130.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3045299790517,'Moon is Down, The','fiction classic Steinbeck, John','Penguin',51,18,4,'img/libros/placeholder/51.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6028695287275,'More Tears to Cry','fiction novel Sassoon, Jean',NULL,15,25,1,'img/libros/placeholder/195.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8751744622974,'Mossad','nonfiction history Baz-Zohar, Michael',NULL,74,17,1,'img/libros/placeholder/168.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6949017668685,'Murphy''s Law','philosophy psychology',NULL,2,25,2,'img/libros/placeholder/207.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6746933286265,'Nature of Statistical Learning Theory, The','tech data_science Vapnik, Vladimir','Springer',76,26,3,'img/libros/placeholder/7.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1353066528605,'Neural Networks','tech data_science Haykin, Simon',NULL,83,11,2,'img/libros/placeholder/159.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6582905613279,'New Machiavelli, The','fiction novel Wells, H. G.','Penguin',95,12,5,'img/libros/placeholder/20.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5053181148182,'New Markets & Other Essays','science economics Drucker, Peter','Penguin',42,23,2,'img/libros/placeholder/96.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1117397989678,'Numbers Behind Numb3rs, The','science mathematics Devlin, Keith',NULL,62,27,4,'img/libros/placeholder/145.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9431814747358,'O Jerusalem!','nonfiction history Lapierre, Dominique','vikas',48,15,5,'img/libros/placeholder/87.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1888046948051,'On Education','philosophy education Russell, Bertrand','Routledge',15,23,1,'img/libros/placeholder/91.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8001553867953,'Once There Was a War','nonfiction history Steinbeck, John','Penguin',25,10,5,'img/libros/placeholder/50.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9006828935623,'One','nonfiction autobiography Bach, Richard','Dell',76,17,4,'img/libros/placeholder/119.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9143133770120,'Orientalism','nonfiction history Said, Edward','Penguin',63,10,5,'img/libros/placeholder/6.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5152220967324,'Outsider, The','fiction classic Camus, Albert','Penguin',92,22,5,'img/libros/placeholder/29.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9524141779652,'Oxford book of Modern Science Writing','science science Dawkins, Richard',NULL,21,29,2,'img/libros/placeholder/185.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6767850681466,'Pattern Classification','tech data_science Duda, Hart',NULL,57,19,1,'img/libros/placeholder/136.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3306054964682,'Phantom of Manhattan, The','fiction classic Forsyth, Frederick',NULL,36,21,1,'img/libros/placeholder/108.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1937921835179,'Philosophy: Who Needs It','philosophy objectivism Rand, Ayn',NULL,54,28,3,'img/libros/placeholder/180.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9689376330915,'Physics & Philosophy','philosophy science Heisenberg, Werner','Penguin',24,19,1,'img/libros/placeholder/21.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6472851154797,'Pillars of the Earth, The','fiction novel Follett, Ken','Random House',43,13,2,'img/libros/placeholder/33.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5432166440016,'Pointers in C','tech computer_science Kanetkar, Yashwant',NULL,74,10,3,'img/libros/placeholder/174.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6091611843606,'Political Philosophers','philosophy politics',NULL,75,28,4,'img/libros/placeholder/131.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7269944489819,'Power Electronics - Mohan','tech computer_science Mohan, Ned',NULL,63,17,2,'img/libros/placeholder/158.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5223792996472,'Power Electronics - Rashid','tech computer_science Rashid, Muhammad',NULL,71,26,2,'img/libros/placeholder/157.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1087142218632,'Prince, The','fiction classic Machiavelli',NULL,82,16,1,'img/libros/placeholder/200.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8796652016637,'Principles of Communication Systems','tech signal_processing Taub, Schilling','TMH',51,15,4,'img/libros/placeholder/63.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2347352108132,'Prisoner of Birth, A','fiction novel Archer, Jeffery','Pan',100,16,2,'img/libros/placeholder/73.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1958887683049,'Python for Data Analysis','tech data_science McKinney, Wes','O''Reilly',70,28,3,'img/libros/placeholder/26.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2077532561627,'Radiowaril Bhashane & Shrutika','nonfiction misc Deshpande, P L','Mauj',56,25,2,'img/libros/placeholder/78.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9503478324964,'Raisin in the Sun, A','fiction novel Hansberry, Lorraine','Penguin',10,14,3,'img/libros/placeholder/71.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4647131216000,'Rationality & Freedom','science economics Sen, Amartya','Springer',6,19,2,'img/libros/placeholder/116.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4626210506382,'Return of the Primitive','philosophy objectivism Rand, Ayn','Penguin',50,29,1,'img/libros/placeholder/41.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (5465821853577,'Ropemaker, The','fiction novel Dickinson, Peter',NULL,75,26,1,'img/libros/placeholder/196.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3763075127394,'Rosy is My Relative','fiction novel Durrell, Gerald',NULL,87,21,1,'img/libros/placeholder/129.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7247979058354,'Russian Journal, A','nonfiction history Steinbeck, John','Penguin',9,30,5,'img/libros/placeholder/43.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6902658019394,'Scoop!','nonfiction history Nayar, Kuldip','HarperCollins',21,13,5,'img/libros/placeholder/74.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9398648385040,'Sea of Poppies','fiction novel Ghosh, Amitav','Penguin',13,22,5,'img/libros/placeholder/69.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3919914022301,'Selected Short Stories','fiction classic','Jaico',7,13,1,'img/libros/placeholder/115.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4555522850915,'Short History of the World, A','nonfiction history Wells, H G',NULL,98,23,4,'img/libros/placeholder/132.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9437190863590,'Signal and the Noise, The','tech data_science Silver, Nate','Penguin',73,14,2,'img/libros/placeholder/25.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3910902619723,'Simpsons & Their Mathematical Secrets','science mathematics Singh, Simon',NULL,23,20,4,'img/libros/placeholder/135.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8599222714308,'Slaughterhouse Five','fiction classic Vonnegut, Kurt','Random House',31,15,2,'img/libros/placeholder/13.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8121640210267,'Social Choice & Welfare, Vol 39 No. 1','tech economics Various','Springer',10,11,1,'img/libros/placeholder/77.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7333561839393,'Soft Computing & Intelligent Systems','tech data_science Gupta, Madan','Elsevier',88,13,1,'img/libros/placeholder/57.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9684915313843,'Statistical Decision Theory''','tech data_science Pratt, John','MIT Press',33,22,4,'img/libros/placeholder/18.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3140106582950,'Statistical Learning Theory','tech data_science Vapnik, Vladimir',NULL,80,30,3,'img/libros/placeholder/162.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1191139136174,'Story of Philosophy, The','philosophy history Durant, Will','Pocket',39,28,5,'img/libros/placeholder/47.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2029508802519,'Structure & Interpretation of Computer Programs','tech computer_science Sussman, Gerald','MIT Press',12,24,3,'img/libros/placeholder/15.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2895624814775,'Structure and Randomness','science mathematics Tao, Terence',NULL,24,22,4,'img/libros/placeholder/208.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2503739983112,'Superfreakonomics','science economics Dubner, Stephen','HarperCollins',36,11,3,'img/libros/placeholder/5.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6814373366377,'Superman Earth One - 1','fiction comic',NULL,1,11,3,'img/libros/placeholder/146.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1137411501330,'Superman Earth One - 2','fiction comic',NULL,88,29,4,'img/libros/placeholder/147.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7148499790885,'Surely You''re Joking Mr Feynman','science physics Feynman, Richard','Random House',7,23,1,'img/libros/placeholder/36.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6142571259170,'Tales of Beedle the Bard','fiction novel Rowling, J K',NULL,60,23,4,'img/libros/placeholder/202.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8763723996401,'Tales of Mystery and Imagination','fiction classic Poe, Edgar Allen','HarperCollins',19,10,1,'img/libros/placeholder/44.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (8649770498193,'Talking Straight','nonfiction autobiography Iacoca, Lee',NULL,57,29,2,'img/libros/placeholder/106.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9523963362033,'Tao of Physics, The','science physics Capra, Fritjof','Penguin',15,17,5,'img/libros/placeholder/35.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7264648759623,'Textbook of Economic Theory','tech economics Stonier, Alfred','Pearson',84,29,4,'img/libros/placeholder/58.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1007197463500,'Theory of Everything, The','science physics Hawking, Stephen','Jaico',22,10,4,'img/libros/placeholder/95.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9852084252811,'Think Complexity','tech data_science Downey, Allen',NULL,72,26,3,'img/libros/placeholder/177.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6397066022849,'To Sir With Love','fiction classic Braithwaite','Penguin',65,10,2,'img/libros/placeholder/121.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2937192282960,'Trembling of a Leaf, The','fiction novel Maugham, William S',NULL,29,26,5,'img/libros/placeholder/133.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4550027721615,'Trial, The','fiction classic Kafka, Frank','Random House',21,23,4,'img/libros/placeholder/17.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2710113551083,'Uncommon Wisdom','nonfiction anthology Capra, Fritjof','Fontana',52,18,1,'img/libros/placeholder/118.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6060857577940,'Unpopular Essays','philosophy philosophy Russell, Bertrand',NULL,38,22,2,'img/libros/placeholder/125.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4740219815642,'Urlasurla','fiction novel Deshpande P L',NULL,59,25,4,'img/libros/placeholder/173.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (1353999448243,'Veil: Secret Wars of the CIA','nonfiction history Woodward, Bob',NULL,92,26,4,'img/libros/placeholder/127.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (3678370265054,'Veteran, The','fiction novel Forsyth, Frederick','Transworld',84,29,4,'img/libros/placeholder/38.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6840158393195,'Vyakti ani Valli','nonfiction misc Deshpande, P L',NULL,30,10,3,'img/libros/placeholder/161.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7584133472629,'We the Living','fiction novel Rand, Ayn','Penguin',13,13,4,'img/libros/placeholder/112.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (7695263417044,'We the Nation','philosophy philosophy Palkhivala',NULL,15,28,5,'img/libros/placeholder/189.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (6715549687756,'We the People','philosophy philosophy Palkhivala',NULL,89,23,4,'img/libros/placeholder/188.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (9975614424893,'Wealth of Nations, The','science economics Smith, Adam','Random House',68,15,4,'img/libros/placeholder/32.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4606198904891,'Winter of Our Discontent, The','fiction classic Steinbeck, John','Penguin',9,26,2,'img/libros/placeholder/90.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (2673058413670,'World''s Great Thinkers, The','science physics',NULL,10,21,4,'img/libros/placeholder/181.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4703464284452,'World''s Greatest Short Stories, The','fiction classic','Jaico',29,18,4,'img/libros/placeholder/105.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4774938060558,'World''s Greatest Trials, The','nonfiction history',NULL,30,16,2,'img/libros/placeholder/85.jpg');
REPLACE INTO libro_aluguer(ISBN,Titulo,Descripcion,Editorial,Cantidade,Prezo,Prezo_aluguer,Foto) VALUES (4861446661905,'Zen & The Art of Motorcycle Maintenance','philosophy autobiography Pirsig, Robert','Vintage',70,22,4,'img/libros/placeholder/110.jpg');

