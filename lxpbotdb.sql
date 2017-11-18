# *******************************************************************
# Creato per l'articolo di LXP sui bot Slack collegato con LEX di aws
# *******************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Cancelliamo la tabella ricette
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ricette`;

CREATE TABLE `ricette` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` tinytext,
  `ingrediente_principale` tinytext,
  `ingredienti` tinytext,
  `tempo_di_cottura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ricette` WRITE;
/*!40000 ALTER TABLE `ricette` DISABLE KEYS */;

INSERT INTO `ricette` (`id`, `nome`, `ingrediente_principale`, `ingredienti`, `tempo_di_cottura`)
VALUES
	(1,'Baked Salmon','fish','Salmon, Onion, Butter, Fennel',25),
	(2,'Tuna Salad','fish','Tuna steak, pine nuts, olive oil, beetroot, chard',10),
	(3,'Mackerel Salad','fish','Smoked Mackerel, Brown Rice, Capers, Tomatoes ',5),
	(4,'Troll on Toast','troll','Troll, Toast',10),
	(5,'Burger & Chips','burger','Burger, Bun, Chips, Tomatoes, Mustard',20);

/*!40000 ALTER TABLE `ricette` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
