-- /dvd
-- /dvd/find
-- Поиск дисков по подстроке
SELECT *
FROM dvd_rental_app.dvd
WHERE title LIKE '%find%'; -- find - подстрока, по которой ищется диск

-- dvd_rental_app.dvd_find(IN find VARCHAR(255))

-- /dvd/types
-- Взять все типы дисков с их именами
SELECT *
FROM dvd_rental_app.type;

-- dvd_rental_app.dvd_types();

-- /dvd/
-- Возвращает N самых новых и свободных dvd для отображения при открытии главной страницы
SELECT DISTINCT d.*
FROM dvd_rental_app.dvd d LEFT OUTER JOIN dvd_rental_app.rent r on d.dvd_id = r.dvd_id LEFT OUTER JOIN (SELECT * FROM dvd_rental_app.rent WHERE return_date IS NULL) re ON (d.dvd_id = re.dvd_id)
WHERE (r.offer_id IS NULL) OR (r.offer_id IS NOT NULL AND re.offer_id IS NULL)
ORDER BY d.dvd_id DESC
LIMIT 5;

-- dvd_rental_app.dvd();

-- /dvd/update
-- Принимает данные, среди которых есть id, и устанавливает их соответствующему диску
UPDATE dvd_rental_app.dvd
SET title = 'test', production_year = 1990, type_id = 1
WHERE dvd_id = 27;

-- dvd_rental_app.dvd_update(IN in_dvd_id INT, IN in_title VARCHAR(255), IN in_year INT, IN in_type_id INT)

-- /dvd/delete
-- Принимает id, удаляет соответствующий диск
DELETE FROM dvd_rental_app.dvd
WHERE dvd_id = 28;

-- dvd_rental_app.dvd_delete(IN id INT)

-- /dvd/create
-- Добавить новый диск (type_id возвращается с фронта так как мы передаем туда список типов на выбор)
INSERT INTO dvd_rental_app.dvd (title, production_year, type_id)
VALUES('title', 2000, 1);

-- dvd_rental_app.dvd_create(IN in_title VARCHAR(255), IN in_year INT, IN in_type_id INT)

-- /client
-- /client/create
-- Создает клиента
INSERT INTO dvd_rental_app.customers (first_name, last_name, tel_number, birthdate)
VALUES('first_name', 'last_name', '+78005553535', STR_TO_DATE('01.5.2013','%d.%m.%Y'));

-- dvd_rental_app.client_create(IN in_first_name VARCHAR(255), IN in_last_name VARCHAR(255), IN in_tel VARCHAR(255), IN in_birthdate VARCHAR(255))

-- /client/find
-- Найти пользователя по номеру телефона
SELECT *
FROM dvd_rental_app.customers
WHERE customers.tel_number LIKE '%find%'; -- find - подстрока, по которой ищется диск

-- dvd_rental_app.client_find(IN find VARCHAR(255))

-- /client/update
-- Принимает данные, среди которых есть номер телефона, и устанавливает их соответствующему клиенту
UPDATE dvd_rental_app.customers
SET first_name = 'f', last_name = 'l', birthdate = STR_TO_DATE('01.5.2013','%d.%m.%Y')
WHERE tel_number = '88005553535';

-- dvd_rental_app.client_update(IN in_first_name VARCHAR(255), IN in_last_name VARCHAR(255), IN in_birthdate VARCHAR(255), IN in_tel VARCHAR(255))

-- /client/delete
-- Принимает номер телефона, удаляет соответствующего клиента
DELETE FROM dvd_rental_app.customers
WHERE tel_number = '88005553535';

-- dvd_rental_app.client_delete(IN in_tel VARCHAR(255))

-- /rent
-- /rent/add
-- Создать новую запись об аренде
INSERT INTO dvd_rental_app.rent (dvd_id, customer_id)
VALUES(1, 1);

-- dvd_rental_app.rent_add(IN in_dvd_id INT, IN in_customer_id INT)

-- /rent/return
-- Поставить дату возврата на запись об аренде
UPDATE dvd_rental_app.rent
SET return_date = CURRENT_TIMESTAMP()
WHERE offer_id = 3;

-- dvd_rental_app.rent_return(IN in_offer_id INT)