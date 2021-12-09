--
-- Скрипт сгенерирован Devart dbForge Studio 2020 for MySQL, Версия 9.0.567.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 09.12.2021 15:30:09
-- Версия сервера: 8.0.26
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
SET NAMES 'utf8';

DROP DATABASE IF EXISTS dvd_rental_app;

CREATE DATABASE dvd_rental_app
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

--
-- Установка базы данных по умолчанию
--
USE dvd_rental_app;

--
-- Создать таблицу `type`
--
CREATE TABLE type (
  type_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (type_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать таблицу `dvd`
--
CREATE TABLE dvd (
  dvd_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  production_year year DEFAULT NULL,
  type_id int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (dvd_id),
  UNIQUE INDEX dvd_id (dvd_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 26,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE dvd
ADD CONSTRAINT FK_dvd_type_id FOREIGN KEY (type_id)
REFERENCES type (type_id);

--
-- Создать таблицу `customers`
--
CREATE TABLE customers (
  customer_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(255) DEFAULT '',
  last_name varchar(255) DEFAULT '',
  registration_date datetime DEFAULT CURRENT_TIMESTAMP,
  tel_number varchar(20) NOT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX customer_id (customer_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать таблицу `rent`
--
CREATE TABLE rent (
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
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE rent
ADD CONSTRAINT FK_offer_customer_id FOREIGN KEY (customer_id)
REFERENCES customers (customer_id);

--
-- Создать внешний ключ
--
ALTER TABLE rent
ADD CONSTRAINT FK_offer_dvd_id FOREIGN KEY (dvd_id)
REFERENCES dvd (dvd_id);

-- 
-- Вывод данных для таблицы type
--
INSERT INTO type VALUES
(1, 'film'),
(2, 'game'),
(3, 'music_album'),
(4, 'tv_series'),
(5, 'animated_film'),
(6, 'animated_series');

-- 
-- Вывод данных для таблицы dvd
--
INSERT INTO dvd VALUES
(1, 'Spirited Away', 2002, 5),
(2, 'The Wind Rises', 2014, 5),
(3, 'Ponyo', 2009, 5),
(4, 'Tales from Earthsea', 2010, 5),
(5, 'The Secret World of Arrietty', 2012, 5),
(6, 'Howl''s Moving Castle', 2005, 5),
(7, 'Alice in Wonderland', 2010, 1),
(8, 'Monsters University', 2013, 5),
(9, 'Prince of Persia: The Sands of Time', 2010, 2),
(10, 'Nevermind', 1991, 3),
(11, 'Gunfighter Ballads And Trail Songs', 1959, 3),
(12, 'Back In Black', 1980, 3),
(13, 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 1),
(14, 'Pirates of the Caribbean: Dead Man''s Chest', 2006, 1),
(15, 'Pirates of the Caribbean: At World''s End', 2007, 1),
(16, 'Pirates of the Caribbean: On Stranger Tides', 2011, 1),
(17, 'Pirates of the Caribbean: Dead Men Tell No Tales', 2017, 1),
(18, 'Prince of Persia: Warrior Within', 2004, 2),
(19, 'Prince of Persia: The Two Thrones', 2005, 2),
(20, 'Prince of Persia: The Forgotten Sands', 2010, 2),
(21, 'Prince of Persia', 2008, 2),
(22, 'Friends', 1994, 4),
(23, 'The Walking Dead', 2010, 4),
(24, 'Rick and Morty', 2013, 6),
(25, 'Gravity Falls', 2012, 6);

-- 
-- Вывод данных для таблицы customers
--
INSERT INTO customers VALUES
(1, 'Анжела', 'Большакова', '2021-10-07 23:57:40', '+79048478834'),
(2, 'Мария', 'Канюшкова', '2021-10-07 23:57:40', '+79387478289'),
(3, 'Дмитрий', 'Воробьёв', '2021-10-07 23:57:40', '+79823785873'),
(4, 'Елизавета', 'Киско', '2021-10-07 23:57:40', '+79823658833\r\n'),
(5, 'Денис', 'Призраков', '2021-10-07 23:57:40', '+79837528085');

-- 
-- Вывод данных для таблицы rent
--
INSERT INTO rent VALUES
(1, 1, 3, '2016-07-05 00:00:00', '2017-01-01 00:00:00'),
(2, 7, 5, '2015-04-19 00:00:00', NULL),
(3, 6, 1, '2021-10-07 23:57:40', NULL);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;