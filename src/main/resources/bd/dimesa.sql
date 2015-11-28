/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.24-log : Database - sipgdn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`sipgdn` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sipgdn`;

/*Table structure for table `armas` */

DROP TABLE IF EXISTS `armas`;

CREATE TABLE `armas` (
  `IDARMA` int(11) NOT NULL AUTO_INCREMENT,
  `MATRICULA` char(8) NOT NULL,
  `MARCAA` varchar(25) NOT NULL,
  `CALIBRE` float NOT NULL,
  `NUMSERIE` int(11) NOT NULL,
  `MODELOA` varchar(30) NOT NULL,
  `TIPOA` varchar(25) NOT NULL,
  `LARGO` float NOT NULL,
  PRIMARY KEY (`IDARMA`),
  UNIQUE KEY `ARMAS_PK` (`IDARMA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `armas` */

LOCK TABLES `armas` WRITE;

UNLOCK TABLES;

/*Table structure for table `autenticas` */

DROP TABLE IF EXISTS `autenticas`;

CREATE TABLE `autenticas` (
  `IDAUTENTICA` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` char(10) DEFAULT NULL,
  `IDFIRMANTE` char(10) NOT NULL,
  `FECHAFIRMA` date NOT NULL,
  `COSTOAUTENTICA` float NOT NULL,
  PRIMARY KEY (`IDAUTENTICA`),
  UNIQUE KEY `AUTENTICAS_PK` (`IDAUTENTICA`),
  KEY `VALIDA_FK` (`IDUSUARIO`),
  CONSTRAINT `FK_AUTENTIC_VALIDA_USUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `autenticas` */

LOCK TABLES `autenticas` WRITE;

insert  into `autenticas`(`IDAUTENTICA`,`IDUSUARIO`,`IDFIRMANTE`,`FECHAFIRMA`,`COSTOAUTENTICA`) values (1,'1','2','2015-01-01',125.5),(2,'2','2','2013-02-02',150.5),(3,'3','2','2011-01-01',175.25),(4,'3','3','2011-07-01',95),(5,'1','2','2009-05-05',148.35),(6,'1','4','2011-06-03',127.5);

UNLOCK TABLES;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `IDCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `IDNOTARIO` int(11) DEFAULT NULL,
  `IDMCPIO` int(11) DEFAULT NULL,
  `DUI` char(10) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `NIT` char(17) DEFAULT NULL,
  `PROFESION` varchar(40) NOT NULL,
  `SEXO` char(1) NOT NULL,
  `FECHNAC` date NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `CLIENTES_PK` (`IDCLIENTE`),
  KEY `VIVE_EN_FK` (`IDMCPIO`),
  KEY `VINCULADO_CON_FK` (`IDNOTARIO`),
  CONSTRAINT `FK_CLIENTES_VINCULADO_NOTARIO` FOREIGN KEY (`IDNOTARIO`) REFERENCES `notario` (`IDNOTARIO`),
  CONSTRAINT `FK_CLIENTES_VIVE_EN_MUNICIPI` FOREIGN KEY (`IDMCPIO`) REFERENCES `municipios` (`IDMCPIO`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

LOCK TABLES `clientes` WRITE;

insert  into `clientes`(`IDCLIENTE`,`IDNOTARIO`,`IDMCPIO`,`DUI`,`NOMBRE`,`NIT`,`PROFESION`,`SEXO`,`FECHNAC`) values (1,15,7,'614415027-','Howard, Althea, Kirkland, Gates','7993-645258-964-0','Ornare Ltd','F','2015-09-10'),(2,8,8,'206440929-','Cullen, Haley, Murray, Nielsen','6988-651675-373-3','Ad Litora Torquent Limited','F','2015-02-17'),(3,10,6,'002482644-','Melissa, Talon, Guerrero, Buchanan','6371-842066-565-2','Lorem Institute','F','2015-08-28'),(4,3,1,'560802790-','Hamilton, Leilani, Hatfield, Fields','2325-172379-064-4','Non PC','F','2015-10-10'),(5,6,3,'318254598-','Sydnee, Magee, Cameron, Mullins','5119-735007-022-9','Eget Laoreet Ltd','F','2015-08-31'),(6,11,8,'011708295-','Stella, Devin, Mack, Rogers','1667-606070-110-6','Massa Non Corp.','F','2014-12-12'),(7,15,3,'103768672-','Sean, Astra, Sanders, Rosario','9358-325039-901-1','Sagittis Ltd','F','2016-05-13'),(8,13,2,'053634095-','Sybill, Timon, Duncan, Coleman','9616-008187-935-3','Arcu Eu Odio LLC','F','2015-12-22'),(9,10,9,'784246461-','Gay, Andrew, Velez, Frye','3862-990071-483-7','A Dui Corp.','M','2015-03-06'),(10,14,10,'924718180-','John, Signe, Cardenas, Zamora','2658-047176-323-8','Neque Venenatis Lacus Incorporated','M','2015-02-12'),(11,9,10,'030908663-','Francesca, Carter, Singleton, Matthews','0915-101321-685-3','Nunc Ac Institute','M','2016-10-12'),(12,8,5,'025557185-','Caryn, Griffith, Briggs, Wilson','5980-194904-042-9','Non Associates','M','2016-09-13'),(13,4,4,'199321864-','Orla, Nash, Avila, Bates','0382-800244-725-7','Neque Tellus PC','M','2014-12-11'),(14,12,4,'053988700-','Alfreda, Francis, Bennett, Oliver','0506-426592-569-2','Molestie Tortor Corp.','M','2015-07-23'),(15,15,10,'446940544-','Hakeem, Valentine, Kirk, Velasquez','7465-193123-758-3','Tellus Nunc Lectus Limited','F','2016-03-10'),(16,13,2,'102828303-','Valentine, India, Bartlett, Carson','3988-019086-506-3','Nulla Ltd','M','2016-04-05'),(17,1,9,'224583865-','Xantha, Meredith, Maxwell, Houston','4821-911773-473-7','Vulputate Posuere Corp.','F','2016-10-13'),(18,7,3,'048538605-','Whoopi, Darryl, Silva, Waller','9984-876468-428-7','Vel Turpis LLC','M','2015-08-19'),(19,5,6,'942553598-','Guy, Stacy, Blair, Dickson','3850-429969-550-6','Nisi Dictum Ltd','F','2016-08-29'),(20,4,1,'404981148-','Brielle, Kelsey, Harris, Franklin','9146-477248-879-2','Est Vitae Incorporated','F','2015-03-15'),(21,2,9,'086909019-','Kennan, Hedda, Reed, Grant','9738-215878-582-1','Proin LLP','M','2015-12-17'),(22,1,6,'489116150-','Channing, Gemma, Buckley, Harding','5456-292681-489-2','Rutrum Non Hendrerit Inc.','F','2016-05-15'),(23,4,1,'566773016-','Amethyst, Aurelia, Alvarado, Simon','2478-719878-133-8','Rutrum Magna Cras Incorporated','F','2015-11-30'),(24,8,3,'292414458-','Blythe, Marvin, Burks, Grant','0924-403935-991-8','Aliquam Ltd','F','2015-08-09'),(25,3,3,'648223004-','Hayley, Fredericka, Bass, Bass','5711-977374-884-5','Rutrum PC','M','2016-01-07'),(26,13,4,'394339618-','Macey, Hayley, Skinner, Walsh','1647-310039-498-3','Dapibus Rutrum Inc.','F','2015-05-31'),(27,10,1,'063620773-','Lyle, Margaret, Maynard, Meyer','6490-715982-359-9','Vel Corporation','M','2016-11-21'),(28,4,8,'442232737-','Dane, Louis, Meadows, Parker','8945-543724-493-2','Sit Amet Limited','F','2015-04-27'),(29,4,5,'912711975-','Courtney, Aiko, Rowland, Sweet','5827-097069-258-5','Cras Vehicula Aliquet Inc.','M','2016-03-09'),(30,7,6,'196704291-','Ori, Ronan, Hall, Maynard','6351-203968-007-4','Nulla Limited','M','2016-09-04'),(31,11,7,'164748012-','Bruno, Dai, Holloway, Saunders','7342-730838-231-1','Auctor Velit Eget Incorporated','F','2016-07-05'),(32,12,9,'672125107-','Chaim, Blythe, Brock, Oneill','8707-562023-107-9','A Purus Duis LLP','F','2016-09-14'),(33,2,2,'953033922-','Aquila, Carla, Haynes, Hays','3203-282929-306-4','Phasellus Dapibus Quam LLC','M','2016-08-02'),(34,8,3,'958712482-','Eagan, Jameson, Wallace, Beard','8620-034383-338-3','Penatibus Et Magnis Industries','F','2015-11-09'),(35,3,2,'882324112-','Octavia, Tasha, Jacobs, Miller','2485-745509-866-2','Nunc Ac Limited','F','2015-08-08'),(36,8,10,'285144926-','Sonia, Vanna, Estrada, Hull','0609-058107-002-3','Ullamcorper Magna LLP','F','2015-10-17'),(37,1,7,'948693235-','Aidan, Oleg, Torres, Barber','8632-645391-927-5','Orci In Consequat Ltd','F','2016-10-15'),(38,8,6,'308217546-','Mara, Alexandra, Nguyen, Kim','6090-716516-662-0','Lectus Ante Dictum Ltd','F','2016-10-28'),(39,2,7,'496850885-','Mohammad, Zephania, Fleming, Velez','3974-250249-447-0','Dapibus Gravida Foundation','M','2015-11-18'),(40,3,3,'945557610-','Alexandra, Otto, Rivers, Good','6466-219008-136-7','Ut Foundation','M','2016-04-06'),(41,6,1,'488024371-','April, Henry, Herrera, Mccarty','5440-558518-045-5','Neque Venenatis Lacus Inc.','F','2016-10-04'),(42,15,4,'980040361-','Nyssa, Lance, Shannon, Carney','0861-377381-453-7','Lorem Lorem Associates','M','2015-03-12'),(43,3,1,'971069325-','Eugenia, Adara, Davidson, Burris','5275-027884-766-1','Magna Malesuada Vel Associates','F','2016-02-05'),(44,10,6,'968679391-','Ivana, Carolyn, Jones, Meyers','3682-988419-991-4','Ultrices Iaculis Foundation','M','2015-08-17'),(45,12,4,'757011166-','Shaine, Erica, Sloan, Stout','6787-888104-989-7','Pretium Aliquet Institute','F','2016-01-10'),(46,8,4,'879275294-','Quintessa, Isabella, Huffman, Wilkins','3890-865919-398-6','Mauris Industries','F','2015-06-19'),(47,5,2,'676547918-','Veda, Tiger, Melton, Perkins','5874-771981-988-7','Luctus Ut Corporation','F','2016-09-28'),(48,9,10,'072875193-','Venus, Pearl, Shepard, Cummings','7370-630374-282-4','Eu Nulla Corp.','F','2015-05-26'),(49,3,8,'866586935-','Farrah, Kevin, Mullen, Fulton','9532-928253-382-3','Lobortis Tellus Justo Corporation','M','2016-06-01'),(50,7,5,'158788050-','Hayfa, Raven, Lynn, Acevedo','2203-854961-259-8','Scelerisque Neque Associates','F','2016-05-17'),(51,15,1,'345779194-','Burke, Tallulah, Crosby, Barrett','7245-281293-123-4','Convallis Corp.','F','2016-11-05'),(52,5,2,'261877649-','Hanna, Skyler, Norris, Holland','7881-115296-823-1','Enim Gravida Foundation','F','2015-02-25'),(53,10,1,'189818579-','Camden, Cruz, Golden, Myers','2143-187866-472-6','Porttitor Interdum Sed Incorporated','F','2015-09-18'),(54,2,2,'571164146-','Damian, Emily, Skinner, Hatfield','0663-850700-635-9','Aliquam Institute','F','2016-06-07'),(55,3,8,'788972608-','Linda, Bryar, Huff, Ferguson','8893-781397-322-3','Ante Company','F','2015-11-25'),(56,14,8,'137511358-','Stuart, Hasad, Lara, Church','2038-125788-815-9','Ac LLP','F','2015-10-11'),(57,1,7,'819044537-','Cole, Adam, Ferguson, Rich','5821-946275-675-0','Urna Justo Company','F','2015-08-29'),(58,3,2,'182166674-','Geoffrey, Blaine, Aguirre, Cole','3994-487181-657-3','Justo Sit Amet Foundation','F','2015-06-13'),(59,11,9,'464609984-','Coby, Kevin, Willis, Fisher','5402-519128-809-7','At Incorporated','F','2015-03-15'),(60,7,7,'880356742-','Jacqueline, Anthony, Stout, Graves','4715-540227-496-2','Tellus Limited','F','2015-09-04'),(61,9,5,'968006366-','Gay, Steel, Leonard, Gallagher','5511-533523-680-7','Nulla Eu Ltd','F','2015-06-03'),(62,5,9,'650182168-','Graiden, Patience, Pruitt, Gould','7590-788022-637-0','Mi Enim Condimentum Corp.','F','2016-10-28'),(63,5,10,'394547775-','Lysandra, Samantha, Swanson, Morrow','3768-837317-830-7','Aliquam Iaculis LLC','F','2014-12-10'),(64,11,10,'273829639-','Julian, Dolan, Diaz, Macdonald','9307-012719-324-8','Blandit Associates','F','2015-11-09'),(65,10,8,'882194427-','Cara, Vance, Rivera, Wagner','6069-743818-583-3','Quam Quis Industries','F','2016-11-15'),(66,1,5,'446621953-','Xandra, Urielle, Briggs, Alvarado','0439-774259-110-4','Malesuada Integer Industries','F','2015-02-16'),(67,5,7,'534235422-','Jasmine, Kane, Tran, Cobb','7673-333652-963-0','Aenean Limited','F','2015-07-30'),(68,10,10,'542846796-','Shaine, Ebony, Boyer, Potter','0985-362403-840-9','Ut Erat Sed Institute','F','2015-12-01'),(69,10,10,'318677395-','Iona, Kermit, Mann, Daugherty','7772-263694-377-5','Dictum Consulting','F','2016-04-19'),(70,6,1,'916962379-','Ryder, Rigel, Bowman, Powers','1916-259912-103-0','Dis LLP','F','2016-10-02'),(71,5,10,'584995646-','Rigel, Cameron, Hoover, Brown','6829-964086-647-7','Pede Praesent Eu Institute','F','2016-10-19'),(72,14,5,'700473726-','Aretha, Brent, Anthony, Hancock','1801-136757-738-6','Orci Corp.','F','2016-11-13'),(73,2,5,'693574250-','Zachery, Regan, Porter, Gaines','0301-422227-381-2','Aliquam PC','F','2016-04-03'),(74,2,2,'105254931-','Tanek, Kalia, Foley, Foreman','4881-642993-127-3','A Foundation','F','2015-01-13'),(75,3,10,'523034309-','Chanda, Dorian, Leon, Oneal','3246-136565-301-7','Ipsum LLC','F','2016-09-29'),(76,8,1,'371821017-','Pandora, Medge, Gonzalez, Mcbride','4214-293995-472-4','Ligula Consectetuer Corporation','F','2015-09-14'),(77,3,2,'106286616-','Haley, Lane, Watts, Kidd','4890-483396-832-3','Dapibus Company','F','2015-01-11'),(78,5,6,'982535662-','Madison, Aurora, Campos, Case','8174-379442-204-6','Consectetuer Consulting','F','2016-10-27'),(79,6,9,'576378946-','Deanna, Simone, Quinn, Moon','6722-645953-051-7','Est LLP','F','2014-12-28'),(80,10,5,'163312076-','Kevyn, Ashton, Gregory, Gibbs','0349-727172-991-8','A Magna Lorem LLC','F','2016-07-23'),(81,14,10,'798312082-','Bruce, Sigourney, Castaneda, Osborn','3542-335599-333-3','Penatibus Et Magnis Consulting','F','2016-09-05'),(82,14,7,'317337094-','Angelica, Paki, Barnes, Bowers','5791-686022-417-5','Aliquam Incorporated','F','2015-11-25'),(83,4,1,'390787855-','Sasha, Lavinia, Kirby, Strong','2250-964912-648-6','Viverra Donec Tempus Foundation','F','2016-10-27'),(84,10,1,'240779712-','Ruth, Hiroko, Curtis, Haney','2599-341180-727-7','Etiam Vestibulum Industries','F','2015-08-11'),(85,1,7,'800324451-','Vielka, Anastasia, Vinson, Hunt','7207-001968-518-6','Tristique Ac Eleifend Company','F','2016-01-29'),(86,9,5,'484627915-','Kevin, Imogene, Lopez, Sherman','6780-267743-964-1','Purus Nullam Scelerisque Corp.','F','2016-10-05'),(87,1,4,'368614309-','Armando, Cora, Perkins, Moreno','0971-719406-329-2','Ultrices Sit Amet Corporation','F','2016-09-23'),(88,14,9,'941996037-','Shellie, Erasmus, Montgomery, Robinson','1704-936163-672-4','Consequat Enim Associates','F','2015-02-26'),(89,5,1,'920425073-','Georgia, Aubrey, Yang, Wolf','1204-701406-019-8','In LLC','F','2016-08-12'),(90,11,5,'931301979-','Vance, Irma, Ware, Newman','1162-734342-648-4','Vitae Odio Ltd','F','2016-05-20'),(91,10,10,'598981205-','Leilani, Hashim, Griffin, Walters','2478-641768-831-3','Libero Et Inc.','F','2014-12-19'),(92,8,7,'768680107-','Amethyst, Clinton, Hampton, Drake','4549-175386-080-4','Arcu Morbi Associates','F','2014-12-27'),(93,10,1,'761968949-','Cullen, Shad, Carrillo, Sherman','1754-599798-718-1','Elit Industries','F','2016-02-26'),(94,7,4,'753447046-','Angelica, Lois, Duke, Stanley','2563-364868-190-1','Porttitor LLC','F','2016-08-21'),(95,7,7,'123206851-','Zelenia, Sandra, Morin, Ward','8750-898035-927-4','Eget Ipsum LLP','F','2015-11-22'),(96,14,8,'020107748-','Lunea, Dara, Stein, Huff','3232-688422-204-2','Sem Mollis Associates','F','2016-05-16'),(97,13,5,'235918165-','Belle, Kelsie, Burris, Whitfield','7200-822403-507-1','Adipiscing Mauris Molestie Inc.','F','2015-02-04'),(98,3,3,'839717737-','Buffy, Gretchen, Herman, Dejesus','4188-282374-869-5','Et Magnis Dis Industries','F','2015-06-10'),(99,11,8,'434845733-','Stephen, Bruno, Battle, Melendez','6618-285566-413-5','Libero Lacus LLC','F','2015-10-15'),(100,5,5,'739735654-','Kendall, Clare, James, Ewing','8469-034252-590-6','Ac Mattis Incorporated','F','2016-09-21');

UNLOCK TABLES;

/*Table structure for table `libro` */

DROP TABLE IF EXISTS `libro`;

CREATE TABLE `libro` (
  `IDLIBRO` int(11) NOT NULL AUTO_INCREMENT,
  `IDNOTARIO` int(11) DEFAULT NULL,
  `NUMLIBRO` int(11) NOT NULL,
  `NUMFOLIOS` int(11) NOT NULL,
  `FECHAVENC` date NOT NULL,
  PRIMARY KEY (`IDLIBRO`),
  UNIQUE KEY `LIBRO_PK` (`IDLIBRO`),
  KEY `POSEE_FK` (`IDNOTARIO`),
  CONSTRAINT `FK_LIBRO_POSEE_NOTARIO` FOREIGN KEY (`IDNOTARIO`) REFERENCES `notario` (`IDNOTARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `libro` */

LOCK TABLES `libro` WRITE;

insert  into `libro`(`IDLIBRO`,`IDNOTARIO`,`NUMLIBRO`,`NUMFOLIOS`,`FECHAVENC`) values (3,1,1,301,'2014-10-30'),(4,1,2,302,'2014-10-30'),(5,1,1,303,'2014-10-30'),(6,1,2,304,'2014-10-30'),(7,2,132,605,'2013-12-30'),(8,2,321,606,'2011-10-16'),(9,2,322,607,'2010-10-17'),(10,2,323,608,'2009-11-02'),(11,3,324,609,'2013-11-01'),(12,3,325,610,'2013-08-01'),(13,3,326,611,'2010-12-12'),(14,3,327,612,'2010-11-05');

UNLOCK TABLES;

/*Table structure for table `municipios` */

DROP TABLE IF EXISTS `municipios`;

CREATE TABLE `municipios` (
  `IDMCPIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMMCPIO` varchar(35) NOT NULL,
  `IDDEPTO` int(11) NOT NULL,
  `NOMDEPTO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDMCPIO`),
  UNIQUE KEY `MUNICIPIOS_PK` (`IDMCPIO`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `municipios` */

LOCK TABLES `municipios` WRITE;

insert  into `municipios`(`IDMCPIO`,`NOMMCPIO`,`IDDEPTO`,`NOMDEPTO`) values (1,'Alajuela',9,'Alajuela'),(2,'Alajuela',4,'Alajuela'),(3,'San Miguel',4,'San José'),(4,'Alajuela',3,'A'),(5,'Purral',4,'San José'),(6,'Cartago',2,'C'),(7,'Gravilias',1,'SJ'),(8,'Mata de Plátano',10,'San José'),(9,'Calle Blancos',3,'SJ'),(10,'San José',5,'SJ'),(11,'San Rafael',14,'Alajuela'),(12,'Calle Blancos',10,'SJ'),(13,'Tejar',10,'C'),(14,'Mercedes',12,'Heredia'),(15,'Alajuelita',1,'San José'),(16,'San Miguel',11,'SJ'),(17,'San Pedro',11,'San José'),(18,'Patarrá',10,'SJ'),(19,'Alajuela',3,'Alajuela'),(20,'Turrialba',6,'C'),(21,'Nicoya',1,'Guanacaste'),(22,'Cañas',10,'G'),(23,'San José',14,'SJ'),(24,'Cañas',6,'Guanacaste'),(25,'Cinco Esquinas',14,'San José'),(26,'San Rafael',3,'SJ'),(27,'San Rafael',4,'A'),(28,'Cañas',13,'Guanacaste'),(29,'San Juan de Dios',10,'SJ'),(30,'San Rafael',14,'Alajuela'),(31,'Tirrases',6,'SJ'),(32,'Tirrases',2,'SJ'),(33,'Mata de Plátano',7,'San José'),(34,'Alajuela',11,'A'),(35,'San Isidro de El General',12,'San José'),(36,'San Rafael',3,'SJ'),(37,'San Felipe',10,'SJ'),(38,'San Isidro',6,'San José'),(39,'San Francisco',13,'H'),(40,'Nicoya',7,'Guanacaste'),(41,'San Vicente',5,'SJ'),(42,'Barranca',5,'P'),(43,'San Francisco',7,'H'),(44,'Guápiles',8,'L'),(45,'Aguacaliente (San Francisco)',2,'C'),(46,'Alajuela',11,'A'),(47,'Alajuelita',7,'San José'),(48,'Calle Blancos',10,'San José'),(49,'Alajuela',9,'Alajuela'),(50,'San José de Alajuela',8,'A'),(51,'Mercedes',13,'H'),(52,'San Rafael',11,'Alajuela'),(53,'Cañas',4,'Guanacaste'),(54,'Desamparados',6,'SJ'),(55,'Heredia',3,'Heredia'),(56,'San Juan de Dios',4,'San José'),(57,'Patalillo',2,'SJ'),(58,'Curridabat',2,'SJ'),(59,'Quesada',3,'A'),(60,'Guápiles',13,'L'),(61,'Liberia',4,'G'),(62,'San José de Alajuela',8,'A'),(63,'Ulloa (Barrial)',9,'Heredia'),(64,'Gravilias',3,'San José'),(65,'Cañas',3,'Guanacaste'),(66,'Cañas',7,'Guanacaste'),(67,'San José de Alajuela',14,'Alajuela'),(68,'Nicoya',9,'Guanacaste'),(69,'Guadalupe',12,'San José'),(70,'Ipís',11,'San José'),(71,'Aguacaliente (San Francisco)',8,'C'),(72,'San Felipe',6,'San José'),(73,'Ipís',1,'SJ'),(74,'Mata de Plátano',10,'SJ'),(75,'Puntarenas',14,'Puntarenas'),(76,'San Rafael',1,'SJ'),(77,'San Pedro',1,'San José'),(78,'Tejar',9,'C'),(79,'Alajuela',10,'A'),(80,'San Juan de Dios',1,'San José'),(81,'Alajuelita',9,'San José'),(82,'San Francisco',11,'Heredia'),(83,'San Rafael Abajo',2,'SJ'),(84,'Cinco Esquinas',13,'San José'),(85,'Heredia',5,'Heredia'),(86,'San Pedro',8,'San José'),(87,'San José de Alajuela',11,'Alajuela'),(88,'Liberia',4,'Guanacaste'),(89,'Guápiles',1,'L'),(90,'Quesada',5,'A'),(91,'Patalillo',7,'San José'),(92,'Gravilias',3,'San José'),(93,'San Miguel',7,'SJ'),(94,'Alajuela',8,'Alajuela'),(95,'Cinco Esquinas',11,'SJ'),(96,'Alajuela',10,'A'),(97,'Alajuela',2,'A'),(98,'San Isidro',6,'San José'),(99,'San Felipe',5,'San José'),(100,'San Rafael',3,'A');

UNLOCK TABLES;

/*Table structure for table `notario` */

DROP TABLE IF EXISTS `notario`;

CREATE TABLE `notario` (
  `IDNOTARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) NOT NULL,
  `DOMICILIO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IDNOTARIO`),
  UNIQUE KEY `NOTARIO_PK` (`IDNOTARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `notario` */

LOCK TABLES `notario` WRITE;

insert  into `notario`(`IDNOTARIO`,`NOMBRE`,`DOMICILIO`) values (1,'Roberto Carlos Moreno','San Salvador'),(2,'Nady Patricia Marroquín Reyes','San Salvador'),(3,'Ryder Ima, Howe Burgess','Egypt'),(4,'Noah Neville, Kirk Fowler','Kiribati'),(5,'Clementine Patience Klein Thomas','Algeria'),(6,'Castor Tanisha, Ford Pacheco','Benin'),(7,'Yolanda Elliott, Puckett Harris','Slovenia'),(8,'Curran Isabelle, Mueller Cantrell','Guyana'),(9,'Uriel Madison, Oneill Crosby','Aruba'),(10,'Pamela Austin, Harrington Hurley','Bulgaria'),(11,'Zenaida Jameson, Mueller Myers','Cameroon'),(12,'Alan Dai, Berg Terry','Uruguay'),(13,'Kyla Wing, Underwood Harper','Saint Lucia'),(14,'Willa Brennan, Boyer Fleming','Latvia'),(15,'Farrah Maile, Ramirez Vasquez','Venezuela');

UNLOCK TABLES;

/*Table structure for table `pasos` */

DROP TABLE IF EXISTS `pasos`;

CREATE TABLE `pasos` (
  `IDPASO` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` char(10) DEFAULT NULL,
  `IDLIBRO` int(11) DEFAULT NULL,
  `DESDE` char(4) NOT NULL,
  `HASTA` char(4) NOT NULL,
  `OTORGANTE` varchar(40) NOT NULL,
  `FAVORECIDO` varchar(40) NOT NULL,
  `FECHAFIRMA` date NOT NULL,
  `COSTOPASO` float NOT NULL,
  PRIMARY KEY (`IDPASO`),
  UNIQUE KEY `PASOS_PK` (`IDPASO`),
  KEY `FIRMA_FK` (`IDUSUARIO`),
  KEY `PERTENECIENTES_A_FK` (`IDLIBRO`),
  CONSTRAINT `FK_PASOS_FIRMA_USUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`),
  CONSTRAINT `FK_PASOS_PERTENECI_LIBRO` FOREIGN KEY (`IDLIBRO`) REFERENCES `libro` (`IDLIBRO`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

/*Data for the table `pasos` */

LOCK TABLES `pasos` WRITE;

insert  into `pasos`(`IDPASO`,`IDUSUARIO`,`IDLIBRO`,`DESDE`,`HASTA`,`OTORGANTE`,`FAVORECIDO`,`FECHAFIRMA`,`COSTOPASO`) values (25,'1',3,'1','2','Juan Ramón Villanueva','Ana Silvia Mancia','2005-04-03',10.3),(26,'1',4,'2','4','Ana Vilma de Solorzano','Jose Carlos Peña','2006-04-03',10.3),(27,'1',3,'4','6','Mario Fernando Aponte','Gustavo Ignacio Silva','2006-05-06',10.3),(30,'5',9,'K5Q2','E7J0','Stella Salinas','Cleo Flowers','2015-07-11',1.96),(31,'3',6,'X6G7','B5D1','Jessica Acevedo','Zahir Raymond','2015-02-24',0.26),(32,'5',9,'I7D5','S1G6','Cooper Simpson','Kristen Wooten','2015-10-29',5.77),(33,'6',9,'V4I4','L3I5','Colby Whitehead','Katelyn Fuentes','2015-10-13',5.42),(34,'6',14,'X9L3','L1X1','Farrah Bullock','Maia Macias','2015-09-26',0.5),(35,'6',7,'P8E5','N2Z8','Demetrius Schmidt','Adele Nunez','2016-02-06',0.1),(36,'3',6,'Q9D5','N3R5','Mollie Gates','Wade Robertson','2015-05-22',2.21),(37,'5',3,'W6U9','T8I0','Jescie Vaughan','Damon Holt','2015-11-24',2.51),(38,'2',7,'H9I1','R3X7','Vance Roth','Colette Emerson','2015-02-23',4.91),(39,'5',6,'K5J8','Q5Z3','Freya Horn','Rana Hart','2016-06-18',7.85),(40,'1',8,'S4Y9','B8X4','Piper Stanley','Harrison Shields','2015-10-31',9.18),(41,'1',13,'I3L8','J1R0','Mercedes Garrett','Macey Elliott','2016-04-17',0.36),(42,'3',10,'W3M5','Q8V9','Barry Mason','Mollie Vang','2015-06-06',8.4),(43,'3',4,'V2P4','A6Z2','Simone Salas','Alexander Torres','2015-03-09',2.52),(44,'4',10,'S3S0','J9J6','Bryar Waller','Sebastian Harrell','2016-01-16',2.91),(45,'5',4,'I2Z4','X5X9','Kaden Collier','Hillary Wilkerson','2014-12-01',6),(46,'3',4,'R0L9','N4Z7','Cherokee Harrington','Angela Rice','2016-07-16',5.4),(47,'1',9,'Z0O5','Y2W1','Randall Humphrey','Stella Herman','2016-03-23',0.1),(48,'1',4,'K1Y1','G9G2','Patrick Tyson','Xenos Valenzuela','2016-06-13',7.83),(49,'6',10,'N3Y5','Y8C4','Kylynn Crane','Xerxes Hodge','2015-01-01',9.24),(50,'5',5,'L8P8','M7I3','Ashton Carney','Velma Boyle','2015-02-22',4.98),(51,'1',9,'T5R7','S7E0','Hedda Whitney','Wynne Massey','2016-02-27',9.04),(52,'1',6,'N7E6','O5L5','Faith Castaneda','Jakeem Ayers','2016-05-02',5.12),(53,'1',8,'Z3S1','Y8K5','Jessamine Waters','Wynter Boyle','2016-05-31',8.16),(54,'4',14,'U6C4','W1Y6','Clementine Herman','Fallon Santana','2016-06-23',7.54),(55,'5',10,'R3T7','R1O2','Althea Herrera','August Burks','2015-04-24',8.27),(56,'5',11,'M8B7','A3S0','Tashya Thomas','Lenore Blackwell','2015-12-02',0.18),(57,'1',3,'F8W1','Y9X3','Kaitlin Rush','Graiden Kane','2016-04-15',9.94),(58,'3',14,'Q4K3','S0I0','Brian Cooke','Erasmus Foster','2016-08-18',2.57),(59,'4',11,'R3R3','G8L9','Tad Hoover','Cara Rhodes','2015-06-24',7.09),(60,'1',5,'W5K1','P0B4','Mufutau Perkins','Kelsie Andrews','2015-12-26',6.76),(61,'1',14,'W0K7','P7B7','Kenneth Schroeder','Haviva Mclaughlin','2014-12-26',3.1),(62,'1',6,'G7P8','R9U2','Yasir Leach','Bernard Austin','2015-04-28',6.13),(63,'3',13,'O8Q3','C7P8','Shelley Ayala','Declan Logan','2016-01-08',3.51),(64,'1',3,'D9G5','N6B6','Dominique Carver','Fuller Chavez','2016-10-07',6.2),(65,'4',14,'X2X2','R4R6','Stacy Brock','Desirae Martin','2016-09-10',8.42),(66,'6',9,'L8V6','K8P2','Dai Spencer','Neville Jones','2015-12-22',0.93),(67,'4',9,'O6C6','K6O5','Robert Ross','Kareem Santiago','2016-09-06',6.64),(68,'2',5,'E5P4','P7Q8','Abra Parker','Lillian Rodriguez','2015-05-23',7.87),(69,'5',12,'D0Z2','R0A0','Scarlett Hatfield','Kyle Dickson','2016-11-21',9.92),(70,'4',5,'Z5G9','G6O4','Vera Little','Wing Burch','2015-12-04',7.45),(71,'5',4,'Z3I3','K2W3','Cherokee Avila','Garth Sandoval','2016-05-14',2.02),(72,'4',5,'Z2H8','C5A9','Anthony Hayden','Zephr Pace','2016-07-30',9.49),(73,'4',9,'D2Y7','H5W2','Jolie Beck','Galena Rodriquez','2016-06-08',5.27),(74,'5',10,'B0F5','N0H5','Wyatt Cook','Kyla Mcknight','2016-09-12',4.39),(75,'6',14,'Y2H0','H3D4','Alma Noble','Inez Moses','2016-11-13',9.42),(76,'4',9,'S0L7','F3P2','Jana Chaney','Melvin Fuentes','2015-04-12',9.8),(77,'5',6,'B8A4','I0M9','Maris Buckley','Baxter Barr','2015-06-17',6.24),(78,'1',3,'A3N5','F7R2','Burke Rivers','Sade Mccarty','2015-09-30',2.87),(79,'5',6,'G8L9','G8R0','Mechelle Clay','Baker Levy','2015-10-09',0.05),(80,'3',14,'G8P7','K9N5','Kaitlin Garrison','Warren Copeland','2016-07-05',3.24),(81,'4',9,'O5C9','K3M5','Herrod Mason','Quynn Houston','2015-01-24',6.74),(82,'6',9,'O9S2','F9V9','Hanna Torres','Oscar Bullock','2016-08-28',4.56),(83,'2',10,'Y5P9','F0F0','Katelyn Torres','Alexandra Alexander','2016-09-22',4.91),(84,'6',9,'V9A5','Q2F8','Russell Petty','Amos Maldonado','2016-11-21',6.21),(85,'6',3,'L5Z6','K0Y8','Eagan May','Reed Velasquez','2014-12-27',0.84),(86,'4',6,'O4J5','E3V8','Tiger Stewart','Abbot Contreras','2015-08-07',5.28),(87,'1',9,'Z0D9','L1C8','Lois Garcia','Curran Bishop','2015-04-24',4.86),(88,'1',6,'O0C6','C7N0','Arsenio Gay','Karleigh Colon','2015-02-16',4.98),(89,'2',11,'K5N9','L2R9','Pandora Holden','Colette Duffy','2016-08-17',5.85),(90,'2',10,'A5O0','P9K1','Indira Avila','Zoe Walton','2015-01-13',5.47),(91,'2',4,'M4C9','B1D0','Dieter Obrien','Ruth Carver','2016-01-03',1.41),(92,'1',13,'H1D0','C3K2','Germane Cain','Kasper Grant','2016-04-18',2.6),(93,'2',12,'D0J5','Q3J5','Chloe Garza','Sade Vasquez','2015-08-11',0.34),(94,'3',11,'Y6V2','N6L0','Mari Castillo','Ivan Stanton','2016-11-23',1.53),(95,'5',7,'U3S6','K6P2','Alexander Melendez','Vera Lott','2014-11-29',4.52),(96,'3',6,'W6S9','O7W8','Robert Sweeney','Baxter Craig','2015-10-13',3.04),(97,'3',4,'F0R7','P5B6','Madeline Olson','Lewis Phelps','2016-11-03',9.94),(98,'4',9,'Y4F0','J1R4','Vivian Drake','Imelda Sweet','2016-07-29',2.64),(99,'5',7,'U2E7','R3L4','Honorato Sanchez','Ishmael Berry','2015-09-05',9.11),(100,'2',3,'C8Z2','D5T1','Mari Wade','Georgia Cochran','2015-02-20',5.23),(101,'5',9,'C6J1','M1P3','Brandon Snider','Drew Hardin','2016-03-22',6.02),(102,'3',12,'X9W7','V9I0','Olympia Coleman','Helen Mcfadden','2016-08-24',1.87),(103,'1',5,'X7W8','B6L5','Josephine Lynch','Charity Mcintyre','2016-04-03',1.07),(104,'1',4,'S5E1','Z6Q3','Nayda Robbins','Avye Booth','2015-07-23',4.26),(105,'6',5,'V2A5','V8C9','Lara Justice','Allen Dillard','2015-10-28',6.66),(106,'5',14,'Z8C7','B7X1','Miriam Jenkins','Vladimir Gregory','2016-01-04',8.48),(107,'4',7,'M1D1','K6U8','Lewis Stewart','Neve Pittman','2015-03-16',8.82),(108,'6',8,'M2K2','H0L7','Basil Oliver','Kiayada Wood','2015-04-06',9.01),(109,'6',6,'J5V9','M0T0','August Sullivan','Shafira Watkins','2016-03-20',1.94),(110,'1',8,'A5J6','D8K4','Kennedy George','Wayne Combs','2014-12-11',9.12),(111,'2',4,'J3C6','E5C6','Isaiah Bentley','Mollie Sexton','2016-10-21',9.54),(112,'1',3,'E9L9','A9W8','Clinton Prince','Bruno Watts','2016-07-15',4.05),(113,'4',13,'I1S5','T0M3','Logan Mitchell','Melanie Garcia','2016-06-07',6.91),(114,'3',7,'U3M4','O0A2','Noah Buck','Lester Petty','2015-03-20',1.29),(115,'5',13,'W7K5','P8B1','Kasimir Olsen','Barbara Matthews','2016-01-11',6.82),(116,'6',10,'V1I2','F8F2','Joel Matthews','Alisa Wallace','2016-05-30',2.97),(117,'1',7,'W1G4','X0C4','Amity Hunter','Carlos Mccullough','2016-03-15',8.18),(118,'4',3,'M9U1','C7Z5','Quincy Petty','Hiroko Hogan','2015-10-18',2.23),(119,'6',5,'R2Q6','T2E7','Reagan Porter','Hamilton Mooney','2015-03-26',5.26),(120,'5',10,'W4P0','B4O7','Allegra Dyer','Orli Colon','2015-07-26',3.72),(121,'4',9,'T7I0','D4X2','Haley Vargas','Idola Robbins','2015-10-09',3.86),(122,'5',6,'V8X8','Z2A7','Kai William','Brent Sexton','2015-11-07',5.62),(123,'4',12,'D2J9','P2E1','Kato Shaw','Jane Todd','2015-12-08',1.12),(124,'4',11,'V7U5','Y4F7','Zenia Meadows','Jenette Browning','2014-12-10',8.46),(125,'6',11,'R8V3','N8D5','Tana Thomas','Hanae Maxwell','2015-08-11',3.69),(126,'5',3,'C3C3','Q9M1','Erin Porter','Rhoda Clay','2015-05-14',9.68),(127,'4',5,'G9W3','J0W3','Fitzgerald Macdonald','Raphael Lamb','2015-07-08',0.32),(128,'4',10,'W8O4','M8E4','Macey Pugh','Madison Lawson','2015-05-15',6.28),(129,'6',5,'N0C2','G1E5','Alvin Farrell','Emerson Carrillo','2014-12-22',6.53);

UNLOCK TABLES;

/*Table structure for table `ss_historico_claves` */

DROP TABLE IF EXISTS `ss_historico_claves`;

CREATE TABLE `ss_historico_claves` (
  `ID_HISTORICO_CLAVE` decimal(9,0) NOT NULL COMMENT 'ID del histórico de clave.',
  `ID_USUARIO` decimal(9,0) DEFAULT NULL,
  `ID_USUARIO2` decimal(9,0) DEFAULT NULL,
  `FECHA_CLAVE` datetime DEFAULT NULL COMMENT 'Fecha en que la clave fue cambiada y movida al histórico.',
  `CLAVE2` varchar(100) DEFAULT NULL COMMENT 'Clave',
  PRIMARY KEY (`ID_HISTORICO_CLAVE`),
  KEY `AK_UK_SS_HISTORICO_CLAVES` (`ID_USUARIO2`,`CLAVE2`),
  KEY `FK_FK_SS_HIST_CLAVES_USUARIOS` (`ID_USUARIO`),
  CONSTRAINT `FK_FK_SS_HIST_CLAVES_USUARIOS` FOREIGN KEY (`ID_USUARIO`) REFERENCES `ss_usuarios` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene las claves que ha cambiado el usuario para controla';

/*Data for the table `ss_historico_claves` */

LOCK TABLES `ss_historico_claves` WRITE;

UNLOCK TABLES;

/*Table structure for table `ss_menus` */

DROP TABLE IF EXISTS `ss_menus`;

CREATE TABLE `ss_menus` (
  `ID_MENU` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica al menú.',
  `SS__ID_MENU` decimal(9,0) DEFAULT NULL COMMENT 'Correlativo que identifica al menú.',
  `NOMBRE_MENU` varchar(100) DEFAULT NULL COMMENT 'Nombre del menú ',
  `USUARIO_REGISTRO` varchar(15) DEFAULT NULL COMMENT 'Usuario que registra la información.',
  `FECHA_REGISTRO` datetime DEFAULT NULL COMMENT 'Fecha y hora en que se registra información',
  `USUARIO_ULTIMAMODIFICACION` varchar(15) DEFAULT NULL COMMENT 'Último usuario que modificó la información.',
  `FECHA_ULTIMAMODIFICACION` datetime DEFAULT NULL COMMENT 'Fecha y hora de última modificación de información.',
  PRIMARY KEY (`ID_MENU`),
  KEY `FK_FK_SS_MENUS_MENU_PADRE` (`SS__ID_MENU`),
  CONSTRAINT `FK_FK_SS_MENUS_MENU_PADRE` FOREIGN KEY (`SS__ID_MENU`) REFERENCES `ss_menus` (`ID_MENU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene los diferentes menus de las aplicaciones';

/*Data for the table `ss_menus` */

LOCK TABLES `ss_menus` WRITE;

insert  into `ss_menus`(`ID_MENU`,`SS__ID_MENU`,`NOMBRE_MENU`,`USUARIO_REGISTRO`,`FECHA_REGISTRO`,`USUARIO_ULTIMAMODIFICACION`,`FECHA_ULTIMAMODIFICACION`) values ('1',NULL,'Salidas de Control','desarrollo','2014-10-30 00:00:00',NULL,NULL),('2',NULL,'Toma de Decision','desarrollo','2014-10-30 00:00:00',NULL,NULL),('3',NULL,'Salidas3','desarrollo','2014-10-30 00:00:00',NULL,NULL),('4',NULL,'Salidas4','desarrollo','2014-10-30 00:00:00',NULL,NULL),('5',NULL,'Salidas5','desarrollo','2014-10-30 00:00:00',NULL,NULL),('6',NULL,'Salidas6','desarrollo','2014-10-30 00:00:00',NULL,NULL),('7',NULL,'Salidas7','desarrollo','2014-10-30 00:00:00',NULL,NULL),('8',NULL,'Salidas8','desarrollo','2014-10-30 00:00:00',NULL,NULL),('9',NULL,'Saldias9','desarrollo','2015-05-09 00:00:00',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ss_menus_opciones` */

DROP TABLE IF EXISTS `ss_menus_opciones`;

CREATE TABLE `ss_menus_opciones` (
  `ID_MENU` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica al menú.',
  `ID_OPCION` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica a la opción.',
  PRIMARY KEY (`ID_MENU`,`ID_OPCION`),
  KEY `FK_FK_SS_OPCIONES_MENUS` (`ID_OPCION`),
  CONSTRAINT `FK_FK_SS_MENUS_OPCIONES` FOREIGN KEY (`ID_MENU`) REFERENCES `ss_menus` (`ID_MENU`),
  CONSTRAINT `FK_FK_SS_OPCIONES_MENUS` FOREIGN KEY (`ID_OPCION`) REFERENCES `ss_opciones` (`ID_OPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene la relacion n:n entre menus y opciones (de menú).';

/*Data for the table `ss_menus_opciones` */

LOCK TABLES `ss_menus_opciones` WRITE;

insert  into `ss_menus_opciones`(`ID_MENU`,`ID_OPCION`) values ('1','2'),('1','3'),('2','4'),('3','5'),('3','6'),('3','7'),('3','8'),('3','9'),('4','10'),('5','11'),('5','12'),('8','13'),('8','14'),('2','15');

UNLOCK TABLES;

/*Table structure for table `ss_opciones` */

DROP TABLE IF EXISTS `ss_opciones`;

CREATE TABLE `ss_opciones` (
  `ID_OPCION` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica a la opción.',
  `NOMBRE_OPCION` varchar(100) DEFAULT NULL COMMENT 'Nombre de la opción',
  `URL` varchar(300) DEFAULT NULL COMMENT 'URL de ubicación de la página de la opción.',
  `VISIBLE` varchar(1) DEFAULT '1' COMMENT 'Indica si la opción se muestra o no. (Si tiene un 1 = SI, Si tiene un 0 = NO, default=0)',
  `USUARIO_REGISTRO` varchar(15) DEFAULT NULL COMMENT 'Usuario que registra la información.',
  `FECHA_REGISTRO` datetime DEFAULT NULL COMMENT 'Fecha y hora en que se registra información',
  `USUARIO_ULTIMAMODIFICACION` varchar(15) DEFAULT NULL COMMENT 'Último usuario que modificó la información.',
  `FECHA_ULTIMAMODIFICACION` datetime DEFAULT NULL COMMENT 'Fecha y hora de última modificación de información.',
  `IMAGEN_OPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_OPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene las diferentes opciones de los menús de las aplicac';

/*Data for the table `ss_opciones` */

LOCK TABLES `ss_opciones` WRITE;

insert  into `ss_opciones`(`ID_OPCION`,`NOMBRE_OPCION`,`URL`,`VISIBLE`,`USUARIO_REGISTRO`,`FECHA_REGISTRO`,`USUARIO_ULTIMAMODIFICACION`,`FECHA_ULTIMAMODIFICACION`,`IMAGEN_OPCION`) values ('1','Home','/gmorenosys/views/index.xhtml','S','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('2','Indice Notarial','/gmorenosys/views/Indice/index.xhtml','S','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('3','CompraVenta Vehiculo','/gmorenosys/views/compraventa/index.xhtml','S','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('4','Autenticas','/gmorenosys/views/autenticas/index.xhtml','S','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('5','pantalla4','/siapa/views/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('6','pantalla5','/siapa/views/persona/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('7','pantalla6','/dimesa/views/davivienda/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('8','pantalla7','/dimesa/views/davivienda/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('9','pantalla8','/siapa/views/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('10','pantalla9','/siapa/views/jaula/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('11','pantalla10','/siapa/views/alimento/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('12','pantalla11','/siapa/views/detalleCompraAlimento/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('13','pantalla12','/siapa/views/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL),('14','pantalla13','/siapa/views/alimento/index.xhtml','N','desarrollo','2014-11-01 00:00:00',NULL,NULL,NULL),('15','pantalla14','/siapa/views/proveedor/index.xhtml','N','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ss_roles` */

DROP TABLE IF EXISTS `ss_roles`;

CREATE TABLE `ss_roles` (
  `ID_ROL` decimal(9,0) NOT NULL COMMENT 'Identificador único del rol',
  `CODIGO_ROL` varchar(50) DEFAULT NULL COMMENT 'Código que identifica al rol.',
  `NOMBRE_ROL` varchar(50) DEFAULT NULL COMMENT 'Nombre del Rol',
  `DESCRIPCION` varchar(150) DEFAULT NULL COMMENT 'Propiedades o usos que identifican al rol',
  `USUARIO_REGISTRO` varchar(15) DEFAULT NULL COMMENT 'Usuario que registra la información.',
  `FECHA_REGISTRO` datetime DEFAULT NULL COMMENT 'Fecha y hora en que se registra información',
  `USUARIO_ULTIMAMODIFICACION` varchar(15) DEFAULT NULL COMMENT 'Último usuario que modificó la información.',
  `FECHA_ULTIMAMODIFICACION` datetime DEFAULT NULL COMMENT 'Fecha y hora de última modificación de información.',
  PRIMARY KEY (`ID_ROL`),
  KEY `AK_UK_SS_ROLES_CODIGO_ROL` (`CODIGO_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene los diferentes niveles de acceso que un usuario pue';

/*Data for the table `ss_roles` */

LOCK TABLES `ss_roles` WRITE;

insert  into `ss_roles`(`ID_ROL`,`CODIGO_ROL`,`NOMBRE_ROL`,`DESCRIPCION`,`USUARIO_REGISTRO`,`FECHA_REGISTRO`,`USUARIO_ULTIMAMODIFICACION`,`FECHA_ULTIMAMODIFICACION`) values ('1','EOP','Encargado Operativo','Posee privilegios ..','desarrollo','2014-10-30 00:00:00',NULL,NULL),('2','EAD','Encargado Administrativo','Posee Privilegios de ...','desarrollo','2014-10-30 00:00:00',NULL,NULL),('3','VEN','Vendedor','Encargado de registrar las ventas ','desarrollo','2014-10-30 00:00:00',NULL,NULL),('4','OPE','Operario','Encargado de Realizar ...','desarrollo','2014-10-30 00:00:00',NULL,NULL),('5','ADM','Administrador del Sistema','Tiene todos los provilegios de gestion de usuario y otras tareas de adminitracion del sistema','desarrollo','2014-10-30 00:00:00',NULL,NULL),('6','ASC','Asociado','puede ver los reportes que se generan desde el sistema','desarrollo','2014-10-30 00:00:00',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `ss_roles_menu` */

DROP TABLE IF EXISTS `ss_roles_menu`;

CREATE TABLE `ss_roles_menu` (
  `ID_MENU` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica al menú.',
  `ID_ROL` decimal(9,0) NOT NULL COMMENT 'Identificador único del rol',
  PRIMARY KEY (`ID_MENU`,`ID_ROL`),
  KEY `FK_SS_ROLES_MENU2` (`ID_ROL`),
  CONSTRAINT `FK_SS_ROLES_MENU` FOREIGN KEY (`ID_MENU`) REFERENCES `ss_menus` (`ID_MENU`),
  CONSTRAINT `FK_SS_ROLES_MENU2` FOREIGN KEY (`ID_ROL`) REFERENCES `ss_roles` (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene la relacion n:n entre roles y menus';

/*Data for the table `ss_roles_menu` */

LOCK TABLES `ss_roles_menu` WRITE;

insert  into `ss_roles_menu`(`ID_MENU`,`ID_ROL`) values ('3','1'),('4','1'),('5','1'),('6','1'),('8','1'),('1','2'),('2','2'),('3','2'),('4','2'),('7','2'),('1','3'),('8','3'),('3','4'),('1','5'),('2','5'),('3','5'),('4','5'),('6','5'),('7','5'),('8','5'),('9','5'),('2','6'),('6','6');

UNLOCK TABLES;

/*Table structure for table `ss_roles_opciones` */

DROP TABLE IF EXISTS `ss_roles_opciones`;

CREATE TABLE `ss_roles_opciones` (
  `ID_ROL` decimal(9,0) NOT NULL COMMENT 'Identificador único del rol',
  `ID_OPCION` decimal(9,0) NOT NULL COMMENT 'Correlativo que identifica a la opción.',
  PRIMARY KEY (`ID_ROL`,`ID_OPCION`),
  KEY `FK_SS_ROLES_OPCIONES2` (`ID_OPCION`),
  CONSTRAINT `FK_SS_ROLES_OPCIONES` FOREIGN KEY (`ID_ROL`) REFERENCES `ss_roles` (`ID_ROL`),
  CONSTRAINT `FK_SS_ROLES_OPCIONES2` FOREIGN KEY (`ID_OPCION`) REFERENCES `ss_opciones` (`ID_OPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ss_roles_opciones` */

LOCK TABLES `ss_roles_opciones` WRITE;

insert  into `ss_roles_opciones`(`ID_ROL`,`ID_OPCION`) values ('1','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('2','2'),('3','2'),('5','2'),('2','3'),('3','3'),('5','3'),('2','4'),('5','4'),('6','4'),('4','5'),('5','5'),('1','6'),('4','7'),('1','8'),('2','8'),('1','9'),('5','9'),('1','10'),('2','10'),('1','11'),('1','12'),('3','13'),('1','14'),('5','14'),('2','15'),('5','15');

UNLOCK TABLES;

/*Table structure for table `ss_roles_usuarios` */

DROP TABLE IF EXISTS `ss_roles_usuarios`;

CREATE TABLE `ss_roles_usuarios` (
  `ID_ROL` decimal(9,0) NOT NULL COMMENT 'Identificador único del rol',
  `ID_USUARIO` decimal(9,0) NOT NULL,
  PRIMARY KEY (`ID_ROL`,`ID_USUARIO`),
  KEY `FK_SS_ROLES_USUARIOS2` (`ID_USUARIO`),
  CONSTRAINT `FK_SS_ROLES_USUARIOS` FOREIGN KEY (`ID_ROL`) REFERENCES `ss_roles` (`ID_ROL`),
  CONSTRAINT `FK_SS_ROLES_USUARIOS2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `ss_usuarios` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene la relación n:n entre roles y usuarios';

/*Data for the table `ss_roles_usuarios` */

LOCK TABLES `ss_roles_usuarios` WRITE;

insert  into `ss_roles_usuarios`(`ID_ROL`,`ID_USUARIO`) values ('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),('6','6');

UNLOCK TABLES;

/*Table structure for table `ss_usuarios` */

DROP TABLE IF EXISTS `ss_usuarios`;

CREATE TABLE `ss_usuarios` (
  `ID_USUARIO` decimal(9,0) NOT NULL,
  `CODIGO_USUARIO` varchar(15) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(100) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CARGO` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL COMMENT 'Propiedades o usos que identifican al rol',
  `BLOQUEADO` varchar(1) DEFAULT '0',
  `CLAVE` varchar(100) DEFAULT NULL,
  `INTENTOS_ACCESO_FALLIDOS` decimal(3,0) DEFAULT '0',
  `USUARIO_REGISTRO` varchar(15) DEFAULT NULL COMMENT 'Usuario que registra la información.',
  `FECHA_REGISTRO` datetime DEFAULT NULL COMMENT 'Fecha y hora en que se registra información',
  `USUARIO_ULTIMAMODIFICACION` varchar(15) DEFAULT NULL COMMENT 'Último usuario que modificó la información.',
  `FECHA_ULTIMAMODIFICACION` datetime DEFAULT NULL COMMENT 'Fecha y hora de última modificación de información.',
  `FECHA_ULTIMO_ACCESO` datetime DEFAULT NULL,
  `DIRECCION_ACCESO` varchar(100) DEFAULT NULL,
  `DETALLE_ULTIMO_ACCESO` varchar(300) DEFAULT NULL,
  `FECHA_CAMBIO_CLAVE` datetime DEFAULT NULL,
  `CODIGO_SUCURSAL` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ss_usuarios` */

LOCK TABLES `ss_usuarios` WRITE;

insert  into `ss_usuarios`(`ID_USUARIO`,`CODIGO_USUARIO`,`NOMBRE_USUARIO`,`TELEFONO`,`EMAIL`,`CARGO`,`DESCRIPCION`,`BLOQUEADO`,`CLAVE`,`INTENTOS_ACCESO_FALLIDOS`,`USUARIO_REGISTRO`,`FECHA_REGISTRO`,`USUARIO_ULTIMAMODIFICACION`,`FECHA_ULTIMAMODIFICACION`,`FECHA_ULTIMO_ACCESO`,`DIRECCION_ACCESO`,`DETALLE_ULTIMO_ACCESO`,`FECHA_CAMBIO_CLAVE`,`CODIGO_SUCURSAL`) values ('1','EOP','Encargado Operativo','78421829','siapa@gmail.com','Encargado Operativo',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','EAD','Encargado Administrativo','78421829','siapa@gmail.com','Encargado Administrativo',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','VEN','Vendedor','78421829','siapa@gmail.com','Vendedor',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4','OPE','Operario','78421829','siapa@gmail.com','Operario',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5','ADM','Administrador del Sistema','78421829','siapa@gmail.com','Administrador del Sistema',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6','ASC','Asociado','78421829','siapa@gmail.com','Asociado',NULL,'N','e10adc3949ba59abbe56e057f20f883e','0','desarrollo','2014-10-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `IDUSUARIO` char(10) CHARACTER SET latin1 NOT NULL,
  `IDNOTARIO` int(11) DEFAULT NULL,
  `IDSSUSUARIO` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  UNIQUE KEY `USUARIO_PK` (`IDUSUARIO`),
  KEY `AUTORIZA_FK` (`IDNOTARIO`),
  KEY `FK_usuario` (`IDSSUSUARIO`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`IDSSUSUARIO`) REFERENCES `ss_usuarios` (`ID_USUARIO`),
  CONSTRAINT `FK_USUARIO_AUTORIZA_NOTARIO` FOREIGN KEY (`IDNOTARIO`) REFERENCES `notario` (`IDNOTARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`IDUSUARIO`,`IDNOTARIO`,`IDSSUSUARIO`) values ('1',1,'1'),('2',2,'2'),('3',3,'3'),('4',4,'4'),('5',5,'5'),('6',6,'6');

UNLOCK TABLES;

/*Table structure for table `vehiculos` */

DROP TABLE IF EXISTS `vehiculos`;

CREATE TABLE `vehiculos` (
  `IDVEHICULO` int(11) NOT NULL AUTO_INCREMENT,
  `PLACA` char(8) NOT NULL,
  `CLASE` varchar(20) NOT NULL,
  `TIPO` varchar(25) DEFAULT NULL,
  `MARCA` varchar(25) DEFAULT NULL,
  `MODELO` varchar(30) DEFAULT NULL,
  `MOTOR` char(20) NOT NULL,
  `CHASIS` char(20) NOT NULL,
  `VIN` char(20) NOT NULL,
  `ANIO` int(11) NOT NULL,
  `COLOR` varchar(25) NOT NULL,
  `CAPACIDAD` float NOT NULL,
  PRIMARY KEY (`IDVEHICULO`),
  UNIQUE KEY `VEHICULOS_PK` (`IDVEHICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `vehiculos` */

LOCK TABLES `vehiculos` WRITE;

insert  into `vehiculos`(`IDVEHICULO`,`PLACA`,`CLASE`,`TIPO`,`MARCA`,`MODELO`,`MOTOR`,`CHASIS`,`VIN`,`ANIO`,`COLOR`,`CAPACIDAD`) values (1,'O3O-8G3','P4M','K2L 6E7','Vincent','Carly','53437','HZN51OQI8HP','PIB19OMX9QX',2015,'Bzue',0),(2,'H1F-8N7','J0D','K0I 1P6','Leblanc','Zelenia','75942','MZP51EBI5HD','NMN47QGV6PM',2015,'Bwue',0),(3,'N7G-3U6','M1I','N9W 6B5','Morse','Amela','63976','XWF73FHG3CQ','UQL24ORE4SN',2015,'Bzue',0),(4,'H1C-1K7','S0L','T0J 1D2','Mccarty','Branden','16403','JVT30AYJ7AY','VUO75ZPW3FW',2015,'Bque',0),(5,'J9A-8C5','B2Q','E9M 3Y4','Mccarty','Kane','02614','NCC96BLI3CH','FZP77SHD3OQ',2016,'Beue',0),(6,'L9R-0Y3','U6T','L1Q 4Y9','Miller','Yolanda','15213','CXI72BLD9ZM','GLQ97MIS6GW',2015,'Bzue',0),(7,'J9K-6C5','Y5P','R6W 4Q0','Patton','Jolene','55755','YCM02WQR8JO','QGK70CEC5KZ',2016,'Boue',0),(8,'S1E-1C1','Q6A','Z6D 6Q1','Barrett','Avram','10152','IMV91SWJ1LL','NOQ94FWD0OQ',2014,'Beue',0),(9,'Q3M-4J5','Y5K','A1E 5G2','Mcbride','Fay','73979','NFP30ZQN1MC','DWM12ANC7LU',2015,'Byue',0),(10,'F1W-4G4','P7N','J0N 8A1','Decker','Nash','74269','KJI56IIT8HA','ENO44KUG5BO',2016,'Byue',0),(11,'Y4F-5E3','G6L','R5P 9L9','Richmond','Imani','32448','BFY27SXI5FU','NFL65CTN7JL',2015,'Bnue',0),(12,'J3G-9F9','C7S','A6L 3L1','Lynn','Tyrone','35057','XGC82GMP3XZ','JQT62MYK2ZR',2016,'Biue',0),(13,'D2D-8O7','H9B','K2T 3Y2','Faulkner','Jasmine','40868','PHN30HRI8CZ','MWH05UBM9EK',2016,'Bvue',0),(14,'Z4T-2X9','A0S','X5I 7Z9','Sargent','Leonard','10401','UZK40MPD9XX','WYZ16VLJ6YU',2015,'Beue',0),(15,'T0V-4M7','P5S','L6X 8Z2','Burke','Oren','11235','TXX76PHA1YN','YHI10LSA6NO',2016,'Bbue',0),(16,'B6L-4Z1','N6S','P5O 7Z4','Hammond','Theodore','95856','USA94JCG2NB','FAT56ZLX7YT',2015,'Bmue',0),(17,'Y7R-1Q3','Q4V','Z1Y 4D0','Christian','Erich','12265','BGQ90BHY9HE','GAH54UUX4GV',2016,'Bkue',0),(18,'V9J-6Z2','K9L','G2H 2F7','Hunt','Octavius','32146','OBA59HPG0NQ','GOE98DLO6PB',2016,'Baue',0),(19,'M7B-5X8','M2B','O9I 5S2','Avila','Carter','03380','NRQ84YPL0XM','WRV15YXR9EW',2015,'Bkue',0),(20,'W7T-8Z1','I1G','D6X 4K8','Coffey','Kyle','09457','PVR65OJT1MQ','EYD55ENX6WU',2016,'Bgue',0),(21,'M5N-7O6','F5C','Z0A 4A7','Perez','Cheyenne','07327','OKP87XZN7FI','OEU96SOT1ZX',2016,'Bzue',0),(22,'P7J-2E3','V8F','L1C 6I7','Sharp','Tyrone','71743','QQS53OKT0GH','TRR22PLG7RY',2015,'Bwue',0),(23,'J5W-6L1','N7Z','M2F 3R5','Stuart','Paula','61921','AXA75PSG3XS','OTS27VBF9DX',2016,'Bhue',0),(24,'T0O-8M7','W9T','H4N 1F3','Campos','Samson','20855','QJM23DVO3LN','FFG89VCE8YJ',2016,'Bvue',0),(25,'I3S-1T6','O4L','O1P 8L9','Blevins','Keiko','34793','MDC47WPD1PZ','PJN87EYM2RH',2016,'Bxue',0),(26,'I3M-5S3','B4Q','V3C 4A8','Francis','Yen','79417','HAI55ZMT0KV','PHA87RKU0GR',2016,'Bkue',0),(27,'G5T-1X9','C2Q','O0C 3S7','Harris','Rhona','19936','EUY21QXW9VF','KKT68SQK7CO',2016,'Boue',0),(28,'H8B-6J4','M5Y','B0R 1M2','Casey','Merritt','48275','XTE24XJN5KH','SLS83OPC1MI',2016,'Buue',0),(29,'F8E-6S0','Y2O','Y9L 1Q8','Ford','Gary','02103','BOA57BEC7KE','XDD59AXB8ES',2016,'Bbue',0),(30,'C3J-1Z2','G2L','Y6P 5Z0','Avila','Gannon','52798','QOO16GHS8KH','THZ26GMK5BM',2015,'Bvue',0),(31,'F8L-1P9','P4K','C3E 9P5','Woodward','Nora','26179','HGN26KWV5JY','PCN52XPP3EH',2016,'Brue',0),(32,'P9B-7S0','Z8S','D9D 5R1','Macdonald','Isaac','94439','SOV94ZFD1KC','BNR51DNJ1ER',2014,'Beue',0),(33,'B8I-7F8','Q2J','C2U 2Z3','Adkins','Ryan','96517','THR83NEM9IS','TUP43AHR8PA',2016,'Btue',0),(34,'P7Z-6J1','D3D','K2M 2L1','Lowery','Blake','70769','DNK70VSZ6OT','PCD36GJI4XQ',2016,'Bnue',0),(35,'Y2F-6L0','C0S','F0A 3Z8','Raymond','Yvette','11345','MLM29PCI7MJ','UPY61HMJ5OZ',2015,'Bxue',0),(36,'V3H-1V2','O9V','V9I 2Z4','Vargas','Carson','88848','JIT07VWK1EG','WIB55YMT0ET',2016,'Boue',0),(37,'F8G-4S2','S9K','C8Y 4H1','Richardson','Brynne','90761','YHY33QRA1GF','GAN98LTU2YK',2016,'Boue',0),(38,'I8D-9Q2','C5N','O0L 3Y2','Bruce','Joseph','90264','FFD22ZUN0TS','OLR60NBS5WI',2016,'Bcue',0),(39,'G9L-4Z5','N7U','F1T 3Z2','Riddle','Gloria','09299','UDD81JCY1KB','YCW81TDT3XQ',2015,'Bfue',0),(40,'G6D-8I0','K1S','D8Q 9M6','Berger','Elliott','24946','VIG96HKL7ED','XQJ75YMH4RK',2015,'Bjue',0),(41,'J6H-2E5','G3Y','Q6N 9H0','Kennedy','Jaquelyn','09436','XNZ84LQH5RD','CJY23MLN2BD',2016,'Buue',0),(42,'J5K-0K7','A1Y','C2C 2L2','Wood','Jasper','64508','VOT26RQW0XX','NCA80KFA8IF',2015,'Buue',0),(43,'F4A-4S4','L7N','J7W 6X9','Suarez','Shafira','55465','IRY14XPH5WZ','ZDK98YAF8YA',2015,'Bzue',0),(44,'K6S-4Y2','E5B','G1N 3R0','Kelly','Calista','75755','KNP29GXM8VK','FDD79AFP9OM',2016,'Baue',0),(45,'I3N-0N4','E4X','S5J 5P1','Keller','Cassandra','31484','SCY88GXU1IH','AQU79LGT0DQ',2015,'Bnue',0),(46,'D8C-1K3','K7R','M7X 7Q5','Mosley','Cheyenne','47886','JLG10IMP5BE','WWU20AUM0WZ',2016,'Bmue',0),(47,'S5T-5A5','C0C','G7R 0S8','Salas','Naomi','56648','MJB21HJP0TF','QFD14NIH2GV',2016,'Bque',0),(48,'N4L-4O3','N5G','M7Z 6K1','Hughes','Rhona','90097','UHR30AJZ4XZ','ZTT56PXL3LM',2015,'Bjue',0),(49,'V0D-7K8','O7S','V5B 3D5','Erickson','Idola','01821','ZNC64DBU5YD','BLJ16YMX2XQ',2016,'Bmue',0),(50,'R4C-8E6','B3O','Z3W 3C2','Booth','Aaron','98962','AXU76SFA2MC','QGH37XVX2VS',2015,'Boue',0),(51,'E0C-0M0','W7P','S8R 7O6','Pena','Alden','25206','PDO41BKU3UJ','VEF51CTR6OD',2015,'Bwue',0),(52,'P3C-5W7','C0W','I3R 3P1','Hopkins','Imelda','02273','QON66MWL0SQ','LIN51FEA1HH',2015,'Beue',0),(53,'Y3R-8Z8','Z2C','H3L 3N5','Mcintyre','Nissim','49217','CVZ88IXN6HI','PUN17GUY0PL',2016,'Blue',0),(54,'Y1K-5R3','C0X','E6I 6I4','Armstrong','Beck','41063','YWN51UTZ2LI','SCV76ZFB9KU',2016,'Bmue',0),(55,'L2J-7U7','Y2H','R0Z 0W9','Meyer','Lee','52144','DNR21VJE9KP','WFR24FBI1DK',2016,'Bzue',0),(56,'T4K-5W3','V3K','B9I 5H6','Eaton','Ezra','39620','KEQ80CTD5OY','EJZ85UYO2IG',2016,'Bmue',0),(57,'Q3Q-1N2','Z4Q','I5R 3K8','Kirby','Mechelle','47190','QTM86TMA3DY','SMI82OAG0PY',2015,'Bcue',0),(58,'Z2B-3V2','Y4T','K1U 5V8','Frost','Abdul','51269','GSI78WOK9EE','TBB85INE4KS',2015,'Bgue',0),(59,'K7A-3B1','O5M','Z1F 2G7','Snyder','Avram','92150','MDJ20AGM0VQ','AUT22JMX8IN',2015,'Bgue',0),(60,'D0Y-0D6','S0C','R8P 3S5','Short','Hanna','96976','JRG68QVN8DO','LFX70ETF6QX',2016,'Bzue',0),(61,'N1H-3W1','B4Q','H6J 2M9','Boyle','Lunea','82716','ZVE31BJU1LI','OLA45DSY5MF',2016,'Bcue',0),(62,'K2P-7A8','T6N','T0R 3R7','Osborne','Amery','69513','LZF55OTY8PM','CDD99KQQ5EY',2016,'Bxue',0),(63,'Y2X-0S2','U1F','N3O 9J0','Cantrell','Bert','04978','QBO77PII4DB','OSN36VVY3LL',2015,'Blue',0),(64,'T5E-7S9','Z0E','K3O 1P2','Rivers','Stephen','75211','HRV98NSA9VC','HVS06FJS4XX',2015,'Biue',0),(65,'Y3C-3F6','N5D','V1P 6R4','Austin','Aurora','91818','XPR23YFX5XG','OYV92EYJ8JJ',2016,'Bhue',0),(66,'G2X-9G3','H2A','Y3H 7E8','Kline','Laurel','00516','VES60HRR0CN','PCD88HWP4GQ',2015,'Bpue',0),(67,'V9X-3J4','A0E','R9U 7W1','England','Phelan','63206','VLI40HKA4ZK','XYW13XUX3MA',2016,'Baue',0),(68,'X0N-7Q8','T6Q','J1A 2X6','Dominguez','Driscoll','71447','MWO05WVD9QH','XMX60JNK0HW',2014,'Bque',0),(69,'T7M-8G2','K9D','X4Y 0C1','Fletcher','Kimberly','60536','RZL25XWM9QK','FNU97GOX1EJ',2016,'Baue',0),(70,'I3U-3G1','P9Y','E1H 3V8','Christian','Emerald','43555','PCJ32YOS3VV','ZAK53PZQ8OY',2015,'Boue',0),(71,'X7P-1M6','R9Y','M8B 4I2','Klein','Delilah','11346','GSO50VXM6AR','KED21DSX7FP',2015,'Brue',0),(72,'S8E-8E7','W5O','R5Z 8M9','Wong','Dai','08158','PYS28DUU9CT','ANC46ZGP5SU',2016,'Bxue',0),(73,'D7D-5K4','U0Z','X5A 5B7','Buckley','Leigh','11215','OZS48BWM1YA','KJO96AWE9EJ',2015,'Buue',0),(74,'J2C-7E1','E0Y','Z5A 8C7','Dickson','Scarlet','58414','PWK01MEC8KQ','RBJ43QWC3DN',2015,'Bzue',0),(75,'E5Y-6P2','Q9S','W2O 3L9','Bradford','Ina','66238','FCZ83HNP4RY','NJX40EJF5ZD',2016,'Buue',0),(76,'E0W-9U9','V1O','X8M 6E1','Buchanan','Cruz','52394','LNQ66CUN0OW','DUV56XCH7MZ',2014,'Bzue',0),(77,'L3N-0M9','F7G','Z3D 4L6','Sanders','Dora','05459','YXL91NMS6AU','NPM50USB6VQ',2015,'Byue',0),(78,'Y3L-5S1','W2T','Q2C 1M4','Grimes','Kelly','55098','NIM36XYG3OF','QSF66EQQ3QZ',2015,'Bsue',0),(79,'M7O-5Y6','O0V','R5H 2Q1','Camacho','Blaze','61652','ZKT14JQU3XO','ZIN63SKQ1IW',2016,'Bxue',0),(80,'N5M-2V0','T9T','K0M 1F6','Lawson','Anjolie','50927','RKG34BUV9QN','HSW78NPP5YH',2014,'Brue',0),(81,'I2B-4Y7','H6P','I9A 7P3','Carlson','Kellie','38128','SVH57TQO6QO','VVH80YVU8XF',2015,'Bxue',0),(82,'S1T-3U4','U0F','H1T 9J9','Payne','Glenna','93945','LYH06BBW2PJ','RID27QTR2EW',2015,'Bvue',0),(83,'L8D-7F3','J2K','F4J 2B6','Rosario','Cameron','88481','GAE17TPU8LC','LNN95CJL5BV',2016,'Bjue',0),(84,'E8A-9U3','S3W','U2I 8K5','Mcleod','Melyssa','39915','GRC77GWP0LY','XSP40FQT7CS',2015,'Btue',0),(85,'T2L-3E1','S6W','T9D 0N6','Rios','Keith','54899','YSL46KAV2PK','NTF05DJK3DC',2015,'Bhue',0),(86,'X1X-6M7','Z7F','F7F 9O2','Joyce','Hashim','17103','AGK92EHX3WX','XYJ00BYB6PR',2015,'Bhue',0),(87,'G8C-3C2','F5F','U2E 9J9','Gentry','Anika','81107','ZMQ75KYF5NA','AIJ32QSS4IN',2016,'Bmue',0),(88,'F4D-6D0','Z8D','M9A 3I9','Hunter','Mohammad','24854','KIJ32MKI1GZ','ARR44MTB8TC',2016,'Beue',0),(89,'N3R-6U5','O6M','Y2J 0H7','Gates','Gareth','93374','ZTW42FBV0JK','SGX92JCH0VJ',2016,'Bfue',0),(90,'Q2I-7H4','M2Z','L4F 7S0','Gamble','Hu','94912','AHX77DUT2MJ','PSG22MZB2EN',2016,'Bvue',0),(91,'W8Z-1Q7','N2S','C1G 5S1','Lynn','Lucy','67779','FYF21YLA5LM','AXN19GIY0VI',2016,'Buue',0),(92,'L0V-2N6','S9J','I5B 8A5','Spears','Tanya','94894','DVM14IGM3HX','REB12UIG3SF',2016,'Boue',0),(93,'E6B-1K3','H2C','Z4U 5X1','Dunn','Olivia','50109','OLH75MWD2GI','WKG12BUL8WJ',2015,'Blue',0),(94,'K7L-3B3','J1Q','U7F 1T5','Oneil','Octavius','68092','OZT00KXO0YX','JIH33PRB9BL',2015,'Bvue',0),(95,'W7X-3A1','J7K','W7C 1E1','Buck','Blaine','51663','AHJ78MPV5OQ','SHO77KHP7CU',2015,'Bgue',0),(96,'H2B-6A8','X9R','W3C 7O1','Rice','Zena','13641','DVO70UVT7LR','OYM52AGS7ZJ',2014,'Beue',0),(97,'F8X-1Y0','Z8E','V3L 5Z9','Hurst','Sonia','42066','XKR70LYM1GH','XCL13RXE4YF',2016,'Byue',0),(98,'C4U-2T5','U6F','N3N 7U8','Wilkinson','Camilla','14928','SYI06VWV7GW','MRS14DHJ4PQ',2016,'Buue',0),(99,'X1T-0D3','L8A','Z8N 7Q2','Battle','Inez','29245','HCL93IAN0LK','BXE07NZJ8AX',2015,'Bhue',0),(100,'H2P-1D2','H2L','P1G 3H4','Woodward','Aristotle','99087','CCH57OLX4NB','SJV36XMD1RS',2016,'Bvue',0);

UNLOCK TABLES;

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `IDVENTA` int(11) NOT NULL AUTO_INCREMENT,
  `IDARMA` int(11) DEFAULT NULL,
  `IDVEHICULO` int(11) DEFAULT NULL,
  `IDUSUARIO` char(10) DEFAULT NULL,
  `IDCLIENTE` int(11) DEFAULT NULL,
  `CLI_IDCLIENTE` int(11) DEFAULT NULL,
  `NUMCV` int(11) NOT NULL,
  `FECHACV` date NOT NULL,
  `TIPOCV` int(11) NOT NULL,
  `PRECIO` float NOT NULL,
  `ESTADO` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`IDVENTA`),
  UNIQUE KEY `VENTA_PK` (`IDVENTA`),
  KEY `ES_COMPRADOR_EN_FK` (`CLI_IDCLIENTE`),
  KEY `TRASPASADO_EN_FK` (`IDVEHICULO`),
  KEY `ES_VENDERDOR_EN_FK` (`IDCLIENTE`),
  KEY `TRASPASADA_EN_FK` (`IDARMA`),
  KEY `REALIZA_FK` (`IDUSUARIO`),
  CONSTRAINT `FK_VENTA_ES_COMPRA_CLIENTES` FOREIGN KEY (`CLI_IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`),
  CONSTRAINT `FK_VENTA_ES_VENDER_CLIENTES` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`),
  CONSTRAINT `FK_VENTA_REALIZA_USUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`),
  CONSTRAINT `FK_VENTA_TRASPASAD_ARMAS` FOREIGN KEY (`IDARMA`) REFERENCES `armas` (`IDARMA`),
  CONSTRAINT `FK_VENTA_TRASPASAD_VEHICULO` FOREIGN KEY (`IDVEHICULO`) REFERENCES `vehiculos` (`IDVEHICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `venta` */

LOCK TABLES `venta` WRITE;

insert  into `venta`(`IDVENTA`,`IDARMA`,`IDVEHICULO`,`IDUSUARIO`,`IDCLIENTE`,`CLI_IDCLIENTE`,`NUMCV`,`FECHACV`,`TIPOCV`,`PRECIO`,`ESTADO`) values (1,NULL,50,'1',28,25,100,'2016-11-02',95,6,1),(2,NULL,40,'1',12,9,101,'2015-11-25',16,5,2),(3,NULL,49,'1',24,16,102,'2016-11-09',94,8,1),(5,NULL,41,'2',14,20,104,'2016-05-12',44,8,1),(8,NULL,9,'2',30,8,107,'2016-02-11',96,7,1),(9,NULL,44,'2',24,12,108,'2016-04-24',40,9,1),(10,NULL,37,'2',21,24,109,'2015-05-16',16,8,2),(11,NULL,50,'2',26,21,110,'2016-09-20',41,8,2),(12,NULL,42,'2',13,5,111,'2015-02-11',69,7,1),(13,NULL,1,'3',8,8,112,'2016-06-30',43,8,1),(16,NULL,21,'2',18,9,115,'2016-03-21',55,9,1),(17,NULL,17,'1',5,9,116,'2015-01-29',10,5,2),(18,NULL,38,'2',19,20,117,'2015-06-24',88,6,1),(19,NULL,25,'1',17,7,118,'2016-09-01',54,6,2),(21,NULL,42,'3',9,24,120,'2015-06-20',48,6,2),(22,NULL,46,'3',11,7,121,'2016-09-27',63,7,1),(24,NULL,21,'3',30,13,123,'2016-09-15',74,5,1),(26,NULL,11,'3',18,24,125,'2015-07-05',81,7,1),(28,NULL,2,'3',16,8,127,'2015-12-25',61,9,1),(29,NULL,5,'2',6,19,128,'2016-07-30',31,6,2),(30,NULL,23,'1',6,16,129,'2016-06-20',95,6,1),(33,NULL,26,'1',9,18,132,'2016-06-27',79,7,2),(34,NULL,34,'1',25,22,133,'2015-11-24',12,9,1),(40,NULL,9,'3',11,15,139,'2014-11-27',75,5,2),(41,NULL,29,'2',26,15,140,'2015-01-15',67,5,1),(42,NULL,32,'2',17,23,141,'2016-03-25',51,7,2),(43,NULL,7,'1',28,23,142,'2015-04-11',75,9,1),(45,NULL,40,'3',28,13,144,'2015-01-17',20,9,2),(46,NULL,41,'2',27,7,145,'2016-01-02',75,6,2),(47,NULL,50,'3',1,24,146,'2016-08-16',45,6,2),(48,NULL,34,'3',29,25,147,'2015-01-30',32,6,2),(51,NULL,26,'2',11,5,150,'2015-05-20',73,9,2),(52,NULL,9,'1',11,13,151,'2015-12-24',6,7,1),(53,NULL,3,'3',23,22,152,'2016-11-03',48,6,2),(56,NULL,20,'2',26,19,155,'2016-09-06',38,5,2),(58,NULL,19,'1',4,15,157,'2015-03-03',91,9,1),(60,NULL,25,'2',16,24,159,'2015-10-03',61,6,1),(62,NULL,37,'3',26,11,161,'2015-03-26',18,5,2),(63,NULL,9,'1',28,17,162,'2015-01-25',78,7,1),(66,NULL,21,'1',23,9,165,'2015-09-19',5,7,1),(68,NULL,32,'3',26,9,167,'2015-02-12',62,9,2),(69,NULL,23,'3',17,11,168,'2016-03-02',3,7,1),(70,NULL,32,'2',27,24,169,'2015-09-18',91,7,2),(72,NULL,11,'3',25,7,171,'2016-11-06',80,6,1),(74,NULL,49,'3',27,15,173,'2015-01-13',69,9,1),(75,NULL,8,'2',2,13,174,'2016-07-19',28,8,1),(77,NULL,10,'3',16,16,176,'2015-04-13',87,7,2),(78,NULL,38,'3',21,14,177,'2016-02-03',69,7,1),(79,NULL,13,'1',2,13,178,'2015-05-23',86,7,2),(80,NULL,22,'2',25,19,179,'2015-01-27',94,8,1),(81,NULL,39,'3',9,6,180,'2015-01-15',89,5,2),(83,NULL,7,'1',2,25,182,'2016-01-29',35,7,2),(84,NULL,17,'3',2,19,183,'2016-11-18',30,7,1),(85,NULL,23,'2',15,23,184,'2014-12-14',7,7,1),(86,NULL,39,'1',28,8,185,'2016-04-05',26,7,1),(88,NULL,41,'3',25,7,187,'2014-12-06',64,9,1),(90,NULL,11,'3',26,16,189,'2015-12-16',91,6,1),(91,NULL,8,'1',24,11,190,'2015-08-14',73,5,2),(92,NULL,25,'2',11,25,191,'2016-06-16',97,8,1),(93,NULL,37,'2',28,20,192,'2015-04-15',39,6,1),(94,NULL,50,'2',17,20,193,'2015-08-10',17,9,1),(95,NULL,9,'3',26,18,194,'2015-01-04',14,8,1),(96,NULL,34,'2',23,11,195,'2015-04-07',34,6,1),(98,NULL,15,'3',14,7,197,'2015-10-08',69,5,1),(99,NULL,26,'3',24,21,198,'2016-03-31',32,8,2),(100,NULL,19,'2',2,23,199,'2015-09-09',46,9,2);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
