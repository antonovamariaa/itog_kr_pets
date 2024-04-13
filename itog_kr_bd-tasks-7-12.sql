-- выбрать созданную базу данных
USE man_friends;

-- 8 создать таблицы необходимые для дальнейшей работы

DROP TABLE IF EXISTS man_friends.cats;
CREATE TABLE man_friends.cats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);


DROP TABLE IF EXISTS man_friends.dogs;
CREATE TABLE man_friends.dogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);


DROP TABLE IF EXISTS man_friends.hamsters;
CREATE TABLE man_friends.hamsters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);

DROP TABLE IF EXISTS man_friends.horses;
CREATE TABLE man_friends.horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);

DROP TABLE IF EXISTS man_friends.donkeys;
CREATE TABLE man_friends.donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);

DROP TABLE IF EXISTS man_friends.camels;
CREATE TABLE man_friends.camels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    a_name VARCHAR(100) ,
    b_date DATE,
    commands VARCHAR(150) ,
    a_type VARCHAR(45)
);


-- 9 заполнить таблицы значениями

INSERT INTO man_friends.cats (a_name, b_date, commands, a_type) VALUES
('Пушок', '2017-10-20', 'есть, спать', 'домашнее'),
('Облачко', '2023-01-16', 'охотиться', 'домашнее'),
('Конь', '2020-03-01', 'бежать, стоп, перестань', 'домашнее'),
('Ракетка', '2017-06-14', 'бежать', 'домашнее');

INSERT INTO man_friends.dogs (a_name, b_date, commands, a_type) VALUES
('Шарик', '2019-04-09', 'прыгать, перевернуться, сальто, сидеть, дать лапу', 'домашнее'),
('Бусинка', '2023-02-25', 'крутиться', 'домашнее');

INSERT INTO man_friends.hamsters (a_name, b_date, commands, a_type) VALUES
('Том', '2023-12-03', 'прыгать, перевернуться', 'домашнее'),
('Брайан', '2022-12-29', 'крутиться', 'домашнее');

INSERT INTO man_friends.horses (a_name, b_date, commands, a_type) VALUES
('Святозар', '2024-01-01', 'сесть, галоп, рысь, остановиться', 'вьючное'),
('Светослав', '2018-02-04', 'есть, проснуться, рысь', 'вьючное');

INSERT INTO man_friends.donkeys (a_name, b_date, commands, a_type) VALUES
('Картошка', '2011-10-16', 'прыгать', 'вьючное'),
('Огурец', '2022-12-11', 'бежать', 'вьючное'),
('Шашлык', '2015-05-08', 'лежать', 'вьючное');

INSERT INTO man_friends.camels (a_name, b_date, commands, a_type) VALUES
('Василий', '2010-12-09', 'бежать, остановиться, спать, проснуться, есть, сесть, встать, сальто', 'вьючное'),
('Иван', '1999-08-09', 'бежать, подать ногу, проснуться', 'вьючное'),
('Камилла', '2001-05-15', 'есть, спать', 'вьючное');


-- 10 удалить верблюдов, объединить лошадей с ослами

DROP TABLE camels;

DROP TABLE IF EXISTS not_home;
CREATE TABLE not_home AS
SELECT a_name, b_date, commands, a_type,  'horse' AS type FROM horses
UNION ALL
SELECT a_name, b_date, commands, a_type,  'donkey' AS type FROM donkeys;

-- 12 объединить все таблицы в одну, сохраняя принадлежность к старым таблицам

DROP TABLE IF EXISTS all_animals;
CREATE TABLE all_animals AS
SELECT a_name, b_date, commands, a_type,  type AS type FROM not_home
UNION ALL
SELECT a_name, b_date, commands, a_type,  'dog' AS type FROM dogs
UNION ALL
SELECT a_name, b_date, commands, a_type,  'cat' AS type FROM cats
UNION ALL
SELECT a_name, b_date, commands, a_type,  'hamster' AS type FROM hamsters;

-- 11 создать таблицу "молодые животные", куда попадут животные от 1 до 3 лет, посчитать их возраст в месяцах

DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals AS
SELECT *, TIMESTAMPDIFF(MONTH, b_date, CURDATE()) AS age_in_months
FROM all_animals
WHERE TIMESTAMPDIFF(YEAR, b_date, CURDATE()) BETWEEN 1 AND 2;
