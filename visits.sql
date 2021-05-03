DROP TABLE IF EXISTS `visit`;
CREATE TABLE IF NOT EXISTS `visit` (
  `idvisit` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_iduser` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`idvisit`),
  KEY `fk_visits_users1` (`user_iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `visit`
--

insert into visit ( `ip_address`, `timestamp`, `user_iduser`) values
('10.28.14.123', NOW(), 1),
('10.28.14.124', NOW(), 2),
('10.28.14.123', NOW(), 1),
('10.28.14.123', NOW(), 2),
('10.28.14.125', NOW(), null);
