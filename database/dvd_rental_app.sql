--
-- Скрипт сгенерирован Devart dbForge Studio 2020 for MySQL, Версия 9.0.567.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 11.12.2021 18:42:56
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
  production_year int DEFAULT NULL,
  type_id int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (dvd_id),
  UNIQUE INDEX dvd_id (dvd_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 31,
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
  birthdate date DEFAULT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE INDEX customer_id (customer_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать индекс `UK_customers_tel_number` для объекта типа таблица `customers`
--
ALTER TABLE customers
ADD UNIQUE INDEX UK_customers_tel_number (tel_number);

DELIMITER $$

--
-- Создать процедуру `client_update`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE client_update (IN in_first_name varchar(255), IN in_last_name varchar(255), IN in_birthdate varchar(255), IN in_tel varchar(255))
BEGIN
  UPDATE dvd_rental_app.customers
  SET first_name = in_first_name,
      last_name = in_last_name,
      birthdate = STR_TO_DATE(in_birthdate, '%d.%m.%Y')
  WHERE tel_number = in_tel;
END
$$

--
-- Создать процедуру `client_find`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE client_find (IN find varchar(255))
BEGIN
  SELECT
    *
  FROM dvd_rental_app.customers
  WHERE customers.tel_number LIKE CONCAT('%', find, '%');
END
$$

--
-- Создать процедуру `client_delete`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE client_delete (IN in_tel varchar(255))
BEGIN
  DELETE
    FROM dvd_rental_app.customers
  WHERE tel_number = in_tel;
END
$$

--
-- Создать процедуру `client_create`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE client_create (IN in_first_name varchar(255), IN in_last_name varchar(255), IN in_tel varchar(255), IN in_birthdate varchar(255))
BEGIN
  INSERT INTO dvd_rental_app.customers (first_name, last_name, tel_number, birthdate)
    VALUES (in_first_name, in_last_name, in_tel, STR_TO_DATE(in_birthdate, '%d.%m.%Y'));
END
$$

DELIMITER ;

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
AUTO_INCREMENT = 14,
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

DELIMITER $$

--
-- Создать процедуру `rent_return`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE rent_return (IN in_offer_id int)
BEGIN
  UPDATE dvd_rental_app.rent
  SET return_date = CURRENT_TIMESTAMP()
  WHERE offer_id = in_offer_id;
END
$$

--
-- Создать процедуру `rent_add`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE rent_add (IN in_dvd_id int, IN in_customer_id int)
BEGIN
  INSERT INTO dvd_rental_app.rent (dvd_id, customer_id)
    VALUES (in_dvd_id, in_customer_id);
END
$$

--
-- Создать процедуру `dvd`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd ()
BEGIN
  SELECT DISTINCT
    d.dvd_id,
    d.title,
    d.production_year,
    t.type
  FROM dvd_rental_app.dvd d
    JOIN dvd_rental_app.type t
      ON d.type_id = t.type_id
    LEFT OUTER JOIN dvd_rental_app.rent r
      ON d.dvd_id = r.dvd_id
    LEFT OUTER JOIN (SELECT
        *
      FROM dvd_rental_app.rent
      WHERE return_date IS NULL) re
      ON (d.dvd_id = re.dvd_id)
  WHERE (r.offer_id IS NULL)
  OR (r.offer_id IS NOT NULL
  AND re.offer_id IS NULL)
  ORDER BY d.dvd_id DESC
  LIMIT 5;
END
$$

--
-- Создать процедуру `dvd_update`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd_update (IN in_dvd_id int, IN in_title varchar(255), IN in_year int, IN in_type_id int)
BEGIN
  UPDATE dvd_rental_app.dvd
  SET title = in_title,
      production_year = in_year,
      type_id = in_type_id
  WHERE dvd_id = in_dvd_id;
END
$$

--
-- Создать процедуру `dvd_find`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd_find (IN find varchar(255))
BEGIN
  SELECT
    d.dvd_id,
    d.title,
    d.production_year,
    t.type,
    c.tel_number,
    c.first_name,
    c.last_name,
    re.offer_date
  FROM dvd_rental_app.dvd d
    JOIN dvd_rental_app.type t
      ON d.type_id = t.type_id
    LEFT OUTER JOIN (SELECT
        *
      FROM dvd_rental_app.rent
      WHERE return_date IS NULL) re
      ON (d.dvd_id = re.dvd_id)
    LEFT OUTER JOIN dvd_rental_app.customers c
      ON re.customer_id = c.customer_id
  WHERE title LIKE CONCAT('%', find, '%') -- find - подстрока, по которой ищется диск
  ORDER BY d.dvd_id;
END
$$

--
-- Создать процедуру `dvd_delete`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd_delete (IN id int)
BEGIN
  DELETE
    FROM dvd_rental_app.dvd
  WHERE dvd_id = id;
END
$$

--
-- Создать процедуру `dvd_create`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd_create (IN in_title varchar(255), IN in_year int, IN in_type_id int)
BEGIN
  INSERT INTO dvd_rental_app.dvd (title, production_year, type_id)
    VALUES (in_title, in_year, in_type_id);
END
$$

--
-- Создать процедуру `dvd_types`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE dvd_types ()
BEGIN
  SELECT
    *
  FROM dvd_rental_app.type;
END
$$

DELIMITER ;

-- 
-- Вывод данных для таблицы type
--
INSERT INTO type VALUES
(1, 'Film'),
(2, 'Videogame'),
(3, 'Music album'),
(4, 'TV series'),
(5, 'Animated film'),
(6, 'Animated series');

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
(1, 'Анжела', 'Большакова', '2021-10-07 23:57:40', '+79048478834', '2000-03-01'),
(2, 'Мария', 'Канюшкова', '2021-10-07 23:57:40', '+79387478289', '2001-05-18'),
(3, 'Дмитрий', 'Воробьёв', '2021-10-07 23:57:40', '+79823785873', '2003-07-28'),
(4, 'Елизавета', 'Киско', '2021-10-07 23:57:40', '+79823658833\r\n', '1998-01-21'),
(5, 'Денис', 'Призраков', '2021-10-07 23:57:40', '+79837528085', '1999-09-08');

-- 
-- Вывод данных для таблицы rent
--
INSERT INTO rent VALUES
(1, 1, 3, '2016-07-05 00:00:00', '2017-01-01 00:00:00'),
(2, 7, 5, '2015-04-19 00:00:00', NULL),
(3, 6, 1, '2021-10-07 23:57:40', '2021-12-10 20:16:00'),
(5, 25, 3, '2021-12-10 18:51:37', '2021-12-10 18:37:30'),
(6, 25, 4, '2021-12-10 18:51:37', NULL),
(7, 21, 2, '2021-12-10 19:06:12', '2021-12-10 18:37:30'),
(8, 21, 1, '2021-12-10 19:06:12', '2021-12-10 18:37:30'),
(9, 21, 1, '2021-12-10 19:10:34', NULL),
(11, 25, 2, '2021-12-10 19:28:52', '2021-12-10 18:37:30'),
(12, 1, 1, '2021-12-10 20:15:51', NULL);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;