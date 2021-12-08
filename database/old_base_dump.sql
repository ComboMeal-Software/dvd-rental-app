
-- Версия сервера: 5.7.25
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8mb4';

--
-- Установка базы данных по умолчанию
--
USE dvd_rental_app;

--
-- Удалить таблицу `customers`
--
DROP TABLE IF EXISTS customers;

--
-- Удалить таблицу `dvd`
--
DROP TABLE IF EXISTS dvd;

--
-- Удалить таблицу `offer`
--
DROP TABLE IF EXISTS offer;

--
-- Установка базы данных по умолчанию
--
USE dvd_rental_app;

--
-- Создать таблицу `offer`
--
CREATE TABLE offer (
  offer_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  dvd_id int UNSIGNED DEFAULT NULL,
  customer_id int UNSIGNED DEFAULT NULL,
  offer_date datetime DEFAULT CURRENT_TIMESTAMP,
  return_date datetime DEFAULT NULL,
  PRIMARY KEY (offer_id),
  UNIQUE INDEX offer_id (offer_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать таблицу `dvd`
--
CREATE TABLE dvd (
  dvd_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) DEFAULT '',
  production_year year DEFAULT NULL,
  PRIMARY KEY (dvd_id),
  UNIQUE INDEX dvd_id (dvd_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать таблицу `customers`
--
CREATE TABLE customers (
  customer_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(255) DEFAULT '',
  last_name varchar(255) DEFAULT '',
  passport_code int DEFAULT NULL,
  registration_date datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX customer_id (customer_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

-- 
-- Вывод данных для таблицы offer
--
INSERT INTO offer VALUES
(1, 1, 3, '2016-07-05 00:00:00', '2017-01-01 00:00:00'),
(2, 7, 5, '2015-04-19 00:00:00', NULL),
(3, 6, 1, '2021-10-07 23:57:40', NULL);

-- 
-- Вывод данных для таблицы dvd
--
INSERT INTO dvd VALUES
(1, 'Spirited Away', 2002),
(2, 'The Wind Rises', 2014),
(3, 'Ponyo', 2009),
(4, 'Tales from Earthsea', 2010),
(5, 'The Secret World of Arrietty', 2012),
(6, 'Howl''s Moving Castle', 2005),
(7, 'Alice in Wonderland', 2010),
(8, 'Monsters University', 2013),
(9, 'Prince of Persia: The Sands of Time', 2010);

-- 
-- Вывод данных для таблицы customers
--
INSERT INTO customers VALUES
(1, 'Анжела', 'Большакова', 1234, '2021-10-07 23:57:40'),
(2, 'Мария', 'Канюшкова', 2345, '2021-10-07 23:57:40'),
(3, 'Дмитрий', 'Воробьёв', 3456, '2021-10-07 23:57:40'),
(4, 'Елизавета', 'Киско', 4567, '2021-10-07 23:57:40'),
(5, 'Денис', 'Призраков', 5678, '2021-10-07 23:57:40');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;