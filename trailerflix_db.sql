
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `trailerflix_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `trailerflix_db`;
SET FOREIGN_KEY_CHECKS = 0;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `actores_fk2` (`pais_id`),
  CONSTRAINT `actores_fk2` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `actores` VALUES (1,'Claire Foy',1),(2,'Olivia Colman',1),(3,'Imelda Staunton',1),(4,'Matt Smith',1),(5,'Tobias Menzies',1),(6,'Vanessa Kirby',1),(7,'KJ Apa',2),(8,'Lili Reinhart',3),(9,'Camila Mendes',3),(10,'Cole Sprouse',3),(11,'Madelaine Petsch',3),(12,'Pedro Pascal',4),(13,'Gina Carano',3),(14,'Giancarlo Esposito',3),(15,'Carl Weathers',3),(16,'Katee Sackhoff',3),(17,'Elliot Page',5),(18,'Tom Hopper',1),(19,'David Castañeda',14),(20,'Emmy Raver-Lampman',3),(21,'Robert Sheehan',6),(22,'Aidan Gallagher',3),(23,'Anya Taylor-Joy',9),(24,'Thomas Brodie-Sangster',1),(25,'Harry Melling',1),(26,'Moses Ingram',3),(27,'Bill Camp',3),(28,'Millie Bobby Brown',1),(29,'Henry Cavill',1),(30,'Sam Claflin',1),(31,'Helena Bonham Carter',1),(32,'Joaquin Phoenix',3),(33,'Robert De Niro',3),(34,'Zazie Beetz',3),(35,'Frances Conroy',3),(36,'Robert Downey Jr.',3),(37,'Chris Evans',3),(38,'Mark Ruffalo',3),(39,'Chris Hemsworth',7),(40,'Scarlett Johansson',3),(41,'Jeremy Renner',3),(42,'Florence Pugh',1),(43,'David Harbour',3),(44,'Rachel Weisz',1),(45,'O-T Fagbenle',1),(46,'Jessica Chastain',3),(47,'John Malkovich',3),(48,'Colin Farrell',6),(49,'Common',3),(50,'Geena Davis',3),(51,'Ryan Phillippe',3),(52,'Tim Robbins',3),(53,'Rachael Leigh Cook',3),(54,'Claire Forlani',1),(55,'Ben Affleck',3),(56,'Gal Gadot',11),(57,'Jason Momoa',3),(58,'Ezra Miller',3),(59,'Ray Fisher',3),(60,'Winona Ryder',3),(61,'Finn Wolfhard',5),(62,'Gaten Matarazzo',3),(63,'Caleb McLaughlin',3),(64,'Noah Schnapp',3),(65,'Úrsula Corberó',8),(66,'Álvaro Morte',8),(67,'Itziar Ituño',8),(68,'Pedro Alonso',8),(69,'Miguel Herrán',8),(70,'Ricardo Darín',9),(71,'Carla Peterson',9),(72,'César Troncoso',10),(73,'Andrea Pietra',9),(74,'Ariel Staltari',9),(75,'Leonardo Sbaraglia',9),(76,'Érica Rivas',9),(77,'Darío Grandinetti',9),(78,'Rita Cortese',9),(79,'Oscar Martínez',9),(80,'Soledad Villamil',9),(81,'Guillermo Francella',9),(82,'Pablo Rago',9),(83,'Javier Godino',9),(84,'Peter Lanzani',9),(85,'Alejandra Flechner',9),(86,'Norman Briski',9),(87,'Bryan Cranston',3),(88,'Aaron Paul',3),(89,'Anna Gunn',3),(90,'Dean Norris',3),(91,'Bob Odenkirk',3),(92,'Jenna Ortega',3),(93,'Catherine Zeta-Jones',1),(94,'Luis Guzmán',14),(95,'Emma Myers',3),(96,'Gwendoline Christie',1),(97,'Bella Ramsey',1),(98,'Gabriel Luna',3),(99,'Anna Torv',7),(100,'Nick Offerman',3),(101,'Timothée Chalamet',3),(102,'Rebecca Ferguson',12),(103,'Oscar Isaac',3),(104,'Zendaya',3),(105,'Josh Brolin',3),(106,'Cillian Murphy',6),(107,'Emily Blunt',1),(108,'Matt Damon',3),(109,'Anthony Gonzalez',3),(110,'Gael García Bernal',14),(111,'Benjamin Bratt',3),(112,'Alanna Ubach',3),(113,'Tom Hanks',3),(114,'Tim Allen',3),(115,'Don Rickles',3),(116,'Jim Varney',3),(117,'Jennifer Aniston',3),(118,'Courteney Cox',3),(119,'Lisa Kudrow',3),(120,'Matt LeBlanc',3),(121,'Matthew Perry',3),(122,'David Schwimmer',3),(123,'Steve Carell',3),(124,'Rainn Wilson',3),(125,'John Krasinski',3),(126,'Jenna Fischer',3),(127,'Ed Helms',3),(128,'Matthew McConaughey',3),(129,'Anne Hathaway',3),(130,'Michael Caine',1),(131,'Margot Robbie',7),(132,'Ryan Gosling',5),(133,'America Ferrera',3),(134,'Kate McKinnon',3),(135,'Louis Hofmann',15),(136,'Lisa Vicari',15),(137,'Oliver Masucci',15),(138,'Jördis Triebel',15),(139,'Maja Schöne',15);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `categorias` VALUES (2,'Película'),(1,'Serie');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido_actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido_id` int NOT NULL,
  `actor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `contenido_actor_fk1` (`contenido_id`),
  KEY `contenido_actor_fk2` (`actor_id`),
  CONSTRAINT `contenido_actor_fk1` FOREIGN KEY (`contenido_id`) REFERENCES `contenidos` (`id`),
  CONSTRAINT `contenido_actor_fk2` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `contenido_actor` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,4,17),(18,4,18),(19,4,19),(20,4,20),(21,4,21),(22,4,22),(23,5,23),(24,5,24),(25,5,25),(26,5,26),(27,5,27),(28,6,28),(29,6,29),(30,6,30),(31,6,31),(32,7,32),(33,7,33),(34,7,34),(35,7,35),(36,8,36),(37,8,37),(38,8,38),(39,8,39),(40,8,40),(41,8,41),(42,9,40),(43,9,42),(44,9,43),(45,9,44),(46,9,45),(47,10,46),(48,10,47),(49,10,48),(50,10,49),(51,10,50),(52,11,51),(53,11,52),(54,11,53),(55,11,54),(56,12,55),(57,12,29),(58,12,56),(59,12,57),(60,12,58),(61,12,59),(62,13,28),(63,13,60),(64,13,43),(65,13,61),(66,13,62),(67,13,63),(68,13,64),(69,14,65),(70,14,66),(71,14,67),(72,14,68),(73,14,69),(74,15,70),(75,15,71),(76,15,72),(77,15,73),(78,15,74),(79,16,70),(80,16,75),(81,16,76),(82,16,77),(83,16,78),(84,16,79),(85,17,70),(86,17,80),(87,17,81),(88,17,82),(89,17,83),(90,18,70),(91,18,84),(92,18,85),(93,18,86),(94,19,87),(95,19,88),(96,19,89),(97,19,90),(98,19,91),(99,19,14),(100,20,92),(101,20,93),(102,20,94),(103,20,95),(104,20,96),(105,21,12),(106,21,97),(107,21,98),(108,21,99),(109,21,100),(110,22,101),(111,22,102),(112,22,103),(113,22,104),(114,22,57),(115,22,105),(116,23,106),(117,23,107),(118,23,108),(119,23,36),(120,23,42),(121,24,109),(122,24,110),(123,24,111),(124,24,112),(125,25,113),(126,25,114),(127,25,115),(128,25,116),(129,26,117),(130,26,118),(131,26,119),(132,26,120),(133,26,121),(134,26,122),(135,27,123),(136,27,124),(137,27,125),(138,27,126),(139,27,127),(140,28,128),(141,28,129),(142,28,46),(143,28,130),(144,28,108),(145,29,131),(146,29,132),(147,29,133),(148,29,134),(149,30,135),(150,30,136),(151,30,137),(152,30,138),(153,30,139);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido_genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido_id` int NOT NULL,
  `genero_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `contenido_genero_fk1` (`contenido_id`),
  KEY `contenido_genero_fk2` (`genero_id`),
  CONSTRAINT `contenido_genero_fk1` FOREIGN KEY (`contenido_id`) REFERENCES `contenidos` (`id`),
  CONSTRAINT `contenido_genero_fk2` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `contenido_genero` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,2,4),(6,3,5),(7,3,6),(8,3,7),(9,4,5),(10,4,7),(11,4,8),(12,5,1),(13,6,6),(14,6,3),(15,6,8),(16,7,1),(17,7,4),(18,8,7),(19,8,6),(20,8,5),(21,9,7),(22,9,6),(23,10,7),(24,10,4),(25,11,4),(26,11,1),(27,12,7),(28,12,6),(29,12,10),(30,13,5),(31,13,9),(32,13,1),(33,14,4),(34,14,7),(35,14,1),(36,15,5),(37,15,1),(38,15,4),(39,16,8),(40,16,1),(41,16,4),(42,17,4),(43,17,1),(44,17,13),(45,18,1),(46,18,2),(47,19,1),(48,19,4),(49,20,8),(50,20,3),(51,20,10),(52,21,1),(53,21,5),(54,21,9),(55,22,5),(56,22,6),(57,23,1),(58,23,2),(59,24,11),(60,24,6),(61,24,12),(62,25,11),(63,25,8),(64,25,12),(65,26,8),(66,27,8),(67,28,5),(68,28,1),(69,28,6),(70,29,8),(71,29,10),(72,30,5),(73,30,3),(74,30,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `sinopsis` text NOT NULL,
  `temporadas` varchar(20) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `reproducciones` int DEFAULT '0',
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `contenidos_fk6` (`categoria_id`),
  CONSTRAINT `contenidos_fk6` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `contenidos` VALUES (1,'The Crown','Recorre el reinado de Isabel II desde su juventud, mostrando cómo la vida privada de la familia real choca con las obligaciones de la Corona y los grandes acontecimientos políticos del siglo XX.','6','https://www.youtube.com/results?search_query=The+Crown+trailer+oficial',999,1),(2,'Riverdale','Detrás de la fachada tranquila de un pueblo pequeño, un grupo de estudiantes investiga un crimen que deja al descubierto los secretos más oscuros de sus familias y vecinos.','7','https://www.youtube.com/results?search_query=Riverdale+trailer+oficial',669,1),(3,'The Mandalorian','Tras la caída del Imperio, un cazarrecompensas solitario recorre los confines de la galaxia y termina protegiendo a una misteriosa criatura que muchos quieren capturar.','3','https://www.youtube.com/results?search_query=The+Mandalorian+trailer+oficial',594,1),(4,'The Umbrella Academy','Un grupo de hermanos adoptivos con poderes extraordinarios se reencuentra tras la muerte de su padre y descubre que tiene pocos días para evitar el fin del mundo.','4','https://www.youtube.com/results?search_query=The+Umbrella+Academy+trailer+oficial',865,1),(5,'Gambito de Dama','Una huérfana con un talento excepcional para el ajedrez se abre camino en un mundo dominado por hombres mientras lucha contra sus propias adicciones.','1',NULL,638,1),(6,'Enola Holmes','La hermana menor de Sherlock Holmes decide buscar por su cuenta a su madre desaparecida y, en el camino, se ve envuelta en una conspiración que involucra a un joven lord.','N/A','https://www.youtube.com/results?search_query=Enola+Holmes+trailer+oficial',496,2),(7,'Guasón','Un comediante fracasado y marginado por la sociedad de Ciudad Gótica atraviesa una espiral de violencia que lo transforma en uno de los criminales más temidos.','N/A','https://www.youtube.com/results?search_query=Guason+Joker+trailer+oficial',467,2),(8,'Avengers: Endgame','Después de perder a la mitad del universo, los Vengadores sobrevivientes se reúnen para un último intento de revertir el daño y enfrentar nuevamente a Thanos.','N/A','https://www.youtube.com/results?search_query=Avengers+Endgame+trailer+oficial',749,2),(9,'Black Widow','Natasha Romanoff se enfrenta a su pasado cuando una peligrosa conspiración la obliga a reencontrarse con la familia que dejó atrás antes de convertirse en Vengadora.','N/A','https://www.youtube.com/results?search_query=Black+Widow+trailer+oficial',439,2),(10,'AVA','Una asesina a sueldo que trabaja para una organización secreta se convierte en blanco de sus propios jefes después de cuestionar una misión que sale mal.','N/A','https://www.youtube.com/results?search_query=AVA+2020+trailer+oficial',753,2),(11,'AntiTrust','Un joven programador talentoso consigue el trabajo de sus sueños en una gran empresa de software, pero pronto sospecha que su jefe esconde algo muy peligroso.','N/A',NULL,546,2),(12,'La Liga de la Justicia de Zack Snyder','Batman y la Mujer Maravilla reúnen a un equipo de héroes con habilidades únicas para defender la Tierra de una amenaza de proporciones catastróficas.','N/A','https://www.youtube.com/results?search_query=Liga+de+la+Justicia+de+Zack+Snyder+trailer+oficial',369,2),(13,'Stranger Things','En un pequeño pueblo de los años ochenta, la desaparición de un niño lleva a sus amigos a descubrir experimentos secretos, fuerzas sobrenaturales y a una misteriosa niña.','5','https://www.youtube.com/results?search_query=Stranger+Things+trailer+oficial',108,1),(14,'La Casa de Papel','Un enigmático profesor reúne a un grupo de delincuentes con alias de ciudades para ejecutar un atraco sin precedentes en la Fábrica Nacional de Moneda y Timbre de España.','5','https://www.youtube.com/results?search_query=La+Casa+de+Papel+trailer+oficial',237,1),(15,'El Eternauta','Una nevada tóxica cae sobre Buenos Aires y mata a casi toda la población. Un grupo de sobrevivientes debe organizarse para resistir a una invasión que recién comienza.','1','https://www.youtube.com/results?search_query=El+Eternauta+serie+trailer+oficial',760,1),(16,'Relatos Salvajes','Seis historias independientes muestran a personas comunes que, frente a una situación injusta o absurda, pierden el control y reaccionan de las formas más extremas.','N/A',NULL,286,2),(17,'El Secreto de sus Ojos','Un empleado judicial retirado decide escribir una novela sobre un crimen que investigó décadas atrás, y al hacerlo reabre heridas del caso y de un amor nunca confesado.','N/A','https://www.youtube.com/results?search_query=El+Secreto+de+sus+Ojos+trailer+oficial',852,2),(18,'Argentina, 1985','Un fiscal y su joven equipo se enfrentan a amenazas y presiones mientras preparan el histórico juicio a los responsables de la última dictadura militar argentina.','N/A',NULL,602,2),(19,'Breaking Bad','Un profesor de química con una enfermedad terminal se asocia con un exalumno para fabricar metanfetamina y asegurar el futuro económico de su familia.','5','https://www.youtube.com/results?search_query=Breaking+Bad+trailer+oficial',351,1),(20,'Merlina','Merlina Addams llega a una academia para jóvenes con habilidades especiales, donde intenta dominar sus poderes y resolver una serie de asesinatos que aterrorizan al pueblo.','2','https://www.youtube.com/results?search_query=Merlina+Wednesday+trailer+oficial',753,1),(21,'The Last of Us','Veinte años después de una pandemia que devastó a la humanidad, un contrabandista endurecido debe escoltar a una adolescente a través de un país en ruinas.','2','https://www.youtube.com/results?search_query=The+Last+of+Us+serie+trailer+oficial',809,1),(22,'Duna','El heredero de una familia noble viaja al planeta desértico más peligroso del universo, fuente del recurso más valioso de la galaxia, donde queda atrapado en una lucha por el poder.','N/A','https://www.youtube.com/results?search_query=Duna+2021+trailer+oficial',787,2),(23,'Oppenheimer','Retrata la vida del físico que dirigió el desarrollo de la primera bomba atómica y los dilemas morales y políticos que lo persiguieron después.','N/A','https://www.youtube.com/results?search_query=Oppenheimer+trailer+oficial',509,2),(24,'Coco','Un niño mexicano que sueña con ser músico viaja accidentalmente a la Tierra de los Muertos, donde busca a su tatarabuelo para descubrir la verdad sobre su familia.','N/A',NULL,983,2),(25,'Toy Story','Los juguetes de un niño cobran vida cuando nadie los ve, y la llegada de un moderno guardián espacial pone en jaque el liderazgo de un vaquero de trapo.','N/A',NULL,586,2),(26,'Friends','Seis amigos que viven en Nueva York comparten trabajos, romances, mudanzas y tardes interminables en su cafetería favorita.','10','https://www.youtube.com/results?search_query=Friends+serie+trailer',782,1),(27,'The Office','Un falso documental sigue el día a día de los empleados de una distribuidora de papel y de su jefe, tan bienintencionado como incómodo.','9',NULL,249,1),(28,'Interestelar','Con la Tierra al borde del colapso, un expiloto se une a una misión que atraviesa un agujero de gusano en busca de un nuevo hogar para la humanidad.','N/A','https://www.youtube.com/results?search_query=Interestelar+trailer+oficial',603,2),(29,'Barbie','Tras una crisis existencial, Barbie abandona su mundo perfecto y viaja junto a Ken al mundo real, donde descubre que las cosas no son como imaginaba.','N/A','https://www.youtube.com/results?search_query=Barbie+2023+trailer+oficial',366,2),(30,'Dark','La desaparición de dos niños en un pueblo alemán revela los vínculos ocultos entre cuatro familias y un misterio que se extiende a lo largo de varias generaciones.','3',NULL,824,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `generos` VALUES (7,'Acción'),(11,'Animación'),(6,'Aventura'),(5,'Ciencia Ficción'),(8,'Comedia'),(1,'Drama'),(12,'Familia'),(10,'Fantasía'),(2,'Hechos verídicos'),(3,'Misterio'),(13,'Romance'),(4,'Suspenso'),(9,'Terror');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `paises` VALUES (15,'Alemania'),(9,'Argentina'),(7,'Australia'),(5,'Canadá'),(4,'Chile'),(8,'España'),(3,'Estados Unidos'),(13,'Guatemala'),(6,'Irlanda'),(11,'Israel'),(14,'México'),(2,'Nueva Zelanda'),(1,'Reino Unido'),(12,'Suecia'),(10,'Uruguay');
SET FOREIGN_KEY_CHECKS = 1;
