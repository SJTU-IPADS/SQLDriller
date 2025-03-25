SELECT count(*) FROM singer	concert_singer
SELECT count(*) FROM singer	concert_singer
SELECT name, country, age FROM singer ORDER BY age DESC, Singer_ID ASC	concert_singer
SELECT name, country, age FROM singer ORDER BY age DESC, Singer_ID ASC	concert_singer
SELECT avg(age) , min(age) , max(age) FROM singer WHERE country = 'France'	concert_singer
SELECT avg(age) , min(age) , max(age) FROM singer WHERE country = 'France'	concert_singer
SELECT song_name, song_release_year FROM singer WHERE age = (SELECT MIN(age) FROM singer)	concert_singer
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)	concert_singer
SELECT DISTINCT country FROM singer WHERE age > 20	concert_singer
SELECT DISTINCT country FROM singer WHERE age > 20	concert_singer
SELECT country , count(*) FROM singer GROUP BY country	concert_singer
SELECT country , count(*) FROM singer GROUP BY country	concert_singer
SELECT DISTINCT song_name FROM singer WHERE age > (SELECT avg(age) FROM singer)	concert_singer
SELECT DISTINCT song_name FROM singer WHERE age > (SELECT avg(age) FROM singer)	concert_singer
SELECT LOCATION , name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
SELECT LOCATION , name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
SELECT MAX(Capacity), AVG(Capacity) FROM stadium	concert_singer
select avg(capacity) , max(capacity) from stadium	concert_singer
SELECT name, capacity FROM stadium ORDER BY average DESC, Stadium_ID ASC LIMIT 1	concert_singer
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium)	concert_singer
SELECT count(*) FROM concert WHERE YEAR = 2014 OR YEAR = 2015	concert_singer
SELECT count(*) FROM concert WHERE YEAR = 2014 OR YEAR = 2015	concert_singer
SELECT s.name as StadiumName, (SELECT COUNT(*) FROM concert WHERE stadium_id = s.stadium_id) AS NumberOfConcerts FROM stadium s	concert_singer
SELECT s.stadium_id, COUNT(c.concert_id) AS concert_count FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id GROUP BY s.stadium_id	concert_singer
SELECT T2.name , T2.capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id = T2.stadium_id WHERE T1.year >= 2014 GROUP BY T2.stadium_id HAVING COUNT(*) = (SELECT COUNT(*) AS c FROM concert AS T3 JOIN stadium AS T4 ON T3.stadium_id = T4.stadium_id WHERE T3.year >= 2014 GROUP BY T4.stadium_id ORDER BY c desc LIMIT 1)	concert_singer
SELECT first.name, first.capacity FROM (SELECT s.name, s.capacity FROM stadium s, concert c WHERE s.stadium_id = c.stadium_id AND c.year > 2013 GROUP BY s.stadium_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM concert GROUP BY stadium_id) as subquery)) AS first	concert_singer
SELECT Year FROM concert GROUP BY Year HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM concert GROUP BY Year) AS max_count)	concert_singer
SELECT Year FROM concert GROUP BY Year HAVING count(*) = (SELECT count(*) as cnt FROM concert GROUP BY Year ORDER BY cnt DESC LIMIT 1)	concert_singer
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
SELECT country FROM singer WHERE age > 40 INTERSECT SELECT country FROM singer WHERE age < 30	concert_singer
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert WHERE year = 2014)	concert_singer
SELECT s.name FROM stadium s WHERE s.stadium_id NOT IN (SELECT c.stadium_id FROM concert c WHERE c.year = 2014)	concert_singer
SELECT concert_name, theme, (SELECT COUNT(*) FROM singer_in_concert WHERE singer_in_concert.concert_id = concert.concert_id) AS number_of_singers FROM concert	concert_singer
SELECT concert.concert_name, concert.theme, COUNT(DISTINCT sic.singer_id) num_singers FROM concert LEFT JOIN singer_in_concert sic ON concert.concert_id = sic.concert_id GROUP BY concert.concert_id, concert.concert_name, concert.theme	concert_singer
SELECT name as SingerName, (SELECT COUNT(*) FROM singer_in_concert WHERE singer_id = singer.singer_id) as ConcertCount FROM singer	concert_singer
SELECT T2.name , count(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id = T2.singer_id GROUP BY T2.singer_id	concert_singer
SELECT DISTINCT T2.name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id = T2.singer_id JOIN concert AS T3 ON T1.concert_id = T3.concert_id WHERE T3.year = 2014	concert_singer
SELECT DISTINCT T2.name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id = T2.singer_id JOIN concert AS T3 ON T1.concert_id = T3.concert_id WHERE T3.year = 2014	concert_singer
SELECT name, country FROM singer WHERE INSTR(song_name, 'Hey') > 0	concert_singer
SELECT name, country FROM singer WHERE instr(song_name, 'Hey') > 0	concert_singer
SELECT Name, Location FROM stadium where Stadium_ID in (SELECT Stadium_ID FROM concert WHERE year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE year = 2015)	concert_singer
SELECT Name, Location FROM stadium where Stadium_ID in (SELECT Stadium_ID FROM concert WHERE year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE year = 2015)	concert_singer
SELECT COUNT(c.concert_id) FROM concert AS c JOIN stadium AS s ON c.stadium_id = s.stadium_id WHERE s.capacity = (SELECT MAX(capacity) FROM stadium)	concert_singer
SELECT COUNT(concert.concert_id) FROM concert JOIN stadium ON concert.stadium_id = stadium.stadium_id WHERE stadium.capacity = (SELECT MAX(capacity) FROM stadium)	concert_singer
SELECT count(*) FROM pets WHERE weight > 10	pets_1
SELECT count(*) FROM pets WHERE weight > 10	pets_1
SELECT weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog') AND PetType = 'dog'	pets_1
SELECT weight FROM pets WHERE pet_age = (SELECT MIN(pet_age) FROM pets WHERE PetType = 'dog') AND PetType = 'dog'	pets_1
SELECT max(weight) , petType FROM pets GROUP BY petType	pets_1
SELECT max(weight) , petType FROM pets GROUP BY petType	pets_1
SELECT COUNT(DISTINCT hp.petid) FROM has_pet hp INNER JOIN student s ON hp.stuid = s.stuid WHERE s.age > 20	pets_1
SELECT COUNT(*) FROM pets WHERE petid IN (SELECT petid FROM has_pet WHERE stuid IN (SELECT stuid FROM student WHERE age > 20));	pets_1
SELECT COUNT(DISTINCT pets.petid) FROM student, has_pet, pets WHERE student.stuid = has_pet.stuid AND has_pet.petid = pets.petid AND student.sex = 'F' AND pets.pettype = 'dog'	pets_1
SELECT count(DISTINCT T3.PetID) FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T2.petid = T3.petid WHERE T1.sex = 'F' AND T3.pettype = 'dog'	pets_1
SELECT count(DISTINCT pettype) FROM pets	pets_1
SELECT count(DISTINCT pettype) FROM pets	pets_1
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' OR pettype = 'dog'))	pets_1
SELECT T1.Fname FROM student AS T1 WHERE T1.StuID IN (SELECT T2.StuID FROM has_pet AS T2 JOIN pets AS T3 ON T3.petid = T2.petid WHERE T3.pettype = 'cat' OR T3.pettype = 'dog')	pets_1
SELECT s.fname FROM student s WHERE s.stuid IN (SELECT hp.stuid FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE p.pettype = 'cat') AND s.stuid IN (SELECT hp.stuid FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE p.pettype = 'dog')	pets_1
SELECT s.fname FROM student s WHERE StuID in (SELECT hp.StuID FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE p.pettype IN ('cat', 'dog') GROUP BY hp.StuID HAVING COUNT(DISTINCT p.pettype) = 2)	pets_1
SELECT major , age FROM student WHERE stuid NOT IN (SELECT T1.stuid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T3.petid = T2.petid WHERE T3.pettype = 'cat')	pets_1
SELECT major , age FROM student WHERE stuid NOT IN (SELECT T1.stuid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T3.petid = T2.petid WHERE T3.pettype = 'cat')	pets_1
SELECT stuid FROM student EXCEPT SELECT T1.stuid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T3.petid = T2.petid WHERE T3.pettype = 'cat'	pets_1
SELECT stuid FROM student EXCEPT SELECT T1.stuid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T3.petid = T2.petid WHERE T3.pettype = 'cat'	pets_1
SELECT s.fname, s.age FROM student s WHERE EXISTS (SELECT 1 FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'dog' AND has_pet.stuid = s.stuid) AND NOT EXISTS (SELECT 1 FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'cat' AND has_pet.stuid = s.stuid)	pets_1
SELECT s1.fname FROM student s1 WHERE EXISTS (SELECT * FROM has_pet hp1 JOIN pets p1 ON hp1.petid = p1.petid WHERE p1.pettype = 'dog' AND hp1.stuid = s1.stuid) AND NOT EXISTS (SELECT * FROM has_pet hp2 JOIN pets p2 ON hp2.petid = p2.petid WHERE p2.pettype = 'cat' AND hp2.stuid = s1.stuid)	pets_1
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)	pets_1
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)	pets_1
SELECT petid , weight FROM pets WHERE pet_age > 1	pets_1
SELECT petid , weight FROM pets WHERE pet_age > 1	pets_1
SELECT avg(pet_age) , max(pet_age) , pettype FROM pets GROUP BY pettype	pets_1
SELECT avg(pet_age) , max(pet_age) , pettype FROM pets GROUP BY pettype	pets_1
SELECT avg(weight) , pettype FROM pets GROUP BY pettype	pets_1
SELECT avg(weight) , pettype FROM pets GROUP BY pettype	pets_1
SELECT fname, age FROM student WHERE stuid IN (SELECT stuid FROM has_pet);	pets_1
SELECT DISTINCT T1.fname , T1.age FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid	pets_1
SELECT petid FROM pets WHERE petid IN (SELECT petid FROM has_pet JOIN student ON has_pet.stuid = student.stuid WHERE lname = 'Smith')	pets_1
SELECT petid FROM pets WHERE petid IN (SELECT petid FROM has_pet WHERE stuid IN (SELECT stuid FROM student WHERE lname = 'Smith'))	pets_1
SELECT count(*) , T1.stuid FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid GROUP BY T1.stuid	pets_1
select count(*) , t1.stuid from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t1.stuid	pets_1
SELECT T1.fname , T1.sex FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid GROUP BY T1.stuid HAVING count(*) > 1	pets_1
SELECT T1.fname , T1.sex FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid = T2.stuid GROUP BY T1.stuid HAVING count(*) > 1	pets_1
SELECT lname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' AND pet_age = 3))	pets_1
SELECT lname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' AND pet_age = 3))	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1
SELECT count(*) FROM CONTINENTS;	car_1
SELECT count(*) FROM CONTINENTS;	car_1
SELECT a.contid, a.continent, COALESCE(b.num_countries, 0) AS num_countries FROM continents a LEFT JOIN (SELECT continent, COUNT(*) AS num_countries FROM countries GROUP BY continent) b ON a.contid = b.continent	car_1
SELECT contid, continent, (SELECT COUNT(*) FROM countries WHERE continent = continents.contid) AS country_count FROM continents;	car_1
SELECT count(*) FROM COUNTRIES;	car_1
SELECT count(*) FROM COUNTRIES;	car_1
SELECT fullName, id, (SELECT COUNT(*) FROM model_list WHERE model_list.maker = car_makers.id) AS model_count FROM car_makers	car_1
SELECT id, fullname, (SELECT COUNT(modelid) FROM model_list WHERE model_list.maker = car_makers.id) AS TotalModels FROM car_makers	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.horsepower = (SELECT min(T3.Horsepower) FROM CARS_DATA AS T3)	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.horsepower = (SELECT min(T3.Horsepower) FROM CARS_DATA AS T3)	car_1
SELECT T1.model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Weight < (SELECT avg(Weight) FROM CARS_DATA)	car_1
SELECT T1.ModelId FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Weight < (SELECT AVG(Weight) FROM cars_data)	car_1
SELECT T1.FullName FROM CAR_MAKERS AS T1 WHERE T1.Id IN (SELECT T2.Maker FROM MODEL_LIST AS T2 JOIN CAR_NAMES AS T3 ON T2.model = T3.model JOIN CARS_DATA AS T4 ON T3.MakeId = T4.id WHERE T4.year = '1970');	car_1
SELECT T1.FullName FROM CAR_MAKERS AS T1 WHERE T1.Id IN (SELECT T2.Maker FROM MODEL_LIST AS T2 JOIN CAR_NAMES AS T3 ON T2.model = T3.model JOIN CARS_DATA AS T4 ON T3.MakeId = T4.id WHERE T4.year = '1970');	car_1
SELECT T2.Make , T1.Year FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T1.Year = (SELECT min(YEAR) FROM CARS_DATA);	car_1
SELECT T4.FullName , T1.Year FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T1.Year = (SELECT min(YEAR) FROM CARS_DATA);	car_1
SELECT DISTINCT T1.model FROM MODEL_LIST AS T1 JOIN CAR_NAMES AS T2 ON T1.model = T2.model JOIN CARS_DATA AS T3 ON T2.MakeId = T3.id WHERE T3.year > 1980;	car_1
SELECT DISTINCT T1.ModelId, T1.Model FROM MODEL_LIST AS T1 JOIN CAR_NAMES AS T2 ON T1.Model = T2.Model JOIN CARS_DATA AS T3 ON T2.MakeId = T3.Id WHERE T3.Year > 1980	car_1
SELECT T1.Continent, count(*) FROM CONTINENTS AS T1 JOIN COUNTRIES AS T2 ON T1.ContId = T2.continent JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.ContId;	car_1
SELECT cont.continent, numMakers FROM (SELECT contid, COUNT(DISTINCT car_makers.id) as numMakers FROM continents LEFT JOIN countries ON continents.contid = countries.continent LEFT JOIN car_makers ON car_makers.country = countries.countryid GROUP BY contid) AS subquery JOIN continents cont ON cont.contid = subquery.contid	car_1
SELECT c.countryname FROM countries c WHERE c.countryid IN (SELECT cm.country FROM car_makers cm GROUP BY cm.country HAVING COUNT(cm.maker) = (SELECT MAX(counted) FROM (SELECT COUNT(maker) AS counted FROM car_makers GROUP BY country)))	car_1
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T1.Country, T2.CountryName HAVING COUNT(*) = (SELECT MAX(car_count) FROM (SELECT COUNT(*) as car_count FROM car_makers GROUP BY Country) as counts)	car_1
select count(*) , t2.fullname from model_list as t1 join car_makers as t2 on t1.maker = t2.id group by t2.id;	car_1
SELECT cm.id, cm.fullname, (SELECT COUNT(*) FROM model_list WHERE model_list.maker = cm.id) AS model_count FROM car_makers cm GROUP BY cm.id, cm.fullname	car_1
SELECT T1.Accelerate FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'amc hornet sportabout (sw)';	car_1
SELECT T1.Accelerate FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'amc hornet sportabout (sw)';	car_1
SELECT count(*) FROM CAR_MAKERS AS T1 JOIN COUNTRIES AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'france';	car_1
SELECT count(*) FROM CAR_MAKERS AS T1 JOIN COUNTRIES AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'France';	car_1
SELECT count(*) FROM MODEL_LIST AS T1 JOIN CAR_MAKERS AS T2 ON T1.Maker = T2.Id JOIN COUNTRIES AS T3 ON T2.Country = T3.CountryId WHERE T3.CountryName = 'usa';	car_1
SELECT count(*) FROM MODEL_LIST AS T1 JOIN CAR_MAKERS AS T2 ON T1.Maker = T2.Id JOIN COUNTRIES AS T3 ON T2.Country = T3.CountryId WHERE T3.CountryName = 'usa';	car_1
SELECT avg(mpg) FROM CARS_DATA WHERE Cylinders  =  4;	car_1
SELECT avg(mpg) FROM CARS_DATA WHERE Cylinders = 4;	car_1
select min(weight) from cars_data where cylinders = 8 and year = 1974	car_1
select min(weight) from cars_data where cylinders  =  8 and year  =  1974	car_1
SELECT T2.FullName , T1.Model FROM MODEL_LIST AS T1 JOIN CAR_MAKERS AS T2 ON T1.Maker = T2.Id;	car_1
SELECT T2.FullName , T1.Model FROM MODEL_LIST AS T1 JOIN CAR_MAKERS AS T2 ON T1.Maker = T2.Id;	car_1
SELECT T1.CountryName , T1.CountryId FROM COUNTRIES AS T1 JOIN CAR_MAKERS AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING count(*) >= 1;	car_1
SELECT T1.CountryName , T1.CountryId FROM COUNTRIES AS T1 JOIN CAR_MAKERS AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING count(*) >= 1;	car_1
SELECT count(*) FROM CARS_DATA WHERE horsepower > 150;	car_1
SELECT count(*) FROM CARS_DATA WHERE horsepower > 150;	car_1
SELECT avg(Weight) , YEAR FROM CARS_DATA GROUP BY YEAR;	car_1
SELECT avg(Weight), YEAR FROM CARS_DATA GROUP BY YEAR;	car_1
SELECT T1.CountryName FROM COUNTRIES AS T1 JOIN CONTINENTS AS T2 ON T1.Continent = T2.ContId JOIN CAR_MAKERS AS T3 ON T1.CountryId = T3.Country WHERE T2.Continent = 'europe' GROUP BY T1.CountryId HAVING count(*) >= 3;	car_1
SELECT T1.CountryName FROM COUNTRIES AS T1 JOIN CONTINENTS AS T2 ON T1.Continent = T2.ContId JOIN CAR_MAKERS AS T3 ON T1.CountryId = T3.Country WHERE T2.Continent = 'europe' GROUP BY T1.CountryId HAVING count(*) >= 3;	car_1
SELECT T2.horsepower, T1.Make FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.cylinders = 3 and T2.Horsepower = (SELECT max(T3.Horsepower) FROM cars_data AS T3)	car_1
SELECT T2.horsepower, T1.Make FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.cylinders = 3 and T2.Horsepower = (SELECT max(T3.Horsepower) FROM cars_data AS T3)	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.MPG = (SELECT max(T3.MPG) FROM CARS_DATA AS T3)	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.MPG = (SELECT max(T3.MPG) FROM CARS_DATA AS T3)	car_1
SELECT avg(horsepower) FROM CARS_DATA WHERE YEAR < 1980;	car_1
select avg(horsepower) from cars_data where year < 1980;	car_1
SELECT avg(T2.edispl) FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo';	car_1
SELECT avg(T2.edispl) FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo';	car_1
SELECT max(Accelerate) , Cylinders FROM CARS_DATA GROUP BY Cylinders;	car_1
SELECT max(Accelerate) , Cylinders FROM CARS_DATA GROUP BY Cylinders;	car_1
SELECT T2.ModelId FROM CAR_NAMES AS T1 JOIN MODEL_LIST AS T2 ON T1.Model = T2.Model GROUP BY T2.Model HAVING count(DISTINCT T1.Make) = (SELECT max(cnt) FROM (SELECT count(DISTINCT T3.Make) AS cnt FROM CAR_NAMES AS T3 JOIN MODEL_LIST AS T4 ON T3.Model = T4.Model GROUP BY T4.Model));	car_1
SELECT T2.ModelId FROM CAR_NAMES AS T1 JOIN MODEL_LIST AS T2 ON T1.Model = T2.Model GROUP BY T2.Model HAVING count(DISTINCT T1.Make) = (SELECT max(cnt) FROM (SELECT count(DISTINCT T3.Make) AS cnt FROM CAR_NAMES AS T3 JOIN MODEL_LIST AS T4 ON T3.Model = T4.Model GROUP BY T4.Model));	car_1
SELECT count(*) FROM CARS_DATA WHERE Cylinders > 4;	car_1
SELECT count(*) FROM CARS_DATA WHERE Cylinders  >  4;	car_1
SELECT count(*) FROM CARS_DATA WHERE YEAR = 1980;	car_1
SELECT count(*) FROM CARS_DATA WHERE YEAR = 1980;	car_1
SELECT count(*) FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company';	car_1
SELECT count(*) FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company';	car_1
SELECT T1.FullName , T1.Id FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING count(*) > 3;	car_1
SELECT T1.FullName , T1.Id FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING count(*) > 3;	car_1
SELECT DISTINCT model FROM model_list WHERE maker IN (SELECT id FROM car_makers WHERE fullname = 'General Motors') OR model IN (SELECT cn.model FROM car_names cn JOIN cars_data cd ON cn.makeid = cd.id WHERE cd.weight > 3500)	car_1
SELECT DISTINCT T2.Model FROM CAR_NAMES AS T1 JOIN MODEL_LIST AS T2 ON T1.Model = T2.Model JOIN CAR_MAKERS AS T3 ON T2.Maker = T3.Id JOIN CARS_DATA AS T4 ON T1.MakeId = T4.Id WHERE T3.FullName = 'General Motors' OR T4.weight > 3500;	car_1
select distinct year from cars_data where weight between 3000 and 4000;	car_1
SELECT year FROM (SELECT year FROM cars_data WHERE weight > 3000 INTERSECT SELECT year FROM cars_data WHERE weight < 4000)	car_1
SELECT d.horsepower FROM cars_data AS d WHERE d.accelerate = (SELECT MAX(accelerate) FROM cars_data)	car_1
SELECT T1.horsepower FROM CARS_DATA AS T1 WHERE T1.accelerate = (SELECT MAX(T2.accelerate) FROM CARS_DATA AS T2)	car_1
SELECT Distinct T1.cylinders FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo' and T1.Accelerate = (SELECT min(T3.Accelerate) FROM cars_data AS T3)	car_1
SELECT Distinct T1.cylinders FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo' and T1.Accelerate = (SELECT min(T3.Accelerate) FROM cars_data AS T3)	car_1
SELECT COUNT(*) FROM CARS_DATA WHERE Accelerate > (SELECT min(Accelerate) FROM CARS_DATA WHERE Horsepower = (SELECT max(Horsepower) FROM cars_data));	car_1
SELECT COUNT(*) FROM CARS_DATA WHERE Accelerate > (SELECT min(Accelerate) FROM CARS_DATA WHERE Horsepower = (SELECT max(Horsepower) FROM cars_data));	car_1
SELECT COUNT(*) FROM (SELECT country FROM car_makers GROUP BY country HAVING COUNT(maker) > 2)	car_1
SELECT COUNT(DISTINCT c.countryid) FROM countries c INNER JOIN car_makers cm ON c.countryid = cm.country GROUP BY c.countryid HAVING COUNT(cm.id) > 2	car_1
SELECT COUNT(*) FROM CARS_DATA WHERE Cylinders  >  6;	car_1
SELECT COUNT(*) FROM CARS_DATA WHERE Cylinders > 6;	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 4 AND T2.horsepower = (SELECT max(T3.Horsepower) FROM CARS_DATA AS T3 WHERE T3.Cylinders = 4)	car_1
SELECT DISTINCT T1.Model FROM CAR_NAMES AS T1 JOIN CARS_DATA AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 4 AND T2.horsepower = (SELECT max(T3.Horsepower) FROM CARS_DATA AS T3 WHERE T3.Cylinders = 4)	car_1
SELECT T2.MakeId , T2.Make FROM CARS_DATA AS T1 JOIN CAR_NAMES AS T2 ON T1.Id = T2.MakeId WHERE T1.Horsepower > (SELECT min(Horsepower) FROM CARS_DATA) AND T1.Cylinders <= 3;	car_1
select t2.makeid , t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.horsepower > (select min(horsepower) from cars_data) and t1.cylinders < 4;	car_1
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1
SELECT DISTINCT T1.ModelId FROM MODEL_LIST AS T1 JOIN CAR_NAMES AS T2 ON T1.Model = T2.Model JOIN CARS_DATA AS T3 ON T2.MakeId = T3.Id JOIN CAR_MAKERS AS T4 ON T1.Maker = T4.Id WHERE T3.weight < 3500 AND T4.FullName != 'Ford Motor Company'	car_1
SELECT DISTINCT T1.model FROM MODEL_LIST AS T1 JOIN CAR_NAMES AS T2 ON T1.Model = T2.Model JOIN CARS_DATA AS T3 ON T2.MakeId = T3.Id JOIN CAR_MAKERS AS T4 ON T1.Maker = T4.Id WHERE T3.weight < 3500 AND T4.FullName != 'Ford Motor Company';	car_1
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)	car_1
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)	car_1
select t1.id , t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) >= 2 intersect select t1.id , t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker join car_names as t3 on t2.model = t3.model group by t1.id having count(*) > 3;	car_1
SELECT T1.Id , T1.Maker FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING count(*) >= 2 INTERSECT SELECT T1.Id , T1.Maker FROM CAR_MAKERS AS T1 JOIN MODEL_LIST AS T2 ON T1.Id = T2.Maker JOIN CAR_NAMES AS T3 ON T2.model = T3.model GROUP BY T1.Id HAVING count(*) > 3;	car_1
SELECT T1.countryId , T1.CountryName FROM Countries AS T1 JOIN CAR_MAKERS AS T2 ON T1.CountryId = T2.Country GROUP BY T1.countryId HAVING count(*) > 3 UNION SELECT T1.countryId , T1.CountryName FROM Countries AS T1 JOIN CAR_MAKERS AS T2 ON T1.CountryId = T2.Country JOIN MODEL_LIST AS T3 ON T2.Id = T3.Maker WHERE T3.Model = 'fiat';	car_1
select t1.countryid , t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryid having count(*) > 3 union select t1.countryid , t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country join model_list as t3 on t2.id = t3.maker where t3.model = 'fiat';	car_1
SELECT Country FROM AIRLINES WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Country FROM AIRLINES WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM AIRLINES WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM AIRLINES WHERE Airline = 'JetBlue Airways'	flight_2
SELECT DISTINCT Airline , Abbreviation FROM AIRLINES WHERE Country = 'USA'	flight_2
SELECT Airline , Abbreviation FROM AIRLINES WHERE Country = 'USA'	flight_2
SELECT AirportCode , AirportName FROM AIRPORTS WHERE city = 'Anthony'	flight_2
SELECT AirportCode , AirportName FROM AIRPORTS WHERE city = 'Anthony'	flight_2
SELECT count(*) FROM AIRLINES	flight_2
SELECT count(*) FROM AIRLINES	flight_2
SELECT count(*) FROM AIRPORTS	flight_2
SELECT count(*) FROM AIRPORTS	flight_2
SELECT count(*) FROM FLIGHTS	flight_2
SELECT count(*) FROM FLIGHTS	flight_2
SELECT Airline FROM AIRLINES WHERE Abbreviation = 'UAL'	flight_2
SELECT Airline FROM AIRLINES WHERE Abbreviation = 'UAL'	flight_2
SELECT count(*) FROM AIRLINES WHERE Country = 'USA'	flight_2
SELECT count(*) FROM AIRLINES WHERE Country  =  'USA'	flight_2
SELECT City , Country FROM AIRPORTS WHERE AirportName = 'Alton'	flight_2
SELECT City , Country FROM AIRPORTS WHERE AirportName = 'Alton'	flight_2
SELECT AirportName FROM AIRPORTS WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM AIRPORTS WHERE AirportCode = 'AKO'	flight_2
SELECT DISTINCT AirportName FROM AIRPORTS WHERE City = 'Aberdeen'	flight_2
SELECT AirportName FROM AIRPORTS WHERE City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS WHERE SourceAirport = 'APG'	flight_2
SELECT count(*) FROM FLIGHTS WHERE SourceAirport = 'APG'	flight_2
SELECT count(*) FROM FLIGHTS WHERE DestAirport  =  'ATO'	flight_2
SELECT count(*) FROM FLIGHTS WHERE DestAirport = 'ATO'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode JOIN AIRPORTS AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.City = 'Ashley' AND T3.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode JOIN AIRPORTS AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.City = 'Ashley' AND T3.City = 'Aberdeen'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRLINES AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRLINES AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways'	flight_2
SELECT count(*) FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T2.Airline = T1.uid WHERE T1.Airline = 'United Airlines' AND T2.DestAirport = 'ASY'	flight_2
SELECT count(*) FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T2.Airline = T1.uid WHERE T1.Airline = 'United Airlines' AND T2.DestAirport = 'ASY'	flight_2
SELECT count(*) FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T2.Airline = T1.uid WHERE T1.Airline = 'United Airlines' AND T2.SourceAirport = 'AHD'	flight_2
SELECT count(*) FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T2.Airline = T1.uid WHERE T1.Airline = 'United Airlines' AND T2.SourceAirport = 'AHD'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode JOIN AIRLINES AS T3 ON T3.uid = T1.Airline WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines'	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode JOIN AIRLINES AS T3 ON T3.uid = T1.Airline WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines'	flight_2
SELECT T1.City FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City HAVING COUNT(*) = (SELECT MAX(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM AIRPORTS AS T3 JOIN FLIGHTS AS T4 ON T3.AirportCode = T4.DestAirport GROUP BY T3.City) AS subquery)	flight_2
SELECT T1.City FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City HAVING COUNT(*) = (SELECT MAX(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM AIRPORTS AS T3 JOIN FLIGHTS AS T4 ON T3.AirportCode = T4.DestAirport GROUP BY T3.City) AS subquery)	flight_2
SELECT T1.City FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City HAVING count(*) = (SELECT MAX(Cnt) FROM (SELECT count(*) as Cnt FROM AIRPORTS JOIN FLIGHTS ON AirportCode = SourceAirport GROUP BY City) as maxTable)	flight_2
SELECT T1.City FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City HAVING count(*) = (SELECT MAX(Cnt) FROM (SELECT count(*) as Cnt FROM AIRPORTS JOIN FLIGHTS ON AirportCode = SourceAirport GROUP BY City) as maxTable)	flight_2
WITH CombinedAirports AS (SELECT sourceairport AS airportcode FROM flights UNION ALL SELECT destairport AS airportcode FROM flights) SELECT airportcode FROM CombinedAirports GROUP BY airportcode HAVING COUNT(airportcode) = (SELECT MAX(Count) FROM (SELECT COUNT(airportcode) AS Count FROM CombinedAirports GROUP BY airportcode))	flight_2
SELECT combined.airport FROM (SELECT sourceairport AS airport FROM flights UNION ALL SELECT destairport AS airport FROM flights) combined GROUP BY combined.airport HAVING COUNT(*) = (SELECT max(C) FROM (SELECT COUNT(*) AS C FROM (SELECT sourceairport AS airport FROM flights UNION ALL SELECT destairport AS airport FROM flights) t GROUP BY t.airport))	flight_2
SELECT airportcode FROM ( SELECT sourceairport AS airportcode FROM flights UNION ALL SELECT destairport FROM flights ) AllFlights GROUP BY airportcode HAVING COUNT(*) = (SELECT MIN(Count) FROM ( SELECT COUNT(*) AS Count FROM ( SELECT sourceairport AS airportcode FROM flights UNION ALL SELECT destairport FROM flights ) GROUPED GROUP BY airportcode ))	flight_2
SELECT T1.AirportCode FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.DestAirport OR T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode HAVING COUNT(*) = (SELECT MIN(C) FROM (SELECT COUNT(*) AS C FROM AIRPORTS AS T1 JOIN FLIGHTS AS T2 ON T1.AirportCode = T2.DestAirport OR T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode) AS max_count)	flight_2
SELECT airline FROM airlines WHERE uid IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(flightno) = (SELECT MAX(cnt) FROM (SELECT COUNT(flightno) AS cnt FROM flights GROUP BY airline)))	flight_2
SELECT T1.Airline FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING count(*) = (SELECT MAX(FlightCount) FROM (SELECT count(*) AS FlightCount FROM FLIGHTS GROUP BY Airline) AS SubQuery)	flight_2
SELECT T1.Abbreviation, T1.Country FROM AIRLINES AS T1 JOIN FLIGHTS AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid, T1.Abbreviation, T1.Country HAVING COUNT(*) = (SELECT MIN(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM FLIGHTS GROUP BY Airline) AS Temp)	flight_2
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid, T1.Abbreviation, T1.Country HAVING COUNT(*) = (SELECT MIN(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM flights GROUP BY Airline) AS subquery)	flight_2
SELECT airline FROM airlines WHERE uid IN (SELECT airline FROM flights WHERE sourceairport = 'AHD')	flight_2
SELECT T1.Airline FROM airlines as T1 WHERE T1.uid in (SELECT T2.Airline FROM flights as T2 WHERE T2.sourceairport = 'AHD')	flight_2
SELECT airline FROM airlines WHERE uid IN (SELECT DISTINCT airline FROM flights WHERE destairport = 'AHD')	flight_2
SELECT T1.Airline FROM airlines as T1 WHERE T1.uid in (SELECT T2.Airline FROM flights as T2 WHERE T2.sourceairport = 'AHD')	flight_2
SELECT al.airline FROM airlines al WHERE EXISTS (SELECT 1 FROM flights f WHERE f.airline = al.uid AND f.sourceairport = 'APG') AND EXISTS (SELECT 1 FROM flights f WHERE f.airline = al.uid AND f.sourceairport = 'CVO')	flight_2
SELECT al.airline FROM airlines al WHERE al.uid IN (SELECT airline FROM flights WHERE sourceairport = 'APG') AND al.uid IN (SELECT airline FROM flights WHERE sourceairport = 'CVO')	flight_2
SELECT al.airline FROM airlines al WHERE al.uid IN (SELECT airline FROM flights WHERE sourceairport = 'CVO') AND al.uid NOT IN (SELECT airline FROM flights WHERE sourceairport = 'APG');	flight_2
SELECT al.airline FROM airlines al WHERE al.uid IN (SELECT airline FROM flights WHERE sourceairport = 'CVO') AND al.uid NOT IN (SELECT airline FROM flights WHERE sourceairport = 'APG');	flight_2
SELECT airline FROM airlines WHERE uid IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(*) >= 10)	flight_2
SELECT a.airline FROM airlines a WHERE (SELECT COUNT(*) FROM flights f WHERE f.airline = a.uid) >= 10	flight_2
SELECT A.airline FROM airlines A WHERE (SELECT COUNT(*) FROM flights F WHERE F.airline = A.uid) < 200	flight_2
SELECT a.airline FROM airlines a WHERE (SELECT COUNT(*) FROM flights f WHERE f.airline = a.uid) < 200	flight_2
SELECT DISTINCT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRLINES AS T2 ON T2.uid  =  T1.Airline WHERE T2.Airline  =  'United Airlines'	flight_2
SELECT FlightNo FROM FLIGHTS WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM FLIGHTS WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM FLIGHTS WHERE DestAirport = 'APG'	flight_2
SELECT FlightNo FROM FLIGHTS WHERE DestAirport  =  'APG'	flight_2
SELECT DISTINCT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport   =  T2.AirportCode WHERE T2.City  =  'Aberdeen'	flight_2
SELECT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'	flight_2
SELECT count(*) FROM Flights AS T1 JOIN Airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.city = 'Aberdeen' OR T2.city = 'Abilene'	flight_2
SELECT count(*) FROM Flights AS T1 JOIN Airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.city = 'Aberdeen' OR T2.city = 'Abilene'	flight_2
SELECT AirportName FROM Airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM Flights UNION SELECT DestAirport FROM Flights)	flight_2
SELECT AirportName FROM Airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM Flights UNION SELECT DestAirport FROM Flights)	flight_2
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT name FROM employee ORDER BY age, Employee_ID	employee_hire_evaluation
SELECT name FROM employee ORDER BY age, name ASC	employee_hire_evaluation
SELECT count(*) , city FROM employee GROUP BY city	employee_hire_evaluation
SELECT count(*) , city FROM employee GROUP BY city	employee_hire_evaluation
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING count(*) > 1	employee_hire_evaluation
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING count(*) > 1	employee_hire_evaluation
SELECT count(*) , LOCATION FROM shop GROUP BY LOCATION	employee_hire_evaluation
SELECT count(*) , LOCATION FROM shop GROUP BY LOCATION	employee_hire_evaluation
SELECT manager_name, district FROM shop WHERE number_products = (SELECT MAX(number_products) FROM shop)	employee_hire_evaluation
SELECT manager_name, district FROM shop WHERE number_products = (SELECT MAX(number_products) FROM shop)	employee_hire_evaluation
SELECT min(Number_products) , max(Number_products) FROM shop	employee_hire_evaluation
SELECT min(Number_products) , max(Number_products) FROM shop	employee_hire_evaluation
SELECT name, LOCATION, district FROM shop ORDER BY number_products DESC, Shop_ID ASC	employee_hire_evaluation
SELECT name, location, district FROM shop ORDER BY number_products DESC, Shop_ID ASC	employee_hire_evaluation
SELECT name FROM shop WHERE number_products > (SELECT avg(number_products) FROM shop)	employee_hire_evaluation
SELECT name FROM shop WHERE number_products > (SELECT avg(number_products) FROM shop)	employee_hire_evaluation
SELECT employee.name FROM employee JOIN (SELECT MAX(totalAwards) AS totalAwards FROM (SELECT employee_id, COUNT(employee_id) AS totalAwards FROM evaluation GROUP BY employee_id)) Awards ON Awards.totalAwards = (SELECT COUNT(*) FROM evaluation WHERE evaluation.employee_id = employee.employee_id)	employee_hire_evaluation
WITH AwardCount AS (SELECT t1.Name, COUNT(*) as TotalAwards FROM employee t1 JOIN evaluation t2 ON t1.Employee_ID = t2.Employee_ID GROUP BY t1.Employee_ID) SELECT Name FROM AwardCount WHERE TotalAwards = (SELECT MAX(TotalAwards) FROM AwardCount)	employee_hire_evaluation
SELECT name FROM employee WHERE employee_id IN (SELECT employee_id FROM evaluation WHERE bonus = (SELECT MAX(bonus) FROM evaluation))	employee_hire_evaluation
SELECT e.name FROM employee e WHERE e.employee_id IN (SELECT ee.employee_id FROM evaluation ee WHERE ee.bonus = (SELECT MAX(bonus) FROM evaluation))	employee_hire_evaluation
SELECT name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT Employee_ID, Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT t2.Name FROM hiring AS t1 JOIN shop AS t2 ON t1.shop_id = t2.shop_id GROUP BY t1.shop_id HAVING count(*) = (SELECT MAX(employee_count) FROM (SELECT count(*) AS employee_count FROM hiring GROUP BY shop_id) AS counts)	employee_hire_evaluation
SELECT t2.name FROM hiring AS t1 JOIN shop AS t2 ON t1.shop_id = t2.shop_id GROUP BY t1.shop_id HAVING COUNT(*) = (SELECT MAX(total_employees) FROM (SELECT COUNT(*) AS total_employees FROM hiring GROUP BY shop_id) AS employee_counts)	employee_hire_evaluation
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)	employee_hire_evaluation
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)	employee_hire_evaluation
SELECT name, (SELECT COUNT(*) FROM hiring WHERE hiring.shop_id = shop.shop_id) AS num_employees FROM shop	employee_hire_evaluation
SELECT shop.name, (SELECT COUNT(*) FROM hiring WHERE hiring.shop_id = shop.shop_id) AS emp_count FROM shop	employee_hire_evaluation
SELECT sum(bonus) FROM evaluation	employee_hire_evaluation
SELECT sum(bonus) FROM evaluation	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT district FROM shop WHERE Number_products < 3000 INTERSECT SELECT district FROM shop WHERE Number_products > 10000	employee_hire_evaluation
SELECT district FROM shop WHERE Number_products < 3000 INTERSECT SELECT district FROM shop WHERE Number_products > 10000	employee_hire_evaluation
SELECT count(DISTINCT LOCATION) FROM shop	employee_hire_evaluation
SELECT count(DISTINCT LOCATION) FROM shop	employee_hire_evaluation
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT document_id , document_name , document_description FROM Documents	cre_Doc_Template_Mgt
SELECT document_id , document_name , document_description FROM Documents	cre_Doc_Template_Mgt
SELECT document_name , template_id FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT document_name , template_id FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT document_id , template_id , Document_Description FROM Documents WHERE document_name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT document_id , template_id , Document_Description FROM Documents WHERE document_name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT count(DISTINCT template_id) FROM Documents	cre_Doc_Template_Mgt
SELECT count(DISTINCT template_id) FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT count(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID WHERE T2.Template_Type_Code  =  'PPT'	cre_Doc_Template_Mgt
SELECT t.template_id, COUNT(d.document_id) AS number_of_documents FROM templates t LEFT JOIN documents d ON t.template_id = d.template_id GROUP BY t.template_id	cre_Doc_Template_Mgt
SELECT template_id , count(*) FROM Documents GROUP BY template_id	cre_Doc_Template_Mgt
SELECT T1.template_id, T2.Template_Type_code FROM Documents AS T1 JOIN Templates AS T2 ON T1.template_id = T2.template_id GROUP BY T1.template_id, T2.Template_Type_code HAVING COUNT(*) = (SELECT MAX(doc_count) FROM (SELECT COUNT(*) AS doc_count FROM Documents GROUP BY template_id) AS max_count)	cre_Doc_Template_Mgt
SELECT T1.template_id, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.template_id = T2.template_id GROUP BY T1.template_id, T2.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(doc_count) FROM (SELECT COUNT(*) AS doc_count FROM Documents GROUP BY template_id) AS subquery)	cre_Doc_Template_Mgt
SELECT template_id FROM Documents GROUP BY template_id HAVING count(*) > 1	cre_Doc_Template_Mgt
SELECT template_id FROM Documents GROUP BY template_id HAVING count(*) > 1	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates	cre_Doc_Template_Mgt
SELECT template_id , version_number , template_type_code FROM Templates	cre_Doc_Template_Mgt
SELECT template_id , version_number , template_type_code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT template_type_code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT template_type_code FROM ref_template_types;	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE template_type_code = 'PP' OR template_type_code = 'PPT'	cre_Doc_Template_Mgt
SELECT template_id FROM Templates WHERE template_type_code = 'PP' OR template_type_code = 'PPT'	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates WHERE template_type_code = 'CV'	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates WHERE template_type_code  =  'CV'	cre_Doc_Template_Mgt
SELECT version_number , template_type_code FROM Templates WHERE version_number > 5	cre_Doc_Template_Mgt
SELECT version_number , template_type_code FROM Templates WHERE version_number > 5	cre_Doc_Template_Mgt
SELECT template_type_code , count(*) FROM Templates GROUP BY template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code , count(*) FROM Templates GROUP BY template_type_code	cre_Doc_Template_Mgt
WITH template_counts AS (SELECT template_type_code, COUNT(*) AS template_count FROM Templates GROUP BY template_type_code) SELECT template_type_code FROM template_counts WHERE template_count = (SELECT MAX(template_count) FROM template_counts)	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templates GROUP BY template_type_code HAVING count(*) = (SELECT max(count) FROM (SELECT count(*) as count FROM Templates GROUP BY template_type_code) as counts)	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templates GROUP BY template_type_code HAVING count(*) < 3	cre_Doc_Template_Mgt
SELECT r.template_type_code FROM ref_template_types r WHERE (SELECT COUNT(*) FROM templates t WHERE t.template_type_code = r.template_type_code) < 3	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number = (SELECT MIN(Version_Number) FROM Templates)	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number = (SELECT MIN(Version_Number) FROM Templates)	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates WHERE template_id IN (SELECT template_id FROM documents WHERE document_name = 'Data base')	cre_Doc_Template_Mgt
SELECT ref_template_types.template_type_code FROM ref_template_types WHERE ref_template_types.template_type_code IN (SELECT t.template_type_code FROM templates t JOIN documents d ON t.template_id = d.template_id WHERE d.document_name = 'Data base')	cre_Doc_Template_Mgt
SELECT T2.document_name FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id = T2.template_id WHERE T1.template_type_code = 'BK'	cre_Doc_Template_Mgt
SELECT T2.document_name FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id = T2.template_id WHERE T1.template_type_code = 'BK'	cre_Doc_Template_Mgt
SELECT rt.template_type_code, COUNT(distinct doc.document_id) FROM ref_template_types rt LEFT JOIN templates temp ON rt.template_type_code = temp.template_type_code LEFT JOIN documents doc ON temp.template_id = doc.template_id GROUP BY rt.template_type_code	cre_Doc_Template_Mgt
SELECT ref_template_types.template_type_code, COUNT(documents.document_id) AS document_count FROM ref_template_types LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code LEFT JOIN documents ON templates.template_id = documents.template_id GROUP BY ref_template_types.template_type_code	cre_Doc_Template_Mgt
WITH TemplateCount AS (SELECT T1.template_type_code, COUNT(*) AS doc_count FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id = T2.template_id GROUP BY T1.template_type_code) SELECT template_type_code FROM TemplateCount WHERE doc_count = (SELECT MAX(doc_count) FROM TemplateCount)	cre_Doc_Template_Mgt
WITH TypeCount AS (SELECT T1.template_type_code, COUNT(*) AS cnt FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id = T2.template_id GROUP BY T1.template_type_code) SELECT template_type_code FROM TypeCount WHERE cnt = (SELECT MAX(cnt) FROM TypeCount)	cre_Doc_Template_Mgt
SELECT rt.template_type_code FROM ref_template_types rt WHERE NOT EXISTS (SELECT 1 FROM templates t WHERE rt.template_type_code = t.template_type_code AND EXISTS (SELECT 1 FROM documents d WHERE t.template_id = d.template_id))	cre_Doc_Template_Mgt
SELECT rtt.template_type_code FROM ref_template_types rtt WHERE NOT EXISTS (SELECT 1 FROM templates t JOIN documents d ON t.template_id = d.template_id WHERE t.template_type_code = rtt.template_type_code)	cre_Doc_Template_Mgt
SELECT template_type_code , template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_code , template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code = 'AD'	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code  =  'AD'	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description = 'Book'	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code JOIN Documents AS T3 ON T2.Template_ID = T3.template_ID	cre_Doc_Template_Mgt
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code JOIN Documents AS T3 ON T2.Template_ID = T3.template_ID	cre_Doc_Template_Mgt
SELECT T2.template_id FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code WHERE T1.template_type_description = 'Presentation'	cre_Doc_Template_Mgt
SELECT T2.template_id FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code WHERE T1.template_type_description = 'Presentation'	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_ID = T2.document_ID WHERE T2.document_name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_ID = T2.document_ID WHERE T2.document_name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT * FROM paragraphs WHERE paragraph_text = 'Korea '	cre_Doc_Template_Mgt
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT T1.paragraph_id , T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id = T2.document_id WHERE T2.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT T1.paragraph_id , T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id = T2.document_id WHERE T2.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  'Customer reviews'	cre_Doc_Template_Mgt
SELECT T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id = T2.document_id WHERE T2.document_name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT documents.document_id, COALESCE(SUM(CASE WHEN paragraphs.paragraph_id IS NOT NULL THEN 1 ELSE 0 END), 0) FROM documents LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY documents.document_id	cre_Doc_Template_Mgt
SELECT doc.document_id, COUNT(para.paragraph_id) AS count_paragraphs FROM documents doc LEFT JOIN paragraphs para ON doc.document_id = para.document_id GROUP BY doc.document_id ORDER BY doc.document_id	cre_Doc_Template_Mgt
SELECT d.document_id, d.document_name, COUNT(p.paragraph_id) AS num_paragraphs FROM documents d LEFT JOIN paragraphs p ON d.document_id = p.document_id GROUP BY d.document_id, d.document_name	cre_Doc_Template_Mgt
SELECT doc.document_id, doc.document_name, (SELECT COUNT(paragraph_id) FROM paragraphs WHERE paragraphs.document_id = doc.document_id) AS number_of_paragraphs FROM documents doc	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) >= 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) >= 2	cre_Doc_Template_Mgt
SELECT T1.document_id, T2.document_name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id = T2.document_id GROUP BY T1.document_id HAVING count(*) = (SELECT MAX(ct) FROM (SELECT count(*) as ct FROM Paragraphs GROUP BY document_id) AS counts)	cre_Doc_Template_Mgt
SELECT D.document_id, D.document_name FROM Documents D WHERE D.document_id IN (SELECT P.document_id FROM Paragraphs P GROUP BY P.document_id HAVING COUNT(*) = (SELECT MAX(par_count) FROM (SELECT COUNT(*) as par_count FROM Paragraphs GROUP BY document_id) count_summary))	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) = (SELECT MIN(counted) FROM (SELECT document_id, COUNT(*) as counted FROM Paragraphs GROUP BY document_id) AS counts)	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) = (SELECT count(*) FROM Paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1)	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text = 'Ireland'	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE paragraph_text LIKE '%Brazil%' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text LIKE '%Ireland%'	cre_Doc_Template_Mgt
SELECT count(*) FROM teacher	course_teach
SELECT count(*) FROM teacher	course_teach
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC	course_teach
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC	course_teach
SELECT Age , Hometown FROM teacher	course_teach
SELECT Age , Hometown FROM teacher	course_teach
select name from teacher where hometown != 'Little Lever Urban District'	course_teach
SELECT DISTINCT name FROM teacher WHERE hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33	course_teach
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33	course_teach
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)	course_teach
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)	course_teach
SELECT Hometown , COUNT(*) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown , COUNT(*) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM teacher GROUP BY Hometown) subquery)	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM teacher GROUP BY Hometown) t)	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT T3.Name , T2.Course FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID	course_teach
SELECT T3.Name , T2.Course FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID	course_teach
SELECT T3.Name, T2.Course FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID ORDER BY T3.Name, T2.Course	course_teach
SELECT T3.Name , T2.Course FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID ORDER BY T3.Name, T2.Course	course_teach
SELECT T3.Name FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID WHERE T2.Course = 'Math'	course_teach
SELECT T3.Name FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID = T3.Teacher_ID WHERE T2.Course = 'Math'	course_teach
SELECT t.name AS teacher_name, COUNT(ca.course_id) FROM teacher t LEFT JOIN course_arrange ca ON t.teacher_id = ca.teacher_id GROUP BY t.teacher_id	course_teach
SELECT name, (SELECT COUNT(*) FROM course_arrange WHERE teacher_id = teacher.teacher_id) AS num_courses FROM teacher	course_teach
SELECT T.Name FROM teacher AS T WHERE T.Teacher_ID IN (SELECT ca.Teacher_ID FROM course_arrange ca GROUP BY ca.Teacher_ID HAVING COUNT(DISTINCT ca.course_id) > 1)	course_teach
SELECT t.name FROM teacher t WHERE t.teacher_id IN (SELECT ca.teacher_id FROM course_arrange ca GROUP BY ca.teacher_id HAVING COUNT(DISTINCT ca.course_id) >= 2)	course_teach
SELECT Name FROM teacher WHERE Teacher_id NOT IN (SELECT Teacher_id FROM course_arrange)	course_teach
SELECT Name FROM teacher WHERE Teacher_id NOT IN (SELECT Teacher_id FROM course_arrange)	course_teach
SELECT count(*) FROM visitor WHERE age < 30	museum_visit
SELECT name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC	museum_visit
SELECT avg(age) FROM visitor WHERE Level_of_membership  <=  4	museum_visit
SELECT name , Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY age DESC	museum_visit
SELECT museum_id, name FROM museum WHERE num_of_staff = (SELECT MAX(num_of_staff) FROM museum)	museum_visit
SELECT avg(num_of_staff) FROM museum WHERE open_year < 2009	museum_visit
SELECT Num_of_Staff , Open_Year FROM museum WHERE name = 'Plaza Museum'	museum_visit
SELECT name FROM museum WHERE num_of_staff > (SELECT min(num_of_staff) FROM museum WHERE open_year > 2010)	museum_visit
SELECT t1.id ,  t1.name ,  t1.age FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id GROUP BY t1.id HAVING count(*)  >  1	museum_visit
SELECT t1.ID, t1.name, t1.Level_of_membership from visitor AS T1 WHERE T1.ID IN (SELECT T2.visitor_ID FROM visit AS T2 GROUP BY t2.visitor_ID HAVING sum(T2.Total_spent) = (SELECT sum(T3.Total_spent) AS S FROM visit AS T3 GROUP BY t3.visitor_ID ORDER BY S DESC LIMIT 1))	museum_visit
SELECT t2.Museum_ID, t1.Name FROM museum AS t1 JOIN visit AS t2 ON t1.Museum_ID = t2.Museum_ID GROUP BY t2.Museum_ID HAVING COUNT(*) = (SELECT MAX(visit_counts) FROM (SELECT COUNT(*) AS visit_counts FROM visit GROUP BY Museum_ID) AS subquery)	museum_visit
SELECT name FROM museum WHERE Museum_ID NOT IN (SELECT museum_id FROM visit)	museum_visit
SELECT v.name, v.age FROM (SELECT visitor_id FROM visit GROUP BY visitor_id HAVING MAX(num_of_ticket) = (SELECT MAX(num_of_ticket) FROM visit)) ids JOIN visitor v ON v.id = ids.visitor_id	museum_visit
SELECT avg(num_of_ticket) , max(num_of_ticket) FROM visit	museum_visit
SELECT sum(t2.Total_spent) FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id WHERE t1.Level_of_membership  =  1	museum_visit
SELECT T1.Name FROM visitor AS T1 WHERE exists(SELECT 1 FROM visit AS T2 JOIN museum AS T3 on T2.Museum_ID = T3.Museum_ID WHERE T3.Open_Year < 2009 AND T2.visitor_ID = T1.ID) AND exists(SELECT 1 FROM visit AS T4 JOIN museum AS T5 on T4.Museum_ID = T5.Museum_ID WHERE T5.Open_Year > 2011 AND T4.visitor_ID = T1.ID)	museum_visit
SELECT count(*) FROM visitor WHERE id NOT IN (SELECT t2.visitor_id FROM museum AS t1 JOIN visit AS t2 ON t1.Museum_ID = t2.Museum_ID WHERE t1.open_year > 2010)	museum_visit
SELECT count(*) FROM museum WHERE open_year > 2013 OR open_year < 2008	museum_visit
SELECT count(*) FROM players	wta_1
SELECT count(*) FROM players	wta_1
SELECT count(*) FROM matches	wta_1
SELECT count(*) FROM matches	wta_1
SELECT first_name , birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT first_name , birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT avg(loser_age) , avg(winner_age) FROM matches	wta_1
SELECT avg(loser_age) , avg(winner_age) FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10	wta_1
SELECT T.winner_name FROM (SELECT winner_id, winner_name FROM matches WHERE YEAR = 2013 INTERSECT SELECT winner_id, winner_name FROM matches WHERE YEAR = 2016) AS T	wta_1
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013 INTERSECT SELECT winner_id FROM matches WHERE year = 2016)	wta_1
SELECT count(*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016	wta_1
SELECT count(*) FROM matches WHERE YEAR = 2013 OR YEAR = 2016	wta_1
SELECT p.country_code, p.first_name FROM players p WHERE EXISTS (SELECT 1 FROM matches m WHERE m.winner_id = p.player_id AND m.tourney_name = 'WTA Championships') AND EXISTS (SELECT 1 FROM matches m WHERE m.winner_id = p.player_id AND m.tourney_name = 'Australian Open')	wta_1
SELECT first_name, country_code FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships' INTERSECT SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open')	wta_1
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)	wta_1
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date, last_name, player_id	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date, player_id	wta_1
SELECT first_name ,  last_name FROM players WHERE hand  =  'L' ORDER BY birth_date	wta_1
SELECT first_name ,  last_name FROM players WHERE hand  =  'L' ORDER BY birth_date	wta_1
SELECT p.first_name, p.country_code FROM players p, (SELECT player_id FROM rankings GROUP BY player_id HAVING MAX(tours) = (SELECT MAX(tours) FROM rankings)) as r WHERE p.player_id = r.player_id	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1 WHERE T1.player_id IN (SELECT T2.player_id FROM rankings AS T2 WHERE T2.tours = (SELECT MAX(tours) FROM rankings))	wta_1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC, year ASC LIMIT 1	wta_1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1	wta_1
SELECT first_name, last_name, SUM(winner_rank_points) AS total_winner_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id GROUP BY winner_id HAVING COUNT(*) = (SELECT max(cnt) FROM (SELECT COUNT(*) AS cnt FROM matches GROUP BY winner_id))	wta_1
SELECT p.first_name, p.last_name, T.total_winner_rank_points FROM players AS p JOIN (SELECT m1.winner_id, SUM(m1.winner_rank_points) AS total_winner_rank_points FROM matches AS m1 GROUP BY m1.winner_id HAVING count(*) = (SELECT count(*) AS C FROM matches m JOIN players p ON m.winner_id = p.player_id GROUP BY m.winner_id ORDER BY C DESC LIMIT 1)) AS T on p.player_id = T.winner_id	wta_1
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open'))	wta_1
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open'))	wta_1
WITH LongestMatch AS (SELECT MAX(minutes) AS max_minutes FROM matches) SELECT m.winner_name, m.loser_name FROM matches m JOIN LongestMatch lm ON m.minutes = lm.max_minutes	wta_1
WITH LongestMatch AS (SELECT MAX(minutes) AS max_minutes FROM matches) SELECT m.winner_name, m.loser_name FROM matches m JOIN LongestMatch lm ON m.minutes = lm.max_minutes	wta_1
SELECT T1.player_id, avg(ranking), T1.first_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id, T1.first_name	wta_1
SELECT T1.first_name, T1.player_id, COALESCE(AVG(T2.ranking), 0) AS average_ranking FROM players AS T1 LEFT JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name, T1.player_id	wta_1
SELECT sum(ranking_points), T1.first_name, T1.player_id FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name, T1.player_id	wta_1
SELECT p.first_name, IFNULL(SUM(r.ranking_points), 0) FROM players p LEFT JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id	wta_1
SELECT count(*) , country_code FROM players GROUP BY country_code	wta_1
SELECT count(*) , country_code FROM players GROUP BY country_code	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) = (SELECT max(count) FROM (SELECT count(*) AS count FROM players GROUP BY country_code) AS counts)	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) = (SELECT MAX(player_count) FROM (SELECT count(*) AS player_count FROM players GROUP BY country_code) AS counts)	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50	wta_1
SELECT sum(tours) , ranking_date FROM rankings GROUP BY ranking_date	wta_1
SELECT sum(tours) , ranking_date FROM rankings GROUP BY ranking_date	wta_1
SELECT count(*) , YEAR FROM matches GROUP BY YEAR	wta_1
SELECT count(*) , YEAR FROM matches GROUP BY YEAR	wta_1
SELECT winner_name, winner_rank FROM matches WHERE winner_age <= (SELECT MAX(winner_age) FROM (SELECT winner_age AS winner_age FROM matches ORDER BY winner_age Limit 3)) ORDER BY winner_age	wta_1
SELECT winner_name, winner_rank FROM matches WHERE winner_age <= (SELECT MAX(winner_age) FROM (SELECT winner_age AS winner_age FROM matches ORDER BY winner_age Limit 3)) ORDER BY winner_age	wta_1
SELECT count(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'	wta_1
SELECT count(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 WHERE T1.player_id IN (SELECT T2.winner_id FROM matches AS T2 WHERE T2.winner_rank_points = (SELECT max(T3.winner_rank_points) FROM matches AS T3))	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 WHERE T1.player_id IN (SELECT T2.winner_id FROM matches AS T2 WHERE T2.winner_rank_points = (SELECT max(T3.winner_rank_points) FROM matches AS T3))	wta_1
SELECT count(*) , hand FROM players GROUP BY hand	wta_1
SELECT count(*) , hand FROM players GROUP BY hand	wta_1
SELECT count(*) FROM ship WHERE disposition_of_ship = 'Captured'	battle_death
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage ASC	battle_death
SELECT name, date, result FROM battle	battle_death
SELECT max(killed) , min(killed) FROM death	battle_death
SELECT avg(injured) FROM death	battle_death
SELECT T1.killed , T1.injured FROM death AS T1 JOIN ship AS t2 ON T1.caused_by_ship_id = T2.id WHERE T2.tonnage = 't'	battle_death
SELECT name , RESULT FROM battle WHERE bulgarian_commander != 'Boril'	battle_death
SELECT DISTINCT T1.id , T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'	battle_death
SELECT T1.id , T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle JOIN death AS T3 ON T2.id = T3.caused_by_ship_id GROUP BY T1.id HAVING sum(T3.killed) > 10	battle_death
SELECT T2.id, T2.name FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id GROUP BY T2.id HAVING SUM(T1.injured) = (SELECT max(total_injured) FROM (SELECT SUM(T3.injured) AS total_injured FROM death AS T3 JOIN ship AS T4 ON T3.caused_by_ship_id = T4.id GROUP BY T4.id))	battle_death
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'	battle_death
SELECT count(DISTINCT RESULT) FROM battle	battle_death
SELECT count(*) FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE tonnage = '225' );	battle_death
SELECT T3.name, T3.date FROM (SELECT T1.id, T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.name = 'Lettice' INTERSECT SELECT T1.id, T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.name = 'HMS Atalanta') AS T3	battle_death
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel')	battle_death
SELECT note FROM death WHERE note LIKE '%East%'	battle_death
SELECT line_1 , line_2 FROM addresses	student_transcripts_tracking
SELECT line_1 , line_2 FROM addresses	student_transcripts_tracking
SELECT count(*) FROM Courses	student_transcripts_tracking
SELECT count(*) FROM Courses	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name = 'math'	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name = 'math'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
WITH DegreeCount AS (SELECT department_id, COUNT(*) AS num_degrees FROM Degree_Programs GROUP BY department_id) SELECT D.department_name, D.department_id FROM Departments AS D JOIN DegreeCount AS DC ON D.department_id = DC.department_id WHERE DC.num_degrees = (SELECT MAX(num_degrees) FROM DegreeCount)	student_transcripts_tracking
SELECT t2.department_name, t1.department_id FROM degree_programs AS t1 JOIN departments AS t2 ON t1.department_id = t2.department_id GROUP BY t1.department_id HAVING COUNT(*) = (SELECT MAX(degree_count) FROM (SELECT COUNT(*) AS degree_count FROM degree_programs GROUP BY department_id) AS counts)	student_transcripts_tracking
SELECT count(DISTINCT department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT count(DISTINCT department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT count(*) FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = 'engineer'	student_transcripts_tracking
SELECT count(*) FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = 'engineer'	student_transcripts_tracking
SELECT section_name , section_description FROM Sections	student_transcripts_tracking
SELECT section_name , section_description FROM Sections	student_transcripts_tracking
SELECT c.course_id, c.course_name FROM courses c WHERE (SELECT COUNT(*) FROM sections s WHERE s.course_id = c.course_id) <= 2	student_transcripts_tracking
SELECT c.course_name, c.course_id FROM courses c WHERE (SELECT COUNT(*) FROM sections s WHERE s.course_id = c.course_id) < 2	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id HAVING count(*) = (SELECT MAX(counted) FROM (SELECT count(*) as counted FROM Student_Enrolment GROUP BY semester_id) AS temp)	student_transcripts_tracking
SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id HAVING COUNT(*) = (SELECT MAX(total_enrolments) FROM (SELECT COUNT(*) AS total_enrolments FROM Student_Enrolment GROUP BY semester_id) AS enrolment_counts)	student_transcripts_tracking
SELECT department_description FROM departments WHERE department_name LIKE '%the computer%'	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT DISTINCT s.first_name, s.middle_name, s.last_name, s.student_id FROM students s WHERE EXISTS (SELECT 1 FROM student_enrolment se WHERE se.student_id = s.student_id GROUP BY se.semester_id HAVING COUNT(DISTINCT se.degree_program_id) = 2)	student_transcripts_tracking
SELECT DISTINCT s.student_id, s.first_name, s.middle_name, s.last_name FROM students s JOIN student_enrolment se ON s.student_id = se.student_id JOIN (SELECT student_id, semester_id FROM student_enrolment GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2) ds ON s.student_id = ds.student_id AND se.semester_id = ds.semester_id	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'))	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelors'))	student_transcripts_tracking
SELECT dp.degree_summary_name FROM degree_programs dp INNER JOIN student_enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name HAVING COUNT(DISTINCT se.student_id) = (SELECT MAX(total_enrolled) FROM (SELECT COUNT(DISTINCT student_id) AS total_enrolled FROM student_enrolment GROUP BY degree_program_id))	student_transcripts_tracking
WITH EnrollmentCounts AS (SELECT T1.degree_summary_name, COUNT(*) AS student_count FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name) SELECT degree_summary_name FROM EnrollmentCounts WHERE student_count = (SELECT MAX(student_count) FROM EnrollmentCounts)	student_transcripts_tracking
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id HAVING COUNT(*) = (SELECT MAX(student_count) FROM (SELECT degree_program_id, COUNT(*) as student_count FROM Student_Enrolment GROUP BY degree_program_id) AS counts)	student_transcripts_tracking
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id HAVING COUNT(*) = (SELECT MAX(total_enrolled) FROM (SELECT COUNT(*) AS total_enrolled FROM Student_Enrolment GROUP BY degree_program_id) AS counts)	student_transcripts_tracking
WITH EnrollmentCounts AS (SELECT student_id, COUNT(*) AS num_enrollments FROM Student_Enrolment GROUP BY student_id) SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name, EnrollmentCounts.num_enrollments FROM Students JOIN EnrollmentCounts ON Students.student_id = EnrollmentCounts.student_id WHERE EnrollmentCounts.num_enrollments = (SELECT MAX(num_enrollments) FROM EnrollmentCounts)	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(T2.student_id) AS num_enrollments FROM students T1 INNER JOIN student_enrolment T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING num_enrollments = (SELECT COUNT(*) AS num_enrollments FROM student_enrolment AS T3 GROUP BY T3.student_id ORDER BY num_enrollments DESC LIMIT 1)	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN( SELECT semester_id FROM Student_Enrolment )	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN( SELECT semester_id FROM Student_Enrolment )	student_transcripts_tracking
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id	student_transcripts_tracking
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_enrolment_courses)	student_transcripts_tracking
SELECT C.course_name FROM courses C INNER JOIN (SELECT course_id FROM student_enrolment_courses GROUP BY course_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM student_enrolment_courses GROUP BY course_id))) SC ON C.course_id = SC.course_id	student_transcripts_tracking
SELECT T1.course_name FROM courses AS T1 JOIN student_enrolment_courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(*) = (SELECT COUNT(*) AS C FROM student_enrolment_courses GROUP BY course_id ORDER BY C DESC LIMIT 1)	student_transcripts_tracking
SELECT T.last_name FROM (SELECT T1.student_id, T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = 'North Carolina' EXCEPT SELECT T3.student_id, T3.last_name FROM Students AS T3 JOIN Student_Enrolment AS T4 ON T3.student_id = T4.student_id) AS T	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = 'NorthCarolina' and T1.student_id not in (SELECT T3.student_id From Student_Enrolment AS T3)	student_transcripts_tracking
SELECT T2.transcript_date , T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT T2.transcript_date , T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name  =  'Timmothy' AND last_name  =  'Ward'	student_transcripts_tracking
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC, student_id ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC, student_id ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC, student_id ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC, student_id ASC LIMIT 1	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT A.address_id, A.line_1, A.line_2, A.line_3 FROM addresses A INNER JOIN students S ON A.address_id = S.current_address_id GROUP BY A.address_id, A.line_1, A.line_2, A.line_3 HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) count FROM students GROUP BY current_address_id))	student_transcripts_tracking
SELECT T1.address_id, T1.line_1, T1.line_2 FROM Addresses AS T1 JOIN (SELECT current_address_id AS address_id FROM Students UNION ALL SELECT permanent_address_id AS address_id FROM Students) AS T2 ON T1.address_id = T2.address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC, T1.address_id ASC LIMIT 1	student_transcripts_tracking
SELECT AVG(strftime('%Y', transcript_date) ) FROM Transcripts	student_transcripts_tracking
SELECT avg(transcript_date) FROM Transcripts	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts WHERE transcript_date = (SELECT min(transcript_date) FROM Transcripts)	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts WHERE transcript_date = (SELECT MIN(transcript_date) FROM Transcripts)	student_transcripts_tracking
SELECT count(*) FROM Transcripts	student_transcripts_tracking
SELECT count(*) FROM Transcripts	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
WITH CountPerStudentCourse AS (SELECT student_course_id, COUNT(*) AS cnt FROM Transcript_Contents GROUP BY student_course_id) SELECT cnt, student_course_id FROM CountPerStudentCourse WHERE cnt = (SELECT MAX(cnt) FROM CountPerStudentCourse)	student_transcripts_tracking
SELECT count(*) as num_transcripts, student_course_id FROM Transcript_Contents GROUP BY student_course_id HAVING count(*) = (SELECT max(counts) FROM (SELECT count(*) as counts FROM Transcript_Contents GROUP BY student_course_id) as subquery)	student_transcripts_tracking
SELECT T2.transcript_date, T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(*), T1.transcript_id ASC LIMIT 1	student_transcripts_tracking
SELECT T2.transcript_date, T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) = (SELECT COUNT(*) AS c FROM Transcript_Contents AS T3 JOIN Transcripts AS T4 ON T3.transcript_id = T4.transcript_id GROUP BY T3.transcript_id ORDER BY c LIMIT 1)	student_transcripts_tracking
SELECT s.semester_name FROM semesters s WHERE s.semester_id IN (SELECT se.semester_id FROM student_enrolment se JOIN degree_programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Master' INTERSECT SELECT se.semester_id FROM student_enrolment se JOIN degree_programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor')	student_transcripts_tracking
SELECT DISTINCT T2.semester_id FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE degree_summary_name = 'Master' INTERSECT SELECT DISTINCT T2.semester_id FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT count(DISTINCT current_address_id) FROM Students	student_transcripts_tracking
SELECT COUNT(*) FROM (SELECT current_address_id FROM Students UNION SELECT permanent_address_id FROM Students) AS T	student_transcripts_tracking
SELECT other_student_details FROM Students ORDER BY other_student_details DESC	student_transcripts_tracking
SELECT other_student_details FROM Students ORDER BY other_student_details DESC	student_transcripts_tracking
SELECT section_description FROM Sections WHERE section_name = 'H'	student_transcripts_tracking
SELECT section_description FROM Sections WHERE section_name  =  'h'	student_transcripts_tracking
select t1.first_name from students as t1 join addresses as t2 on t1.permanent_address_id = t2.address_id where t2.country = 'Haiti' or t1.cell_mobile_number = '09700166582'	student_transcripts_tracking
select t1.first_name from students as t1 join addresses as t2 on t1.permanent_address_id = t2.address_id where t2.country = 'Haiti' or t1.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Title FROM Cartoon ORDER BY title	tvshow
SELECT Title FROM Cartoon ORDER BY title	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones';	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones';	tvshow
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';	tvshow
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id	tvshow
SELECT title, Directed_by FROM Cartoon ORDER BY Original_air_date, id ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti';	tvshow
WITH ranked_countries AS (SELECT country, COUNT(id) AS total_channels, RANK() OVER (ORDER BY COUNT(id) DESC) AS rank FROM tv_channel GROUP BY country) SELECT country, total_channels FROM ranked_countries WHERE rank = 1	tvshow
SELECT Country, count(*) FROM TV_Channel GROUP BY Country HAVING count(*) = (SELECT count(*) as c FROM TV_Channel GROUP BY Country ORDER BY c DESC LIMIT 1)	tvshow
SELECT count(DISTINCT series_name) , count(DISTINCT content) FROM TV_Channel;	tvshow
SELECT count(DISTINCT series_name) , count(DISTINCT content) FROM TV_Channel;	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';	tvshow
SELECT count(*) FROM TV_Channel WHERE LANGUAGE = 'English';	tvshow
SELECT count(*) FROM TV_Channel WHERE LANGUAGE = 'English';	tvshow
SELECT LANGUAGE, COUNT(*) FROM TV_Channel GROUP BY LANGUAGE HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM TV_Channel GROUP BY LANGUAGE) as subquery)	tvshow
WITH Language_Count AS (SELECT LANGUAGE, COUNT(*) AS num_channels FROM TV_Channel GROUP BY LANGUAGE) SELECT LANGUAGE, num_channels FROM Language_Count WHERE num_channels = (SELECT MIN(num_channels) FROM Language_Count);	tvshow
SELECT LANGUAGE , count(*) FROM TV_Channel GROUP BY LANGUAGE	tvshow
SELECT LANGUAGE , count(*) FROM TV_Channel GROUP BY LANGUAGE	tvshow
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE title = 'The Rise of the Blue Beetle!')	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 WHERE T1.id IN (SELECT T2.Channel FROM Cartoon AS T2 WHERE T2.Title = 'The Rise of the Blue Beetle!')	tvshow
SELECT T2.Title FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';	tvshow
SELECT T2.Title FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';	tvshow
SELECT Episode FROM TV_series ORDER BY Rating, id ASC	tvshow
SELECT Episode FROM TV_series ORDER BY Rating, id ASC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3	tvshow
SELECT Episode , Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;	tvshow
SELECT max(SHARE) , min(SHARE) FROM TV_series;	tvshow
SELECT max(SHARE) , min(SHARE) FROM TV_series;	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime';	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime';	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';	tvshow
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime')	tvshow
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime')	tvshow
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';	tvshow
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio';	tvshow
SELECT count(*) , Directed_by FROM cartoon GROUP BY Directed_by	tvshow
SELECT count(*) , Directed_by FROM cartoon GROUP BY Directed_by	tvshow
SELECT production_code, channel FROM cartoon WHERE original_air_date = (SELECT MAX(original_air_date) FROM cartoon)	tvshow
select production_code, channel from cartoon where Original_air_date = (SELECT max(original_air_date) FROM cartoon)	tvshow
SELECT package_option , series_name FROM TV_Channel WHERE hight_definition_TV = 'yes'	tvshow
SELECT package_option , series_name FROM TV_Channel WHERE hight_definition_TV = 'yes'	tvshow
SELECT DISTINCT country FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE written_by = 'Todd Casey')	tvshow
SELECT DISTINCT tc.country FROM tv_channel tc JOIN cartoon c ON tc.id = c.channel WHERE c.written_by = 'Todd Casey'	tvshow
SELECT country FROM TV_Channel EXCEPT SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by = 'Todd Casey'	tvshow
SELECT country FROM TV_Channel EXCEPT SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by = 'Todd Casey'	tvshow
SELECT T1.series_name, T1.country FROM TV_Channel AS T1 WHERE T1.id IN (SELECT T2.id FROM TV_Channel AS T2 JOIN cartoon AS T3 ON T2.id = T3.Channel WHERE T3.directed_by = 'Michael Chang' INTERSECT SELECT T2.Id FROM TV_Channel AS T2 JOIN cartoon AS T3 ON T2.id = T3.Channel WHERE T3.directed_by = 'Ben Jones')	tvshow
SELECT T1.series_name, T1.country FROM TV_Channel AS T1 WHERE T1.id IN (SELECT T2.id FROM TV_Channel AS T2 JOIN cartoon AS T3 ON T2.id = T3.Channel WHERE T3.directed_by = 'Michael Chang' INTERSECT SELECT T2.Id FROM TV_Channel AS T2 JOIN cartoon AS T3 ON T2.id = T3.Channel WHERE T3.directed_by = 'Ben Jones')	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE != 'English'	tvshow
SELECT Pixel_aspect_ratio_PAR , country FROM tv_channel WHERE LANGUAGE != 'English'	tvshow
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)	tvshow
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones'	tvshow
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones'	tvshow
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones')	tvshow
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones')	tvshow
SELECT count(*) FROM poker_player	poker_player
SELECT count(*) FROM poker_player	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC, Poker_Player_ID ASC	poker_player
SELECT Final_Table_Made , Best_Finish FROM poker_player	poker_player
SELECT Final_Table_Made , Best_Finish FROM poker_player	poker_player
SELECT avg(Earnings) FROM poker_player	poker_player
SELECT avg(Earnings) FROM poker_player	poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)	poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)	poker_player
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings  <  200000	poker_player
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000	poker_player
SELECT name FROM people WHERE exists (SELECT 1 FROM poker_player WHERE poker_player.people_id = people.people_id)	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC, T2.Earnings DESC, T2.Poker_Player_ID ASC	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC, T1.Name ASC, T2.Poker_Player_ID ASC	poker_player
SELECT birth_date FROM people WHERE people_id IN (SELECT people_id FROM poker_player WHERE earnings = (SELECT MIN(earnings) FROM poker_player))	poker_player
SELECT birth_date FROM people WHERE people_id IN (SELECT people_id FROM poker_player WHERE earnings = (SELECT MIN(earnings) FROM poker_player))	poker_player
SELECT T2.Money_Rank FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height = (SELECT MAX(Height) FROM people AS T3 JOIN poker_player AS T4 ON T3.People_ID = T4.People_ID)	poker_player
SELECT T2.Money_Rank FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height = (SELECT MAX(Height) FROM people AS T3 JOIN poker_player AS T4 ON T3.People_ID = T4.People_ID)	poker_player
SELECT avg(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Height  >  200	poker_player
SELECT avg(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height > 200	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC, T1.Name ASC	poker_player
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC, T1.Name ASC, T2.Poker_Player_ID ASC	poker_player
SELECT Nationality , COUNT(*) FROM people GROUP BY Nationality	poker_player
SELECT Nationality , COUNT(*) FROM people GROUP BY Nationality	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(ncount) FROM (SELECT COUNT(*) as ncount FROM people GROUP BY Nationality) as counts)	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(ncount) FROM (SELECT COUNT(*) as ncount FROM people GROUP BY Nationality) as counts)	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT count(DISTINCT Nationality) FROM people	poker_player
SELECT count(DISTINCT Nationality) FROM people	poker_player
SELECT count(*) FROM area_code_state	voter_1
SELECT contestant_number ,  contestant_name FROM contestants ORDER BY contestant_name DESC	voter_1
SELECT vote_id , phone_number , state FROM votes	voter_1
SELECT max(area_code) , min(area_code) FROM area_code_state	voter_1
SELECT max(created) FROM votes WHERE state  =  'CA'	voter_1
SELECT contestant_name FROM contestants WHERE contestant_name != 'Jessie Alloway'	voter_1
SELECT DISTINCT state , created FROM votes	voter_1
SELECT T1.contestant_number , T1.contestant_name FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number HAVING count(*) >= 2	voter_1
WITH VoteCounts AS (SELECT contestant_number, COUNT(*) AS vote_count FROM votes GROUP BY contestant_number), MinVotes AS (SELECT MIN(vote_count) AS min_votes FROM VoteCounts) SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS C JOIN VoteCounts VC ON C.contestant_number = VC.contestant_number JOIN MinVotes MV ON VC.vote_count = MV.min_votes	voter_1
SELECT count(*) FROM votes WHERE state  =  'NY' OR state  =  'CA'	voter_1
SELECT count(*) FROM contestants WHERE contestant_number NOT IN ( SELECT contestant_number FROM votes )	voter_1
SELECT T1.area_code FROM area_code_state AS T1 JOIN (SELECT state, COUNT(*) as votes_count FROM votes GROUP BY state) AS T2 ON T1.state = T2.state WHERE T2.votes_count = (SELECT MAX(votes_count) FROM (SELECT state, COUNT(*) AS votes_count FROM votes GROUP BY state) AS V2)	voter_1
SELECT T2.created , T2.state , T2.phone_number FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number = T2.contestant_number WHERE T1.contestant_name = 'Tabatha Gehling'	voter_1
SELECT T3.area_code FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number = T2.contestant_number JOIN area_code_state AS T3 ON T2.state = T3.state WHERE T1.contestant_name = 'Tabatha Gehling' INTERSECT SELECT T3.area_code FROM contestants AS T1 JOIN votes AS T2 ON T1.contestant_number = T2.contestant_number JOIN area_code_state AS T3 ON T2.state = T3.state WHERE T1.contestant_name = 'Kelly Clauss'	voter_1
select contestant_name from contestants where contestant_name like '%al%'	voter_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT count(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT count(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'	world_1
SELECT sum(SurfaceArea) FROM country WHERE Region  =  'Caribbean'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT region FROM country WHERE code IN (SELECT countrycode FROM city WHERE name = 'Kabul')	world_1
SELECT region FROM country WHERE code IN (SELECT countrycode FROM city WHERE name = 'Kabul');	world_1
SELECT language FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE name = 'Aruba') AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE name = 'Aruba'))	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' AND Percentage = (SELECT max(T4.Percentage) FROM country AS T3 JOIN countrylanguage AS T4 ON T3.Code = T4.CountryCode WHERE T3.Name = 'Aruba')	world_1
SELECT Population , LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Population , LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Population , Region FROM country WHERE Name = 'Angola'	world_1
SELECT Population , Region FROM country WHERE Name = 'Angola'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Region  =  'Central Africa'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')	world_1
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia')	world_1
SELECT sum(Population) , max(GNP) FROM country WHERE Continent = 'Asia'	world_1
SELECT sum(Population) ,  max(GNP) FROM country WHERE Continent  =  'Asia'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT sum(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'	world_1
SELECT sum(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'	world_1
SELECT sum(Population) FROM city WHERE District  =  'Gelderland'	world_1
SELECT sum(Population) FROM city WHERE District  =  'Gelderland'	world_1
SELECT avg(GNP), sum(population) FROM country WHERE GovernmentForm = 'US territory'	world_1
SELECT avg(GNP), sum(population) FROM country WHERE GovernmentForm = 'US territory'	world_1
SELECT count(DISTINCT LANGUAGE) FROM countrylanguage	world_1
SELECT count(DISTINCT LANGUAGE) FROM countrylanguage	world_1
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'	world_1
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'	world_1
SELECT COUNT(T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba'	world_1
SELECT COUNT(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.name = 'Aruba'	world_1
SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Afghanistan' AND IsOfficial = 'T'	world_1
SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Afghanistan' AND IsOfficial = 'T'	world_1
SELECT T1.name FROM country AS T1 WHERE T1.Code IN (SELECT T2.CountryCode FROM countrylanguage AS T2 GROUP BY T2.CountryCode HAVING count(*) = (SELECT COUNT(*) AS C FROM countrylanguage AS T3 GROUP BY T3.CountryCode ORDER BY C DESC LIMIT 1))	world_1
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage GROUP BY countrycode HAVING COUNT(DISTINCT language) = (SELECT MAX(lang_count) FROM (SELECT COUNT(DISTINCT language) AS lang_count FROM countrylanguage GROUP BY countrycode)))	world_1
SELECT continent FROM (SELECT continent, COUNT(DISTINCT language) AS lang_count FROM country c INNER JOIN countrylanguage cl ON c.code = cl.countrycode GROUP BY continent ORDER BY lang_count DESC) WHERE lang_count = (SELECT MAX(lang_count) FROM (SELECT continent, COUNT(DISTINCT language) AS lang_count FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY continent))	world_1
WITH LanguageCount AS (SELECT continent, COUNT(DISTINCT language) AS NumLanguages FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY continent) SELECT continent FROM LanguageCount WHERE NumLanguages = (SELECT MAX(NumLanguages) FROM LanguageCount)	world_1
SELECT COUNT(DISTINCT a.code) FROM country AS a JOIN countrylanguage AS b ON a.code = b.countrycode WHERE b.language IN ('English', 'Dutch') GROUP BY a.code HAVING COUNT(DISTINCT b.language) = 2	world_1
SELECT COUNT(*) FROM (SELECT T1.Code, T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' INTERSECT SELECT T1.Code, T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch');	world_1
SELECT T1.Name FROM country AS T1 WHERE T1.Code IN (SELECT T2.Code FROM country AS T2 JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'English' INTERSECT SELECT T2.Code FROM country AS T2 JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'French')	world_1
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English') AND code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French')	world_1
SELECT country.name FROM country JOIN countrylanguage AS cl1 ON country.code = cl1.countrycode JOIN countrylanguage AS cl2 ON country.code = cl2.countrycode WHERE cl1.language = 'English' AND cl1.isofficial = 'T' AND cl2.language = 'French' AND cl2.isofficial = 'T'	world_1
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE isofficial = 'T' AND language = 'English') AND code IN (SELECT countrycode FROM countrylanguage WHERE isofficial = 'T' AND language = 'French')	world_1
SELECT COUNT( DISTINCT Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'	world_1
SELECT COUNT( DISTINCT Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'	world_1
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'	world_1
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'	world_1
select t1.Code from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where (t2.language = 'English' or t2.language = 'Dutch') and isofficial = 't'	world_1
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE isofficial = 'T' AND language IN ('English', 'Dutch'))	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language HAVING COUNT(*) = (SELECT MAX(LangCount) FROM (SELECT COUNT(*) AS LangCount FROM country AS SubT1 JOIN countrylanguage AS SubT2 ON SubT1.Code = SubT2.CountryCode WHERE SubT1.Continent = 'Asia' GROUP BY SubT2.Language) AS Counts)	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) as c FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language) as counts)	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(*) = 1	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.GovernmentForm  =  'Republic' GROUP BY T2.Language HAVING COUNT(*)  =  1	world_1
SELECT T1.Name, T1.Population FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' AND T1.Population = (SELECT max(T3.Population) FROM city AS T3 JOIN countrylanguage AS T4 ON T3.CountryCode = T4.CountryCode WHERE T4.Language = 'English')	world_1
SELECT T1.Name, T1.Population FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' AND T1.Population = (SELECT max(T3.Population) FROM city AS T3 JOIN countrylanguage AS T4 ON T3.CountryCode = T4.CountryCode WHERE T4.Language = 'English')	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')	world_1
SELECT AVG(c.lifeexpectancy) FROM country AS c WHERE c.code NOT IN (SELECT cl.countrycode FROM countrylanguage AS cl WHERE cl.language = 'English' AND cl.isofficial = 'T')	world_1
SELECT AVG(c.lifeexpectancy) FROM country c WHERE NOT EXISTS (SELECT 1 FROM countrylanguage cl WHERE cl.countrycode = c.code AND cl.language = 'English' AND cl.isofficial = 'T')	world_1
SELECT SUM(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')	world_1
SELECT SUM(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'	world_1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'	world_1
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE IndepYear < 1930 AND T2.IsOfficial = 'T'	world_1
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE IndepYear < 1930 AND T2.IsOfficial = 'T'	world_1
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')	world_1
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT A.name FROM country AS A WHERE A.continent = 'Africa' AND A.population < (SELECT MIN(B.population) FROM country B WHERE B.continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Africa' AND population < (SELECT min(population) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND population > (SELECT max(population) FROM country WHERE Continent = 'Africa')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')	world_1
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')	world_1
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')	world_1
SELECT DISTINCT CountryCode FROM countrylanguage WHERE LANGUAGE != 'English'	world_1
SELECT DISTINCT CountryCode FROM countrylanguage WHERE LANGUAGE != 'English'	world_1
SELECT Code FROM country WHERE GovernmentForm != 'Republic' EXCEPT SELECT CountryCode FROM countrylanguage WHERE LANGUAGE = 'English'	world_1
SELECT Code FROM country WHERE GovernmentForm != 'Republic' EXCEPT SELECT CountryCode FROM countrylanguage WHERE LANGUAGE  =  'English'	world_1
SELECT T1.name FROM city AS T1 WHERE T1.countrycode IN (SELECT T2.code FROM country AS T2 WHERE T2.continent = 'Europe' AND NOT EXISTS (SELECT countrycode FROM countrylanguage AS T3 WHERE T2.code = T3.countrycode AND T3.language = 'English' AND T3.isofficial = 'T'))	world_1
SELECT T2.Name FROM country AS T1 JOIN city AS T2 ON T2.CountryCode = T1.Code WHERE T1.Continent = 'Europe' AND T1.Code NOT IN (SELECT T3.Code FROM country AS T3 JOIN countrylanguage AS T4 ON T3.Code = T4.CountryCode WHERE T4.IsOfficial = 'T' AND T4.Language = 'English')	world_1
select t3.name, t3.population from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode join city as t3 on t1.code = t3.countrycode where t2.isofficial = 't' and t2.language = 'Chinese' and t1.continent = 'Asia'	world_1
SELECT DISTINCT T3.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T2.IsOfficial = 'T' AND T2.Language = 'Chinese' AND T1.Continent = 'Asia'	world_1
SELECT Name, SurfaceArea, IndepYear FROM country WHERE Population = (SELECT MIN(Population) FROM country)	world_1
SELECT Name, SurfaceArea, IndepYear FROM country WHERE Population = (SELECT MIN(Population) FROM country)	world_1
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)	world_1
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)	world_1
SELECT distinctcountry.name, num_languages FROM (SELECT C.name, COUNT(DISTINCT L.language) AS num_languages FROM country C INNER JOIN countrylanguage L ON C.code = L.countrycode GROUP BY C.code) AS distinctcountry WHERE distinctcountry.num_languages >= 3	world_1
SELECT country.name, COUNT(DISTINCT countrylanguage.language) AS language_count FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY country.code HAVING COUNT(DISTINCT countrylanguage.language) > 2	world_1
SELECT count(*) , District FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District	world_1
SELECT count(*) , District FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District	world_1
SELECT sum(Population) , GovernmentForm FROM country GROUP BY GovernmentForm HAVING avg(LifeExpectancy) > 72	world_1
SELECT sum(Population) , GovernmentForm FROM country GROUP BY GovernmentForm HAVING avg(LifeExpectancy) > 72	world_1
SELECT sum(Population) , avg(LifeExpectancy) , Continent FROM country GROUP BY Continent HAVING avg(LifeExpectancy) < 72	world_1
SELECT sum(Population) , avg(LifeExpectancy) , Continent FROM country GROUP BY Continent HAVING avg(LifeExpectancy) < 72	world_1
SELECT Name, SurfaceArea, Code FROM country ORDER BY SurfaceArea DESC, Name ASC, Code ASC LIMIT 5	world_1
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC, Population DESC, Code ASC LIMIT 5	world_1
SELECT name FROM country ORDER BY population DESC, name, code LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population DESC, Name ASC, Code ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3	world_1
SELECT count(*) FROM country WHERE continent  =  'Asia'	world_1
SELECT count(*) FROM country WHERE continent  =  'Asia'	world_1
SELECT Name FROM country WHERE continent = 'Europe' AND Population = '80000'	world_1
SELECT Name FROM country WHERE continent = 'Europe' AND Population = '80000'	world_1
select sum(population), avg(surfacearea) from country where continent = 'North America' and surfacearea > 3000	world_1
select sum(population), avg(surfacearea) from country where continent = 'North America' and surfacearea > 3000	world_1
SELECT name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
select name from city where population between 160000 and 900000	world_1
SELECT LANGUAGE FROM countrylanguage GROUP BY LANGUAGE HAVING count(*) = (SELECT max(c) FROM (SELECT count(*) as c FROM countrylanguage GROUP BY LANGUAGE) temp)	world_1
SELECT LANGUAGE FROM countrylanguage GROUP BY LANGUAGE HAVING COUNT(*) = (SELECT MAX(C) FROM (SELECT COUNT(*) AS C FROM countrylanguage GROUP BY LANGUAGE) sub)	world_1
SELECT T1.Language, T1.CountryCode, T2.Name FROM countrylanguage AS T1 JOIN country as T2 on T1.CountryCode = T2.Code WHERE Percentage = (SELECT MAX(Percentage) FROM countrylanguage as T3 WHERE T3.CountryCode = T2.Code)	world_1
SELECT CountryCode, Language FROM countrylanguage WHERE (CountryCode, Percentage) IN (SELECT CountryCode, max(Percentage) FROM countrylanguage GROUP BY CountryCode)	world_1
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage as T1 WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage as T2 WHERE T2.CountryCode = T1.CountryCode)	world_1
SELECT count(DISTINCT CountryCode) FROM countrylanguage WHERE LANGUAGE = 'Spanish' and (CountryCode, Percentage) IN (SELECT CountryCode, max(Percentage) FROM countrylanguage GROUP BY CountryCode)	world_1
SELECT DISTINCT CountryCode FROM countrylanguage as T1 WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage as T2 WHERE T2.CountryCode = T1.CountryCode)	world_1
SELECT CountryCode FROM countrylanguage WHERE LANGUAGE = 'Spanish' and (CountryCode, Percentage) IN (SELECT CountryCode, max(Percentage) FROM countrylanguage GROUP BY CountryCode)	world_1
SELECT count(*) FROM conductor	orchestra
SELECT count(*) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Age ASC, Conductor_ID ASC	orchestra
SELECT Name FROM conductor ORDER BY Age ASC, Conductor_ID ASC	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID ASC	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID ASC	orchestra
SELECT avg(Attendance) FROM SHOW	orchestra
SELECT avg(Attendance) FROM SHOW	orchestra
SELECT max(SHARE) , min(SHARE) FROM performance WHERE TYPE != 'Live final'	orchestra
SELECT max(SHARE) , min(SHARE) FROM performance WHERE TYPE != 'Live final'	orchestra
SELECT count(DISTINCT Nationality) FROM conductor	orchestra
SELECT count(DISTINCT Nationality) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC	orchestra
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)	orchestra
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)	orchestra
SELECT T1.Name , T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID	orchestra
SELECT T1.Name , T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T2.Conductor_ID HAVING COUNT(*)  >  1	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T2.Conductor_ID HAVING COUNT(*)  >  1	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(*) = (SELECT MAX(Counted) FROM (SELECT COUNT(*) as Counted FROM orchestra GROUP BY Conductor_ID) as MaxCount)	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(*) = (SELECT MAX(CountOrch) FROM (SELECT COUNT(*) AS CountOrch FROM orchestra GROUP BY Conductor_ID) AS TempTable)	orchestra
SELECT T1.Name FROM conductor AS T1 WHERE T1.conductor_id IN (SELECT T2.conductor_id FROM orchestra AS T2 WHERE T2.year_of_founded > 2008)	orchestra
SELECT T1.Name FROM conductor AS T1 WHERE T1.conductor_id IN (SELECT T2.conductor_id FROM orchestra AS T2 WHERE T2.year_of_founded > 2008)	orchestra
SELECT Record_Company , COUNT(*) FROM orchestra GROUP BY Record_Company	orchestra
SELECT Record_Company , COUNT(*) FROM orchestra GROUP BY Record_Company	orchestra
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_Format ASC	orchestra
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_Format, Orchestra_ID	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company HAVING COUNT(*) = (SELECT MAX(orch_count) FROM (SELECT COUNT(*) AS orch_count FROM orchestra GROUP BY Record_Company) AS counts)	orchestra
SELECT record_company FROM (SELECT record_company, COUNT(*) AS num_orchestras FROM orchestra GROUP BY record_company ORDER BY num_orchestras DESC) AS rc WHERE rc.num_orchestras = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(*) AS num_orchestras FROM orchestra GROUP BY record_company) as stats)	orchestra
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format  =  'CD' OR Major_Record_Format  =  'DVD'	orchestra
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'	orchestra
SELECT DISTINCT o.year_of_founded FROM orchestra o WHERE o.orchestra_id IN (SELECT p.orchestra_id FROM performance p GROUP BY p.orchestra_id HAVING COUNT(p.performance_id) > 1)	orchestra
SELECT Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(*) > 1	orchestra
SELECT count(*) FROM Highschooler	network_1
SELECT count(*) FROM Highschooler	network_1
SELECT name , grade FROM Highschooler	network_1
SELECT name , grade FROM Highschooler	network_1
SELECT DISTINCT grade FROM Highschooler	network_1
SELECT grade FROM Highschooler	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10	network_1
SELECT grade , count(*) FROM Highschooler GROUP BY grade	network_1
SELECT grade , count(*) FROM Highschooler GROUP BY grade	network_1
WITH GradeCounts AS (SELECT grade, COUNT(*) AS total FROM Highschooler GROUP BY grade) SELECT grade FROM GradeCounts WHERE total = (SELECT MAX(total) FROM GradeCounts)	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Highschooler GROUP BY grade) AS counts)	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4	network_1
SELECT ide, COUNT(DISTINCT fre.friend_id) AS total_friends FROM (SELECT id AS ide FROM highschooler) LEFT JOIN (SELECT student_id, friend_id FROM friend UNION ALL SELECT friend_id, student_id FROM friend) fre ON ide = fre.student_id GROUP BY ide	network_1
SELECT id, (SELECT COUNT(*) FROM friend WHERE friend_id = h.id) + (SELECT COUNT(*) FROM friend WHERE student_id = h.id) AS num_friends FROM highschooler h	network_1
SELECT name, (SELECT COUNT(*) FROM friend WHERE highschooler.id = friend.student_id) AS friend_count FROM highschooler	network_1
SELECT h2.name as HighschoolerName, (SELECT COUNT(*) FROM friend WHERE student_id = h2.id) as FriendshipCount FROM highschooler h2	network_1
SELECT T2.name FROM (SELECT student_id AS id FROM Friend UNION ALL SELECT friend_id AS id FROM Friend) AS T1 JOIN Highschooler AS T2 ON T1.id = T2.ID GROUP BY T1.id HAVING COUNT(*) = (SELECT COUNT(*) AS c FROM (SELECT student_id AS id FROM Friend UNION ALL SELECT friend_id AS id FROM Friend) AS T3 GROUP BY T3.id ORDER BY c DESC LIMIT 1)	network_1
SELECT T2.name FROM (SELECT student_id AS id FROM Friend UNION ALL SELECT friend_id AS id FROM Friend) AS T1 JOIN Highschooler AS T2 ON T1.id = T2.ID GROUP BY T1.id HAVING COUNT(*) = (SELECT COUNT(*) AS c FROM (SELECT student_id AS id FROM Friend UNION ALL SELECT friend_id AS id FROM Friend) AS T3 GROUP BY T3.id ORDER BY c DESC LIMIT 1)	network_1
SELECT H.name FROM highschooler H WHERE (SELECT COUNT(*) FROM friend F WHERE F.student_id = H.id OR F.friend_id = H.id) >= 3	network_1
SELECT h.name FROM highschooler h WHERE (SELECT COUNT(*) FROM friend WHERE student_id = h.id OR friend_id = h.id) >= 3	network_1
SELECT T3.ID, T4.name FROM (SELECT T2.ID, T1.friend_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id WHERE T2.name = 'Kyle' UNION SELECT T2.ID, T1.student_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.id WHERE T2.name = 'Kyle') AS T3 JOIN Highschooler AS T4 ON T3.friend_id = T4.ID	network_1
SELECT T3.ID, T4.name FROM (SELECT T2.ID, T1.friend_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id WHERE T2.name = 'Kyle' UNION SELECT T2.ID, T1.student_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.id WHERE T2.name = 'Kyle') AS T3 JOIN Highschooler AS T4 ON T3.friend_id = T4.ID	network_1
SELECT H.id, COUNT(F.friend_id) AS num_friends FROM highschooler H LEFT JOIN friend F ON H.id = F.student_id WHERE H.name = 'Kyle' GROUP BY H.id	network_1
SELECT T3.ID, COUNT(T3.friend_id) FROM (SELECT T2.ID, T1.friend_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id WHERE T2.name = 'Kyle' UNION SELECT T2.ID, T1.student_id AS friend_id FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.id WHERE T2.name = 'Kyle') AS T3 GROUP BY T3.ID;	network_1
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend UNION SELECT friend_id FROM friend)	network_1
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend) AND id NOT IN (SELECT friend_id FROM friend)	network_1
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)	network_1
SELECT name FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend) AND id NOT IN (SELECT friend_id FROM friend)	network_1
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes	network_1
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes	network_1
SELECT T1.name FROM highschooler AS T1 WHERE T1.id IN (SELECT DISTINCT T2.student_id FROM friend AS T2) and T1.id IN (SELECT DISTINCT T3.liked_id FROM likes AS T3)	network_1
SELECT T3.name FROM Highschooler as T3 WHERE T3.ID IN (SELECT T2.ID FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id UNION SELECT T2.ID FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.friend_id = T2.id INTERSECT SELECT T2.ID FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id)	network_1
SELECT id, COUNT(DISTINCT L1.liked_id) + COUNT(DISTINCT L2.student_id) AS total_likes FROM highschooler h LEFT JOIN likes L1 ON h.id = L1.student_id LEFT JOIN likes L2 ON h.id = L2.liked_id GROUP BY id	network_1
SELECT T1.ID, (SELECT COUNT(*) FROM Likes as T2 WHERE T2.student_id = T1.ID) as given, (SELECT COUNT(*) FROM Likes AS T3 WHERE T3.liked_id = T1.ID) as received FROM Highschooler AS T1	network_1
SELECT T2.name, COALESCE(COUNT(DISTINCT T1.liked_id), 0) AS likes_given, COALESCE(COUNT(DISTINCT T3.student_id), 0) AS likes_received FROM Highschooler AS T2 LEFT JOIN Likes AS T1 ON T1.student_id = T2.ID LEFT JOIN Likes AS T3 ON T3.liked_id = T2.ID GROUP BY T2.ID, T2.name	network_1
SELECT T2.name, COUNT(DISTINCT T1.student_id) AS likes_given, COUNT(DISTINCT T3.liked_id) AS likes_received FROM Highschooler AS T2 LEFT JOIN Likes AS T1 ON T1.student_id = T2.ID LEFT JOIN Likes AS T3 ON T3.liked_id = T2.ID GROUP BY T2.ID	network_1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id GROUP BY T1.liked_id HAVING count(*) = (SELECT max(count) FROM (SELECT count(*) as count FROM Likes GROUP BY liked_id) AS counts)	network_1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id GROUP BY T1.liked_id HAVING count(*) = (SELECT MAX(ncount) from (SELECT COUNT(*) as ncount FROM Likes AS T3 JOIN Highschooler AS T4 ON T3.liked_id = T4.id GROUP BY T3.liked_id) temp)	network_1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id GROUP BY T1.liked_id HAVING count(*) >= 2	network_1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id GROUP BY T1.liked_id HAVING count(*) >= 2	network_1
SELECT T2.name FROM Highschooler AS T2 JOIN Friend AS T1 ON T1.student_id = T2.id OR T1.friend_id = T2.id WHERE T2.grade > 5 GROUP BY T2.id HAVING count(*) >= 2	network_1
SELECT T2.name FROM Highschooler AS T2 JOIN Friend AS T1 ON T1.student_id = T2.id OR T1.friend_id = T2.id WHERE T2.grade > 5 GROUP BY T2.id HAVING count(*) >= 2	network_1
SELECT h.id AS student_id, (SELECT COUNT(*) FROM likes WHERE liked_id = h.id) AS likes_count FROM highschooler h WHERE h.name = 'Kyle'	network_1
SELECT T2.ID, count(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.ID WHERE T2.name = 'Kyle' GROUP BY T2.ID	network_1
SELECT avg(grade) FROM Highschooler WHERE id IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)	network_1
SELECT avg(grade) FROM Highschooler WHERE id IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)	network_1
SELECT min(grade) FROM Highschooler WHERE id NOT IN (SELECT T1.student_id FROM Friend AS T1 UNION SELECT T2.friend_id FROM Friend AS T2)	network_1
SELECT min(grade) FROM Highschooler WHERE id NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)	network_1
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals	dog_kennels
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals	dog_kennels
SELECT avg(age) FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments )	dog_kennels
SELECT avg(age) FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments )	dog_kennels
SELECT professional_id , last_name , cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT T1.professional_id , T1.last_name , T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING count(*) > 2	dog_kennels
SELECT professional_id , last_name , cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT T1.professional_id , T1.last_name , T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING count(*) > 2	dog_kennels
select name from dogs where dog_id not in ( select dog_id from treatments group by dog_id having sum(cost_of_treatment) > 1000 )	dog_kennels
select name from dogs where dog_id not in ( select dog_id from treatments group by dog_id having sum(cost_of_treatment) > 1000 )	dog_kennels
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs	dog_kennels
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs	dog_kennels
SELECT professional_id , role_code , email_address FROM Professionals EXCEPT SELECT T1.professional_id , T1.role_code , T1.email_address FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT professional_id , role_code , email_address FROM Professionals EXCEPT SELECT T1.professional_id , T1.role_code , T1.email_address FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT T1.owner_id, T2.first_name, T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id, T2.first_name, T2.last_name HAVING COUNT(*) = (SELECT MAX(dog_count) FROM (SELECT owner_id, COUNT(*) AS dog_count FROM Dogs GROUP BY owner_id) sub)	dog_kennels
SELECT T1.owner_id, T2.first_name, T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id HAVING count(*) = (SELECT MAX(dog_count) FROM (SELECT owner_id, count(*) AS dog_count FROM Dogs GROUP BY owner_id) AS subquery)	dog_kennels
SELECT T1.professional_id , T1.role_code , T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING count(*) >= 2	dog_kennels
SELECT T1.professional_id , T1.role_code , T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING count(*) >= 2	dog_kennels
SELECT T1.breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_code HAVING COUNT(*) = (SELECT MAX(counts) FROM (SELECT COUNT(*) AS counts FROM Dogs GROUP BY breed_code) AS subquery)	dog_kennels
SELECT T1.breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_code HAVING COUNT(*) = (SELECT MAX(dog_count) FROM (SELECT COUNT(*) AS dog_count FROM Dogs GROUP BY breed_code) AS subquery)	dog_kennels
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.last_name HAVING COUNT(*) = (SELECT MAX(treatment_count) FROM (SELECT COUNT(*) AS treatment_count FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY owner_id) AS max_count)	dog_kennels
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.last_name HAVING SUM(T3.cost_of_treatment) = (SELECT MAX(cost) FROM (SELECT SUM(T5.cost_of_treatment) as cost FROM Dogs AS T4 JOIN Treatments AS T5 ON T4.dog_id = T5.dog_id GROUP BY T4.owner_id))	dog_kennels
WITH TotalCosts AS (SELECT treatment_type_code, SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN TotalCosts AS T2 ON T1.treatment_type_code = T2.treatment_type_code WHERE T2.total_cost = (SELECT MIN(total_cost) FROM TotalCosts)	dog_kennels
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code HAVING SUM(T2.cost_of_treatment) = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) AS SubQuery)	dog_kennels
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id HAVING SUM(T3.cost_of_treatment) = (SELECT MAX(cost) FROM (SELECT SUM(T5.cost_of_treatment) as cost FROM Dogs AS T4 JOIN Treatments AS T5 ON T4.dog_id = T5.dog_id GROUP BY T4.owner_id))	dog_kennels
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id HAVING SUM(T3.cost_of_treatment) = (SELECT MAX(total_cost) FROM (SELECT SUM(T3.cost_of_treatment) AS total_cost FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id) AS Sub)	dog_kennels
SELECT p.professional_id, p.cell_number FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2	dog_kennels
SELECT P.professional_id, P.cell_number FROM professionals P JOIN treatments T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.cell_number HAVING COUNT(DISTINCT T.treatment_type_code) >= 2	dog_kennels
SELECT T1.first_name, T1.last_name FROM Professionals AS T1 WHERE T1.professional_id IN (SELECT T2.professional_id FROM treatments AS T2 WHERE T2.cost_of_treatment < (SELECT AVG(T3.cost_of_treatment) FROM treatments AS T3))	dog_kennels
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT avg(cost_of_treatment) FROM Treatments))	dog_kennels
SELECT T1.date_of_treatment , T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT T1.date_of_treatment , T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT T1.cost_of_treatment , T2.treatment_type_description FROM Treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code = T2.treatment_type_code	dog_kennels
SELECT T1.cost_of_treatment , T2.treatment_type_description FROM Treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code = T2.treatment_type_code	dog_kennels
SELECT T1.first_name ,  T1.last_name ,  T2.size_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id	dog_kennels
SELECT T1.first_name ,  T1.last_name ,  T2.size_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id	dog_kennels
SELECT T1.first_name , T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id	dog_kennels
SELECT T1.first_name , T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id	dog_kennels
SELECT T1.name, T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T1.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) = (SELECT COUNT(*) FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1))	dog_kennels
SELECT T1.name, T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T1.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING count(*) = (SELECT MIN(c) FROM (SELECT count(*) AS c FROM Dogs GROUP BY breed_code) AS counts))	dog_kennels
SELECT T1.first_name , T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'	dog_kennels
SELECT T1.first_name , T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'	dog_kennels
SELECT date_arrived, date_departed FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)	dog_kennels
SELECT date_arrived, date_departed FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)	dog_kennels
SELECT o.last_name FROM Owners AS o WHERE o.owner_id IN (SELECT d1.owner_id FROM dogs AS d1 WHERE d1.age = (SELECT MIN(d2.age) FROM dogs AS d2))	dog_kennels
SELECT o.last_name FROM Owners AS o WHERE o.owner_id IN (SELECT d1.owner_id FROM dogs AS d1 WHERE d1.age = (SELECT MIN(d2.age) FROM dogs AS d2))	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT date_arrived , date_departed FROM Dogs	dog_kennels
SELECT date_arrived , date_departed FROM Dogs	dog_kennels
SELECT count(DISTINCT dog_id) FROM Treatments	dog_kennels
SELECT count(DISTINCT dog_id) FROM Treatments	dog_kennels
SELECT count(DISTINCT professional_id) FROM Treatments	dog_kennels
SELECT count(DISTINCT professional_id) FROM Treatments	dog_kennels
SELECT role_code , street , city , state FROM professionals WHERE city LIKE '%West%'	dog_kennels
SELECT role_code , street , city , state FROM professionals WHERE city LIKE '%West%'	dog_kennels
SELECT first_name , last_name , email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT first_name , last_name , email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT count(*) FROM Dogs WHERE age < ( SELECT avg(age) FROM Dogs )	dog_kennels
SELECT count(*) FROM Dogs WHERE age < ( SELECT avg(age) FROM Dogs )	dog_kennels
SELECT MAX(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)	dog_kennels
SELECT cost_of_treatment FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)	dog_kennels
SELECT count(*) FROM Dogs WHERE dog_id NOT IN ( SELECT dog_id FROM Treatments )	dog_kennels
select count(*) from dogs where dog_id not in ( select dog_id from treatments )	dog_kennels
SELECT count(*) FROM Owners WHERE owner_id NOT IN ( SELECT owner_id FROM Dogs )	dog_kennels
SELECT count(*) FROM Owners WHERE owner_id NOT IN ( SELECT owner_id FROM Dogs )	dog_kennels
SELECT count(*) FROM Professionals WHERE professional_id NOT IN ( SELECT professional_id FROM Treatments )	dog_kennels
SELECT count(*) FROM Professionals WHERE professional_id NOT IN ( SELECT professional_id FROM Treatments )	dog_kennels
SELECT name , age , weight FROM Dogs WHERE abandoned_yn = 1	dog_kennels
SELECT name , age , weight FROM Dogs WHERE abandoned_yn = 1	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT max(age) FROM Dogs	dog_kennels
SELECT max(age) FROM Dogs	dog_kennels
SELECT charge_type , charge_amount FROM Charges	dog_kennels
SELECT charge_type , charge_amount FROM Charges	dog_kennels
SELECT max(charge_amount) FROM Charges	dog_kennels
SELECT max(charge_amount) FROM Charges	dog_kennels
SELECT email_address , cell_number , home_phone FROM professionals	dog_kennels
SELECT email_address , cell_number , home_phone FROM professionals	dog_kennels
SELECT DISTINCT breed_code , size_code FROM dogs	dog_kennels
SELECT DISTINCT breed_code , size_code FROM dogs	dog_kennels
SELECT p.first_name, tt.treatment_type_description FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id JOIN treatment_types tt ON t.treatment_type_code = tt.treatment_type_code	dog_kennels
SELECT p.first_name, tt.treatment_type_description FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id JOIN treatment_types tt ON t.treatment_type_code = tt.treatment_type_code	dog_kennels
SELECT count(*) FROM singer	singer
SELECT count(*) FROM singer	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name ASC	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Singer_ID ASC	singer
SELECT Birth_Year , Citizenship FROM singer	singer
SELECT Birth_Year , Citizenship FROM singer	singer
SELECT Name FROM singer WHERE Citizenship != 'France'	singer
SELECT Name FROM singer WHERE Citizenship != 'France'	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)	singer
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)	singer
SELECT Citizenship , COUNT(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship , COUNT(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship FROM singer GROUP BY Citizenship HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM singer GROUP BY Citizenship) AS counts)	singer
SELECT citizenship, COUNT(*) AS occurrence FROM singer GROUP BY citizenship	singer
SELECT Citizenship , max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship , max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT T2.Title , T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID	singer
SELECT T2.Title , T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID	singer
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000	singer
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000	singer
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING COUNT(song_id) > 1)	singer
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING COUNT(*) > 1)	singer
SELECT T1.Name, sum(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID	singer
SELECT singer.name, SUM(song.sales) FROM song JOIN singer ON singer.singer_id = song.singer_id GROUP BY singer.singer_id	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955	singer
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955	singer
SELECT count(*) FROM Other_Available_Features	real_estate_properties
SELECT feature_type_name FROM ref_feature_types WHERE feature_type_code IN (SELECT feature_type_code FROM other_available_features WHERE feature_name = 'AirCon')	real_estate_properties
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code	real_estate_properties
SELECT property_name FROM Properties WHERE (property_type_code = 'House' or property_type_code = 'Apartment') AND room_count > 1;	real_estate_properties