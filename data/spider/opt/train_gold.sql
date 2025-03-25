SELECT COUNT(*) FROM head WHERE age > 56 AND head_id IN (SELECT head_id FROM management)	department_management
SELECT name ,  born_state ,  age FROM head ORDER BY age	department_management
SELECT creation ,  name ,  budget_in_billions FROM department	department_management
SELECT max(budget_in_billions) ,  min(budget_in_billions) FROM department	department_management
SELECT avg(num_employees) FROM department WHERE ranking BETWEEN 10 AND 15	department_management
SELECT name FROM head WHERE born_state != 'California'	department_management
SELECT DISTINCT T1.creation FROM department AS T1 JOIN management AS T2 ON T1.department_id  =  T2.department_id JOIN head AS T3 ON T2.head_id  =  T3.head_id WHERE T3.born_state  =  'Alabama'	department_management
SELECT born_state FROM head GROUP BY born_state HAVING count(*)  >=  3	department_management
SELECT creation FROM department GROUP BY creation ORDER BY count(*) DESC LIMIT 1	department_management
SELECT department.name, department.num_employees FROM department WHERE department.department_id IN (SELECT management.department_id FROM management JOIN head ON management.head_id = head.head_id WHERE management.temporary_acting = 'Yes')	department_management
SELECT count(DISTINCT temporary_acting) FROM management	department_management
SELECT count(*) FROM department WHERE department_id NOT IN (SELECT department_id FROM management);	department_management
SELECT DISTINCT T1.age FROM management AS T2 JOIN head AS T1 ON T1.head_id  =  T2.head_id WHERE T2.temporary_acting  =  'Yes'	department_management
SELECT T3.born_state FROM department AS T1 JOIN management AS T2 ON T1.department_id  =  T2.department_id JOIN head AS T3 ON T2.head_id  =  T3.head_id WHERE T1.name  =  'Treasury' INTERSECT SELECT T3.born_state FROM department AS T1 JOIN management AS T2 ON T1.department_id  =  T2.department_id JOIN head AS T3 ON T2.head_id  =  T3.head_id WHERE T1.name  =  'Homeland Security'	department_management
SELECT T1.department_id ,  T1.name ,  count(*) FROM management AS T2 JOIN department AS T1 ON T1.department_id  =  T2.department_id GROUP BY T1.department_id HAVING count(*)  >  1	department_management
SELECT head_id, name FROM head WHERE instr(name, 'Ha') > 0	department_management
SELECT count(*) FROM farm	farm
SELECT count(*) FROM farm	farm
SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC	farm
SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC	farm
SELECT Hosts FROM farm_competition WHERE Theme !=  'Aliens'	farm
SELECT Hosts FROM farm_competition WHERE Theme !=  'Aliens'	farm
SELECT Theme FROM farm_competition ORDER BY YEAR ASC	farm
SELECT Theme FROM farm_competition ORDER BY YEAR ASC	farm
SELECT avg(Working_Horses) FROM farm WHERE Total_Horses  >  5000	farm
SELECT avg(Working_Horses) FROM farm WHERE Total_Horses  >  5000	farm
SELECT max(Cows) ,  min(Cows) FROM farm	farm
SELECT max(Cows) ,  min(Cows) FROM farm	farm
SELECT count(DISTINCT Status) FROM city	farm
SELECT count(DISTINCT Status) FROM city	farm
SELECT Official_Name FROM city ORDER BY Population DESC	farm
SELECT Official_Name FROM city ORDER BY Population DESC	farm
SELECT official_name, status FROM city WHERE population = (SELECT MAX(population) FROM city)	farm
SELECT official_name, status FROM city WHERE population = (SELECT MAX(population) FROM city)	farm
SELECT T2.Year ,  T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID	farm
SELECT T2.Year ,  T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID	farm
SELECT T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID HAVING COUNT(*)  >  1	farm
SELECT T1.Official_Name FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID HAVING COUNT(*)  >  1	farm
SELECT c.status FROM city c JOIN farm_competition fc ON c.city_id = fc.host_city_id GROUP BY c.city_id HAVING COUNT(DISTINCT fc.competition_id) = ( SELECT COUNT(DISTINCT competition_id) FROM farm_competition GROUP BY host_city_id ORDER BY COUNT(DISTINCT competition_id) DESC LIMIT 1 )	farm
SELECT T1.Status FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID GROUP BY T2.Host_city_ID ORDER BY COUNT(*) DESC LIMIT 1	farm
SELECT T2.Theme FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID WHERE T1.Population  >  1000	farm
SELECT T2.Theme FROM city AS T1 JOIN farm_competition AS T2 ON T1.City_ID  =  T2.Host_city_ID WHERE T1.Population  >  1000	farm
SELECT Status ,  avg(Population) FROM city GROUP BY Status	farm
SELECT DISTINCT status, population FROM city	farm
SELECT DISTINCT status FROM city ORDER BY COUNT(city_id) OVER (PARTITION BY status) DESC	farm
SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) ASC	farm
SELECT Status FROM city GROUP BY Status ORDER BY COUNT(*) DESC LIMIT 1	farm
SELECT status FROM city GROUP BY status HAVING COUNT(city_id) = (SELECT MAX(num_cities) FROM (SELECT COUNT(city_id) as num_cities FROM city GROUP BY status))	farm
SELECT Official_Name FROM city WHERE City_ID NOT IN (SELECT Host_city_ID FROM farm_competition)	farm
SELECT Official_Name FROM city WHERE City_ID NOT IN (SELECT Host_city_ID FROM farm_competition)	farm
SELECT Status FROM city WHERE Population  >  1500 INTERSECT SELECT Status FROM city WHERE Population  <  500	farm
SELECT Status FROM city WHERE Population  >  1500 INTERSECT SELECT Status FROM city WHERE Population  <  500	farm
SELECT Official_Name FROM city WHERE Population  >  1500 OR Population  <  500	farm
SELECT Official_Name FROM city WHERE Population  >  1500 OR Population  <  500	farm
SELECT Census_Ranking FROM city WHERE Status !=  'Village'	farm
SELECT Census_Ranking FROM city WHERE Status !=  'Village'	farm
SELECT T1.course_name FROM courses AS T1 JOIN student_course_registrations AS T2 ON T1.course_id = T2.course_Id GROUP BY T1.course_id ORDER BY count(*) DESC LIMIT 1	student_assessment
SELECT T1.course_name FROM courses AS T1 JOIN student_course_registrations AS T2 ON T1.course_id = T2.course_Id GROUP BY T1.course_id ORDER BY count(*) DESC LIMIT 1	student_assessment
SELECT student_id FROM student_course_registrations GROUP BY student_id HAVING COUNT(course_id) = (   SELECT MIN(CourseCount)   FROM (    SELECT COUNT(course_id) AS CourseCount    FROM student_course_registrations    GROUP BY student_id    )   )	student_assessment
SELECT student_id FROM student_course_registrations GROUP BY student_id HAVING COUNT(course_id) = (SELECT MIN(course_count) FROM (SELECT COUNT(course_id) AS course_count FROM student_course_registrations GROUP BY student_id))	student_assessment
SELECT T2.first_name ,  T2.last_name FROM candidates AS T1 JOIN people AS T2 ON T1.candidate_id = T2.person_id	student_assessment
SELECT T2.first_name ,  T2.last_name FROM candidates AS T1 JOIN people AS T2 ON T1.candidate_id = T2.person_id	student_assessment
SELECT student_id FROM students WHERE student_id NOT IN (SELECT student_id FROM student_course_attendance)	student_assessment
SELECT student_id FROM students WHERE student_id NOT IN (SELECT student_id FROM student_course_attendance)	student_assessment
SELECT DISTINCT student_id FROM student_course_attendance	student_assessment
SELECT DISTINCT student_id FROM student_course_attendance	student_assessment
SELECT T1.student_id ,  T2.course_name FROM student_course_registrations AS T1 JOIN courses AS T2 ON T1.course_id = T2.course_id	student_assessment
SELECT T2.student_details FROM student_course_registrations AS T1 JOIN students AS T2 ON T1.student_id = T2.student_id ORDER BY T1.registration_date DESC LIMIT 1	student_assessment
SELECT T2.student_details FROM student_course_registrations AS T1 JOIN students AS T2 ON T1.student_id = T2.student_id ORDER BY T1.registration_date DESC LIMIT 1	student_assessment
SELECT COUNT(student_id) FROM (SELECT DISTINCT s.student_id FROM students s JOIN student_course_registrations r ON s.student_id = r.student_id JOIN courses c ON r.course_id = c.course_id WHERE c.course_name = 'English') AS temp	student_assessment
SELECT COUNT(DISTINCT student_id) FROM student_course_attendance WHERE course_id IN (SELECT course_id FROM courses WHERE course_name = 'English')	student_assessment
SELECT count(*) FROM courses AS T1 JOIN student_course_attendance AS T2 ON T1.course_id = T2.course_id WHERE T2.student_id = 171	student_assessment
SELECT count(*) FROM courses AS T1 JOIN student_course_attendance AS T2 ON T1.course_id = T2.course_id WHERE T2.student_id = 171	student_assessment
SELECT T2.candidate_id FROM people AS T1 JOIN candidates AS T2 ON T1.person_id = T2.candidate_id WHERE T1.email_address = 'stanley.monahan@example.org'	student_assessment
SELECT T2.candidate_id FROM people AS T1 JOIN candidates AS T2 ON T1.person_id = T2.candidate_id WHERE T1.email_address = 'stanley.monahan@example.org'	student_assessment
SELECT candidate_id FROM candidate_assessments WHERE assessment_date = (SELECT max(assessment_date) FROM candidate_assessments)	student_assessment
SELECT candidate_id FROM candidate_assessments ORDER BY assessment_date DESC LIMIT 1	student_assessment
SELECT T1.student_details FROM students AS T1 JOIN student_course_registrations AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	student_assessment
SELECT T1.student_details FROM students AS T1 JOIN student_course_registrations AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	student_assessment
SELECT T1.student_id ,  count(*) FROM students AS T1 JOIN student_course_registrations AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id	student_assessment
SELECT T1.student_id ,  count(*) FROM students AS T1 JOIN student_course_registrations AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id	student_assessment
SELECT courses.course_name, COUNT(students.student_id) FROM courses LEFT JOIN student_course_registrations ON courses.course_id = student_course_registrations.course_id LEFT JOIN students ON student_course_registrations.student_id = students.student_id GROUP BY courses.course_name	student_assessment
SELECT sc.course_id, COUNT(sc.student_id) AS num_registered_students, c.course_name FROM student_course_registrations sc JOIN courses c ON sc.course_id = c.course_id GROUP BY sc.course_id, c.course_name	student_assessment
SELECT candidate_id FROM candidates WHERE candidate_id IN (SELECT candidate_id FROM candidate_assessments WHERE asessment_outcome_code = 'Pass')	student_assessment
SELECT candidate_id FROM candidate_assessments WHERE asessment_outcome_code = 'Pass'	student_assessment
SELECT cell_mobile_number FROM people WHERE person_id IN ( SELECT candidate_id FROM candidates WHERE candidate_id IN ( SELECT candidate_id FROM candidate_assessments WHERE asessment_outcome_code = 'Fail' ) )	student_assessment
SELECT cell_mobile_number FROM people WHERE person_id IN (SELECT candidate_id FROM candidate_assessments WHERE asessment_outcome_code = 'Fail')	student_assessment
SELECT student_id FROM student_course_registrations WHERE course_id = 301	student_assessment
SELECT student_id FROM student_course_registrations WHERE course_id = 301	student_assessment
SELECT student_id FROM student_course_registrations WHERE course_id = 301 ORDER BY registration_date DESC LIMIT 1	student_assessment
SELECT student_id FROM student_course_registrations WHERE course_id = 301 ORDER BY registration_date DESC LIMIT 1	student_assessment
SELECT DISTINCT T1.city FROM addresses AS T1 JOIN people_addresses AS T2 ON T1.address_id = T2.address_id	student_assessment
SELECT DISTINCT T1.city FROM addresses AS T1 JOIN people_addresses AS T2 ON T1.address_id = T2.address_id	student_assessment
SELECT DISTINCT T1.city FROM addresses AS T1 JOIN people_addresses AS T2 ON T1.address_id = T2.address_id JOIN students AS T3 ON T2.person_id = T3.student_id	student_assessment
SELECT DISTINCT T1.city FROM addresses AS T1 JOIN people_addresses AS T2 ON T1.address_id = T2.address_id JOIN students AS T3 ON T2.person_id = T3.student_id	student_assessment
SELECT course_name FROM courses ORDER BY course_name	student_assessment
SELECT course_name FROM courses ORDER BY course_name	student_assessment
SELECT first_name FROM people ORDER BY first_name	student_assessment
SELECT first_name FROM people ORDER BY first_name	student_assessment
SELECT student_id FROM student_course_registrations UNION SELECT student_id FROM student_course_attendance	student_assessment
SELECT student_id FROM student_course_registrations UNION SELECT student_id FROM student_course_attendance	student_assessment
SELECT course_id FROM student_course_registrations WHERE student_id = 121 UNION SELECT course_id FROM student_course_attendance WHERE student_id = 121	student_assessment
SELECT course_id   FROM courses   WHERE course_id IN (   SELECT course_id    FROM student_course_registrations    WHERE student_id = 121 UNION SELECT course_id FROM student_course_attendance    WHERE student_id = 121   )	student_assessment
SELECT * FROM students WHERE student_id IN (SELECT student_id FROM student_course_registrations EXCEPT SELECT student_id FROM student_course_attendance)	student_assessment
SELECT * FROM people WHERE person_id IN ( SELECT student_id FROM student_course_registrations EXCEPT SELECT student_id FROM student_course_attendance )	student_assessment
SELECT T2.student_id FROM courses AS T1 JOIN student_course_registrations AS T2 ON T1.course_id = T2.course_id WHERE T1.course_name = 'statistics' ORDER BY T2.registration_date	student_assessment
SELECT T2.student_id FROM courses AS T1 JOIN student_course_registrations AS T2 ON T1.course_id = T2.course_id WHERE T1.course_name = 'statistics' ORDER BY T2.registration_date	student_assessment
SELECT student_id FROM student_course_attendance WHERE course_id IN (SELECT course_id FROM courses WHERE course_name = 'statistics') ORDER BY date_of_attendance	student_assessment
SELECT student_id FROM student_course_attendance WHERE course_id IN (SELECT course_id FROM courses WHERE course_name = 'statistics') ORDER BY date(date_of_attendance)	student_assessment
SELECT date FROM weather WHERE max_temperature_f  >  85	bike_1
SELECT date FROM weather WHERE max_temperature_f  >  85	bike_1
SELECT name FROM station WHERE lat  <  37.5	bike_1
SELECT name FROM station WHERE lat  <  37.5	bike_1
SELECT city ,  max(lat) FROM station GROUP BY city	bike_1
SELECT city ,  max(lat) FROM station GROUP BY city	bike_1
SELECT start_station_name ,  end_station_name FROM trip ORDER BY id LIMIT 3	bike_1
SELECT start_station_name ,  end_station_name FROM trip ORDER BY id LIMIT 3	bike_1
SELECT avg(lat) ,  avg(long) FROM station WHERE city  =  'San Jose'	bike_1
SELECT avg(lat) ,  avg(long) FROM station WHERE city  =  'San Jose'	bike_1
SELECT id FROM trip WHERE duration = (SELECT MIN(duration) FROM trip)	bike_1
SELECT id FROM trip AS t1 WHERE NOT EXISTS (SELECT 1 FROM trip AS t2 WHERE t2.duration < t1.duration)	bike_1
SELECT sum(duration) ,  max(duration) FROM trip WHERE bike_id  =  636	bike_1
SELECT sum(duration) ,  max(duration) FROM trip WHERE bike_id  =  636	bike_1
SELECT zip_code  ,  avg(mean_temperature_f) FROM weather WHERE date LIKE '8/%' GROUP BY zip_code	bike_1
SELECT zip_code, AVG(mean_temperature_f) FROM weather WHERE date LIKE '8%' GROUP BY zip_code	bike_1
SELECT count(DISTINCT bike_id) FROM trip	bike_1
SELECT count(DISTINCT bike_id) FROM trip	bike_1
SELECT count(DISTINCT city) FROM station	bike_1
SELECT count(DISTINCT city) FROM station	bike_1
SELECT COUNT(*) FROM station WHERE city  =  'Mountain View'	bike_1
SELECT COUNT(*) FROM station WHERE city  =  'Mountain View'	bike_1
SELECT DISTINCT T1.name FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id WHERE T2.bikes_available  =  7	bike_1
SELECT DISTINCT T1.name FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id WHERE T2.bikes_available  =  7	bike_1
SELECT start_station_name ,  start_station_id FROM trip WHERE start_date LIKE '8/%' GROUP BY start_station_name ORDER BY COUNT(*) DESC LIMIT 1	bike_1
SELECT start_station_name ,  start_station_id FROM trip WHERE start_date LIKE '8/%' GROUP BY start_station_name ORDER BY COUNT(*) DESC LIMIT 1	bike_1
SELECT bike_id FROM trip WHERE zip_code  =  94002 GROUP BY bike_id ORDER BY COUNT(*) DESC LIMIT 1	bike_1
SELECT bike_id FROM trip WHERE zip_code  =  94002 GROUP BY bike_id ORDER BY COUNT(*) DESC LIMIT 1	bike_1
SELECT COUNT(DISTINCT date) FROM weather WHERE mean_humidity > 50 AND mean_visibility_miles > 8	bike_1
SELECT COUNT(DISTINCT date) FROM weather WHERE mean_humidity > 50 AND mean_visibility_miles > 8	bike_1
SELECT T1.lat ,  T1.long ,  T1.city FROM station AS T1 JOIN trip AS T2 ON T1.id  =  T2.start_station_id ORDER BY T2.duration LIMIT 1	bike_1
SELECT lat, long, city FROM station INNER JOIN trip ON station.id = trip.start_station_id WHERE trip.duration = (SELECT MIN(duration) FROM trip)	bike_1
SELECT id FROM station WHERE city  =  'San Francisco' INTERSECT SELECT station_id FROM status GROUP BY station_id HAVING avg(bikes_available)  >  10	bike_1
SELECT id FROM station WHERE city = 'San Francisco' AND id IN (SELECT station_id FROM status WHERE bikes_available > 10)	bike_1
SELECT T1.name ,  T1.id FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id GROUP BY T2.station_id HAVING avg(T2.bikes_available)  >  14 UNION SELECT name ,  id FROM station WHERE installation_date LIKE '12/%'	bike_1
SELECT T1.name ,  T1.id FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id GROUP BY T2.station_id HAVING avg(T2.bikes_available)  >  14 UNION SELECT name ,  id FROM station WHERE installation_date LIKE '12/%'	bike_1
SELECT cloud_cover FROM weather WHERE zip_code  =  94107 GROUP BY cloud_cover ORDER BY COUNT (*) DESC LIMIT 3	bike_1
SELECT cloud_cover FROM (SELECT cloud_cover, COUNT(*) AS count FROM weather WHERE zip_code = 94107 GROUP BY cloud_cover) ORDER BY count DESC LIMIT 3	bike_1
SELECT zip_code FROM weather GROUP BY zip_code HAVING AVG(mean_sea_level_pressure_inches) = (SELECT MIN(avg_pres) FROM (SELECT AVG(mean_sea_level_pressure_inches) AS avg_pres FROM weather GROUP BY zip_code))	bike_1
SELECT zip_code FROM (SELECT zip_code, AVG(mean_sea_level_pressure_inches) AS average_pressure FROM weather GROUP BY zip_code) WHERE average_pressure = (SELECT MIN(avg_mean_pressure) FROM (SELECT AVG(mean_sea_level_pressure_inches) AS avg_mean_pressure FROM weather GROUP BY zip_code))	bike_1
SELECT avg(bikes_available) FROM status WHERE station_id NOT IN (SELECT id FROM station WHERE city  =  'Palo Alto')	bike_1
SELECT avg(bikes_available) FROM status WHERE station_id NOT IN (SELECT id FROM station WHERE city  =  'Palo Alto')	bike_1
SELECT avg(long) FROM station WHERE id NOT IN (SELECT station_id FROM status GROUP BY station_id HAVING max(bikes_available)  >  10)	bike_1
SELECT avg(long) FROM station WHERE id NOT IN (SELECT station_id FROM status GROUP BY station_id HAVING max(bikes_available)  >  10)	bike_1
SELECT date ,  zip_code FROM weather WHERE max_temperature_f  >=  80	bike_1
SELECT date ,  zip_code FROM weather WHERE max_temperature_f  >=  80	bike_1
SELECT id FROM trip WHERE zip_code IN (SELECT zip_code FROM weather GROUP BY zip_code HAVING AVG(mean_temperature_f) > 60)	bike_1
SELECT trip.id FROM trip, weather WHERE trip.zip_code = weather.zip_code GROUP BY trip.id HAVING AVG(weather.mean_temperature_f) > 60	bike_1
SELECT zip_code , count(*) FROM weather WHERE max_wind_Speed_mph  >=  25 GROUP BY zip_code	bike_1
SELECT zip_code , count(*) FROM weather WHERE max_wind_Speed_mph  >=  25 GROUP BY zip_code	bike_1
SELECT date ,  zip_code FROM weather WHERE min_dew_point_f  <  (SELECT min(min_dew_point_f) FROM weather WHERE zip_code  =  94107)	bike_1
SELECT date ,  zip_code FROM weather WHERE min_dew_point_f  <  (SELECT min(min_dew_point_f) FROM weather WHERE zip_code  =  94107)	bike_1
SELECT s.installation_date FROM trip t JOIN station s ON t.end_station_id = s.id	bike_1
SELECT installation_date FROM station WHERE id IN (SELECT end_station_id FROM trip)	bike_1
SELECT t.id FROM trip t INNER JOIN station s on t.start_station_id = s.id WHERE s.dock_count = (SELECT MAX(dock_count) FROM station)	bike_1
SELECT id FROM trip WHERE start_station_id = ( SELECT id FROM station ORDER BY dock_count DESC LIMIT 1 )	bike_1
SELECT COUNT(*) FROM trip WHERE end_station_id NOT IN (SELECT id FROM station WHERE city = 'San Francisco')	bike_1
SELECT COUNT(*) FROM trip WHERE end_station_id NOT IN (SELECT id FROM station WHERE city = 'San Francisco')	bike_1
SELECT date FROM weather WHERE zip_code  =  94107 AND EVENTS != 'Fog' AND EVENTS != 'Rain'	bike_1
SELECT date FROM weather WHERE COALESCE(events, '') = '' AND zip_code = '94107'	bike_1
SELECT id FROM station WHERE lat  >  37.4 EXCEPT SELECT station_id FROM status GROUP BY station_id HAVING min(bikes_available)  <  7	bike_1
SELECT id FROM station WHERE lat  >  37.4 EXCEPT SELECT station_id FROM status GROUP BY station_id HAVING min(bikes_available)  <  7	bike_1
SELECT T1.name FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id GROUP BY T2.station_id HAVING avg(bikes_available)  >  10 EXCEPT SELECT name FROM station WHERE city  =  'San Jose'	bike_1
SELECT station.name FROM station JOIN (SELECT station_id FROM status WHERE bikes_available > 10 EXCEPT SELECT id FROM station WHERE city = 'San Jose') ON station.id = station_id	bike_1
SELECT name, lat, city FROM station WHERE lat = (SELECT MIN(lat) FROM station)	bike_1
SELECT name, lat, city FROM station WHERE lat = (SELECT MIN(lat) FROM station)	bike_1
SELECT date ,  mean_temperature_f ,  mean_humidity FROM weather ORDER BY max_gust_speed_mph DESC LIMIT 3	bike_1
SELECT date ,  mean_temperature_f ,  mean_humidity FROM weather ORDER BY max_gust_speed_mph DESC LIMIT 3	bike_1
SELECT city ,  COUNT(*) FROM station GROUP BY city HAVING COUNT(*)  >=  15	bike_1
SELECT city ,  COUNT(*) FROM station GROUP BY city HAVING COUNT(*)  >=  15	bike_1
SELECT start_station_id ,  start_station_name FROM trip GROUP BY start_station_name HAVING COUNT(*)  >=  200	bike_1
SELECT start_station_id ,  start_station_name FROM trip GROUP BY start_station_name HAVING COUNT(*)  >=  200	bike_1
SELECT zip_code FROM weather GROUP BY zip_code HAVING avg(mean_visibility_miles)  <  10	bike_1
SELECT zip_code FROM weather GROUP BY zip_code HAVING avg(mean_visibility_miles)  <  10	bike_1
SELECT city FROM station GROUP BY city ORDER BY max(lat) DESC	bike_1
SELECT city FROM station GROUP BY city ORDER BY max(lat) DESC	bike_1
SELECT date ,  cloud_cover FROM weather ORDER BY cloud_cover DESC LIMIT 5	bike_1
SELECT date, cloud_cover FROM weather WHERE cloud_cover in (SELECT cloud_cover FROM weather ORDER BY cloud_cover DESC LIMIT 5) ORDER BY cloud_cover DESC	bike_1
SELECT id ,  duration FROM trip ORDER BY duration DESC LIMIT 3	bike_1
SELECT id, duration FROM trip WHERE duration = (SELECT MAX(duration) FROM trip)	bike_1
SELECT station.long, AVG(trip.duration) AS avg_duration FROM station LEFT JOIN trip ON station.id = trip.start_station_id GROUP BY station.id	bike_1
SELECT t.start_station_id, s.name, s.long, ROUND(AVG(t.duration),2) AS avg_duration FROM trip t JOIN station s ON t.start_station_id = s.id GROUP BY 1, 2, 3	bike_1
SELECT station.lat, MIN(trip.duration) FROM station LEFT JOIN trip ON trip.end_station_id = station.id GROUP BY station.id	bike_1
SELECT t.end_station_id, s.name, s.lat, MIN(duration) AS min_duration FROM trip t JOIN station s ON t.end_station_id = s.id GROUP BY t.end_station_id, s.name, s.lat	bike_1
SELECT DISTINCT station.name FROM station WHERE station.id IN (SELECT start_station_id FROM trip WHERE duration < 100)	bike_1
SELECT DISTINCT start_station_name FROM trip WHERE duration  <  100	bike_1
SELECT DISTINCT zip_code FROM weather EXCEPT SELECT DISTINCT zip_code FROM weather WHERE max_dew_point_f  >=  70	bike_1
SELECT DISTINCT zip_code FROM weather EXCEPT SELECT DISTINCT zip_code FROM weather WHERE max_dew_point_f  >=  70	bike_1
SELECT id FROM trip WHERE duration  >=  (SELECT avg(duration) FROM trip WHERE zip_code  =  94103)	bike_1
SELECT t.id FROM trip t WHERE t.duration = (SELECT AVG(duration) FROM trip WHERE zip_code = '94103')	bike_1
SELECT date FROM weather WHERE mean_sea_level_pressure_inches BETWEEN 30.3 AND 31	bike_1
SELECT date FROM weather WHERE mean_sea_level_pressure_inches BETWEEN 30.3 AND 31 GROUP BY date	bike_1
SELECT date ,  max_temperature_f - min_temperature_f FROM weather ORDER BY max_temperature_f - min_temperature_f LIMIT 1	bike_1
SELECT date, (max_temperature_f - min_temperature_f) AS temperature_range FROM weather WHERE (max_temperature_f - min_temperature_f) = (SELECT MIN(max_temperature_f - min_temperature_f) FROM weather)	bike_1
SELECT DISTINCT T1.id ,  T1.name FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id WHERE T2.bikes_available  >  12	bike_1
SELECT DISTINCT T1.id ,  T1.name FROM station AS T1 JOIN status AS T2 ON T1.id  =  T2.station_id WHERE T2.bikes_available  >  12	bike_1
SELECT zip_code FROM weather GROUP BY zip_code HAVING avg(mean_humidity)  <  70 INTERSECT SELECT zip_code FROM trip GROUP BY zip_code HAVING count(*)  >=  100	bike_1
SELECT zip_code FROM weather GROUP BY zip_code HAVING avg(mean_humidity)  <  70 INTERSECT SELECT zip_code FROM trip GROUP BY zip_code HAVING count(*)  >=  100	bike_1
SELECT s.name FROM station s WHERE s.city = 'Palo Alto' AND s.id NOT IN ( SELECT t.end_station_id FROM trip t GROUP BY t.end_station_id HAVING COUNT(t.end_station_id) > 100 )	bike_1
SELECT name FROM station WHERE city = 'Palo Alto' AND id NOT IN (SELECT end_station_id FROM trip)	bike_1
SELECT count(*) FROM station AS T1 JOIN trip AS T2 JOIN station AS T3 JOIN trip AS T4 ON T1.id  =  T2.start_station_id AND T2.id  =  T4.id AND T3.id  =  T4.end_station_id WHERE T1.city  =  'Mountain View' AND T3.city  =  'Palo Alto'	bike_1
SELECT count(*) FROM station AS T1 JOIN trip AS T2 JOIN station AS T3 JOIN trip AS T4 ON T1.id  =  T2.start_station_id AND T2.id  =  T4.id AND T3.id  =  T4.end_station_id WHERE T1.city  =  'Mountain View' AND T3.city  =  'Palo Alto'	bike_1
SELECT avg(T1.lat) ,  avg(T1.long) FROM station AS T1 JOIN trip AS T2 ON T1.id  =  T2.start_station_id	bike_1
SELECT AVG(s.lat) AS average_latitude, AVG(s.long) AS average_longitude FROM station s WHERE s.id IN (SELECT start_station_id FROM trip)	bike_1
SELECT count(*) FROM book	book_2
SELECT Writer FROM book ORDER BY Writer ASC	book_2
SELECT Title FROM book ORDER BY Issues ASC	book_2
SELECT DISTINCT title FROM book WHERE writer NOT IN ('Elaine Lee')	book_2
SELECT Title ,  Issues FROM book	book_2
SELECT publication_date FROM publication ORDER BY price DESC, publication_date DESC	book_2
SELECT DISTINCT Publisher FROM publication WHERE Price  >  5000000	book_2
SELECT DISTINCT publisher FROM publication WHERE price = (SELECT MAX(price) FROM publication)	book_2
SELECT publication_date FROM publication WHERE price = (SELECT MIN(price) FROM publication) LIMIT 3	book_2
SELECT T1.Title ,  T2.Publication_Date FROM book AS T1 JOIN publication AS T2 ON T1.Book_ID  =  T2.Book_ID	book_2
SELECT T1.Writer FROM book AS T1 JOIN publication AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T2.Price  >  4000000	book_2
SELECT T1.Title FROM book AS T1 JOIN publication AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Price DESC	book_2
SELECT Publisher FROM publication GROUP BY Publisher HAVING COUNT(*)  >  1	book_2
SELECT Publisher ,  COUNT(*) FROM publication GROUP BY Publisher	book_2
SELECT MAX(publication_date) FROM publication GROUP BY publication_date HAVING COUNT(*) = (SELECT MAX(pub_count) FROM (SELECT COUNT(*) AS pub_count FROM publication GROUP BY publication_date))	book_2
SELECT Writer FROM book GROUP BY Writer HAVING COUNT(*)  >  1	book_2
SELECT Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM publication)	book_2
SELECT Publisher FROM publication WHERE Price  >  10000000 INTERSECT SELECT Publisher FROM publication WHERE Price  <  5000000	book_2
SELECT COUNT (DISTINCT Publication_Date) FROM publication	book_2
SELECT COUNT (DISTINCT Publication_Date) FROM publication	book_2
SELECT Price FROM publication WHERE Publisher  =  'Person' OR Publisher  =  'Wiley'	book_2
SELECT count(*) FROM actor	musical
SELECT count(*) FROM actor	musical
SELECT Name FROM actor ORDER BY Name ASC	musical
SELECT Name FROM actor ORDER BY Name ASC	musical
SELECT Character ,  Duration FROM actor	musical
SELECT Character ,  Duration FROM actor	musical
SELECT Name FROM actor WHERE Age != 20	musical
SELECT Name FROM actor WHERE Age != 20	musical
SELECT Character FROM actor ORDER BY age DESC	musical
SELECT Character FROM actor ORDER BY age DESC	musical
SELECT duration FROM actor WHERE age = (SELECT MAX(age) FROM actor)	musical
SELECT a.duration FROM actor a INNER JOIN (SELECT MAX(age) AS max_age FROM actor) b ON a.age = b.max_age	musical
SELECT Name FROM musical WHERE Nominee  =  'Bob Fosse'	musical
SELECT Name FROM musical WHERE Nominee  =  'Bob Fosse'	musical
SELECT DISTINCT Nominee FROM musical WHERE Award != 'Tony Award'	musical
SELECT DISTINCT Nominee FROM musical WHERE Award != 'Tony Award'	musical
SELECT T1.Name ,  T2.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID	musical
SELECT T1.Name ,  T2.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID	musical
SELECT T1.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID WHERE T2.Name  =  'The Phantom of the Opera'	musical
SELECT T1.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID WHERE T2.Name  =  'The Phantom of the Opera'	musical
SELECT T1.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID ORDER BY T2.Year DESC	musical
SELECT T1.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID ORDER BY T2.Year DESC	musical
SELECT name, (SELECT COUNT(actor_id) FROM actor WHERE musical_id = musical.musical_id) AS actor_count FROM musical	musical
SELECT T2.Name ,  COUNT(*) FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID GROUP BY T1.Musical_ID	musical
SELECT T2.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID GROUP BY T1.Musical_ID HAVING COUNT(*)  >=  3	musical
SELECT T2.Name FROM actor AS T1 JOIN musical AS T2 ON T1.Musical_ID  =  T2.Musical_ID GROUP BY T1.Musical_ID HAVING COUNT(*)  >=  3	musical
SELECT Nominee ,  COUNT(*) FROM musical GROUP BY Nominee	musical
SELECT nominee, COUNT(DISTINCT name) AS num_nominations FROM musical GROUP BY nominee	musical
SELECT Nominee FROM musical GROUP BY Nominee ORDER BY COUNT(*) DESC LIMIT 1	musical
SELECT nominee FROM musical GROUP BY nominee HAVING COUNT(DISTINCT musical_id) = (SELECT COUNT(musical_id) FROM musical GROUP BY nominee ORDER BY COUNT(musical_id) DESC LIMIT 1)	musical
SELECT result FROM musical GROUP BY result HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM musical GROUP BY result))	musical
SELECT result FROM musical GROUP BY result HAVING COUNT(result) = (SELECT MAX(ResultCount) FROM (SELECT COUNT(result) AS ResultCount FROM musical GROUP BY result))	musical
SELECT Nominee FROM musical GROUP BY Nominee HAVING COUNT(*)  >  2	musical
SELECT Nominee FROM musical GROUP BY Nominee HAVING COUNT(*)  >  2	musical
SELECT Name FROM musical WHERE Musical_ID NOT IN (SELECT Musical_ID FROM actor)	musical
SELECT Name FROM musical WHERE Musical_ID NOT IN (SELECT Musical_ID FROM actor)	musical
SELECT Nominee FROM musical WHERE Award  =  'Tony Award' INTERSECT SELECT Nominee FROM musical WHERE Award  =  'Drama Desk Award'	musical
SELECT Nominee FROM musical WHERE Award  =  'Tony Award' INTERSECT SELECT Nominee FROM musical WHERE Award  =  'Drama Desk Award'	musical
SELECT nominee FROM musical WHERE award = 'Bob Fosse' OR award = 'Cleavant Derricks'	musical
SELECT DISTINCT nominee FROM musical WHERE award = 'Bob Fosse' UNION SELECT DISTINCT nominee FROM musical WHERE award = 'Cleavant Derricks'	musical
SELECT email FROM user_profiles WHERE name  =  'Mary'	twitter_1
SELECT partitionid FROM user_profiles WHERE name  =  'Iron Man'	twitter_1
SELECT count(*) FROM user_profiles	twitter_1
SELECT count(*) FROM follows	twitter_1
SELECT count(*) FROM follows GROUP BY f1	twitter_1
SELECT count(*) FROM tweets	twitter_1
SELECT count(DISTINCT UID) FROM tweets	twitter_1
SELECT name ,  email FROM user_profiles WHERE name LIKE '%Swift%'	twitter_1
SELECT name FROM user_profiles WHERE email LIKE '%superstar%' OR email LIKE '%edu%'	twitter_1
SELECT text FROM tweets WHERE text LIKE '%intern%'	twitter_1
SELECT name ,  email FROM user_profiles WHERE followers  >  1000	twitter_1
SELECT USER_PROFILES.NAME FROM USER_PROFILES, (SELECT MAX(FOLLOWERS) AS FOLLOWERS_COUNT FROM USER_PROFILES WHERE NAME = 'TYLER SWIFT') AS SWIFT_FOLLOWERS WHERE FOLLOWERS > SWIFT_FOLLOWERS.FOLLOWERS_COUNT AND NAME NOT LIKE 'TYLER SWIFT' ORDER BY FOLLOWERS DESC	twitter_1
SELECT name, email FROM user_profiles WHERE followers > 1	twitter_1
SELECT T1.name FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  >  1	twitter_1
SELECT T2.f1 FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f2 WHERE T1.name  =  'Mary' INTERSECT SELECT T2.f1 FROM user_profiles AS T1 JOIN follows AS T2 ON T1.uid  =  T2.f2 WHERE T1.name  =  'Susan'	twitter_1
SELECT user_profiles.uid FROM user_profiles JOIN follows ON user_profiles.uid = follows.f2 WHERE user_profiles.name IN ('Mary', 'Susan')	twitter_1
SELECT name FROM user_profiles WHERE followers = (SELECT MAX(followers) FROM user_profiles)	twitter_1
SELECT name ,  email FROM user_profiles ORDER BY followers LIMIT 1	twitter_1
SELECT name ,  followers FROM user_profiles ORDER BY followers DESC	twitter_1
SELECT name FROM user_profiles WHERE uid = ( SELECT f1 FROM follows GROUP BY f1 ORDER BY COUNT(f2) DESC LIMIT 1 )	twitter_1
SELECT text FROM tweets ORDER BY createdate	twitter_1
SELECT name, (SELECT COUNT(*) FROM tweets WHERE uid = user_profiles.uid) AS total_tweets FROM user_profiles	twitter_1
SELECT T1.name ,  T1.partitionid FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  <  2	twitter_1
SELECT T1.name ,  count(*) FROM user_profiles AS T1 JOIN tweets AS T2 ON T1.uid  =  T2.uid GROUP BY T2.uid HAVING count(*)  >  1	twitter_1
SELECT avg(followers) FROM user_profiles WHERE UID NOT IN (SELECT UID FROM tweets)	twitter_1
SELECT avg(followers) FROM user_profiles WHERE UID IN (SELECT UID FROM tweets)	twitter_1
SELECT max(followers) ,  sum(followers) FROM user_profiles	twitter_1
SELECT catalog_entry_name FROM catalog_contents	product_catalog
SELECT catalog_entry_name FROM catalog_contents	product_catalog
SELECT attribute_data_type FROM Attribute_Definitions GROUP BY attribute_data_type HAVING count(*)  >  3	product_catalog
SELECT attribute_data_type FROM Attribute_Definitions GROUP BY attribute_data_type HAVING count(*)  >  3	product_catalog
SELECT attribute_data_type FROM Attribute_Definitions WHERE attribute_name  =  'Green'	product_catalog
SELECT attribute_data_type FROM Attribute_Definitions WHERE attribute_name  =  'Green'	product_catalog
SELECT catalog_level_name ,  catalog_level_number FROM Catalog_Structure WHERE catalog_level_number BETWEEN 5 AND 10	product_catalog
SELECT catalog_level_name ,  catalog_level_number FROM Catalog_Structure WHERE catalog_level_number BETWEEN 5 AND 10	product_catalog
SELECT catalog_publisher FROM catalogs WHERE catalog_publisher LIKE '%Murray%'	product_catalog
SELECT catalog_publisher FROM catalogs WHERE catalog_publisher LIKE '%Murray%'	product_catalog
SELECT catalog_publisher FROM catalogs GROUP BY catalog_publisher ORDER BY count(*) DESC LIMIT 1	product_catalog
SELECT c.catalog_publisher FROM (SELECT catalog_publisher, COUNT(*) as cnt FROM catalogs GROUP BY catalog_publisher) c JOIN (SELECT MAX(c_count) as max_count FROM (SELECT catalog_publisher, COUNT(*) as c_count FROM catalogs GROUP BY catalog_publisher)) m ON c.cnt = m.max_count	product_catalog
SELECT catalog_name, date_of_publication FROM catalogs WHERE catalog_id IN (  SELECT catalog_id  FROM catalog_structure  WHERE catalog_level_number > 5  )	product_catalog
SELECT catalog_name, date_of_publication FROM catalogs WHERE catalog_id IN (SELECT catalog_id FROM catalog_structure WHERE catalog_level_number > 5)	product_catalog
SELECT cca.catalog_entry_name FROM catalog_contents cca WHERE EXISTS ( SELECT catalog_entry_id FROM catalog_contents_additional_attributes WHERE catalog_entry_id = cca.catalog_entry_id GROUP BY catalog_entry_id ORDER BY COUNT(attribute_id) DESC LIMIT 1 )	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE catalog_entry_id IN (SELECT catalog_entry_id FROM catalog_contents_additional_attributes GROUP BY catalog_entry_id ORDER BY COUNT(*) DESC LIMIT 1)	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE price_in_dollars = (SELECT MAX(price_in_dollars) FROM catalog_contents)	product_catalog
SELECT catalog_entry_name FROM catalog_contents ORDER BY price_in_dollars DESC LIMIT 1	product_catalog
SELECT t2.catalog_level_name FROM catalog_contents AS t1 JOIN catalog_structure AS t2 ON t1.catalog_level_number  =  t2.catalog_level_number ORDER BY t1.price_in_dollars LIMIT 1	product_catalog
SELECT distinct csl.catalog_level_name FROM catalog_structure csl JOIN catalog_contents cc ON cc.catalog_level_number = csl.catalog_level_number WHERE cc.price_in_dollars = (SELECT min(price_in_dollars) FROM catalog_contents)	product_catalog
SELECT avg(price_in_euros) ,  min(price_in_euros) FROM catalog_contents	product_catalog
SELECT avg(price_in_euros) ,  min(price_in_euros) FROM catalog_contents	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE height = (SELECT MAX(height) FROM catalog_contents)	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE height = (SELECT MAX(height) FROM catalog_contents)	product_catalog
SELECT cc.catalog_entry_name FROM catalog_contents cc WHERE NOT EXISTS (SELECT * FROM catalog_contents WHERE capacity > cc.capacity)	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE capacity = (SELECT MIN(capacity) FROM catalog_contents)	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE product_stock_number LIKE '2%'	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE product_stock_number LIKE '2%'	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE catalog_level_number = 8	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE catalog_level_number = 8	product_catalog
SELECT DISTINCT catalog_entry_name FROM catalog_contents WHERE length < 3 UNION SELECT DISTINCT catalog_entry_name FROM catalog_contents WHERE height > 5	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE LENGTH  <  3 OR width  >  5	product_catalog
SELECT t1.attribute_name ,  t1.attribute_id FROM Attribute_Definitions AS t1 JOIN Catalog_Contents_Additional_Attributes AS t2 ON t1.attribute_id  =  t2.attribute_id WHERE t2.attribute_value  =  0	product_catalog
SELECT attribute_name, attribute_id FROM attribute_definitions WHERE attribute_id IN (SELECT attribute_id FROM catalog_contents_additional_attributes WHERE attribute_value = 0)	product_catalog
SELECT catalog_entry_name ,  capacity FROM Catalog_Contents WHERE price_in_dollars  >  700	product_catalog
SELECT catalog_entry_name ,  capacity FROM Catalog_Contents WHERE price_in_dollars  >  700	product_catalog
SELECT date_of_latest_revision FROM Catalogs GROUP BY date_of_latest_revision HAVING count(*)  >  1	product_catalog
SELECT date_of_latest_revision FROM Catalogs GROUP BY date_of_latest_revision HAVING count(*)  >  1	product_catalog
SELECT count(*) FROM catalog_contents	product_catalog
SELECT count(*) FROM catalog_contents	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE next_entry_id  >  8	product_catalog
SELECT catalog_entry_name FROM catalog_contents WHERE next_entry_id  >  8	product_catalog
SELECT count(*) FROM Aircraft	flight_1
SELECT count(*) FROM Aircraft	flight_1
SELECT name ,  distance FROM Aircraft	flight_1
SELECT name ,  distance FROM Aircraft	flight_1
SELECT aid FROM Aircraft WHERE distance  >  1000	flight_1
SELECT aid FROM Aircraft WHERE distance  >  1000	flight_1
SELECT count(*) FROM Aircraft WHERE distance BETWEEN 1000 AND 5000	flight_1
SELECT count(*) FROM Aircraft WHERE distance BETWEEN 1000 AND 5000	flight_1
SELECT name ,  distance FROM Aircraft WHERE aid  =  12	flight_1
SELECT name ,  distance FROM Aircraft WHERE aid  =  12	flight_1
SELECT min(distance) ,  avg(distance) ,  max(distance) FROM Aircraft	flight_1
SELECT min(distance) ,  avg(distance) ,  max(distance) FROM Aircraft	flight_1
SELECT aid, name FROM aircraft WHERE distance = (SELECT MAX(distance) FROM aircraft)	flight_1
SELECT aid, name FROM aircraft WHERE distance = (SELECT MAX(distance) FROM aircraft)	flight_1
SELECT name FROM Aircraft ORDER BY distance LIMIT 3	flight_1
SELECT name FROM Aircraft ORDER BY distance LIMIT 3	flight_1
SELECT name FROM Aircraft WHERE distance  >  (SELECT avg(distance) FROM Aircraft)	flight_1
SELECT name FROM Aircraft WHERE distance  >  (SELECT avg(distance) FROM Aircraft)	flight_1
SELECT count(*) FROM Employee	flight_1
SELECT count(*) FROM Employee	flight_1
SELECT name ,  salary FROM Employee ORDER BY salary	flight_1
SELECT name ,  salary FROM Employee ORDER BY salary	flight_1
SELECT eid FROM employee WHERE salary >= 100000	flight_1
SELECT eid FROM employee WHERE salary >= 100000	flight_1
SELECT count(*) FROM Employee WHERE salary BETWEEN 100000 AND 200000	flight_1
SELECT count(*) FROM Employee WHERE salary BETWEEN 100000 AND 200000	flight_1
SELECT name ,  salary FROM Employee WHERE eid  =  242518965	flight_1
SELECT name ,  salary FROM Employee WHERE eid  =  242518965	flight_1
SELECT avg(salary) ,  max(salary) FROM Employee	flight_1
SELECT avg(salary) ,  max(salary) FROM Employee	flight_1
SELECT eid, name FROM employee WHERE salary = (SELECT MAX(salary) FROM employee)	flight_1
SELECT eid, name FROM employee WHERE salary = (SELECT MAX(salary) FROM employee)	flight_1
SELECT name FROM Employee ORDER BY salary ASC LIMIT 3	flight_1
SELECT name FROM Employee ORDER BY salary ASC LIMIT 3	flight_1
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM Employee)	flight_1
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM Employee)	flight_1
SELECT eid ,  salary FROM Employee WHERE name  =  'Mark Young'	flight_1
SELECT eid ,  salary FROM Employee WHERE name  =  'Mark Young'	flight_1
SELECT count(*) FROM Flight	flight_1
SELECT count(*) FROM Flight	flight_1
SELECT flno ,  origin ,  destination FROM Flight ORDER BY origin	flight_1
SELECT flno ,  origin ,  destination FROM Flight ORDER BY origin	flight_1
SELECT flno FROM Flight WHERE origin  =  'Los Angeles'	flight_1
SELECT COUNT(*) FROM flight WHERE origin = 'Los Angeles'	flight_1
SELECT origin FROM Flight WHERE destination  =  'Honolulu'	flight_1
SELECT origin FROM Flight WHERE destination  =  'Honolulu'	flight_1
SELECT departure_date ,  arrival_date FROM Flight WHERE origin  =  'Los Angeles' AND destination  =  'Honolulu'	flight_1
SELECT departure_date ,  arrival_date FROM Flight WHERE origin  =  'Los Angeles' AND destination  =  'Honolulu'	flight_1
SELECT flno FROM Flight WHERE distance  >  2000	flight_1
SELECT flno FROM Flight WHERE distance  >  2000	flight_1
SELECT avg(price) FROM Flight WHERE origin  =  'Los Angeles' AND destination  =  'Honolulu'	flight_1
SELECT avg(price) FROM Flight WHERE origin  =  'Los Angeles' AND destination  =  'Honolulu'	flight_1
SELECT origin ,  destination FROM Flight WHERE price  >  300	flight_1
SELECT origin ,  destination FROM Flight WHERE price  >  300	flight_1
SELECT flno, distance FROM flight WHERE price = (SELECT MAX(price) FROM flight)	flight_1
SELECT flno, distance FROM flight WHERE price = (SELECT MAX(price) FROM flight)	flight_1
SELECT flno FROM Flight ORDER BY distance ASC LIMIT 3	flight_1
SELECT flno FROM flight WHERE distance = (SELECT MIN(distance) FROM flight)	flight_1
SELECT avg(distance) ,  avg(price) FROM Flight WHERE origin  =  'Los Angeles'	flight_1
SELECT AVG(distance) AS avg_distance, AVG(price) AS avg_price FROM flight WHERE origin = 'LA'	flight_1
SELECT origin ,  count(*) FROM Flight GROUP BY origin	flight_1
SELECT origin ,  count(*) FROM Flight GROUP BY origin	flight_1
SELECT destination ,  count(*) FROM Flight GROUP BY destination	flight_1
SELECT destination ,  count(*) FROM Flight GROUP BY destination	flight_1
SELECT origin FROM flight GROUP BY origin HAVING COUNT(*) = (SELECT MAX(flights) FROM (SELECT origin, COUNT(*) AS flights FROM flight GROUP BY origin))	flight_1
SELECT origin FROM flight GROUP BY origin HAVING COUNT(*) = (SELECT MAX(counts) FROM (SELECT COUNT(*) AS counts FROM flight GROUP BY origin))	flight_1
SELECT destination FROM flight GROUP BY destination HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM flight GROUP BY destination))	flight_1
SELECT destination FROM flight GROUP BY destination HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM flight GROUP BY destination))	flight_1
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T1.flno  =  99	flight_1
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T1.flno  =  99	flight_1
SELECT T1.flno FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T2.name  =  'Airbus A340-300'	flight_1
SELECT T1.flno FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T2.name  =  'Airbus A340-300'	flight_1
SELECT a.name, (SELECT COUNT(*) FROM flight WHERE aid = a.aid) AS num_flights FROM aircraft a	flight_1
SELECT name, (SELECT COUNT(*) FROM flight WHERE flight.aid = aircraft.aid) FROM aircraft	flight_1
SELECT distinct a.name FROM aircraft a INNER JOIN flight f ON a.aid = f.aid GROUP BY a.aid HAVING COUNT(f.flno) >= 2	flight_1
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid GROUP BY T1.aid HAVING count(*)  >= 2	flight_1
SELECT count(DISTINCT eid) FROM Certificate	flight_1
SELECT count(DISTINCT eid) FROM Certificate	flight_1
SELECT eid FROM Employee EXCEPT SELECT eid FROM Certificate	flight_1
SELECT eid FROM Employee EXCEPT SELECT eid FROM Certificate	flight_1
SELECT A.name FROM aircraft A WHERE EXISTS (SELECT * FROM certificate C JOIN employee E ON C.eid = E.eid WHERE A.aid = C.aid AND E.name = 'John Williams')	flight_1
SELECT DISTINCT a.name FROM aircraft a JOIN certificate c ON c.aid = a.aid JOIN employee e ON e.eid = c.eid AND e.name = 'John Williams'	flight_1
SELECT name FROM employee WHERE eid IN (SELECT eid FROM certificate JOIN aircraft ON certificate.aid = aircraft.aid WHERE aircraft.name = 'Boeing 737-800')	flight_1
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  'Boeing 737-800'	flight_1
SELECT DISTINCT e.name FROM employee e JOIN (SELECT e.eid FROM employee e JOIN certificate c ON e.eid = c.eid JOIN aircraft a ON c.aid = a.aid WHERE a.name = 'Boeing 737-800' GROUP BY e.eid INTERSECT SELECT e.eid FROM employee e JOIN certificate c ON e.eid = c.eid JOIN aircraft a ON c.aid = a.aid WHERE a.name = 'Airbus A340-300' GROUP BY e.eid) AS both_certified ON e.eid = both_certified.eid	flight_1
SELECT name FROM employee e WHERE (SELECT COUNT(DISTINCT a.name) FROM certificate c JOIN aircraft a ON c.aid = a.aid WHERE e.eid = c.eid AND a.name IN ('Boeing 737-800', 'Airbus A340-300')) = 2	flight_1
SELECT name FROM employee WHERE eid NOT IN (SELECT eid FROM certificate WHERE aid IN (SELECT aid FROM aircraft WHERE name = 'Boeing 737-800'))	flight_1
SELECT employee.name FROM employee WHERE employee.eid NOT IN (SELECT c.eid FROM certificate c JOIN aircraft a ON c.aid = a.aid WHERE a.name = 'Boeing 737-800')	flight_1
SELECT a.name FROM aircraft a LEFT JOIN certificate c ON a.aid = c.aid GROUP BY a.aid ORDER BY COUNT (c.eid) LIMIT 1	flight_1
SELECT name FROM aircraft WHERE aid IN (SELECT aid FROM certificate GROUP BY aid HAVING COUNT(DISTINCT eid) = (SELECT COUNT(DISTINCT eid) FROM certificate GROUP BY aid ORDER BY COUNT(eid) ASC LIMIT 1) )	flight_1
SELECT name, distance FROM aircraft WHERE distance > 5000 AND aid IN (SELECT aid FROM certificate GROUP BY aid HAVING COUNT(*) >= 5)	flight_1
SELECT T2.name FROM Certificate AS T1 JOIN Aircraft AS T2 ON T2.aid  =  T1.aid WHERE T2.distance  >  5000 GROUP BY T1.aid ORDER BY count(*)  >=  5	flight_1
SELECT e.name, e.salary FROM employee e JOIN certificate c ON e.eid = c.eid GROUP BY e.eid HAVING COUNT(c.aid) = (SELECT MAX(cnt) FROM (SELECT COUNT(aid) AS cnt FROM certificate GROUP BY eid))	flight_1
SELECT name, salary FROM employee WHERE eid IN (SELECT eid FROM certificate GROUP BY eid HAVING COUNT(aid) = (SELECT COUNT(aid) FROM certificate GROUP BY eid ORDER BY COUNT(aid) DESC LIMIT 1))	flight_1
SELECT e.salary, e.name FROM employee AS e JOIN certificate AS c ON e.eid = c.eid JOIN aircraft AS a ON c.aid = a.aid WHERE a.distance > 5000 GROUP BY e.eid HAVING COUNT(c.aid) = ( SELECT COUNT(c2.aid) FROM certificate AS c2 JOIN aircraft AS a2 ON c2.aid = a2.aid WHERE a2.distance > 5000 GROUP BY c2.eid ORDER BY COUNT(c2.aid) DESC LIMIT 1 )	flight_1
SELECT name, salary FROM employee WHERE eid IN (SELECT eid FROM certificate WHERE aid IN (SELECT aid FROM aircraft WHERE distance > 5000) GROUP BY eid HAVING COUNT(aid) = (SELECT COUNT(aid) FROM certificate WHERE aid IN (SELECT aid FROM aircraft WHERE distance > 5000) GROUP BY eid ORDER BY COUNT(aid) DESC LIMIT 1))	flight_1
SELECT count(DISTINCT allergy) FROM Allergy_type	allergy_1
SELECT count(DISTINCT allergy) FROM Allergy_type	allergy_1
SELECT count(DISTINCT allergytype) FROM Allergy_type	allergy_1
SELECT COUNT(DISTINCT allergy) FROM allergy_type	allergy_1
SELECT DISTINCT allergytype FROM Allergy_type	allergy_1
SELECT DISTINCT allergytype FROM Allergy_type	allergy_1
SELECT allergy ,  allergytype FROM Allergy_type	allergy_1
SELECT allergy ,  allergytype FROM Allergy_type	allergy_1
SELECT DISTINCT allergy FROM Allergy_type WHERE allergytype  =  'food'	allergy_1
SELECT DISTINCT allergy FROM Allergy_type WHERE allergytype  =  'food'	allergy_1
SELECT allergytype FROM Allergy_type WHERE allergy  =  'Cat'	allergy_1
SELECT allergytype FROM Allergy_type WHERE allergy  =  'Cat'	allergy_1
SELECT count(*) FROM Allergy_type WHERE allergytype  =  'animal'	allergy_1
SELECT count(*) FROM Allergy_type WHERE allergytype  =  'animal'	allergy_1
SELECT allergytype, COUNT(stuid) FROM allergy_type LEFT JOIN has_allergy USING(allergy) GROUP BY allergytype	allergy_1
SELECT allergytype ,  count(*) FROM Allergy_type GROUP BY allergytype	allergy_1
SELECT a.allergytype FROM allergy_type a JOIN has_allergy ha ON a.allergy = ha.allergy GROUP BY a.allergytype ORDER BY COUNT(ha.allergy) DESC LIMIT 1	allergy_1
SELECT allergytype FROM allergy_type JOIN has_allergy ON allergy_type.allergy = has_allergy.allergy GROUP BY allergytype HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT allergytype, COUNT(*) as cnt FROM allergy_type JOIN has_allergy ON allergy_type.allergy = has_allergy.allergy GROUP BY allergytype) AS Counts)	allergy_1
SELECT allergytype FROM allergy_type LEFT JOIN has_allergy ON allergy_type.allergy = has_allergy.allergy GROUP BY allergytype ORDER BY COUNT(has_allergy.allergy) ASC LIMIT 1	allergy_1
SELECT allergytype FROM allergy_type GROUP BY allergytype HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM allergy_type GROUP BY allergytype))	allergy_1
SELECT count(*) FROM Student	allergy_1
SELECT count(*) FROM Student	allergy_1
SELECT Fname ,  Lname FROM Student	allergy_1
SELECT fname || ' ' || lname AS fullname FROM student	allergy_1
SELECT count(DISTINCT advisor) FROM Student	allergy_1
SELECT count(DISTINCT advisor) FROM Student	allergy_1
SELECT major FROM student	allergy_1
SELECT DISTINCT Major FROM Student	allergy_1
SELECT DISTINCT city_code FROM Student	allergy_1
SELECT DISTINCT city_code FROM Student	allergy_1
SELECT Fname ,  Lname ,  Age FROM Student WHERE Sex  =  'F'	allergy_1
SELECT Fname ,  Lname ,  Age FROM Student WHERE Sex  =  'F'	allergy_1
SELECT StuID FROM Student WHERE Sex  =  'M'	allergy_1
SELECT StuID FROM Student WHERE Sex  =  'M'	allergy_1
SELECT count(*) FROM Student WHERE age  =  18	allergy_1
SELECT count(*) FROM Student WHERE age  =  18	allergy_1
SELECT StuID FROM Student WHERE age  >  20	allergy_1
SELECT StuID FROM Student WHERE age  >  20	allergy_1
SELECT city_code FROM Student WHERE LName  =  'Kim'	allergy_1
SELECT city_code FROM Student WHERE LName  =  'Kim'	allergy_1
SELECT Advisor FROM Student WHERE StuID  =  1004	allergy_1
SELECT Advisor FROM Student WHERE StuID  =  1004	allergy_1
SELECT count(*) FROM Student WHERE city_code  =  'HKG' OR city_code  =  'CHI'	allergy_1
SELECT count(*) FROM Student WHERE city_code  =  'HKG' OR city_code  =  'CHI'	allergy_1
SELECT min(age) ,  avg(age) ,  max(age) FROM Student	allergy_1
SELECT min(age) ,  avg(age) ,  max(age) FROM Student	allergy_1
SELECT LName FROM Student WHERE age  =  (SELECT min(age) FROM Student)	allergy_1
SELECT LName FROM Student WHERE age  =  (SELECT min(age) FROM Student)	allergy_1
SELECT StuID FROM Student WHERE age  =  (SELECT max(age) FROM Student)	allergy_1
SELECT StuID FROM Student WHERE age  =  (SELECT max(age) FROM Student)	allergy_1
SELECT major ,  count(*) FROM Student GROUP BY major	allergy_1
SELECT major ,  count(*) FROM Student GROUP BY major	allergy_1
SELECT major FROM student GROUP BY major HAVING COUNT(stuid) = (SELECT MAX(student_count) FROM (SELECT COUNT(stuid) AS student_count FROM student GROUP BY major))	allergy_1
SELECT major FROM student AS s GROUP BY major ORDER BY (SELECT COUNT(DISTINCT s.stuid) FROM has_allergy AS ha WHERE ha.stuid = s.major) DESC LIMIT 1	allergy_1
SELECT age ,  count(*) FROM Student GROUP BY age	allergy_1
SELECT age ,  count(*) FROM Student GROUP BY age	allergy_1
SELECT avg(age) ,  sex FROM Student GROUP BY sex	allergy_1
SELECT avg(age) ,  sex FROM Student GROUP BY sex	allergy_1
SELECT city_code ,  count(*) FROM Student GROUP BY city_code	allergy_1
SELECT city_code ,  count(*) FROM Student GROUP BY city_code	allergy_1
SELECT advisor ,  count(*) FROM Student GROUP BY advisor	allergy_1
SELECT advisor ,  count(*) FROM Student GROUP BY advisor	allergy_1
SELECT advisor FROM student GROUP BY advisor HAVING COUNT(stuid) = (SELECT MAX(students_count) FROM (SELECT COUNT(stuid) as students_count FROM student GROUP BY advisor))	allergy_1
SELECT advisor FROM Student GROUP BY advisor ORDER BY count(*) DESC LIMIT 1	allergy_1
SELECT COUNT(DISTINCT stuid) FROM has_allergy WHERE allergy = 'Cat'	allergy_1
SELECT COUNT(DISTINCT stuid) FROM has_allergy WHERE allergy = 'Cat'	allergy_1
SELECT StuID FROM Has_allergy GROUP BY StuID HAVING count(*)  >=  2	allergy_1
SELECT stuid FROM (SELECT stuid, COUNT(DISTINCT allergy) AS allergy_count FROM has_allergy GROUP BY stuid HAVING allergy_count > 1)	allergy_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_allergy	allergy_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_allergy	allergy_1
SELECT COUNT(*) FROM student WHERE stuid IN (SELECT DISTINCT stuid FROM has_allergy WHERE allergy IN ('Milk', 'Eggs') AND stuid IN (SELECT stuid FROM student WHERE sex = 'F'))	allergy_1
SELECT COUNT(DISTINCT stuid) FROM has_allergy WHERE exists (SELECT stuid FROM student WHERE has_allergy.stuid = student.stuid AND sex = 'F' AND allergy IN ('Milk', 'Eggs'))	allergy_1
SELECT COUNT(DISTINCT stuid) FROM has_allergy WHERE allergy IN (SELECT allergy FROM allergy_type WHERE allergytype = 'food')	allergy_1
SELECT COUNT(DISTINCT stuid) FROM has_allergy WHERE allergy IN (SELECT allergy FROM allergy_type WHERE allergytype = 'food')	allergy_1
SELECT Allergy FROM Has_allergy GROUP BY Allergy ORDER BY count(*) DESC LIMIT 1	allergy_1
SELECT allergy FROM has_allergy GROUP BY allergy HAVING COUNT(*) = (SELECT MAX(mycount) FROM (SELECT COUNT(*) as mycount FROM has_allergy GROUP BY allergy))	allergy_1
SELECT Allergy ,  count(*) FROM Has_allergy GROUP BY Allergy	allergy_1
SELECT Allergy ,  count(*) FROM Has_allergy GROUP BY Allergy	allergy_1
SELECT T2.allergytype ,  count(*) FROM Has_allergy AS T1 JOIN Allergy_type AS T2 ON T1.allergy  =  T2.allergy GROUP BY T2.allergytype	allergy_1
SELECT allergy_type.allergytype, COUNT(DISTINCT stuid) FROM allergy_type LEFT JOIN has_allergy ON allergy_type.allergy = has_allergy.allergy GROUP BY allergy_type.allergytype	allergy_1
SELECT lname ,  age FROM Student WHERE StuID IN (SELECT StuID FROM Has_allergy WHERE Allergy  =  'Milk' INTERSECT SELECT StuID FROM Has_allergy WHERE Allergy  =  'Cat')	allergy_1
SELECT lname ,  age FROM Student WHERE StuID IN (SELECT StuID FROM Has_allergy WHERE Allergy  =  'Milk' INTERSECT SELECT StuID FROM Has_allergy WHERE Allergy  =  'Cat')	allergy_1
SELECT T1.Allergy ,  T1.AllergyType FROM Allergy_type AS T1 JOIN Has_allergy AS T2 ON T1.Allergy  =  T2.Allergy JOIN Student AS T3 ON T3.StuID  =  T2.StuID WHERE T3.Fname  =  'Lisa' ORDER BY T1.Allergy	allergy_1
SELECT T1.Allergy ,  T1.AllergyType FROM Allergy_type AS T1 JOIN Has_allergy AS T2 ON T1.Allergy  =  T2.Allergy JOIN Student AS T3 ON T3.StuID  =  T2.StuID WHERE T3.Fname  =  'Lisa' ORDER BY T1.Allergy	allergy_1
SELECT fname ,  sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_allergy WHERE Allergy  =  'Milk' EXCEPT SELECT StuID FROM Has_allergy WHERE Allergy  =  'Cat')	allergy_1
SELECT fname ,  sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_allergy WHERE Allergy  =  'Milk' EXCEPT SELECT StuID FROM Has_allergy WHERE Allergy  =  'Cat')	allergy_1
SELECT avg(age) FROM Student WHERE StuID IN ( SELECT T1.StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'food' INTERSECT SELECT T1.StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'animal')	allergy_1
SELECT AVG(s.age) FROM student s JOIN has_allergy ha ON s.stuid = ha.stuid JOIN allergy_type at ON ha.allergy = at.allergy WHERE at.allergytype IN ('food', 'animal')	allergy_1
SELECT student.fname, student.lname FROM student WHERE stuid NOT IN (SELECT stuid FROM has_allergy WHERE allergy NOT IN (SELECT allergy FROM allergy_type WHERE allergytype = 'food'))	allergy_1
SELECT student.fname || ' ' || student.lname AS full_name FROM student LEFT JOIN has_allergy ON student.stuid = has_allergy.stuid WHERE has_allergy.stuid IS NULL	allergy_1
SELECT count(*) FROM Student WHERE sex  =  'M' AND StuID IN (SELECT StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'food')	allergy_1
SELECT count(*) FROM Student WHERE sex  =  'M' AND StuID IN (SELECT StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'food')	allergy_1
SELECT DISTINCT T1.fname ,  T1.city_code FROM Student AS T1 JOIN Has_Allergy AS T2 ON T1.stuid  =  T2.stuid WHERE T2.Allergy  =  'Milk' OR T2.Allergy  =  'Cat'	allergy_1
SELECT DISTINCT T1.fname ,  T1.city_code FROM Student AS T1 JOIN Has_Allergy AS T2 ON T1.stuid  =  T2.stuid WHERE T2.Allergy  =  'Milk' OR T2.Allergy  =  'Cat'	allergy_1
SELECT count(*) FROM Student WHERE age  >  18 AND StuID NOT IN ( SELECT StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'food' OR T2.allergytype  =  'animal')	allergy_1
SELECT count(*) FROM Student WHERE age  >  18 AND StuID NOT IN ( SELECT StuID FROM Has_allergy AS T1 JOIN Allergy_Type AS T2 ON T1.Allergy  =  T2.Allergy WHERE T2.allergytype  =  'food' OR T2.allergytype  =  'animal')	allergy_1
SELECT fname ,  major FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_allergy WHERE Allergy  =  'Soy')	allergy_1
SELECT s.fname, s.major FROM student s JOIN has_allergy ha ON s.stuid = ha.stuid WHERE ha.allergy = 'Soy'	allergy_1
SELECT billing_country ,  COUNT(*) FROM invoices GROUP BY billing_country ORDER BY count(*) DESC LIMIT 5;	store_1
SELECT billing_country ,  COUNT(*) FROM invoices GROUP BY billing_country ORDER BY count(*) DESC LIMIT 5;	store_1
SELECT billing_country ,  SUM(total) FROM invoices GROUP BY billing_country ORDER BY SUM(total) DESC LIMIT 8;	store_1
SELECT billing_country ,  SUM(total) FROM invoices GROUP BY billing_country ORDER BY SUM(total) DESC LIMIT 8;	store_1
SELECT billing_country ,  AVG(total) FROM invoices GROUP BY billing_country ORDER BY AVG(total) DESC LIMIT 10;	store_1
SELECT billing_country ,  AVG(total) FROM invoices GROUP BY billing_country ORDER BY AVG(total) DESC LIMIT 10;	store_1
SELECT T1.first_name ,  T1.last_name FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id ORDER BY T2.invoice_date DESC LIMIT 5;	store_1
SELECT T1.first_name ,  T1.last_name FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id ORDER BY T2.invoice_date DESC LIMIT 5;	store_1
SELECT T1.first_name ,  T1.last_name ,  COUNT(*) FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 10;	store_1
SELECT T1.first_name ,  T1.last_name ,  COUNT(*) FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 10;	store_1
SELECT T1.first_name ,  T1.last_name ,  SUM(T2.total) FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id GROUP BY T1.id ORDER BY SUM(T2.total) DESC LIMIT 10;	store_1
SELECT T1.first_name ,  T1.last_name ,  SUM(T2.total) FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id GROUP BY T1.id ORDER BY SUM(T2.total) DESC LIMIT 10;	store_1
SELECT T1.name ,  COUNT(*) FROM genres AS T1 JOIN tracks AS T2 ON T2.genre_id  =  T1.id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 5;	store_1
SELECT T1.name ,  COUNT(*) FROM genres AS T1 JOIN tracks AS T2 ON T2.genre_id  =  T1.id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 5;	store_1
SELECT title FROM albums;	store_1
SELECT title FROM albums;	store_1
SELECT title FROM albums ORDER BY title;	store_1
SELECT title FROM albums ORDER BY title;	store_1
SELECT title FROM albums WHERE title LIKE 'A%' ORDER BY title;	store_1
SELECT title FROM albums WHERE title LIKE 'A%' ORDER BY title;	store_1
SELECT T1.first_name ,  T1.last_name FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id ORDER BY total LIMIT 10;	store_1
SELECT T1.first_name ,  T1.last_name FROM customers AS T1 JOIN invoices AS T2 ON T2.customer_id  =  T1.id ORDER BY total LIMIT 10;	store_1
SELECT sum(total) FROM invoices WHERE billing_city  =  'Chicago' AND billing_state  =  'IL';	store_1
SELECT sum(total) FROM invoices WHERE billing_city  =  'Chicago' AND billing_state  =  'IL';	store_1
SELECT COUNT(*) FROM invoices WHERE billing_city  =  'Chicago' AND billing_state  =  'IL';	store_1
SELECT COUNT(*) FROM invoices WHERE billing_city  =  'Chicago' AND billing_state  =  'IL';	store_1
SELECT billing_state ,  COUNT(*) FROM invoices WHERE billing_country  =  'USA' GROUP BY billing_state;	store_1
SELECT billing_state ,  COUNT(*) FROM invoices WHERE billing_country  =  'USA' GROUP BY billing_state;	store_1
SELECT billing_state ,  COUNT(*) FROM invoices WHERE billing_country  =  'USA' GROUP BY billing_state ORDER BY COUNT(*) DESC LIMIT 1;	store_1
SELECT billing_state FROM invoices GROUP BY billing_state ORDER BY COUNT(*) DESC LIMIT 1	store_1
SELECT billing_state ,  COUNT(*) ,  SUM(total) FROM invoices WHERE billing_state  =  'CA';	store_1
SELECT billing_state ,  COUNT(*) ,  SUM(total) FROM invoices WHERE billing_state  =  'CA';	store_1
SELECT T1.title FROM albums AS T1 JOIN artists AS T2 ON  T1.artist_id = T2.id WHERE T2.name = 'Aerosmith';	store_1
SELECT T1.title FROM albums AS T1 JOIN artists AS T2 ON  T1.artist_id = T2.id WHERE T2.name = 'Aerosmith';	store_1
SELECT count(*) FROM albums AS T1 JOIN artists AS T2 ON  T1.artist_id = T2.id WHERE T2.name = 'Billy Cobham';	store_1
SELECT count(*) FROM albums AS T1 JOIN artists AS T2 ON  T1.artist_id = T2.id WHERE T2.name = 'Billy Cobham';	store_1
SELECT company FROM customers WHERE first_name = 'Eduardo' AND last_name = 'Martins';	store_1
SELECT company FROM customers WHERE first_name = 'Eduardo' AND last_name = 'Martins';	store_1
SELECT email ,  phone FROM customers WHERE first_name = 'Astrid' AND last_name = 'Gruber';	store_1
SELECT email ,  phone FROM customers WHERE first_name = 'Astrid' AND last_name = 'Gruber';	store_1
SELECT count(*) FROM customers WHERE city = 'Prague';	store_1
SELECT count(*) FROM customers WHERE city = 'Prague';	store_1
SELECT count(*) FROM customers WHERE state = 'CA';	store_1
SELECT count(*) FROM customers WHERE state = 'CA';	store_1
SELECT country FROM customers WHERE first_name = 'Roberto' AND last_name = 'Almeida';	store_1
SELECT country FROM customers WHERE first_name = 'Roberto' AND last_name = 'Almeida';	store_1
SELECT T2.title FROM artists AS T1 JOIN albums AS T2 ON T1.id  =  T2.artist_id WHERE T1.name LIKE '%Led%'	store_1
SELECT T2.title FROM artists AS T1 JOIN albums AS T2 ON T1.id  =  T2.artist_id WHERE T1.name LIKE '%Led%'	store_1
SELECT count(*) FROM employees AS T1 JOIN customers AS T2 ON T2.support_rep_id = T1.id WHERE T1.first_name = 'Steve' AND T1.last_name = 'Johnson';	store_1
SELECT count(*) FROM employees AS T1 JOIN customers AS T2 ON T2.support_rep_id = T1.id WHERE T1.first_name = 'Steve' AND T1.last_name = 'Johnson';	store_1
SELECT title ,  phone ,  hire_date FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT title ,  phone ,  hire_date FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT T2.first_name , T2.last_name FROM employees AS T1 JOIN employees AS T2 ON T1.id = T2.reports_to WHERE T1.first_name = 'Nancy' AND T1.last_name = 'Edwards';	store_1
SELECT T2.first_name , T2.last_name FROM employees AS T1 JOIN employees AS T2 ON T1.id = T2.reports_to WHERE T1.first_name = 'Nancy' AND T1.last_name = 'Edwards';	store_1
SELECT address FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT address FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT T1.first_name , T1.last_name FROM employees AS T1 JOIN customers AS T2 ON T1.id  =  T2.support_rep_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1	store_1
SELECT T1.first_name , T1.last_name FROM employees AS T1 JOIN customers AS T2 ON T1.id  =  T2.support_rep_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1	store_1
SELECT count(*) FROM employees WHERE country = 'Canada';	store_1
SELECT count(*) FROM employees WHERE country = 'Canada';	store_1
SELECT phone FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT phone FROM employees WHERE first_name = 'Nancy' AND last_name = 'Edwards';	store_1
SELECT first_name , last_name FROM employees ORDER BY birth_date DESC LIMIT 1;	store_1
SELECT first_name , last_name FROM employees ORDER BY birth_date DESC LIMIT 1;	store_1
SELECT first_name , last_name FROM employees ORDER BY hire_date ASC LIMIT 10;	store_1
SELECT first_name , last_name FROM employees ORDER BY hire_date ASC LIMIT 10;	store_1
SELECT count(*) ,  city FROM employees WHERE title  =  'IT Staff' GROUP BY city	store_1
SELECT count(*) ,  city FROM employees WHERE title  =  'IT Staff' GROUP BY city	store_1
SELECT T2.first_name , T2.last_name ,  count(T1.reports_to) FROM employees AS T1 JOIN employees AS T2 ON T1.reports_to = T2.id GROUP BY T1.reports_to ORDER BY count(T1.reports_to) DESC LIMIT 1;	store_1
SELECT T2.first_name , T2.last_name ,  count(T1.reports_to) FROM employees AS T1 JOIN employees AS T2 ON T1.reports_to = T2.id GROUP BY T1.reports_to ORDER BY count(T1.reports_to) DESC LIMIT 1;	store_1
SELECT count(*) FROM customers AS T1 JOIN invoices AS T2 ON T1.id = T2.customer_id WHERE T1.first_name = 'Lucas' AND T1.last_name = 'Mancini';	store_1
SELECT count(*) FROM customers AS T1 JOIN invoices AS T2 ON T1.id = T2.customer_id WHERE T1.first_name = 'Lucas' AND T1.last_name = 'Mancini';	store_1
SELECT sum(T2.total) FROM customers AS T1 JOIN invoices AS T2 ON T1.id = T2.customer_id WHERE T1.first_name = 'Lucas' AND T1.last_name = 'Mancini';	store_1
SELECT sum(T2.total) FROM customers AS T1 JOIN invoices AS T2 ON T1.id = T2.customer_id WHERE T1.first_name = 'Lucas' AND T1.last_name = 'Mancini';	store_1
SELECT name FROM media_types;	store_1
SELECT name FROM media_types;	store_1
SELECT DISTINCT name FROM genres;	store_1
SELECT DISTINCT name FROM genres;	store_1
SELECT name FROM playlists;	store_1
SELECT name FROM playlists;	store_1
SELECT composer FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT composer FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT milliseconds FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT milliseconds FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.name = 'Rock';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.name = 'Rock';	store_1
SELECT T1.title FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T2.name = 'Balls to the Wall';	store_1
SELECT T1.title FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T2.name = 'Balls to the Wall';	store_1
SELECT T2.name FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.title = 'Balls to the Wall';	store_1
SELECT T2.name FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.title = 'Balls to the Wall';	store_1
SELECT T1.title FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.album_id GROUP BY T1.id HAVING count(T1.id)  >  10;	store_1
SELECT T1.title FROM albums AS T1 JOIN tracks AS T2 ON T1.id = T2.album_id GROUP BY T1.id HAVING count(T1.id)  >  10;	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id JOIN media_types AS T3 ON T3.id = T2.media_type_id WHERE T1.name = 'Rock' AND T3.name = 'MPEG audio file';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id JOIN media_types AS T3 ON T3.id = T2.media_type_id WHERE T1.name = 'Rock' AND T3.name = 'MPEG audio file';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id JOIN media_types AS T3 ON T3.id = T2.media_type_id WHERE T1.name = 'Rock' OR T3.name = 'MPEG audio file';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id JOIN media_types AS T3 ON T3.id = T2.media_type_id WHERE T1.name = 'Rock' OR T3.name = 'MPEG audio file';	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.name = 'Rock' OR T1.name = 'Jazz'	store_1
SELECT T2.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id WHERE T1.name = 'Rock' OR T1.name = 'Jazz'	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id = T2.track_id JOIN playlists AS T3 ON T3.id = T2.playlist_id WHERE T3.name = 'Movies';	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id = T2.track_id JOIN playlists AS T3 ON T3.id = T2.playlist_id WHERE T3.name = 'Movies';	store_1
SELECT T2.name FROM playlist_tracks AS T1 JOIN playlists AS T2 ON T2.id = T1.playlist_id GROUP BY T1.playlist_id HAVING count(T1.track_id)  >  100;	store_1
SELECT T2.name FROM playlist_tracks AS T1 JOIN playlists AS T2 ON T2.id = T1.playlist_id GROUP BY T1.playlist_id HAVING count(T1.track_id)  >  100;	store_1
SELECT T1.name FROM tracks AS T1 JOIN invoice_lines AS T2 ON T1.id = T2.track_id JOIN invoices AS T3 ON T3.id = T2.invoice_id JOIN customers AS T4 ON T4.id = T3.customer_id WHERE T4.first_name = 'Daan' AND T4.last_name = 'Peeters';	store_1
SELECT T1.name FROM tracks AS T1 JOIN invoice_lines AS T2 ON T1.id = T2.track_id JOIN invoices AS T3 ON T3.id = T2.invoice_id JOIN customers AS T4 ON T4.id = T3.customer_id WHERE T4.first_name = 'Daan' AND T4.last_name = 'Peeters';	store_1
SELECT unit_price FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT unit_price FROM tracks WHERE name = 'Fast As a Shark';	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Movies' EXCEPT SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Music'	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Movies' EXCEPT SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Music'	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Movies' INTERSECT SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Music'	store_1
SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Movies' INTERSECT SELECT T1.name FROM tracks AS T1 JOIN playlist_tracks AS T2 ON T1.id  =  T2.track_id JOIN playlists AS T3 ON T2.playlist_id  =  T3.id WHERE T3.name  =  'Music'	store_1
SELECT count(*) ,  T1.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id GROUP BY T1.name;	store_1
SELECT count(*) ,  T1.name FROM genres AS T1 JOIN tracks AS T2 ON T1.id = T2.genre_id GROUP BY T1.name;	store_1
SELECT count(*) FROM editor	journal_committee
SELECT Name FROM editor ORDER BY Age ASC	journal_committee
SELECT Name ,  Age FROM editor	journal_committee
SELECT Name FROM editor WHERE Age  >  25	journal_committee
SELECT name FROM editor WHERE age <= 25 AND age >= 24	journal_committee
SELECT name FROM editor WHERE age = (SELECT MIN(age) FROM editor)	journal_committee
SELECT Age ,  COUNT(*) FROM editor GROUP BY Age	journal_committee
SELECT age FROM editor GROUP BY age HAVING COUNT(age) = (SELECT MAX(counts) FROM (SELECT COUNT(age) AS counts FROM editor GROUP BY age))	journal_committee
SELECT DISTINCT Theme FROM journal	journal_committee
SELECT T2.Name ,  T3.Theme FROM journal_committee AS T1 JOIN editor AS T2 ON T1.Editor_ID  =  T2.Editor_ID JOIN journal AS T3 ON T1.Journal_ID  =  T3.Journal_ID	journal_committee
SELECT T2.Name ,  T3.Theme FROM journal_committee AS T1 JOIN editor AS T2 ON T1.Editor_ID  =  T2.Editor_ID JOIN journal AS T3 ON T1.Journal_ID  =  T3.Journal_ID	journal_committee
SELECT T2.Name ,  T2.age ,  T3.Theme FROM journal_committee AS T1 JOIN editor AS T2 ON T1.Editor_ID  =  T2.Editor_ID JOIN journal AS T3 ON T1.Journal_ID  =  T3.Journal_ID ORDER BY T3.Theme ASC	journal_committee
SELECT e.name FROM editor AS e WHERE EXISTS (SELECT 1 FROM journal_committee AS jc JOIN journal AS j ON jc.journal_id = j.journal_id WHERE jc.editor_id = e.editor_id AND j.sales > 3000)	journal_committee
SELECT ed.editor_id, ed.name, (SELECT COUNT(*) FROM journal_committee WHERE journal_committee.editor_id = ed.editor_id) AS journal_count FROM editor ed	journal_committee
SELECT e.name FROM editor e JOIN journal_committee jc ON e.editor_id = jc.editor_id GROUP BY e.editor_id HAVING COUNT(jc.journal_id) >= 2	journal_committee
SELECT Name FROM editor WHERE editor_id NOT IN (SELECT editor_id FROM journal_committee)	journal_committee
SELECT j.date, j.theme, j.sales FROM journal j WHERE j.journal_id NOT IN (SELECT jc.journal_id FROM journal_committee jc)	journal_committee
SELECT AVG(sales) FROM journal WHERE journal_id IN (SELECT journal_id FROM journal_committee WHERE work_type = 'Photo')	journal_committee
SELECT count(*) FROM Accounts	customers_card_transactions
SELECT count(*) FROM Accounts	customers_card_transactions
SELECT account_id ,  customer_id ,  account_name FROM Accounts	customers_card_transactions
SELECT account_id ,  customer_id ,  account_name FROM Accounts	customers_card_transactions
SELECT other_account_details FROM Accounts WHERE account_name  =  '338'	customers_card_transactions
SELECT other_account_details FROM Accounts WHERE account_name  =  '338'	customers_card_transactions
SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.account_name  =  '162'	customers_card_transactions
SELECT c.customer_first_name || ' ' || c.customer_last_name AS full_name, c.customer_phone FROM customers c JOIN accounts a ON c.customer_id = a.customer_id WHERE a.account_name = '162'	customers_card_transactions
SELECT count(*) FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Art' AND T2.customer_last_name  =  'Turcotte'	customers_card_transactions
SELECT count(*) FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Art' AND T2.customer_last_name  =  'Turcotte'	customers_card_transactions
SELECT customers.customer_id, COUNT(accounts.account_id) FROM customers LEFT JOIN accounts ON customers.customer_id = accounts.customer_id GROUP BY customers.customer_id	customers_card_transactions
SELECT customer_id ,  count(*) FROM Accounts GROUP BY customer_id	customers_card_transactions
SELECT customer_id, COUNT(account_id) FROM accounts GROUP BY customer_id HAVING COUNT(account_id) = (SELECT MAX(account_c) FROM (SELECT COUNT(account_id) as account_c FROM accounts GROUP BY customer_id))	customers_card_transactions
WITH ranked_customers AS (SELECT customer_id, COUNT(account_id) AS accounts_count, RANK() OVER (ORDER BY COUNT(account_id) DESC) AS rank FROM accounts GROUP BY customer_id) SELECT customer_id, accounts_count FROM ranked_customers WHERE rank = 1	customers_card_transactions
SELECT T2.customer_first_name ,  T2.customer_last_name ,  T1.customer_id FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
SELECT c.customer_id, c.customer_first_name || ' ' || c.customer_last_name FROM customers c, accounts a WHERE c.customer_id = a.customer_id GROUP BY c.customer_id HAVING COUNT(a.account_id) = ( SELECT MIN(acc_counts.count) FROM (SELECT customer_id, COUNT(account_id) as count FROM accounts GROUP BY customer_id) as acc_counts)	customers_card_transactions
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_card_transactions
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_card_transactions
SELECT customer_first_name, customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM accounts)	customers_card_transactions
SELECT customer_first_name || ' ' || customer_last_name AS full_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM accounts)	customers_card_transactions
SELECT DISTINCT T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_card_transactions
SELECT DISTINCT c.customer_first_name || ' ' || c.customer_last_name AS full_name FROM customers c JOIN accounts a ON c.customer_id = a.customer_id	customers_card_transactions
SELECT count(DISTINCT customer_id) FROM Accounts	customers_card_transactions
SELECT COUNT(DISTINCT customer_id) FROM accounts WHERE customer_id IN (SELECT customer_id FROM customers);	customers_card_transactions
SELECT count(*) FROM Customers	customers_card_transactions
SELECT count(*) FROM Customers	customers_card_transactions
SELECT customer_id ,  customer_first_name ,  customer_last_name ,  customer_phone FROM Customers	customers_card_transactions
SELECT customer_id, customer_first_name || ' ' || customer_last_name AS full_name, customer_phone FROM customers;	customers_card_transactions
SELECT customer_phone ,  customer_email FROM Customers WHERE customer_first_name  =  'Aniyah' AND customer_last_name  =  'Feest'	customers_card_transactions
SELECT customer_phone ,  customer_email FROM Customers WHERE customer_first_name  =  'Aniyah' AND customer_last_name  =  'Feest'	customers_card_transactions
SELECT count(*) FROM Customers_cards	customers_card_transactions
SELECT count(*) FROM Customers_cards	customers_card_transactions
SELECT card_id ,  customer_id ,  card_type_code ,  card_number FROM Customers_cards	customers_card_transactions
SELECT card_id ,  customer_id ,  card_type_code ,  card_number FROM Customers_cards	customers_card_transactions
SELECT date_valid_from ,  date_valid_to FROM Customers_cards WHERE card_number  =  '4560596484842'	customers_card_transactions
SELECT date_valid_from ,  date_valid_to FROM Customers_cards WHERE card_number  =  '4560596484842'	customers_card_transactions
SELECT T2.customer_first_name ,  T2.customer_last_name ,  T2.customer_phone FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.card_number  =  '4560596484842'	customers_card_transactions
SELECT c.customer_first_name || ' ' || c.customer_last_name AS full_name, c.customer_phone FROM customers_cards cc JOIN customers c ON cc.customer_id = c.customer_ID WHERE cc.card_number = 4560596484842	customers_card_transactions
SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Art' AND T2.customer_last_name  =  'Turcotte'	customers_card_transactions
SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Art' AND T2.customer_last_name  =  'Turcotte'	customers_card_transactions
SELECT count(*) FROM Customers_cards WHERE card_type_code  =  'Debit'	customers_card_transactions
SELECT count(*) FROM Customers_cards WHERE card_type_code  =  'Debit'	customers_card_transactions
SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Blanche' AND T2.customer_last_name  =  'Huels' AND T1.card_type_code  =  'Credit'	customers_card_transactions
SELECT count(*) FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Blanche' AND T2.customer_last_name  =  'Huels' AND T1.card_type_code  =  'Credit'	customers_card_transactions
SELECT customers.customer_id, COUNT(customers_cards.card_id) AS number_of_cards FROM customers LEFT JOIN customers_cards ON customers.customer_id = customers_cards.customer_id GROUP BY customers.customer_id	customers_card_transactions
SELECT customer_id ,  count(*) FROM Customers_cards GROUP BY customer_id	customers_card_transactions
SELECT customer_id, COUNT(*) AS total FROM customers_cards GROUP BY customer_id HAVING total = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM customers_cards GROUP BY customer_id))	customers_card_transactions
SELECT customer_id, COUNT(*) FROM customers_cards GROUP BY customer_id HAVING COUNT(*) = (SELECT MAX(card_count) FROM (SELECT customer_id, COUNT(card_id) AS card_count FROM customers_cards GROUP BY customer_id))	customers_card_transactions
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_card_transactions
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_card_transactions
SELECT customers.customer_id, customer_first_name, customer_last_name FROM customers JOIN accounts ON customers.customer_id = accounts.customer_id GROUP BY customers.customer_id ORDER BY COUNT(accounts.account_id) ASC LIMIT 1	customers_card_transactions
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1	customers_card_transactions
SELECT card_type_code ,  count(*) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
SELECT card_type_code ,  count(*) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
SELECT card_type_code FROM customers_cards GROUP BY card_type_code HAVING COUNT(card_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(card_id) cnt FROM customers_cards GROUP BY card_type_code))	customers_card_transactions
SELECT card_type_code FROM Customers_cards GROUP BY card_type_code ORDER BY count(*) DESC LIMIT 1	customers_card_transactions
SELECT card_type_code FROM Customers_cards GROUP BY card_type_code HAVING count(*)  >=  5	customers_card_transactions
SELECT card_type_code FROM Customers_cards GROUP BY card_type_code HAVING count(*)  >=  5	customers_card_transactions
SELECT card_type_code ,  count(DISTINCT customer_id) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
SELECT card_type_code ,  count(DISTINCT customer_id) FROM Customers_cards GROUP BY card_type_code	customers_card_transactions
SELECT customer_id ,  customer_first_name FROM Customers EXCEPT SELECT T1.customer_id ,  T2.customer_first_name FROM Customers_cards AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE card_type_code  =  'Credit'	customers_card_transactions
SELECT c.customer_id, c.customer_first_name FROM customers c, customers_cards cc WHERE c.customer_id = cc.customer_id AND cc.card_type_code != 'Credit' GROUP BY c.customer_id HAVING COUNT(cc.card_type_code) = 0	customers_card_transactions
SELECT DISTINCT card_type_code FROM Customers_Cards	customers_card_transactions
SELECT DISTINCT card_type_code FROM Customers_Cards	customers_card_transactions
SELECT count(DISTINCT card_type_code) FROM Customers_Cards	customers_card_transactions
SELECT count(DISTINCT card_type_code) FROM Customers_Cards	customers_card_transactions
SELECT DISTINCT transaction_type FROM Financial_Transactions	customers_card_transactions
SELECT DISTINCT transaction_type FROM Financial_Transactions	customers_card_transactions
SELECT count(DISTINCT transaction_type) FROM Financial_Transactions	customers_card_transactions
SELECT count(DISTINCT transaction_type) FROM Financial_Transactions	customers_card_transactions
SELECT avg(transaction_amount) ,  sum(transaction_amount) FROM Financial_transactions	customers_card_transactions
SELECT avg(transaction_amount) ,  sum(transaction_amount) FROM Financial_transactions	customers_card_transactions
SELECT cc.card_type_code, COUNT(transaction_id) FROM customers_cards cc LEFT JOIN financial_transactions ft ON cc.card_id = ft.card_id GROUP BY cc.card_type_code	customers_card_transactions
SELECT T2.card_type_code ,  count(*) FROM Financial_transactions AS T1 JOIN Customers_cards AS T2 ON T1.card_id  =  T2.card_id GROUP BY T2.card_type_code	customers_card_transactions
SELECT transaction_type ,  count(*) FROM Financial_transactions GROUP BY transaction_type	customers_card_transactions
SELECT transaction_type ,  count(*) FROM Financial_transactions GROUP BY transaction_type	customers_card_transactions
SELECT transaction_type FROM financial_transactions GROUP BY transaction_type HAVING SUM(transaction_amount) = (SELECT MAX(total) FROM (SELECT SUM(transaction_amount) AS total FROM financial_transactions GROUP BY transaction_type))	customers_card_transactions
SELECT transaction_type FROM financial_transactions GROUP BY transaction_type HAVING SUM(transaction_amount) = (SELECT MAX(total) FROM (SELECT SUM(transaction_amount) AS total FROM financial_transactions GROUP BY transaction_type) T)	customers_card_transactions
SELECT a.account_id, COUNT(t.transaction_id) AS num_transactions FROM accounts a LEFT JOIN financial_transactions t ON a.account_id = t.account_id GROUP BY a.account_id	customers_card_transactions
SELECT account_id ,  count(*) FROM Financial_transactions GROUP BY account_id	customers_card_transactions
SELECT count(*) FROM track	race_track
SELECT count(*) FROM track	race_track
SELECT name ,  LOCATION FROM track	race_track
SELECT name ,  LOCATION FROM track	race_track
SELECT name ,  seating FROM track WHERE year_opened  >  2000 ORDER BY seating	race_track
SELECT name ,  seating FROM track WHERE year_opened  >  2000 ORDER BY seating	race_track
SELECT name, location, seating FROM track WHERE year_opened = (SELECT MAX(year_opened) FROM track)	race_track
SELECT name, location, seating FROM track WHERE year_opened = (SELECT MAX(year_opened) FROM track);	race_track
SELECT min(seating) ,  max(seating) ,  avg(seating) FROM track	race_track
SELECT min(seating) ,  max(seating) ,  avg(seating) FROM track	race_track
SELECT name ,  LOCATION ,  year_opened FROM track WHERE seating  >  (SELECT avg(seating) FROM track)	race_track
SELECT name ,  LOCATION ,  year_opened FROM track WHERE seating  >  (SELECT avg(seating) FROM track)	race_track
SELECT DISTINCT LOCATION FROM track	race_track
SELECT DISTINCT LOCATION FROM track	race_track
SELECT count(*) FROM race	race_track
SELECT count(*) FROM race	race_track
SELECT DISTINCT CLASS FROM race	race_track
SELECT DISTINCT CLASS FROM race	race_track
SELECT name ,  CLASS ,  date FROM race	race_track
SELECT name ,  CLASS ,  date FROM race	race_track
SELECT CLASS ,  count(*) FROM race GROUP BY CLASS	race_track
SELECT CLASS ,  count(*) FROM race GROUP BY CLASS	race_track
SELECT class FROM race GROUP BY class HAVING COUNT(race_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(race_id) as cnt FROM race GROUP BY class))	race_track
SELECT class FROM race GROUP BY class HAVING COUNT(*) = (SELECT MAX(class_count) FROM (SELECT COUNT(*) AS class_count FROM race GROUP BY class))	race_track
SELECT CLASS FROM race GROUP BY CLASS HAVING count(*)  >=  2	race_track
SELECT CLASS FROM race GROUP BY CLASS HAVING count(*)  >=  2	race_track
SELECT name FROM track WHERE track_id NOT IN (SELECT track_id FROM race WHERE class = 'GT')	race_track
SELECT name FROM track WHERE track_id NOT IN (SELECT track_id FROM race WHERE class = 'GT')	race_track
SELECT name FROM track WHERE track_id NOT IN (SELECT track_id FROM race)	race_track
SELECT name FROM track WHERE track_id NOT IN (SELECT track_id FROM race)	race_track
SELECT DISTINCT t1.year_opened FROM track t1, track t2 WHERE t1.seating >= 5000 AND t2.seating <= 4000 AND t1.year_opened = t2.year_opened	race_track
SELECT year_opened FROM track WHERE seating BETWEEN 4000 AND 5000	race_track
SELECT t2.name AS track_name, (SELECT COUNT(*) FROM race WHERE track_id = t2.track_id) AS number_of_races FROM track AS t2	race_track
SELECT name as TrackName, (SELECT COUNT(*) FROM race WHERE race.track_id = track.track_id) as RaceCount FROM track	race_track
SELECT track.name FROM track, race WHERE track.track_id = race.track_id GROUP BY track.track_id HAVING COUNT(race.race_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(race_id) AS COUNT FROM race GROUP BY track_id))	race_track
SELECT T2.name FROM race AS T1 JOIN track AS T2 ON T1.track_id  =  T2.track_id GROUP BY T1.track_id ORDER BY count(*) DESC LIMIT 1	race_track
SELECT T1.name ,  T1.date ,  T2.name FROM race AS T1 JOIN track AS T2 ON T1.track_id  =  T2.track_id	race_track
SELECT T1.name ,  T1.date ,  T2.name FROM race AS T1 JOIN track AS T2 ON T1.track_id  =  T2.track_id	race_track
SELECT T2.name ,  T2.location FROM race AS T1 JOIN track AS T2 ON T1.track_id  =  T2.track_id GROUP BY T1.track_id HAVING count(*)  =  1	race_track
SELECT T2.name ,  T2.location FROM race AS T1 JOIN track AS T2 ON T1.track_id  =  T2.track_id GROUP BY T1.track_id HAVING count(*)  =  1	race_track
SELECT LOCATION FROM track WHERE seating  >  90000 INTERSECT SELECT LOCATION FROM track WHERE seating  <  70000	race_track
SELECT LOCATION FROM track WHERE seating  >  90000 INTERSECT SELECT LOCATION FROM track WHERE seating  <  70000	race_track
SELECT count(*) FROM member WHERE Membership_card  =  'Black'	coffee_shop
SELECT count(*) ,  address FROM member GROUP BY address	coffee_shop
SELECT name FROM member WHERE address  =  'Harford' OR address  =  'Waterbury'	coffee_shop
SELECT name ,  member_id FROM member WHERE Membership_card  =  'Black' OR age  <  30	coffee_shop
SELECT Time_of_purchase ,  age ,  address FROM member ORDER BY Time_of_purchase	coffee_shop
SELECT Membership_card FROM member GROUP BY Membership_card HAVING count(*)  >  5	coffee_shop
SELECT address FROM member WHERE age  <  30 INTERSECT SELECT address FROM member WHERE age  >  40	coffee_shop
SELECT membership_card FROM member WHERE address  =  'Hartford' INTERSECT SELECT membership_card FROM member WHERE address  =  'Waterbury'	coffee_shop
SELECT count(*) FROM member WHERE address != 'Hartford'	coffee_shop
SELECT shop.address FROM shop LEFT JOIN happy_hour ON shop.shop_id = happy_hour.shop_id LEFT JOIN happy_hour_member ON happy_hour.hh_id = happy_hour_member.hh_id LEFT JOIN member ON happy_hour_member.member_id = member.member_id WHERE member.membership_card != 'Black' OR member.membership_card IS NULL GROUP BY shop.address	coffee_shop
SELECT address FROM shop ORDER BY open_year	coffee_shop
SELECT avg(num_of_staff) ,  avg(score) FROM shop	coffee_shop
SELECT shop_id ,  address FROM shop WHERE score  <  (SELECT avg(score) FROM shop)	coffee_shop
SELECT address ,  num_of_staff FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM happy_hour)	coffee_shop
SELECT DISTINCT shop.shop_id, shop.address FROM shop INNER JOIN happy_hour ON shop.shop_id = happy_hour.shop_id WHERE happy_hour.month = 'May'	coffee_shop
SELECT hh.shop_id, COUNT(*) FROM happy_hour hh GROUP BY hh.shop_id HAVING COUNT(*) = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM happy_hour GROUP BY shop_id))	coffee_shop
SELECT month FROM happy_hour GROUP BY month HAVING COUNT(hh_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(hh_id) AS cnt FROM happy_hour GROUP BY month))	coffee_shop
SELECT MONTH FROM happy_hour GROUP BY MONTH HAVING count(*)  >  2	coffee_shop
SELECT count(*) FROM ALBUM	chinook_1
SELECT count(*) FROM ALBUM	chinook_1
SELECT Name FROM GENRE	chinook_1
SELECT Name FROM GENRE	chinook_1
SELECT * FROM CUSTOMER WHERE State  =  'NY'	chinook_1
SELECT * FROM CUSTOMER WHERE State  =  'NY'	chinook_1
SELECT FirstName ,  LastName FROM EMPLOYEE WHERE City  =  'Calgary'	chinook_1
SELECT FirstName ,  LastName FROM EMPLOYEE WHERE City  =  'Calgary'	chinook_1
SELECT distinct(BillingCountry) FROM INVOICE	chinook_1
SELECT distinct(BillingCountry) FROM INVOICE	chinook_1
SELECT Name FROM ARTIST WHERE Name LIKE '%a%'	chinook_1
SELECT Name FROM ARTIST WHERE Name LIKE '%a%'	chinook_1
SELECT Title FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T2.Name  =  'AC/DC'	chinook_1
SELECT Title FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T2.Name  =  'AC/DC'	chinook_1
SELECT COUNT(*) FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T2.Name  =  'Metallica'	chinook_1
SELECT COUNT(*) FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T2.Name  =  'Metallica'	chinook_1
SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T1.Title  =  'Balls to the Wall'	chinook_1
SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId WHERE T1.Title  =  'Balls to the Wall'	chinook_1
SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId GROUP BY T2.Name ORDER BY COUNT(*) DESC LIMIT 1	chinook_1
SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId GROUP BY T2.Name ORDER BY COUNT(*) DESC LIMIT 1	chinook_1
SELECT Name FROM TRACK WHERE Name LIKE '%you%'	chinook_1
SELECT Name FROM TRACK WHERE Name LIKE '%you%'	chinook_1
SELECT AVG(UnitPrice) FROM TRACK	chinook_1
SELECT AVG(UnitPrice) FROM TRACK	chinook_1
SELECT max(Milliseconds) ,  min(Milliseconds) FROM TRACK	chinook_1
SELECT max(Milliseconds) ,  min(Milliseconds) FROM TRACK	chinook_1
SELECT T1.Title ,  T2.AlbumID ,  COUNT(*) FROM ALBUM AS T1 JOIN TRACK AS T2 ON T1.AlbumId  =  T2.AlbumId GROUP BY T2.AlbumID	chinook_1
SELECT T1.Title ,  T2.AlbumID ,  COUNT(*) FROM ALBUM AS T1 JOIN TRACK AS T2 ON T1.AlbumId  =  T2.AlbumId GROUP BY T2.AlbumID	chinook_1
SELECT T1.Name FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId GROUP BY T2.GenreId ORDER BY COUNT(*) DESC LIMIT 1	chinook_1
SELECT T1.Name FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId GROUP BY T2.GenreId ORDER BY COUNT(*) DESC LIMIT 1	chinook_1
SELECT T1.Name FROM MEDIATYPE AS T1 JOIN TRACK AS T2 ON T1.MediaTypeId  =  T2.MediaTypeId GROUP BY T2.MediaTypeId ORDER BY COUNT(*) ASC LIMIT 1	chinook_1
SELECT T1.Name FROM MEDIATYPE AS T1 JOIN TRACK AS T2 ON T1.MediaTypeId  =  T2.MediaTypeId GROUP BY T2.MediaTypeId ORDER BY COUNT(*) ASC LIMIT 1	chinook_1
SELECT T1.Title ,  T2.AlbumID FROM ALBUM AS T1 JOIN TRACK AS T2 ON T1.AlbumId  =  T2.AlbumId WHERE T2.UnitPrice  >  1 GROUP BY T2.AlbumID	chinook_1
SELECT T1.Title ,  T2.AlbumID FROM ALBUM AS T1 JOIN TRACK AS T2 ON T1.AlbumId  =  T2.AlbumId WHERE T2.UnitPrice  >  1 GROUP BY T2.AlbumID	chinook_1
SELECT COUNT(*) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Rock'	chinook_1
SELECT COUNT(*) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Rock'	chinook_1
SELECT AVG(UnitPrice) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Jazz'	chinook_1
SELECT AVG(UnitPrice) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Jazz'	chinook_1
SELECT FirstName ,  LastName FROM CUSTOMER WHERE Email  =  'luisg@embraer.com.br'	chinook_1
SELECT FirstName ,  LastName FROM CUSTOMER WHERE Email  =  'luisg@embraer.com.br'	chinook_1
SELECT COUNT(*) FROM CUSTOMER WHERE Email LIKE '%gmail.com%'	chinook_1
SELECT COUNT(*) FROM CUSTOMER WHERE Email LIKE '%gmail.com%'	chinook_1
SELECT T2.FirstName ,  T2.LastName FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId WHERE T1.FirstName  =  'Leonie'	chinook_1
SELECT T2.FirstName ,  T2.LastName FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId WHERE T1.FirstName  =  'Leonie'	chinook_1
SELECT T2.City FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId WHERE T1.PostalCode  =  '70174'	chinook_1
SELECT T2.City FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId WHERE T1.PostalCode  =  '70174'	chinook_1
SELECT COUNT(DISTINCT city) FROM EMPLOYEE	chinook_1
SELECT COUNT(DISTINCT city) FROM EMPLOYEE	chinook_1
SELECT T2.InvoiceDate FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.FirstName  =  'Astrid' AND LastName  =  'Gruber'	chinook_1
SELECT T2.InvoiceDate FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.FirstName  =  'Astrid' AND LastName  =  'Gruber'	chinook_1
SELECT LastName FROM CUSTOMER EXCEPT SELECT T1.LastName FROM CUSTOMER AS T1 JOIN Invoice AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T2.total  >  20	chinook_1
SELECT LastName FROM CUSTOMER EXCEPT SELECT T1.LastName FROM CUSTOMER AS T1 JOIN Invoice AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T2.total  >  20	chinook_1
SELECT DISTINCT T1.FirstName FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.country  =  'Brazil'	chinook_1
SELECT DISTINCT T1.FirstName FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.country  =  'Brazil'	chinook_1
SELECT DISTINCT T1.Address FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.country  =  'Germany'	chinook_1
SELECT DISTINCT T1.Address FROM CUSTOMER AS T1 JOIN INVOICE AS T2 ON T1.CustomerId  =  T2.CustomerId WHERE T1.country  =  'Germany'	chinook_1
SELECT Phone FROM EMPLOYEE	chinook_1
SELECT Phone FROM EMPLOYEE	chinook_1
SELECT COUNT(*) FROM MEDIATYPE AS T1 JOIN TRACK AS T2 ON T1.MediaTypeId  =  T2.MediaTypeId WHERE T1.Name  =  'AAC audio file'	chinook_1
SELECT COUNT(*) FROM MEDIATYPE AS T1 JOIN TRACK AS T2 ON T1.MediaTypeId  =  T2.MediaTypeId WHERE T1.Name  =  'AAC audio file'	chinook_1
SELECT AVG(Milliseconds) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Latin' OR T1.Name  =  'Pop'	chinook_1
SELECT AVG(Milliseconds) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Latin' OR T1.Name  =  'Pop'	chinook_1
SELECT T1.FirstName ,  T1.SupportRepId FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId GROUP BY T1.SupportRepId HAVING COUNT(*)  >=  10	chinook_1
SELECT T1.FirstName ,  T1.SupportRepId FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId GROUP BY T1.SupportRepId HAVING COUNT(*)  >=  10	chinook_1
SELECT T1.LastName FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId GROUP BY T1.SupportRepId HAVING COUNT(*)  <=  20	chinook_1
SELECT T1.LastName FROM CUSTOMER AS T1 JOIN EMPLOYEE AS T2 ON T1.SupportRepId  =  T2.EmployeeId GROUP BY T1.SupportRepId HAVING COUNT(*)  <=  20	chinook_1
SELECT Title FROM ALBUM ORDER BY Title	chinook_1
SELECT Title FROM ALBUM ORDER BY Title	chinook_1
SELECT T2.Name ,  T1.ArtistId FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistID GROUP BY T1.ArtistId HAVING COUNT(*)  >=  3 ORDER BY T2.Name	chinook_1
SELECT T2.Name ,  T1.ArtistId FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistID GROUP BY T1.ArtistId HAVING COUNT(*)  >=  3 ORDER BY T2.Name	chinook_1
SELECT Name FROM ARTIST EXCEPT SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId	chinook_1
SELECT Name FROM ARTIST EXCEPT SELECT T2.Name FROM ALBUM AS T1 JOIN ARTIST AS T2 ON T1.ArtistId  =  T2.ArtistId	chinook_1
SELECT AVG(T2.UnitPrice) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Rock'	chinook_1
SELECT AVG(T2.UnitPrice) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Rock'	chinook_1
SELECT MIN(t.milliseconds) AS ShortestPopDuration, MAX(t.milliseconds) AS LongestPopDuration FROM track t JOIN genre g ON t.genreid = g.genreid WHERE g.name = 'Pop' GROUP BY g.name	chinook_1
SELECT max(Milliseconds) ,  min(Milliseconds) FROM GENRE AS T1 JOIN TRACK AS T2 ON T1.GenreId  =  T2.GenreId WHERE T1.Name  =  'Pop'	chinook_1
SELECT BirthDate FROM EMPLOYEE WHERE City  =  'Edmonton'	chinook_1
SELECT BirthDate FROM EMPLOYEE WHERE City  =  'Edmonton'	chinook_1
SELECT distinct(UnitPrice) FROM TRACK	chinook_1
SELECT distinct(UnitPrice) FROM TRACK	chinook_1
SELECT count(*) FROM ARTIST WHERE artistid NOT IN(SELECT artistid FROM ALBUM)	chinook_1
SELECT count(*) FROM ARTIST WHERE artistid NOT IN(SELECT artistid FROM ALBUM)	chinook_1
SELECT T1.Title FROM Album AS T1 JOIN Track AS T2 ON T1.AlbumId  =  T2.AlbumId JOIN Genre AS T3 ON T2.GenreID  =  T3.GenreID WHERE T3.Name  =  'Reggae' INTERSECT SELECT T1.Title FROM Album AS T1 JOIN Track AS T2 ON T1.AlbumId  =  T2.AlbumId JOIN Genre AS T3 ON T2.GenreID  =  T3.GenreID WHERE T3.Name  =  'Rock'	chinook_1
SELECT T1.Title FROM Album AS T1 JOIN Track AS T2 ON T1.AlbumId  =  T2.AlbumId JOIN Genre AS T3 ON T2.GenreID  =  T3.GenreID WHERE T3.Name  =  'Reggae' INTERSECT SELECT T1.Title FROM Album AS T1 JOIN Track AS T2 ON T1.AlbumId  =  T2.AlbumId JOIN Genre AS T3 ON T2.GenreID  =  T3.GenreID WHERE T3.Name  =  'Rock'	chinook_1
SELECT customer_phone FROM available_policies	insurance_fnol
SELECT customer_phone FROM available_policies	insurance_fnol
SELECT customer_phone FROM available_policies WHERE policy_type_code  =  'Life Insurance'	insurance_fnol
SELECT DISTINCT ap.customer_phone FROM available_policies ap JOIN customers_policies cp ON ap.policy_id = cp.policy_id WHERE ap.policy_type_code = 'Life Insurance'	insurance_fnol
SELECT policy_type_code FROM available_policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1	insurance_fnol
SELECT policy_type_code FROM available_policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1	insurance_fnol
SELECT customer_phone FROM available_policies WHERE policy_type_code  =  (SELECT policy_type_code FROM available_policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1)	insurance_fnol
SELECT customer_phone FROM available_policies WHERE policy_type_code  =  (SELECT policy_type_code FROM available_policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1)	insurance_fnol
SELECT DISTINCT ap.policy_type_code FROM available_policies ap INNER JOIN customers_policies cp ON ap.policy_id = cp.policy_id WHERE ap.policy_id IN (SELECT policy_id FROM customers_policies GROUP BY policy_id HAVING COUNT(DISTINCT customer_id) > 4)	insurance_fnol
SELECT policy_type_code FROM available_policies WHERE policy_id IN (SELECT policy_id FROM customers_policies GROUP BY policy_id HAVING COUNT(DISTINCT customer_id) > 4)	insurance_fnol
SELECT sum(settlement_amount) ,  avg(settlement_amount) FROM settlements	insurance_fnol
SELECT sum(settlement_amount) ,  avg(settlement_amount) FROM settlements	insurance_fnol
SELECT t2.service_name FROM first_notification_of_loss AS t1 JOIN services AS t2 ON t1.service_id  =  t2.service_id GROUP BY t1.service_id HAVING count(*)  >  2	insurance_fnol
SELECT DISTINCT S.service_name FROM services S INNER JOIN first_notification_of_loss F ON S.service_id = F.service_id GROUP BY S.service_id HAVING COUNT(F.fnol_id) > 2	insurance_fnol
SELECT t1.Effective_Date FROM claims AS t1 JOIN settlements AS t2 ON t1.claim_id  =  t2.claim_id GROUP BY t1.claim_id ORDER BY sum(t2.settlement_amount) DESC LIMIT 1	insurance_fnol
SELECT t1.Effective_Date FROM claims AS t1 JOIN settlements AS t2 ON t1.claim_id  =  t2.claim_id GROUP BY t1.claim_id ORDER BY sum(t2.settlement_amount) DESC LIMIT 1	insurance_fnol
SELECT COUNT(DISTINCT cp.policy_id) FROM customers c JOIN customers_policies cp ON c.customer_id = cp.customer_id WHERE c.customer_name = 'Dayana Robel'	insurance_fnol
SELECT count(*) FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.customer_name  =  'Dayana Robel'	insurance_fnol
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_policies GROUP BY customer_id HAVING COUNT(policy_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(policy_id) AS cnt FROM customers_policies GROUP BY customer_id)))	insurance_fnol
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_policies GROUP BY customer_id HAVING COUNT(policy_id) = (SELECT MAX(counted) FROM (SELECT COUNT(policy_id) AS counted FROM customers_policies GROUP BY customer_id)))	insurance_fnol
SELECT DISTINCT t3.policy_type_code FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id JOIN available_policies AS t3 ON t2.policy_id  =  t3.policy_id WHERE t1.customer_name  =  'Dayana Robel'	insurance_fnol
SELECT DISTINCT t3.policy_type_code FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id JOIN available_policies AS t3 ON t2.policy_id  =  t3.policy_id WHERE t1.customer_name  =  'Dayana Robel'	insurance_fnol
SELECT DISTINCT t3.policy_type_code FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id JOIN available_policies AS t3 ON t2.policy_id  =  t3.policy_id WHERE t1.customer_name  =  (SELECT t1.customer_name FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_name ORDER BY count(*) DESC LIMIT 1)	insurance_fnol
SELECT DISTINCT t3.policy_type_code FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id JOIN available_policies AS t3 ON t2.policy_id  =  t3.policy_id WHERE t1.customer_name  =  (SELECT t1.customer_name FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_name ORDER BY count(*) DESC LIMIT 1)	insurance_fnol
SELECT service_name FROM services ORDER BY service_name	insurance_fnol
SELECT service_name FROM services ORDER BY service_name	insurance_fnol
SELECT count(*) FROM services	insurance_fnol
SELECT count(*) FROM services	insurance_fnol
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM first_notification_of_loss)	insurance_fnol
SELECT c.customer_name FROM customers c LEFT JOIN first_notification_of_loss f ON c.customer_id = f.customer_id WHERE f.fnol_id IS NULL	insurance_fnol
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM first_notification_of_loss WHERE service_id IN (SELECT service_id FROM services WHERE service_name = 'Close a policy' UNION SELECT service_id FROM services WHERE service_name = 'Upgrade a policy'))	insurance_fnol
SELECT t1.customer_name FROM customers AS t1 JOIN first_notification_of_loss AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id WHERE t3.service_name  =  'Close a policy' OR t3.service_name  =  'Upgrade a policy'	insurance_fnol
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM first_notification_of_loss WHERE service_id IN (SELECT service_id FROM services WHERE service_name = 'Close a policy') INTERSECT SELECT customer_id FROM first_notification_of_loss WHERE service_id IN (SELECT service_id FROM services WHERE service_name = 'New policy application'))	insurance_fnol
SELECT DISTINCT cu.customer_name FROM customers cu JOIN first_notification_of_loss fnol ON cu.customer_id = fnol.customer_id JOIN services s ON fnol.service_id = s.service_id WHERE s.service_name IN ('Close a policy', 'Upgrade a policy') GROUP BY cu.customer_id HAVING COUNT(DISTINCT s.service_name) = 2	insurance_fnol
SELECT customer_id FROM customers WHERE customer_name LIKE '%Diana%'	insurance_fnol
SELECT customer_id FROM customers WHERE customer_name LIKE '%Diana%'	insurance_fnol
SELECT max(settlement_amount) ,  min(settlement_amount) FROM settlements	insurance_fnol
SELECT max(settlement_amount) ,  min(settlement_amount) FROM settlements	insurance_fnol
SELECT customer_id ,  customer_name FROM customers ORDER BY customer_id ASC	insurance_fnol
SELECT customer_id FROM customers ORDER BY customer_id	insurance_fnol
SELECT t2.date_opened ,  t2.date_closed FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.customer_name LIKE '%Diana%'	insurance_fnol
SELECT t2.date_opened ,  t2.date_closed FROM customers AS t1 JOIN customers_policies AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.customer_name LIKE '%Diana%'	insurance_fnol
SELECT COUNT(DISTINCT name) FROM enzyme	medicine_enzyme_interaction
SELECT count(*) FROM enzyme	medicine_enzyme_interaction
SELECT name FROM enzyme ORDER BY name DESC	medicine_enzyme_interaction
SELECT name FROM enzyme ORDER BY name DESC	medicine_enzyme_interaction
SELECT name ,  LOCATION FROM enzyme	medicine_enzyme_interaction
SELECT name ,  LOCATION FROM enzyme	medicine_enzyme_interaction
SELECT max(OMIM) FROM enzyme	medicine_enzyme_interaction
SELECT max(OMIM) FROM enzyme	medicine_enzyme_interaction
SELECT product ,  chromosome ,  porphyria FROM enzyme WHERE LOCATION  =  'Cytosol'	medicine_enzyme_interaction
SELECT product ,  chromosome ,  porphyria FROM enzyme WHERE LOCATION  =  'Cytosol'	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE product != 'Heme'	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE product != 'Heme'	medicine_enzyme_interaction
SELECT name ,  trade_name FROM medicine WHERE FDA_approved  =  'Yes'	medicine_enzyme_interaction
SELECT name ,  trade_name FROM medicine WHERE FDA_approved  =  'Yes'	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE id IN (SELECT enzyme_id FROM medicine_enzyme_interaction WHERE medicine_id IN (SELECT id FROM medicine WHERE name = 'Amisulpride') AND interaction_type = 'inhibitor')	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE id IN (SELECT enzyme_id FROM medicine_enzyme_interaction WHERE interaction_type = 'inhibitor' AND medicine_id IN (SELECT id FROM medicine WHERE name = 'Amisulpride'))	medicine_enzyme_interaction
SELECT T1.id ,  T1.Name FROM medicine AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.medicine_id  =  T1.id GROUP BY T1.id HAVING count(*)  >=  2	medicine_enzyme_interaction
SELECT name FROM medicine WHERE id IN (SELECT medicine_id FROM medicine_enzyme_interaction GROUP BY medicine_id HAVING COUNT(DISTINCT enzyme_id) > 1)	medicine_enzyme_interaction
SELECT T1.id ,  T1.Name ,  T1.FDA_approved FROM medicine AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.medicine_id  =  T1.id GROUP BY T1.id ORDER BY count(*) DESC	medicine_enzyme_interaction
SELECT m.id, m.name, m.fda_approved FROM medicine m LEFT JOIN medicine_enzyme_interaction mei ON m.id = mei.medicine_id GROUP BY m.id ORDER BY COUNT(mei.enzyme_id) DESC	medicine_enzyme_interaction
SELECT e.id, e.name FROM enzyme e JOIN medicine_enzyme_interaction mei ON e.id = mei.enzyme_id WHERE mei.interaction_type = 'activator' GROUP BY e.id ORDER BY COUNT(mei.medicine_id) DESC LIMIT 1	medicine_enzyme_interaction
SELECT T1.id ,  T1.name FROM enzyme AS T1 JOIN medicine_enzyme_interaction AS T2 ON T1.id  =  T2.enzyme_id WHERE T2.interaction_type  =  'activitor' GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1	medicine_enzyme_interaction
SELECT T1.interaction_type FROM medicine_enzyme_interaction AS T1 JOIN medicine AS T2 ON T1.medicine_id  =  T2.id JOIN enzyme AS T3 ON T1.enzyme_id  =  T3.id WHERE T3.name  =  'ALA synthase' AND T2.name  =  'Aripiprazole'	medicine_enzyme_interaction
SELECT T1.interaction_type FROM medicine_enzyme_interaction AS T1 JOIN medicine AS T2 ON T1.medicine_id  =  T2.id JOIN enzyme AS T3 ON T1.enzyme_id  =  T3.id WHERE T3.name  =  'ALA synthase' AND T2.name  =  'Aripiprazole'	medicine_enzyme_interaction
SELECT interaction_type ,  count(*) FROM medicine_enzyme_interaction GROUP BY interaction_type ORDER BY count(*) DESC LIMIT 1	medicine_enzyme_interaction
SELECT interaction_type ,  count(*) FROM medicine_enzyme_interaction GROUP BY interaction_type ORDER BY count(*) DESC LIMIT 1	medicine_enzyme_interaction
SELECT count(*) FROM medicine WHERE FDA_approved  =  'No'	medicine_enzyme_interaction
SELECT count(*) FROM medicine WHERE FDA_approved  =  'No'	medicine_enzyme_interaction
SELECT count(*) FROM enzyme WHERE id NOT IN ( SELECT enzyme_id FROM medicine_enzyme_interaction );	medicine_enzyme_interaction
SELECT count(*) FROM enzyme WHERE id NOT IN ( SELECT enzyme_id FROM medicine_enzyme_interaction );	medicine_enzyme_interaction
SELECT T1.id ,  T1.trade_name FROM medicine AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.medicine_id  =  T1.id GROUP BY T1.id HAVING COUNT(*)  >=  3	medicine_enzyme_interaction
SELECT T1.id ,  T1.trade_name FROM medicine AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.medicine_id  =  T1.id GROUP BY T1.id HAVING COUNT(*)  >=  3	medicine_enzyme_interaction
SELECT DISTINCT T1.name ,  T1.location ,  T1.product FROM enzyme AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.enzyme_id  =  T1.id WHERE T2.interaction_type  =  'inhibitor'	medicine_enzyme_interaction
SELECT DISTINCT T1.name ,  T1.location ,  T1.product FROM enzyme AS T1 JOIN medicine_enzyme_interaction AS T2 ON T2.enzyme_id  =  T1.id WHERE T2.interaction_type  =  'inhibitor'	medicine_enzyme_interaction
SELECT name, trade_name FROM medicine WHERE id IN (SELECT medicine_id FROM medicine_enzyme_interaction WHERE interaction_type = 'inhibitor' INTERSECT SELECT medicine_id FROM medicine_enzyme_interaction WHERE interaction_type = 'activitor')	medicine_enzyme_interaction
SELECT m.name, m.trade_name FROM medicine m WHERE m.id IN (SELECT medicine_id FROM medicine_enzyme_interaction GROUP BY medicine_id HAVING SUM(CASE WHEN interaction_type = 'activitor' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN interaction_type = 'inhibitor' THEN 1 ELSE 0 END) > 0)	medicine_enzyme_interaction
SELECT m.name, m.trade_name FROM medicine m WHERE NOT EXISTS (SELECT 1 FROM medicine_enzyme_interaction mei JOIN enzyme e ON mei.enzyme_id = e.id WHERE mei.medicine_id = m.id AND e.product = 'Heme')	medicine_enzyme_interaction
SELECT medicine.name, medicine.trade_name FROM medicine WHERE medicine.id NOT IN (SELECT medicine_enzyme_interaction.medicine_id FROM medicine_enzyme_interaction JOIN enzyme ON medicine_enzyme_interaction.enzyme_id = enzyme.id WHERE enzyme.product = 'Heme')	medicine_enzyme_interaction
SELECT count(DISTINCT FDA_approved) FROM medicine	medicine_enzyme_interaction
SELECT count(DISTINCT FDA_approved) FROM medicine	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE name LIKE '%ALA%'	medicine_enzyme_interaction
SELECT name FROM enzyme WHERE name LIKE '%ALA%'	medicine_enzyme_interaction
SELECT trade_name ,  count(*) FROM medicine GROUP BY trade_name	medicine_enzyme_interaction
SELECT trade_name ,  count(*) FROM medicine GROUP BY trade_name	medicine_enzyme_interaction
SELECT school ,  nickname FROM university ORDER BY founded	university_basketball
SELECT school ,  nickname FROM university ORDER BY founded	university_basketball
SELECT school ,  LOCATION FROM university WHERE affiliation  =  'Public'	university_basketball
SELECT school ,  LOCATION FROM university WHERE affiliation  =  'Public'	university_basketball
SELECT u.founded FROM university u WHERE u.enrollment = (SELECT MAX(enrollment) FROM university)	university_basketball
SELECT U.founded FROM (SELECT founded, MAX(enrollment) AS MaxEnrollment FROM university GROUP BY founded) U	university_basketball
SELECT founded FROM university WHERE affiliation != 'Public' ORDER BY founded DESC LIMIT 1	university_basketball
SELECT founded FROM university WHERE affiliation != 'Public' ORDER BY founded DESC LIMIT 1	university_basketball
SELECT count(DISTINCT school_id) FROM basketball_match	university_basketball
SELECT count(DISTINCT school_id) FROM basketball_match	university_basketball
SELECT acc_percent FROM basketball_match ORDER BY acc_percent DESC LIMIT 1	university_basketball
SELECT acc_percent FROM basketball_match ORDER BY acc_percent DESC LIMIT 1	university_basketball
SELECT t1.Primary_conference FROM university AS t1 JOIN basketball_match AS t2 ON t1.school_id  =  t2.school_id ORDER BY t2.acc_percent LIMIT 1	university_basketball
SELECT primary_conference FROM university u INNER JOIN basketball_match bm ON u.school_id = bm.school_id WHERE bm.acc_percent = (SELECT MIN(acc_percent) FROM basketball_match)	university_basketball
SELECT b.team_name, b.acc_regular_season FROM basketball_match AS b JOIN university AS u ON b.school_id = u.school_id WHERE u.founded = (SELECT MIN(founded) FROM university)	university_basketball
SELECT b.team_name, b.acc_regular_season FROM basketball_match b JOIN university u ON b.school_id = u.school_id WHERE u.founded = (SELECT MIN(founded) FROM university)	university_basketball
SELECT t2.All_Games ,  t1.location FROM university AS t1 JOIN basketball_match AS t2 ON t1.school_id  =  t2.school_id WHERE team_name  =  'Clemson'	university_basketball
SELECT t2.All_Games ,  t1.location FROM university AS t1 JOIN basketball_match AS t2 ON t1.school_id  =  t2.school_id WHERE team_name  =  'Clemson'	university_basketball
SELECT avg(enrollment) FROM university WHERE founded  <  1850	university_basketball
SELECT avg(enrollment) FROM university WHERE founded  <  1850	university_basketball
SELECT enrollment, primary_conference FROM university WHERE founded = (SELECT MIN(founded) FROM university)	university_basketball
SELECT enrollment, primary_conference FROM university WHERE founded = (SELECT MIN(founded) FROM university)	university_basketball
SELECT sum(enrollment) ,  min(enrollment) FROM university	university_basketball
SELECT sum(enrollment) ,  min(enrollment) FROM university	university_basketball
SELECT sum(enrollment) ,  affiliation FROM university GROUP BY affiliation	university_basketball
SELECT sum(enrollment) ,  affiliation FROM university GROUP BY affiliation	university_basketball
SELECT count(*) FROM university WHERE school_id NOT IN (SELECT school_id FROM basketball_match)	university_basketball
SELECT count(*) FROM university WHERE school_id NOT IN (SELECT school_id FROM basketball_match)	university_basketball
SELECT school FROM university WHERE founded  >  1850 OR affiliation  =  'Public'	university_basketball
SELECT school FROM university WHERE founded < 1850 OR affiliation = 'Public'	university_basketball
SELECT count(DISTINCT affiliation) FROM university	university_basketball
SELECT count(DISTINCT affiliation) FROM university	university_basketball
SELECT COUNT(DISTINCT location) FROM university WHERE location LIKE '%NY%'	university_basketball
SELECT COUNT(*) FROM university WHERE instr(location, 'NY') > 0	university_basketball
SELECT t2.team_name FROM university AS t1 JOIN basketball_match AS t2 ON t1.school_id  =  t2.school_id WHERE enrollment  <  (SELECT avg(enrollment) FROM university)	university_basketball
SELECT t2.team_name FROM university AS t1 JOIN basketball_match AS t2 ON t1.school_id  =  t2.school_id WHERE enrollment  <  (SELECT avg(enrollment) FROM university)	university_basketball
SELECT count(*) ,  affiliation FROM university WHERE enrollment  >  20000 GROUP BY affiliation	university_basketball
SELECT count(*) ,  affiliation FROM university WHERE enrollment  >  20000 GROUP BY affiliation	university_basketball
SELECT sum(Enrollment) ,  affiliation FROM university WHERE founded  >  1850 GROUP BY affiliation	university_basketball
SELECT sum(Enrollment) ,  affiliation FROM university WHERE founded  >  1850 GROUP BY affiliation	university_basketball
SELECT max(Enrollment) FROM university	university_basketball
SELECT max(Enrollment) FROM university	university_basketball
SELECT * FROM basketball_match	university_basketball
SELECT * FROM basketball_match	university_basketball
SELECT team_name FROM basketball_match ORDER BY All_Home DESC	university_basketball
SELECT team_name FROM basketball_match ORDER BY All_Home DESC	university_basketball
SELECT Model_name FROM chip_model WHERE Launch_year BETWEEN 2002 AND 2004;	phone_1
SELECT model_name, ram_mib FROM chip_model WHERE ram_mib = (SELECT MIN(ram_mib) FROM chip_model)	phone_1
SELECT chip_model ,  screen_mode FROM phone WHERE Hardware_Model_name = 'LG-P760';	phone_1
SELECT count(*) FROM phone WHERE Company_name = 'Nokia Corporation';	phone_1
SELECT max(T1.RAM_MiB) ,  min(T1.RAM_MiB) FROM chip_model AS T1 JOIN phone AS T2 ON T1.Model_name  =  T2.chip_model WHERE T2.Company_name = 'Nokia Corporation';	phone_1
SELECT avg(T1.ROM_MiB) FROM chip_model AS T1 JOIN phone AS T2 ON T1.Model_name  =  T2.chip_model WHERE T2.Company_name = 'Nokia Corporation';	phone_1
SELECT T2.Hardware_Model_name ,  T2.Company_name FROM chip_model AS T1 JOIN phone AS T2 ON T1.Model_name  =  T2.chip_model WHERE T1.Launch_year = 2002 OR T1.RAM_MiB  >  32;	phone_1
SELECT hardware_model_name, company_name FROM phone WHERE accreditation_type LIKE '%Full%'	phone_1
SELECT T1.Char_cells ,  T1.Pixels ,  T1.Hardware_colours FROM screen_mode AS T1 JOIN phone AS T2 ON T1.Graphics_mode = T2.screen_mode WHERE T2.Hardware_Model_name = 'LG-P760';	phone_1
SELECT T2.Hardware_Model_name ,  T2.Company_name FROM screen_mode AS T1 JOIN phone AS T2 ON T1.Graphics_mode = T2.screen_mode WHERE T1.Type  =  'Graphics';	phone_1
SELECT company_name, COUNT(DISTINCT hardware_model_name) AS TotalModels FROM phone GROUP BY company_name HAVING TotalModels = (SELECT MIN(c) FROM (SELECT COUNT(DISTINCT hardware_model_name) AS c FROM phone GROUP BY company_name))	phone_1
SELECT Company_name FROM phone GROUP BY Company_name HAVING count(*)  >  1;	phone_1
SELECT max(used_kb) , min(used_kb) , avg(used_kb) FROM screen_mode;	phone_1
SELECT hardware_model_name FROM phone WHERE chip_model IN (SELECT model_name FROM chip_model WHERE launch_year = 2002 ORDER BY ram_mib DESC LIMIT 1)	phone_1
SELECT T1.WiFi , T3.Type FROM chip_model AS T1 JOIN phone AS T2 ON T1.Model_name  =  T2.chip_model JOIN screen_mode AS T3 ON T2.screen_mode = T3.Graphics_mode WHERE T2.Hardware_Model_name = 'LG-P760';	phone_1
SELECT hardware_model_name FROM phone WHERE chip_model IN (SELECT model_name FROM chip_model WHERE ram_mib > 32) OR screen_mode IN (SELECT graphics_mode FROM screen_mode WHERE type = 'Text')	phone_1
SELECT hardware_model_name FROM phone WHERE company_name = 'Nokia Corporation' UNION SELECT hardware_model_name FROM phone WHERE screen_mode IN (SELECT graphics_mode FROM screen_mode WHERE type = 'Graphics')	phone_1
SELECT DISTINCT T2.Hardware_Model_name FROM screen_mode AS T1 JOIN phone AS T2 ON T1.Graphics_mode = T2.screen_mode WHERE t2.Company_name  =  'Nokia Corporation' AND T1.Type != 'Text';	phone_1
SELECT DISTINCT T2.Hardware_Model_name , T2.Company_name FROM screen_mode AS T1 JOIN phone AS T2 ON T1.Graphics_mode = T2.screen_mode WHERE T1.used_kb BETWEEN 10 AND 15;	phone_1
SELECT Accreditation_type ,  count(*) FROM phone GROUP BY Accreditation_type	phone_1
SELECT Accreditation_type ,  count(*) FROM phone GROUP BY Accreditation_type	phone_1
SELECT Accreditation_level FROM phone GROUP BY Accreditation_level HAVING count(*)  >  3	phone_1
SELECT * FROM chip_model	phone_1
SELECT count(*) FROM chip_model WHERE wifi  =  'No'	phone_1
SELECT count(*) FROM chip_model WHERE wifi  =  'No'	phone_1
SELECT model_name FROM chip_model ORDER BY launch_year	phone_1
SELECT avg(RAM_MiB) FROM chip_model WHERE model_name NOT IN (SELECT chip_model FROM phone)	phone_1
SELECT model_name FROM chip_model EXCEPT SELECT chip_model FROM phone WHERE Accreditation_type  =  'Full'	phone_1
SELECT DISTINCT pixels FROM screen_mode WHERE graphics_mode IN (SELECT screen_mode FROM phone WHERE accreditation_type = 'Full' INTERSECT SELECT screen_mode FROM phone WHERE accreditation_type = 'Provisional')	phone_1
SELECT count(*) FROM country	match_season
SELECT count(*) FROM country	match_season
SELECT Country_name ,  Capital FROM country	match_season
SELECT Country_name ,  Capital FROM country	match_season
SELECT Official_native_language FROM country WHERE Official_native_language LIKE '%English%'	match_season
SELECT Official_native_language FROM country WHERE Official_native_language LIKE '%English%'	match_season
SELECT DISTINCT POSITION FROM match_season	match_season
SELECT DISTINCT POSITION FROM match_season	match_season
SELECT Player FROM match_season WHERE College  =  'UCLA'	match_season
SELECT Player FROM match_season WHERE College  =  'UCLA'	match_season
SELECT DISTINCT POSITION FROM match_season WHERE College  =  'UCLA' OR College  =  'Duke'	match_season
SELECT DISTINCT POSITION FROM match_season WHERE College  =  'UCLA' OR College  =  'Duke'	match_season
SELECT Draft_Pick_Number ,  Draft_Class FROM match_season WHERE POSITION  =  'Defender'	match_season
SELECT Draft_Pick_Number ,  Draft_Class FROM match_season WHERE POSITION  =  'Defender'	match_season
SELECT count(DISTINCT Team) FROM match_season	match_season
SELECT count(DISTINCT Team) FROM match_season	match_season
SELECT Player ,  Years_Played FROM player	match_season
SELECT Player ,  Years_Played FROM player	match_season
SELECT Name FROM Team	match_season
SELECT Name FROM Team	match_season
SELECT T2.Season ,  T2.Player ,  T1.Country_name FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country	match_season
SELECT p.player, ms.season, c.country_name FROM match_season ms JOIN player p ON ms.team = p.team JOIN country c ON ms.country = c.country_id	match_season
SELECT T2.Player FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Country_name  =  'Indonesia'	match_season
SELECT T2.Player FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Country_name  =  'Indonesia'	match_season
SELECT DISTINCT T2.Position FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Capital  =  'Dublin'	match_season
SELECT DISTINCT T2.Position FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Capital  =  'Dublin'	match_season
SELECT DISTINCT official_native_language FROM country WHERE country_id IN (SELECT country FROM match_season WHERE college IN ('Duke', 'Maryland'))	match_season
SELECT official_native_language FROM country c WHERE EXISTS (SELECT 1 FROM match_season ms WHERE (ms.college = 'Duke' OR ms.college = 'Maryland') AND ms.country = c.country_id)	match_season
SELECT count(DISTINCT T1.Official_native_language) FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T2.Position  =  'Defender'	match_season
SELECT count(DISTINCT T1.Official_native_language) FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country WHERE T2.Position  =  'Defender'	match_season
SELECT T1.Season ,  T1.Player ,  T2.Name FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id	match_season
SELECT T1.Season ,  T1.Player ,  T2.Name FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id	match_season
SELECT T1.Position FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Ryley Goldner'	match_season
SELECT T1.Position FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Ryley Goldner'	match_season
SELECT count(DISTINCT T1.College) FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Columbus Crew'	match_season
SELECT count(DISTINCT T1.College) FROM match_season AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Columbus Crew'	match_season
SELECT T1.Player , T1.Years_Played FROM player AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Columbus Crew'	match_season
SELECT T1.Player , T1.Years_Played FROM player AS T1 JOIN team AS T2 ON T1.Team  =  T2.Team_id WHERE T2.Name  =  'Columbus Crew'	match_season
SELECT POSITION ,  COUNT(*) FROM match_season GROUP BY POSITION	match_season
SELECT POSITION ,  COUNT(*) FROM match_season GROUP BY POSITION	match_season
SELECT Country_name ,  COUNT(*) FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country GROUP BY T1.Country_name	match_season
SELECT Country_name ,  COUNT(*) FROM country AS T1 JOIN match_season AS T2 ON T1.Country_id  =  T2.Country GROUP BY T1.Country_name	match_season
SELECT player FROM match_season ORDER BY College ASC	match_season
SELECT player FROM match_season ORDER BY College ASC	match_season
SELECT m.position FROM match_season m GROUP BY m.position HAVING COUNT(m.position) = (SELECT MAX(cnt) FROM (SELECT COUNT(position) AS cnt FROM match_season GROUP BY position) tmp)	match_season
WITH RankedPositions AS (SELECT position, RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank FROM match_season GROUP BY position) SELECT position FROM RankedPositions WHERE Rank = 1	match_season
SELECT College FROM match_season GROUP BY College ORDER BY count(*) DESC LIMIT 3	match_season
SELECT College FROM match_season GROUP BY College ORDER BY count(*) DESC LIMIT 3	match_season
SELECT College FROM match_season GROUP BY College HAVING count(*)  >=  2	match_season
SELECT College FROM match_season GROUP BY College HAVING count(*)  >=  2	match_season
SELECT college FROM match_season GROUP BY college HAVING COUNT(DISTINCT player) >= 2 ORDER BY college DESC	match_season
SELECT college FROM match_season GROUP BY college HAVING COUNT(DISTINCT player) >= 2 ORDER BY college DESC	match_season
SELECT Name FROM team WHERE Team_id NOT IN (SELECT Team FROM match_season)	match_season
SELECT Name FROM team WHERE Team_id NOT IN (SELECT Team FROM match_season)	match_season
SELECT DISTINCT country_name FROM country WHERE country_id IN (SELECT country FROM match_season WHERE position = 'Defender') AND country_id IN (SELECT country FROM match_season WHERE position = 'Forward')	match_season
SELECT country_name FROM country WHERE country_id IN (SELECT country FROM match_season ms WHERE ms.position = 'Forward' GROUP BY country HAVING COUNT(*) >= 1) AND country_id IN (SELECT country FROM match_season ms WHERE ms.position = 'Defender' GROUP BY country HAVING COUNT(*) >= 1)	match_season
SELECT College FROM match_season WHERE POSITION  =  'Midfielder' INTERSECT SELECT College FROM match_season WHERE POSITION  =  'Defender'	match_season
SELECT College FROM match_season WHERE POSITION  =  'Midfielder' INTERSECT SELECT College FROM match_season WHERE POSITION  =  'Defender'	match_season
SELECT count(*) FROM climber	climbing
SELECT count(*) FROM climber	climbing
SELECT Name FROM climber ORDER BY Points DESC	climbing
SELECT Name FROM climber ORDER BY Points DESC	climbing
SELECT Name FROM climber WHERE Country != 'Switzerland'	climbing
SELECT Name FROM climber WHERE Country != 'Switzerland'	climbing
SELECT max(Points) FROM climber WHERE Country  =  'United Kingdom'	climbing
SELECT max(Points) FROM climber WHERE Country  =  'United Kingdom'	climbing
SELECT COUNT(DISTINCT Country) FROM climber	climbing
SELECT COUNT(DISTINCT Country) FROM climber	climbing
SELECT Name FROM mountain ORDER BY Name ASC	climbing
SELECT Name FROM mountain ORDER BY Name ASC	climbing
SELECT Country FROM mountain WHERE Height  >  5000	climbing
SELECT Country FROM mountain WHERE Height  >  5000	climbing
SELECT name FROM mountain WHERE height = (SELECT MAX(height) FROM mountain)	climbing
SELECT name FROM mountain WHERE height = (SELECT MAX(height) FROM mountain)	climbing
SELECT DISTINCT range FROM mountain WHERE mountain_id IN (SELECT mountain_id FROM mountain ORDER BY prominence DESC LIMIT 3)	climbing
SELECT DISTINCT r FROM (SELECT range AS r FROM mountain ORDER BY prominence DESC LIMIT 3)	climbing
SELECT T1.Name ,  T2.Name FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID	climbing
SELECT T1.Name ,  T2.Name FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID	climbing
SELECT T1.Name ,  T2.Height FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID	climbing
SELECT T1.Name ,  T2.Height FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID	climbing
SELECT mt.height FROM mountain AS mt JOIN climber AS c ON mt.mountain_id = c.mountain_id WHERE c.points = (SELECT MAX(points) FROM climber)	climbing
SELECT height FROM mountain WHERE mountain_id IN (SELECT mountain_id FROM climber WHERE points = (SELECT MAX(points) FROM climber))	climbing
SELECT DISTINCT T2.Name FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID WHERE T1.Country  =  'West Germany'	climbing
SELECT DISTINCT T2.Name FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID WHERE T1.Country  =  'West Germany'	climbing
SELECT T1.Time FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID WHERE T2.Country  =  'Uganda'	climbing
SELECT T1.Time FROM climber AS T1 JOIN mountain AS T2 ON T1.Mountain_ID  =  T2.Mountain_ID WHERE T2.Country  =  'Uganda'	climbing
SELECT Country ,  COUNT(*) FROM climber GROUP BY Country	climbing
SELECT Country ,  COUNT(*) FROM climber GROUP BY Country	climbing
SELECT Country FROM mountain GROUP BY Country HAVING COUNT(*)  >  1	climbing
SELECT Country FROM mountain GROUP BY Country HAVING COUNT(*)  >  1	climbing
SELECT Name FROM mountain WHERE Mountain_ID NOT IN (SELECT Mountain_ID FROM climber)	climbing
SELECT Name FROM mountain WHERE Mountain_ID NOT IN (SELECT Mountain_ID FROM climber)	climbing
SELECT Country FROM mountain WHERE Height  >  5600 INTERSECT SELECT Country FROM mountain WHERE Height  <  5200	climbing
SELECT Country FROM mountain WHERE Height  >  5600 INTERSECT SELECT Country FROM mountain WHERE Height  <  5200	climbing
SELECT range FROM (SELECT range, COUNT(mountain_id) as count FROM mountain GROUP BY range) WHERE count = (SELECT MAX(count) FROM (SELECT COUNT(mountain_id) as count FROM mountain GROUP BY range))	climbing
SELECT range FROM mountain GROUP BY range HAVING COUNT(mountain_id) = (SELECT MAX(count) FROM (SELECT COUNT(mountain_id) AS count FROM mountain GROUP BY range))	climbing
SELECT Name FROM mountain WHERE Height  >  5000 OR Prominence  >  1000	climbing
SELECT Name FROM mountain WHERE Height  >  5000 OR Prominence  >  1000	climbing
SELECT count(*) FROM body_builder	body_builder
SELECT Total FROM body_builder ORDER BY Total ASC	body_builder
SELECT Snatch ,  Clean_Jerk FROM body_builder ORDER BY Snatch ASC	body_builder
SELECT avg(Snatch) FROM body_builder	body_builder
SELECT b.clean_jerk FROM body_builder AS b WHERE b.total = (SELECT MAX(total) FROM body_builder)	body_builder
SELECT Birth_Date FROM People ORDER BY Height ASC	body_builder
SELECT T2.Name FROM body_builder AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID	body_builder
SELECT T2.Name FROM body_builder AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Total  >  300	body_builder
SELECT p.name FROM people p WHERE EXISTS (SELECT 1 FROM body_builder bb WHERE bb.people_id = p.people_id AND p.weight = (SELECT MAX(weight) FROM people WHERE people_id IN (SELECT people_id FROM body_builder)));	body_builder
SELECT P.birth_date, P.birth_place FROM people P INNER JOIN body_builder B ON P.people_id = B.people_id WHERE B.total = (SELECT MAX(total) FROM body_builder)	body_builder
SELECT T2.Height FROM body_builder AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Total  <  315	body_builder
SELECT avg(T1.Total) FROM body_builder AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Height  >  200	body_builder
SELECT T2.Name FROM body_builder AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Total DESC	body_builder
SELECT Birth_Place ,  COUNT(*) FROM people GROUP BY Birth_Place	body_builder
SELECT birth_place FROM people GROUP BY birth_place HAVING COUNT(birth_place) = (SELECT MAX(count) FROM (SELECT COUNT(birth_place) AS count FROM people GROUP BY birth_place))	body_builder
SELECT Birth_Place FROM people GROUP BY Birth_Place HAVING COUNT(*)  >=  2	body_builder
SELECT Height ,  Weight FROM people ORDER BY Height DESC	body_builder
SELECT * FROM body_builder	body_builder
SELECT name, birth_place FROM people WHERE people_id NOT IN (SELECT people_id FROM body_builder)	body_builder
SELECT count(DISTINCT Birth_Place) FROM people	body_builder
SELECT count(*) FROM people WHERE people_id NOT IN (SELECT People_ID FROM body_builder)	body_builder
SELECT T2.weight FROM body_builder AS T1 JOIN people AS T2 ON T1.people_id  =  T2.people_id WHERE T1.snatch  >  140 OR T2.height  >  200;	body_builder
SELECT T1.total FROM body_builder AS T1 JOIN people AS T2 ON T1.people_id  =  T2.people_id WHERE T2.Birth_Date LIKE '%January%';	body_builder
SELECT min(snatch) FROM body_builder	body_builder
SELECT count(*) FROM election	election_representative
SELECT Votes FROM election ORDER BY Votes DESC	election_representative
SELECT Date ,  Vote_Percent FROM election	election_representative
SELECT min(Vote_Percent) ,  max(Vote_Percent) FROM election	election_representative
SELECT Name ,  Party FROM representative	election_representative
SELECT Name FROM Representative WHERE Party != 'Republican'	election_representative
SELECT Lifespan FROM representative WHERE State  =  'New York' OR State  =  'Indiana'	election_representative
SELECT T2.Name ,  T1.Date FROM election AS T1 JOIN representative AS T2 ON T1.Representative_ID  =  T2.Representative_ID	election_representative
SELECT name FROM representative WHERE representative_id IN (SELECT representative_id FROM election WHERE votes > 10000)	election_representative
SELECT name FROM representative WHERE representative_id IN (SELECT representative_id FROM election ORDER BY votes DESC)	election_representative
SELECT T2.Party FROM election AS T1 JOIN representative AS T2 ON T1.Representative_ID  =  T2.Representative_ID ORDER BY votes ASC LIMIT 1	election_representative
SELECT T2.Lifespan FROM election AS T1 JOIN representative AS T2 ON T1.Representative_ID  =  T2.Representative_ID ORDER BY Vote_Percent DESC	election_representative
SELECT avg(T1.Votes) FROM election AS T1 JOIN representative AS T2 ON T1.Representative_ID  =  T2.Representative_ID WHERE T2.Party  =  'Republican'	election_representative
SELECT Party ,  COUNT(*) FROM representative GROUP BY Party	election_representative
SELECT party FROM representative GROUP BY party ORDER BY COUNT(*) DESC LIMIT 1	election_representative
SELECT Party FROM representative GROUP BY Party HAVING COUNT(*)  >=  3	election_representative
SELECT State FROM representative GROUP BY State HAVING COUNT(*)  >=  2	election_representative
SELECT Name FROM representative WHERE Representative_ID NOT IN (SELECT Representative_ID FROM election)	election_representative
SELECT Party FROM representative WHERE State  =  'New York' INTERSECT SELECT Party FROM representative WHERE State  =  'Pennsylvania'	election_representative
SELECT count(DISTINCT Party) FROM representative	election_representative
SELECT count(*) FROM Apartment_Bookings	apartment_rentals
SELECT count(*) FROM Apartment_Bookings	apartment_rentals
SELECT booking_start_date ,  booking_end_date FROM Apartment_Bookings	apartment_rentals
SELECT booking_start_date ,  booking_end_date FROM Apartment_Bookings	apartment_rentals
SELECT DISTINCT building_description FROM Apartment_Buildings	apartment_rentals
SELECT DISTINCT building_description FROM Apartment_Buildings	apartment_rentals
SELECT building_short_name FROM Apartment_Buildings WHERE building_manager  =  'Emma'	apartment_rentals
SELECT building_short_name FROM Apartment_Buildings WHERE building_manager  =  'Emma'	apartment_rentals
SELECT building_address ,  building_phone FROM Apartment_Buildings WHERE building_manager  =  'Brenden'	apartment_rentals
SELECT building_address ,  building_phone FROM Apartment_Buildings WHERE building_manager  =  'Brenden'	apartment_rentals
SELECT building_full_name FROM Apartment_Buildings WHERE building_full_name LIKE '%court%'	apartment_rentals
SELECT building_full_name FROM Apartment_Buildings WHERE building_full_name LIKE '%court%'	apartment_rentals
SELECT min(bathroom_count) ,  max(bathroom_count) FROM Apartments	apartment_rentals
SELECT min(bathroom_count) ,  max(bathroom_count) FROM Apartments	apartment_rentals
SELECT avg(bedroom_count) FROM Apartments	apartment_rentals
SELECT avg(bedroom_count) FROM Apartments	apartment_rentals
SELECT apt_number ,  room_count FROM Apartments	apartment_rentals
SELECT apt_number ,  room_count FROM Apartments	apartment_rentals
SELECT avg(room_count) FROM Apartments WHERE apt_type_code  =  'Studio'	apartment_rentals
SELECT avg(room_count) FROM Apartments WHERE apt_type_code  =  'Studio'	apartment_rentals
SELECT apt_number FROM Apartments WHERE apt_type_code  =  'Flat'	apartment_rentals
SELECT apt_number FROM Apartments WHERE apt_type_code  =  'Flat'	apartment_rentals
SELECT guest_first_name ,  guest_last_name FROM Guests	apartment_rentals
SELECT guest_first_name ,  guest_last_name FROM Guests	apartment_rentals
SELECT date_of_birth FROM Guests WHERE gender_code  =  'Male'	apartment_rentals
SELECT date_of_birth FROM Guests WHERE gender_code  =  'Male'	apartment_rentals
SELECT a.apt_number, ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN apartments a ON ab.apt_id = a.apt_id	apartment_rentals
SELECT apt_number, booking_start_date, booking_end_date FROM apartment_bookings JOIN apartments ON apartment_bookings.apt_id = apartments.apt_id	apartment_rentals
SELECT ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN apartments ap ON ap.apt_id = ab.apt_id WHERE ap.apt_type_code = 'Duplex'	apartment_rentals
SELECT ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN apartments ap ON ab.apt_id = ap.apt_id WHERE ap.apt_type_code = 'Duplex';	apartment_rentals
SELECT booking_start_date, booking_end_date FROM apartment_bookings WHERE apt_id IN (SELECT apt_id FROM apartments WHERE bedroom_count > 2)	apartment_rentals
SELECT ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN apartments a ON ab.apt_id = a.apt_id WHERE a.bedroom_count > 2	apartment_rentals
SELECT T1.booking_status_code FROM Apartment_Bookings AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T2.apt_number  =  'Suite 634'	apartment_rentals
SELECT T1.booking_status_code FROM Apartment_Bookings AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T2.apt_number  =  'Suite 634'	apartment_rentals
SELECT DISTINCT T2.apt_number FROM Apartment_Bookings AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T1.booking_status_code  =  'Confirmed'	apartment_rentals
SELECT apt_number FROM apartments WHERE apt_id IN (SELECT apt_id FROM apartment_bookings WHERE booking_status_code = 'Confirmed')	apartment_rentals
SELECT avg(room_count) FROM Apartment_Bookings AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T1.booking_status_code  =  'Provisional'	apartment_rentals
SELECT avg(room_count) FROM Apartment_Bookings AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T1.booking_status_code  =  'Provisional'	apartment_rentals
SELECT g.guest_first_name, ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN guests g ON ab.guest_id = g.guest_id	apartment_rentals
SELECT g.guest_first_name, ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN guests g ON ab.guest_id = g.guest_id	apartment_rentals
SELECT ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN guests g ON ab.guest_id = g.guest_id WHERE g.gender_code = 'Female'	apartment_rentals
SELECT ab.booking_start_date, ab.booking_end_date FROM apartment_bookings ab JOIN guests g ON ab.guest_id = g.guest_id WHERE g.gender_code = 'Female'	apartment_rentals
SELECT guest_first_name, guest_last_name FROM guests WHERE guest_id IN (SELECT guest_id FROM apartment_bookings WHERE booking_status_code = 'Confirmed')	apartment_rentals
SELECT guest_first_name, guest_last_name FROM guests WHERE guest_id IN (SELECT guest_id FROM apartment_bookings WHERE booking_status_code = 'Confirmed')	apartment_rentals
SELECT T1.facility_code FROM Apartment_Facilities AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T2.bedroom_count  >  4	apartment_rentals
SELECT T1.facility_code FROM Apartment_Facilities AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T2.bedroom_count  >  4	apartment_rentals
SELECT sum(T2.room_count) FROM Apartment_Facilities AS T1 JOIN Apartments AS T2 ON T1.apt_id  =  T2.apt_id WHERE T1.facility_code  =  'Gym'	apartment_rentals
SELECT TOTAL(apartments.room_count) FROM apartments INNER JOIN apartment_facilities ON apartments.apt_id = apartment_facilities.apt_id WHERE apartment_facilities.facility_code = 'Gym'	apartment_rentals
SELECT TOTAL(room_count) FROM apartments INNER JOIN apartment_buildings ON apartments.building_id = apartment_buildings.building_id WHERE building_short_name = 'Columbus Square'	apartment_rentals
SELECT TOTAL(apartments.room_count) AS TotalRooms FROM apartments LEFT JOIN apartment_buildings ON apartments.building_id = apartment_buildings.building_id WHERE apartment_buildings.building_short_name = 'Columbus Square'	apartment_rentals
SELECT building_address FROM apartment_buildings AB INNER JOIN apartments A ON AB.building_id = A.building_id WHERE A.bathroom_count > 2 GROUP BY building_address	apartment_rentals
SELECT DISTINCT ab.building_address FROM apartments a JOIN apartment_buildings ab ON a.building_id = ab.building_id WHERE a.bathroom_count > 2	apartment_rentals
SELECT T2.apt_type_code ,  T2.apt_number FROM Apartment_Buildings AS T1 JOIN Apartments AS T2 ON T1.building_id  =  T2.building_id WHERE T1.building_manager  =  'Kyle'	apartment_rentals
SELECT T2.apt_type_code ,  T2.apt_number FROM Apartment_Buildings AS T1 JOIN Apartments AS T2 ON T1.building_id  =  T2.building_id WHERE T1.building_manager  =  'Kyle'	apartment_rentals
SELECT  booking_status_code ,  COUNT(*) FROM Apartment_Bookings GROUP BY booking_status_code	apartment_rentals
SELECT  booking_status_code ,  COUNT(*) FROM Apartment_Bookings GROUP BY booking_status_code	apartment_rentals
SELECT apt_number FROM Apartments ORDER BY room_count ASC	apartment_rentals
SELECT apt_number FROM Apartments ORDER BY room_count ASC	apartment_rentals
SELECT apt_number FROM apartments WHERE bedroom_count = (SELECT MAX(bedroom_count) FROM apartments)	apartment_rentals
SELECT apt_number FROM Apartments ORDER BY bedroom_count DESC LIMIT 1	apartment_rentals
SELECT apt_type_code ,  COUNT(*) FROM Apartments GROUP BY apt_type_code ORDER BY COUNT(*) ASC	apartment_rentals
SELECT DISTINCT a.apt_type_code, (SELECT COUNT(a2.apt_id) FROM apartments a2 WHERE a2.apt_type_code = a.apt_type_code) AS Number FROM apartments a ORDER BY Number ASC	apartment_rentals
SELECT apt_type_code FROM Apartments GROUP BY apt_type_code ORDER BY avg(room_count) DESC LIMIT 3	apartment_rentals
SELECT apt_type_code FROM Apartments GROUP BY apt_type_code ORDER BY avg(room_count) DESC LIMIT 3	apartment_rentals
SELECT apt_type_code ,  bathroom_count ,  bedroom_count FROM Apartments GROUP BY apt_type_code ORDER BY sum(room_count) DESC LIMIT 1	apartment_rentals
SELECT apt_type_code, bathroom_count, bedroom_count FROM apartments GROUP BY apt_type_code, bathroom_count, bedroom_count ORDER BY SUM(room_count) DESC LIMIT 1	apartment_rentals
SELECT apt_type_code FROM Apartments GROUP BY apt_type_code ORDER BY count(*) DESC LIMIT 1	apartment_rentals
SELECT apt_type_code FROM apartments GROUP BY apt_type_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) cnt FROM apartments GROUP BY apt_type_code))	apartment_rentals
SELECT apt_type_code FROM (SELECT apt_type_code FROM apartments WHERE bathroom_count > 1) a GROUP BY apt_type_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) cnt FROM apartments WHERE bathroom_count > 1 GROUP BY apt_type_code) tmp)	apartment_rentals
SELECT apt_type_code FROM apartments WHERE bathroom_count > 1 GROUP BY apt_type_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM apartments WHERE bathroom_count > 1 GROUP BY apt_type_code))	apartment_rentals
SELECT apt_type_code ,  max(room_count) ,  min(room_count) FROM Apartments GROUP BY apt_type_code	apartment_rentals
SELECT apt_type_code ,  max(room_count) ,  min(room_count) FROM Apartments GROUP BY apt_type_code	apartment_rentals
SELECT gender_code ,  COUNT(*) FROM Guests GROUP BY gender_code ORDER BY COUNT(*) DESC	apartment_rentals
SELECT gender_code ,  COUNT(*) FROM Guests GROUP BY gender_code ORDER BY COUNT(*) DESC	apartment_rentals
SELECT count(*) FROM Apartments WHERE apt_id NOT IN (SELECT apt_id FROM Apartment_Facilities)	apartment_rentals
SELECT count(*) FROM Apartments WHERE apt_id NOT IN (SELECT apt_id FROM Apartment_Facilities)	apartment_rentals
SELECT DISTINCT a.apt_number FROM apartments a JOIN apartment_bookings b ON a.apt_id = b.apt_id WHERE b.booking_status_code IN ('Provisional', 'Confirmed') GROUP BY a.apt_id HAVING COUNT(DISTINCT b.booking_status_code) = 2	apartment_rentals
SELECT aps.apt_number FROM apartments aps WHERE aps.apt_id IN (SELECT bq.apt_id FROM apartment_bookings bq GROUP BY bq.apt_id HAVING SUM(CASE WHEN bq.booking_status_code = 'Provisional' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN bq.booking_status_code = 'Confirmed' THEN 1 ELSE 0 END) > 0)	apartment_rentals
SELECT a.apt_number FROM apartments a JOIN (SELECT apt_id FROM view_unit_status WHERE available_yn = 0 INTERSECT SELECT apt_id FROM view_unit_status WHERE available_yn = 1) x ON a.apt_id = x.apt_id	apartment_rentals
SELECT a.apt_number FROM apartments a WHERE a.apt_id IN (SELECT vus.apt_id FROM view_unit_status vus WHERE vus.available_yn = 0 INTERSECT SELECT vus.apt_id FROM view_unit_status vus WHERE vus.available_yn = 1)	apartment_rentals
SELECT count(*) FROM game WHERE season  >  2007	game_injury
SELECT game.date FROM game JOIN stadium ON game.stadium_id = stadium.id ORDER BY stadium.name DESC	game_injury
SELECT season ,  home_team ,  away_team FROM game	game_injury
SELECT max(home_games) ,  min(home_games) ,  avg(home_games) FROM stadium	game_injury
SELECT AVG(average_attendance) FROM stadium WHERE capacity_percentage > 100	game_injury
SELECT player ,  number_of_matches ,  SOURCE FROM injury_accident WHERE injury != 'Knee problem'	game_injury
SELECT T1.season FROM game AS T1 JOIN injury_accident AS T2 ON T1.id  =  T2.game_id WHERE T2.player  =  'Walter Samuel'	game_injury
SELECT T1.id ,  T1.score ,  T1.date FROM game AS T1 JOIN injury_accident AS T2 ON T2.game_id  =  T1.id GROUP BY T1.id HAVING count(*)  >=  2	game_injury
SELECT S.id, S.name FROM stadium S WHERE EXISTS (SELECT NULL FROM game G JOIN injury_accident IA ON G.id = IA.game_id WHERE G.stadium_id = S.id GROUP BY G.stadium_id HAVING COUNT(IA.id) = (SELECT MAX(CNT) FROM (SELECT COUNT(IA.id) AS CNT FROM game G JOIN injury_accident IA ON G.id = IA.game_id GROUP BY G.stadium_id)))	game_injury
SELECT st.id, st.name FROM stadium st, game g, injury_accident ia WHERE st.id = g.stadium_id AND g.id = ia.game_id GROUP BY st.id HAVING COUNT(ia.id) = (SELECT MAX(accident_count) FROM (SELECT COUNT(id) as accident_count FROM injury_accident GROUP BY game_id)tbl)	game_injury
SELECT DISTINCT g.season, s.name FROM game g INNER JOIN stadium s ON g.stadium_id = s.id INNER JOIN injury_accident i ON i.game_id = g.id WHERE i.injury IN ('Foot injury', 'Knee problem')	game_injury
SELECT count(DISTINCT SOURCE) FROM injury_accident	game_injury
SELECT count(*) FROM game WHERE id NOT IN ( SELECT game_id FROM injury_accident )	game_injury
SELECT count(DISTINCT T1.injury) FROM injury_accident AS T1 JOIN game AS T2 ON T1.game_id  =  T2.id WHERE T2.season  >  2010	game_injury
SELECT T2.name FROM game AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.id JOIN injury_accident AS T3 ON T1.id  =  T3.game_id WHERE T3.player  =  'Walter Samuel' INTERSECT SELECT T2.name FROM game AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.id JOIN injury_accident AS T3 ON T1.id  =  T3.game_id WHERE T3.player  =  'Thiago Motta'	game_injury
SELECT s.name, s.average_attendance, s.total_attendance FROM stadium s WHERE s.id NOT IN (SELECT g.stadium_id FROM game g JOIN injury_accident ia ON g.id = ia.game_id)	game_injury
SELECT name FROM stadium WHERE name LIKE '%Bank%'	game_injury
SELECT s.name, IFNULL(COUNT(g.id), 0) AS total_games FROM stadium s LEFT OUTER JOIN game g ON s.id = g.stadium_id GROUP BY s.id	game_injury
SELECT T1.date ,  T2.player FROM game AS T1 JOIN injury_accident AS T2 ON T1.id  =  T2.game_id ORDER BY T1.season DESC	game_injury
SELECT T1.name ,  T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id  =  T2.country_id	soccer_1
SELECT count(*) FROM Country AS T1 JOIN League AS T2 ON T1.id  =  T2.country_id WHERE T1.name  =  'England'	soccer_1
SELECT avg(weight) FROM Player	soccer_1
SELECT MAX(height) AS MaxHeight, MIN(height) AS MinHeight FROM player	soccer_1
SELECT p.player_name FROM player p WHERE EXISTS (SELECT 1 FROM player_attributes pa WHERE pa.player_api_id = p.player_api_id AND pa.overall_rating > (SELECT AVG(overall_rating) FROM player_attributes))	soccer_1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE dribbling = (SELECT MAX(dribbling) FROM player_attributes))	soccer_1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE crossing > 90 AND preferred_foot = 'right')	soccer_1
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot  =  'left' AND T2.overall_rating  >=  85 AND T2.overall_rating  <=  90	soccer_1
SELECT preferred_foot ,  avg(overall_rating) FROM Player_Attributes GROUP BY preferred_foot	soccer_1
SELECT preferred_foot ,  count(*) FROM Player_Attributes WHERE overall_rating  >  80 GROUP BY preferred_foot	soccer_1
SELECT DISTINCT p.id FROM player p JOIN player_attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height >= 180 AND pa.overall_rating > 85	soccer_1
SELECT player_api_id FROM Player WHERE height  >=  180 AND height  <=  190 INTERSECT SELECT player_api_id FROM Player_Attributes WHERE preferred_foot  =  'left'	soccer_1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes ORDER BY overall_rating DESC LIMIT 3)	soccer_1
SELECT p.player_name, p.birthday FROM player p JOIN player_attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.potential DESC LIMIT 5	soccer_1
SELECT count(*) FROM performance	performance_attendance
SELECT HOST FROM performance ORDER BY Attendance ASC	performance_attendance
SELECT Date ,  LOCATION FROM performance	performance_attendance
SELECT Attendance FROM performance WHERE LOCATION  =  'TD Garden' OR LOCATION  =  'Bell Centre'	performance_attendance
SELECT avg(Attendance) FROM performance	performance_attendance
SELECT p.date FROM performance p WHERE p.attendance = (SELECT MAX(attendance) FROM performance)	performance_attendance
SELECT LOCATION ,  COUNT(*) FROM performance GROUP BY LOCATION	performance_attendance
SELECT location FROM (SELECT location, RANK() OVER (ORDER BY COUNT(*) DESC) as rank FROM performance GROUP BY location) WHERE rank = 1	performance_attendance
SELECT LOCATION FROM performance GROUP BY LOCATION HAVING COUNT(*)  >=  2	performance_attendance
SELECT LOCATION FROM performance WHERE Attendance  >  2000 INTERSECT SELECT LOCATION FROM performance WHERE Attendance  <  1000	performance_attendance
SELECT T2.Name ,  T3.Location FROM member_attendance AS T1 JOIN member AS T2 ON T1.Member_ID  =  T2.Member_ID JOIN performance AS T3 ON T1.Performance_ID  =  T3.Performance_ID	performance_attendance
SELECT T2.Name ,  T3.Location FROM member_attendance AS T1 JOIN member AS T2 ON T1.Member_ID  =  T2.Member_ID JOIN performance AS T3 ON T1.Performance_ID  =  T3.Performance_ID ORDER BY T2.Name ASC	performance_attendance
SELECT date FROM performance p WHERE EXISTS (SELECT 1 FROM member_attendance ma JOIN member m ON ma.member_id = m.member_id WHERE ma.performance_id = p.performance_id AND m.role = 'Violin')	performance_attendance
SELECT T2.Name ,  T3.Date FROM member_attendance AS T1 JOIN member AS T2 ON T1.Member_ID  =  T2.Member_ID JOIN performance AS T3 ON T1.Performance_ID  =  T3.Performance_ID ORDER BY T3.Attendance DESC	performance_attendance
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM member_attendance)	performance_attendance
SELECT DISTINCT building FROM classroom WHERE capacity  >  50	college_2
SELECT DISTINCT building FROM classroom WHERE capacity  >  50	college_2
SELECT count(*) FROM classroom WHERE building != 'Lamberton'	college_2
SELECT count(*) FROM classroom WHERE building != 'Lamberton'	college_2
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100	college_2
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1	college_2
SELECT s.name FROM student s WHERE s.dept_name = 'History' AND s.tot_cred = (SELECT MAX(tot_cred) FROM student WHERE dept_name = 'History')	college_2
SELECT name FROM student WHERE dept_name = 'History' AND tot_cred = (SELECT MAX(tot_cred) FROM student WHERE dept_name = 'History')	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'	college_2
SELECT count(DISTINCT s_id) FROM advisor	college_2
SELECT count(DISTINCT s_id) FROM advisor	college_2
SELECT count(DISTINCT dept_name) FROM course	college_2
SELECT count(DISTINCT dept_name) FROM course	college_2
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'	college_2
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'	college_2
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2	college_2
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2	college_2
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1	college_2
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1	college_2
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT COUNT (DISTINCT id) FROM teaches	college_2
SELECT COUNT (DISTINCT id) FROM teaches	college_2
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'	college_2
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'	college_2
SELECT DISTINCT dept_name FROM instructor WHERE name LIKE '%Soisalon%'	college_2
SELECT dept_name FROM department WHERE dept_name IN (SELECT dept_name FROM instructor WHERE name LIKE '%Soisalon%');	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50	college_2
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50	college_2
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)	college_2
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1	college_2
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'	college_2
SELECT course.title FROM course WHERE course.dept_name = 'Statistics' AND course.title NOT IN (SELECT course.title FROM course WHERE course.dept_name = 'Psychology')	college_2
SELECT C.title FROM course AS C WHERE C.dept_name = 'Statistics' AND NOT EXISTS (SELECT 1 FROM course AS P WHERE P.dept_name = 'Psychology' AND P.title = C.title)	college_2
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010	college_2
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1	college_2
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1	college_2
SELECT title FROM course ORDER BY title ,  credits	college_2
SELECT title FROM course ORDER BY title ,  credits	college_2
SELECT dept_name FROM department ORDER BY budget LIMIT 1	college_2
SELECT dept_name FROM department ORDER BY budget LIMIT 1	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC	college_2
SELECT dept_name ,  building FROM department ORDER BY budget DESC	college_2
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1	college_2
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1	college_2
SELECT * FROM instructor ORDER BY salary	college_2
SELECT * FROM instructor ORDER BY salary	college_2
SELECT name ,  dept_name FROM student ORDER BY tot_cred	college_2
SELECT name ,  dept_name FROM student ORDER BY tot_cred	college_2
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title	college_2
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title	college_2
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1	college_2
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1	college_2
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building	college_2
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building	college_2
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building	college_2
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building	college_2
SELECT title FROM course GROUP BY title HAVING count(*)  >  1	college_2
SELECT title FROM course GROUP BY title HAVING count(*)  >  1	college_2
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name	college_2
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name	college_2
SELECT min(salary) ,  dept_name FROM instructor GROUP BY dept_name HAVING avg(salary)  >  (SELECT avg(salary) FROM instructor)	college_2
SELECT MIN(t.salary) FROM (SELECT dept_name, MIN(salary) AS salary FROM instructor GROUP BY dept_name HAVING AVG(salary) > (SELECT AVG(salary) FROM instructor)) t	college_2
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR	college_2
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR	college_2
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1	college_2
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1	college_2
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1	college_2
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name	college_2
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name	college_2
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1	college_2
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1	college_2
SELECT i.id FROM instructor i WHERE i.id IN (SELECT a.i_id FROM advisor a JOIN student s ON a.s_id = s.id WHERE s.dept_name = 'History' GROUP BY a.i_id HAVING COUNT(*) = (SELECT COUNT(*) FROM student WHERE dept_name = 'History'))	college_2
SELECT i_id FROM advisor AS T1 JOIN student AS T2 ON T1.s_id  =  T2.id WHERE T2.dept_name  =  'History'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'	college_2
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'	college_2
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq	college_2
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'International Finance')	college_2
SELECT C1.title FROM course C1, course C2, prereq P WHERE C2.title = 'International Finance' AND C2.course_id = P.course_id AND C1.course_id = P.prereq_id	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')	college_2
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)	college_2
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)	college_2
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010	college_2
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010	college_2
SELECT name FROM instructor WHERE id IN (SELECT id FROM teaches WHERE course_id IN (SELECT course_id FROM course WHERE title = 'C Programming'))	college_2
SELECT DISTINCT i.name FROM instructor i JOIN teaches t ON i.id = t.id JOIN course c ON t.course_id = c.course_id WHERE c.title = 'C Programming'	college_2
SELECT name, salary FROM instructor WHERE id IN (SELECT i_id FROM advisor WHERE s_id IN (SELECT id FROM student WHERE dept_name = 'Math'))	college_2
SELECT name, salary FROM instructor WHERE id IN (SELECT i_id FROM advisor WHERE s_id IN (SELECT id FROM student WHERE dept_name = 'Math'))	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')	college_2
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1	college_2
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)	college_2
SELECT id FROM instructor EXCEPT SELECT id FROM teaches	college_2
SELECT id FROM instructor EXCEPT SELECT id FROM teaches	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')	college_2
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')	college_2
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1	college_2
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1	college_2
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1	college_2
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1	college_2
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)	college_2
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)	college_2
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')	college_2
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')	college_2
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name	college_2
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name	college_2
SELECT DISTINCT s.name FROM student s WHERE EXISTS (SELECT 1 FROM takes t JOIN prereq p ON t.course_id = p.prereq_id JOIN course c ON p.course_id = c.course_id WHERE s.id = t.id AND c.title = 'International Finance')	college_2
SELECT name FROM student AS s WHERE EXISTS (SELECT * FROM course AS c JOIN prereq AS p ON c.course_id = p.course_id JOIN takes AS t ON p.prereq_id = t.course_id WHERE c.title = 'International Finance' AND t.id = s.id)	college_2
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')	college_2
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')	college_2
SELECT DISTINCT s.name FROM student s, takes t, course c WHERE s.id = t.id AND t.course_id = c.course_id AND c.dept_name = 'Statistics'	college_2
SELECT DISTINCT s.name FROM student s JOIN takes t ON s.id = t.id JOIN course c ON t.course_id = c.course_id WHERE c.dept_name = 'Statistics'	college_2
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title	college_2
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000	college_2
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID	college_2
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID	college_2
SELECT DISTINCT i.name, t.course_id FROM instructor AS i INNER JOIN teaches AS t ON i.id = t.id WHERE i.dept_name = 'Art'	college_2
SELECT DISTINCT instructor.name, teaches.course_id FROM instructor JOIN teaches ON instructor.id = teaches.id WHERE instructor.dept_name = 'Art'	college_2
SELECT name FROM instructor WHERE name LIKE '%dar%'	college_2
SELECT name FROM instructor WHERE name LIKE '%dar%'	college_2
SELECT DISTINCT name FROM  instructor ORDER BY name	college_2
SELECT DISTINCT name FROM  instructor ORDER BY name	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)	college_2
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)	college_2
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010	college_2
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000	college_2
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT Name FROM instructor i WHERE NOT EXISTS(SELECT * FROM instructor i2 WHERE i2.dept_name = 'Biology' AND i2.salary >= i.salary)	college_2
SELECT name FROM instructor WHERE salary  >  (SELECT max(salary) FROM instructor WHERE dept_name  =  'Biology')	college_2
SELECT count(*) FROM debate	debate
SELECT Venue FROM debate ORDER BY Num_of_Audience ASC	debate
SELECT Date ,  Venue FROM debate	debate
SELECT Date FROM debate WHERE Num_of_Audience  >  150	debate
SELECT Name FROM  people WHERE Age  =  35 OR Age  =  36	debate
SELECT party FROM people WHERE age = (SELECT MIN(age) FROM people)	debate
SELECT Party ,  COUNT(*) FROM people GROUP BY Party	debate
SELECT people.party FROM people GROUP BY people.party HAVING COUNT(people_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(people_id) as cnt FROM people GROUP BY party))	debate
SELECT DISTINCT Venue FROM debate	debate
SELECT T3.Name ,  T2.Date ,  T2.Venue FROM debate_people AS T1 JOIN debate AS T2 ON T1.Debate_ID  =  T2.Debate_ID JOIN people AS T3 ON T1.Affirmative  =  T3.People_ID	debate
SELECT T3.Name ,  T2.Date ,  T2.Venue FROM debate_people AS T1 JOIN debate AS T2 ON T1.Debate_ID  =  T2.Debate_ID JOIN people AS T3 ON T1.Negative  =  T3.People_ID ORDER BY T3.Name ASC	debate
SELECT T3.Name FROM debate_people AS T1 JOIN debate AS T2 ON T1.Debate_ID  =  T2.Debate_ID JOIN people AS T3 ON T1.Affirmative  =  T3.People_ID WHERE T2.Num_of_Audience  >  200	debate
SELECT T2.Name ,  COUNT(*) FROM debate_people AS T1 JOIN people AS T2 ON T1.Affirmative  =  T2.People_ID GROUP BY T2.Name	debate
SELECT DISTINCT p.name FROM people p, debate_people dp WHERE p.people_id = dp.negative GROUP BY dp.negative HAVING COUNT(dp.negative) >= 2	debate
SELECT Name FROM people WHERE People_id NOT IN (SELECT Affirmative FROM debate_people)	debate
SELECT customer_details FROM customers ORDER BY customer_details	insurance_and_eClaims
SELECT customer_details FROM customers ORDER BY customer_details	insurance_and_eClaims
SELECT policy_type_code FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.customer_details  =  'Dayana Robel'	insurance_and_eClaims
SELECT policy_type_code FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.customer_details  =  'Dayana Robel'	insurance_and_eClaims
SELECT policy_type_code FROM policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1	insurance_and_eClaims
SELECT policy_type_code FROM policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1	insurance_and_eClaims
SELECT p.policy_type_code FROM policies p INNER JOIN customers c ON p.customer_id = c.customer_id GROUP BY p.policy_type_code HAVING COUNT(DISTINCT p.customer_id) > 2	insurance_and_eClaims
SELECT policy_type_code FROM policies GROUP BY policy_type_code HAVING COUNT(DISTINCT customer_id) > 2	insurance_and_eClaims
SELECT sum(amount_piad) ,  avg(amount_piad) FROM claim_headers	insurance_and_eClaims
SELECT sum(amount_piad) ,  avg(amount_piad) FROM claim_headers	insurance_and_eClaims
SELECT SUM(amount_claimed) FROM claim_headers WHERE claim_header_id IN (SELECT claim_id FROM claims_documents WHERE created_date = (SELECT MAX(created_date) FROM claims_documents))	insurance_and_eClaims
SELECT SUM(amount_claimed) AS TotalClaimed FROM claim_headers WHERE claim_header_id IN (SELECT claim_id FROM claims_documents WHERE created_date = (SELECT MAX(created_date) FROM claims_documents))	insurance_and_eClaims
SELECT customers.customer_details FROM customers JOIN policies ON customers.customer_id = policies.customer_id JOIN claim_headers ON policies.policy_id = claim_headers.policy_id ORDER BY claim_headers.amount_claimed DESC LIMIT 1	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id = (SELECT customer_id FROM policies WHERE policy_id = (SELECT policy_id FROM claim_headers WHERE claim_header_id = (SELECT claim_header_id FROM claim_headers ORDER BY amount_claimed DESC LIMIT 1)))	insurance_and_eClaims
SELECT c.customer_details FROM customers c INNER JOIN policies p ON c.customer_id = p.customer_id INNER JOIN claim_headers ch ON p.policy_id = ch.policy_id ORDER BY ch.amount_claimed ASC LIMIT 1	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM policies WHERE policy_id IN (SELECT policy_id FROM claim_headers WHERE amount_claimed = (SELECT MIN(amount_claimed) FROM claim_headers)))	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM policies)	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM policies)	insurance_and_eClaims
SELECT count(*) FROM claims_processing_stages	insurance_and_eClaims
SELECT count(*) FROM claims_processing_stages	insurance_and_eClaims
SELECT claim_status_name FROM claims_processing_stages WHERE claim_stage_id = (SELECT claim_stage_id FROM claims_processing GROUP BY claim_stage_id ORDER BY COUNT(*) DESC LIMIT 1)	insurance_and_eClaims
SELECT t2.claim_status_name FROM claims_processing AS t1 JOIN claims_processing_stages AS t2 ON t1.claim_stage_id  =  t2.claim_stage_id GROUP BY t1.claim_stage_id ORDER BY count(*) DESC LIMIT 1	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_details LIKE '%Diana%'	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_details LIKE '%Diana%'	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM policies WHERE policy_type_code = 'Deputy')	insurance_and_eClaims
SELECT customer_details FROM customers c WHERE EXISTS (SELECT 1 FROM policies p WHERE p.customer_id = c.customer_id AND p.policy_type_code = 'Deputy')	insurance_and_eClaims
SELECT DISTINCT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.policy_type_code  =  'Deputy' OR t1.policy_type_code  =  'Uniform'	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM policies WHERE policy_type_code = 'Deputy' OR policy_type_code = 'Uniform')	insurance_and_eClaims
SELECT customer_details FROM customers UNION ALL SELECT staff_details FROM staff WHERE staff_details NOT IN (SELECT customer_details FROM customers)	insurance_and_eClaims
SELECT details FROM (SELECT customer_details AS details FROM customers UNION ALL SELECT staff_details FROM staff)	insurance_and_eClaims
SELECT policy_type_code ,  count(*) FROM policies GROUP BY policy_type_code	insurance_and_eClaims
SELECT policy_type_code ,  count(*) FROM policies GROUP BY policy_type_code	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM policies GROUP BY customer_id HAVING COUNT(policy_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(policy_id) AS cnt FROM policies GROUP BY customer_id)))	insurance_and_eClaims
SELECT C.customer_details FROM customers C WHERE EXISTS (SELECT NULL FROM policies P WHERE P.customer_id = C.customer_id GROUP BY P.customer_id HAVING COUNT(*) = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM policies GROUP BY customer_id) AS counts))	insurance_and_eClaims
SELECT claim_status_description FROM claims_processing_stages WHERE claim_status_name  =  'Open'	insurance_and_eClaims
SELECT claim_status_description FROM claims_processing_stages WHERE claim_status_name  =  'Open'	insurance_and_eClaims
SELECT count(DISTINCT claim_outcome_code) FROM claims_processing	insurance_and_eClaims
SELECT count(DISTINCT claim_outcome_code) FROM claims_processing	insurance_and_eClaims
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM policies WHERE start_date = (SELECT MAX(start_date) FROM policies))	insurance_and_eClaims
SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.start_date  =  (SELECT max(start_date) FROM policies)	insurance_and_eClaims
SELECT count(*) FROM Accounts	customers_and_invoices
SELECT count(*) FROM Accounts	customers_and_invoices
SELECT count(DISTINCT customer_id) FROM Accounts	customers_and_invoices
SELECT count(DISTINCT customer_id) FROM Accounts	customers_and_invoices
SELECT account_id ,  date_account_opened ,  account_name ,  other_account_details FROM Accounts	customers_and_invoices
SELECT account_id ,  date_account_opened ,  account_name ,  other_account_details FROM Accounts	customers_and_invoices
SELECT accounts.account_id, accounts.account_name, accounts.other_account_details FROM accounts JOIN customers ON accounts.customer_id = customers.customer_id WHERE customers.customer_first_name = 'Meaghan'	customers_and_invoices
SELECT T1.account_id ,  T1.date_account_opened ,  T1.account_name ,  T1.other_account_details FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Meaghan'	customers_and_invoices
SELECT T1.account_name ,  T1.other_account_details FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Meaghan' AND T2.customer_last_name  =  'Keeling'	customers_and_invoices
SELECT T1.account_name ,  T1.other_account_details FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_first_name  =  'Meaghan' AND T2.customer_last_name  =  'Keeling'	customers_and_invoices
SELECT T2.customer_first_name ,  T2.customer_last_name FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.account_name  =  '900'	customers_and_invoices
SELECT C.customer_first_name || ' ' || IFNULL(C.customer_middle_initial || ' ', '') || C.customer_last_name AS Full_Name FROM customers C INNER JOIN accounts A ON C.customer_id = A.customer_id WHERE A.account_name = '900'	customers_and_invoices
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_and_invoices
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Accounts)	customers_and_invoices
SELECT customer_first_name, customer_last_name, phone_number FROM (SELECT DISTINCT customer_first_name, customer_last_name, phone_number, customer_id FROM customers) AS c JOIN accounts a ON c.customer_id = a.customer_id	customers_and_invoices
SELECT DISTINCT T1.customer_first_name ,  T1.customer_last_name ,  T1.phone_number FROM Customers AS T1 JOIN Accounts AS T2 ON T1.customer_id  =  T2.customer_id	customers_and_invoices
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Accounts	customers_and_invoices
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Accounts	customers_and_invoices
SELECT customers.customer_id, COUNT(accounts.account_id) AS accounts_count FROM customers LEFT JOIN accounts ON customers.customer_id = accounts.customer_id GROUP BY customers.customer_id	customers_and_invoices
SELECT count(*) ,  customer_id FROM Accounts GROUP BY customer_id	customers_and_invoices
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT c.customer_id, c.customer_first_name, c.customer_last_name, COUNT(a.account_id) AS num_accounts FROM customers c LEFT JOIN accounts a ON c.customer_id = a.customer_id GROUP BY c.customer_id, c.customer_first_name, c.customer_last_name	customers_and_invoices
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name ,  count(*) FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id	customers_and_invoices
SELECT T2.customer_first_name ,  T1.customer_id FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_and_invoices
SELECT T2.customer_first_name ,  T1.customer_id FROM Accounts AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_and_invoices
SELECT count(*) FROM Customers	customers_and_invoices
SELECT count(*) FROM Customers	customers_and_invoices
SELECT gender ,  count(*) FROM Customers GROUP BY gender	customers_and_invoices
SELECT gender ,  count(*) FROM Customers GROUP BY gender	customers_and_invoices
SELECT count(*) FROM Financial_transactions	customers_and_invoices
SELECT count(*) FROM Financial_transactions	customers_and_invoices
SELECT a.account_id, COUNT(ft.transaction_id) AS total_transactions FROM accounts a JOIN financial_transactions ft ON a.account_id = ft.account_id GROUP BY a.account_id	customers_and_invoices
SELECT count(*) ,  account_id FROM Financial_transactions	customers_and_invoices
SELECT count(*) FROM Financial_transactions AS T1 JOIN Accounts AS T2 ON T1.account_id  =  T2.account_id WHERE T2.account_name  =  '337'	customers_and_invoices
SELECT count(*) FROM Financial_transactions AS T1 JOIN Accounts AS T2 ON T1.account_id  =  T2.account_id WHERE T2.account_name  =  '337'	customers_and_invoices
SELECT avg(transaction_amount) ,  min(transaction_amount) ,  max(transaction_amount) ,   sum(transaction_amount) FROM Financial_transactions	customers_and_invoices
SELECT avg(transaction_amount) ,  min(transaction_amount) ,  max(transaction_amount) ,   sum(transaction_amount) FROM Financial_transactions	customers_and_invoices
SELECT transaction_id FROM Financial_transactions WHERE transaction_amount  >  (SELECT avg(transaction_amount) FROM Financial_transactions)	customers_and_invoices
SELECT transaction_id FROM Financial_transactions WHERE transaction_amount  >  (SELECT avg(transaction_amount) FROM Financial_transactions)	customers_and_invoices
SELECT transaction_type ,  sum(transaction_amount) FROM Financial_transactions GROUP BY transaction_type	customers_and_invoices
SELECT transaction_type ,  sum(transaction_amount) FROM Financial_transactions GROUP BY transaction_type	customers_and_invoices
SELECT account_name, account_id, (SELECT COUNT(*) FROM financial_transactions WHERE financial_transactions.account_id = accounts.account_id) AS number_of_transactions FROM accounts	customers_and_invoices
SELECT a.account_id, a.account_name, COUNT(ft.transaction_id) AS transaction_count FROM accounts a LEFT JOIN financial_transactions ft ON a.account_id = ft.account_id GROUP BY a.account_id, a.account_name	customers_and_invoices
SELECT a.account_id FROM financial_transactions AS a JOIN (SELECT account_id, COUNT(transaction_id) AS cnt FROM financial_transactions GROUP BY account_id) AS t ON a.account_id = t.account_id ORDER BY t.cnt DESC LIMIT 1	customers_and_invoices
SELECT account_id FROM Financial_transactions GROUP BY account_id ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT T1.account_id ,  T2.account_name FROM Financial_transactions AS T1 JOIN Accounts AS T2 ON T1.account_id  =  T2.account_id GROUP BY T1.account_id HAVING count(*)  >=  4	customers_and_invoices
SELECT T1.account_id ,  T2.account_name FROM Financial_transactions AS T1 JOIN Accounts AS T2 ON T1.account_id  =  T2.account_id GROUP BY T1.account_id HAVING count(*)  >=  4	customers_and_invoices
SELECT product_size FROM products WHERE product_size IS NOT NULL	customers_and_invoices
SELECT DISTINCT product_size FROM Products	customers_and_invoices
SELECT DISTINCT product_color FROM Products	customers_and_invoices
SELECT DISTINCT product_color FROM Products	customers_and_invoices
SELECT A.invoice_number, COUNT(B.transaction_id) AS number_of_transactions FROM invoices A LEFT JOIN financial_transactions B ON A.invoice_number = B.invoice_number GROUP BY A.invoice_number	customers_and_invoices
SELECT invoice_number ,  count(*) FROM Financial_transactions GROUP BY invoice_number	customers_and_invoices
SELECT T2.invoice_number ,  T2.invoice_date FROM Financial_transactions AS T1 JOIN Invoices AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT T2.invoice_number ,  T2.invoice_date FROM Financial_transactions AS T1 JOIN Invoices AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT count(*) FROM Invoices	customers_and_invoices
SELECT count(*) FROM Invoices	customers_and_invoices
SELECT T1.invoice_date ,  T1.order_id ,  T2.order_details FROM Invoices AS T1 JOIN Orders AS T2 ON T1.order_id  =  T2.order_id	customers_and_invoices
SELECT T1.invoice_date ,  T1.order_id ,  T2.order_details FROM Invoices AS T1 JOIN Orders AS T2 ON T1.order_id  =  T2.order_id	customers_and_invoices
SELECT o.order_id, COUNT(i.invoice_number) AS invoice_count FROM orders o LEFT JOIN invoices i ON o.order_id = i.order_id GROUP BY o.order_id	customers_and_invoices
SELECT DISTINCT order_id, (SELECT COUNT(invoice_number) FROM invoices where order_id = orders.order_id) AS invoice_count FROM orders	customers_and_invoices
SELECT T2.order_id ,  T2.order_details FROM Invoices AS T1 JOIN Orders AS T2 ON T1.order_id  =  T2.order_id GROUP BY T2.order_id HAVING count(*)  >  2	customers_and_invoices
SELECT DISTINCT o.order_id, o.order_details FROM orders o WHERE o.order_id IN (SELECT i.order_id FROM invoices i GROUP BY i.order_id HAVING COUNT(i.invoice_number) >= 2)	customers_and_invoices
SELECT T2.customer_last_name ,  T1.customer_id ,  T2.phone_number FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT T2.customer_last_name ,  T1.customer_id ,  T2.phone_number FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	customers_and_invoices
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)	customers_and_invoices
SELECT p.product_name FROM products p WHERE p.product_id NOT IN (SELECT oi.product_id FROM order_items oi)	customers_and_invoices
SELECT T2.product_name ,  sum(T1.product_quantity) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T2.product_name	customers_and_invoices
SELECT T2.product_name ,  sum(T1.product_quantity) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T2.product_name	customers_and_invoices
SELECT order_id ,  count(*) FROM Order_items GROUP BY order_id	customers_and_invoices
SELECT DISTINCT a.order_id, COUNT(b.order_item_id) AS Number_of_Items FROM orders a LEFT JOIN order_items b ON a.order_id = b.order_id GROUP BY a.order_id	customers_and_invoices
SELECT product_id ,  count(DISTINCT order_id) FROM Order_items GROUP BY product_id	customers_and_invoices
SELECT product_id ,  count(DISTINCT order_id) FROM Order_items GROUP BY product_id	customers_and_invoices
SELECT T2.product_name ,  count(*) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T3.order_id  =  T1.order_id GROUP BY T2.product_name	customers_and_invoices
SELECT P.product_name, COUNT(DISTINCT O.customer_id) AS customer_count FROM order_items OI INNER JOIN orders O ON OI.order_id = O.order_id INNER JOIN products P ON OI.product_id = P.product_id GROUP BY P.product_id	customers_and_invoices
SELECT orders.order_id, SUM(order_items.product_quantity) FROM orders JOIN order_items ON orders.order_id = order_items.order_id GROUP BY orders.order_id	customers_and_invoices
SELECT order_id ,  count(DISTINCT product_id) FROM Order_items GROUP BY order_id	customers_and_invoices
SELECT order_id ,  sum(product_quantity) FROM Order_items GROUP BY order_id	customers_and_invoices
SELECT o.order_id, COALESCE(SUM(oi.product_quantity), 0) FROM orders o LEFT JOIN order_items oi ON o.order_id = oi.order_id GROUP BY o.order_id	customers_and_invoices
SELECT count(*) FROM products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	customers_and_invoices
SELECT count(*) FROM products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	customers_and_invoices
SELECT count(*) FROM Church WHERE Open_Date  <  1850	wedding
SELECT name ,  open_date ,  organized_by FROM Church	wedding
SELECT name FROM church ORDER BY open_date DESC	wedding
SELECT open_date FROM church GROUP BY open_date HAVING count(*)  >=  2	wedding
SELECT organized_by ,  name FROM church WHERE open_date BETWEEN 1830 AND 1840	wedding
SELECT open_date ,  count(*) FROM church GROUP BY open_date	wedding
SELECT name ,  open_date FROM church ORDER BY open_date DESC LIMIT 3	wedding
SELECT count(*) FROM people WHERE is_male  =  'F' AND age  >  30	wedding
SELECT country FROM people WHERE age  <  25 INTERSECT SELECT country FROM people WHERE age  >  30	wedding
SELECT min(age) ,  max(age) ,  avg(age) FROM people	wedding
SELECT name ,  country FROM people WHERE age  <  (SELECT avg(age) FROM people)	wedding
SELECT T2.name ,  T3.name FROM wedding AS T1 JOIN people AS T2 ON T1.male_id  =  T2.people_id JOIN people AS T3 ON T1.female_id  =  T3.people_id WHERE T1.year  >  2014	wedding
SELECT p.name, p.age FROM people p WHERE p.is_male = 1 AND p.people_id NOT IN (SELECT w.male_id FROM wedding w)	wedding
SELECT name FROM church WHERE church_id NOT IN (SELECT church_id FROM wedding WHERE year = 2015)	wedding
SELECT T1.name FROM church AS T1 JOIN wedding AS T2 ON T1.church_id  =  T2.church_id GROUP BY T1.church_id HAVING count(*)  >=  2	wedding
SELECT T2.name FROM wedding AS T1 JOIN people AS T2 ON T1.female_id  =  T2.people_id WHERE T1.year  =  2016 AND T2.is_male  =  'F' AND T2.country  =  'Canada'	wedding
SELECT count(*) FROM wedding WHERE YEAR  =  2016	wedding
SELECT ch.name FROM church ch WHERE EXISTS (SELECT 1 FROM wedding w JOIN people p ON p.people_id = w.female_id OR p.people_id = w.male_id WHERE w.church_id = ch.church_id AND p.age > 30)	wedding
SELECT country ,  count(*) FROM people GROUP BY country	wedding
SELECT COUNT (DISTINCT church_id) FROM wedding WHERE YEAR  =  2016	wedding
SELECT count(*) FROM artist	theme_gallery
SELECT count(*) FROM artist	theme_gallery
SELECT name ,  age ,  country FROM artist ORDER BY Year_Join	theme_gallery
SELECT name ,  age ,  country FROM artist ORDER BY Year_Join	theme_gallery
SELECT DISTINCT country FROM artist	theme_gallery
SELECT DISTINCT country FROM artist	theme_gallery
SELECT name ,  year_join FROM artist WHERE country != 'United States'	theme_gallery
SELECT name ,  year_join FROM artist WHERE country != 'United States'	theme_gallery
SELECT count(*) FROM artist WHERE age  >  46 AND year_join  >  1990	theme_gallery
SELECT count(*) FROM artist WHERE age  >  46 AND year_join  >  1990	theme_gallery
SELECT avg(age) ,  min(age) FROM artist WHERE country  =  'United States'	theme_gallery
SELECT avg(age) ,  min(age) FROM artist WHERE country  =  'United States'	theme_gallery
SELECT name FROM artist WHERE year_join = (SELECT MAX(year_join) FROM artist)	theme_gallery
SELECT name FROM artist WHERE year_join = (SELECT MAX(year_join) FROM artist)	theme_gallery
SELECT count(*) FROM exhibition WHERE YEAR  >=  2005	theme_gallery
SELECT count(*) FROM exhibition WHERE YEAR  >=  2005	theme_gallery
SELECT theme ,  YEAR FROM exhibition WHERE ticket_price  <  15	theme_gallery
SELECT theme ,  YEAR FROM exhibition WHERE ticket_price  <  15	theme_gallery
SELECT name, (SELECT COUNT(*) FROM exhibition WHERE exhibition.artist_id = artist.artist_id) as exhibition_count FROM artist	theme_gallery
SELECT T2.name ,  count(*) FROM exhibition AS T1 JOIN artist AS T2 ON T1.artist_id  =  T2.artist_id GROUP BY T1.artist_id	theme_gallery
SELECT A.name, A.country FROM artist A, exhibition E WHERE A.artist_id = E.artist_id GROUP BY E.artist_id HAVING COUNT(E.exhibition_id) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM exhibition GROUP BY artist_id) OneTimeMax)	theme_gallery
SELECT artist.name, artist.country FROM artist JOIN (SELECT artist_id FROM exhibition GROUP BY artist_id HAVING COUNT(exhibition_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM exhibition GROUP BY artist_id) tbl)) filtered ON artist.artist_id = filtered.artist_id	theme_gallery
SELECT name FROM artist WHERE artist_id NOT IN (SELECT artist_id FROM exhibition)	theme_gallery
SELECT name FROM artist WHERE artist_id NOT IN (SELECT artist_id FROM exhibition)	theme_gallery
SELECT T1.theme ,  T2.name FROM exhibition AS T1 JOIN artist AS T2 ON T1.artist_id  =  T2.artist_id WHERE T1.ticket_price  >  (SELECT avg(ticket_price) FROM exhibition)	theme_gallery
SELECT T1.theme ,  T2.name FROM exhibition AS T1 JOIN artist AS T2 ON T1.artist_id  =  T2.artist_id WHERE T1.ticket_price  >  (SELECT avg(ticket_price) FROM exhibition)	theme_gallery
SELECT avg(ticket_price) ,  min(ticket_price) ,  max(ticket_price) FROM exhibition WHERE YEAR  <  2009	theme_gallery
SELECT avg(ticket_price) ,  min(ticket_price) ,  max(ticket_price) FROM exhibition WHERE YEAR  <  2009	theme_gallery
SELECT theme ,  YEAR FROM exhibition ORDER BY ticket_price DESC	theme_gallery
SELECT theme ,  YEAR FROM exhibition ORDER BY ticket_price DESC	theme_gallery
SELECT T2.theme ,  T1.date ,  T1.attendance FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id WHERE T2.year  =  2004	theme_gallery
SELECT T2.theme ,  T1.date ,  T1.attendance FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id WHERE T2.year  =  2004	theme_gallery
SELECT name FROM artist WHERE artist_id NOT IN (SELECT artist_id FROM exhibition WHERE year = 2004)	theme_gallery
SELECT name FROM artist WHERE artist_id NOT IN (SELECT artist_id FROM exhibition WHERE year = 2004)	theme_gallery
SELECT DISTINCT theme FROM exhibition e WHERE e.exhibition_id IN (SELECT exhibition_id FROM exhibition_record WHERE attendance < 100 INTERSECT SELECT exhibition_id FROM exhibition_record WHERE attendance > 500)	theme_gallery
SELECT T2.theme FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id WHERE T1.attendance  <  100 INTERSECT SELECT T2.theme FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id WHERE T1.attendance  >  500	theme_gallery
SELECT COUNT(DISTINCT exhibition_id) FROM (SELECT exhibition_id FROM exhibition WHERE ticket_price < 10 UNION SELECT exhibition_id FROM exhibition_record WHERE attendance > 100)	theme_gallery
SELECT COUNT(DISTINCT e.exhibition_id) FROM exhibition e WHERE e.ticket_price < 10 OR EXISTS (SELECT 1 FROM exhibition_record er WHERE er.exhibition_id = e.exhibition_id AND er.attendance > 100)	theme_gallery
SELECT T3.name FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id JOIN artist AS T3 ON T3.artist_id  =  T2.artist_id GROUP BY T3.artist_id HAVING avg(T1.attendance)  >  200	theme_gallery
SELECT T3.name FROM exhibition_record AS T1 JOIN exhibition AS T2 ON T1.exhibition_id  =  T2.exhibition_id JOIN artist AS T3 ON T3.artist_id  =  T2.artist_id GROUP BY T3.artist_id HAVING avg(T1.attendance)  >  200	theme_gallery
SELECT i_id FROM item WHERE title  =  'orange'	epinions_1
SELECT * FROM item	epinions_1
SELECT count(*) FROM review	epinions_1
SELECT count(*) FROM useracct	epinions_1
SELECT avg(rating) ,  max(rating) FROM review	epinions_1
SELECT MAX(rank) FROM review	epinions_1
SELECT count(DISTINCT u_id) FROM review	epinions_1
SELECT count(DISTINCT i_id) FROM review	epinions_1
SELECT count(*) FROM item WHERE i_id NOT IN (SELECT i_id FROM review)	epinions_1
SELECT name FROM useracct WHERE u_id NOT IN (SELECT u_id FROM review)	epinions_1
SELECT T1.title FROM item AS T1 JOIN review AS T2 ON T1.i_id  =  T2.i_id WHERE T2.rating  =  10	epinions_1
SELECT title FROM item WHERE EXISTS (SELECT 1 FROM review WHERE item.i_id = review.i_id AND review.rating > (SELECT AVG(rating) FROM review))	epinions_1
SELECT T1.title FROM item AS T1 JOIN review AS T2 ON T1.i_id  =  T2.i_id WHERE T2.rating  <  5	epinions_1
SELECT title FROM item WHERE i_id IN (SELECT i_id FROM review GROUP BY i_id HAVING MAX(rating) > 8 AND MIN(rating) < 5)	epinions_1
SELECT i.title FROM item i JOIN review r ON i.i_id = r.i_id WHERE r.rank > 3 GROUP BY i.i_id HAVING AVG(r.rating) > 5	epinions_1
SELECT I.title FROM item I INNER JOIN review R ON I.i_id = R.i_id GROUP BY I.i_id HAVING AVG(R.rating) = (SELECT MIN(AVG_RATING) FROM (SELECT AVG(rating) AS AVG_RATING FROM review GROUP BY i_id))	epinions_1
SELECT title FROM item ORDER BY title	epinions_1
SELECT name FROM useracct WHERE u_id IN (SELECT u_id FROM review GROUP BY u_id HAVING COUNT(u_id) = (SELECT MAX(cnt) FROM (SELECT u_id, COUNT(u_id) AS cnt FROM review GROUP BY u_id)))	epinions_1
SELECT title AS Item_Name, i_id AS Item_ID FROM item WHERE i_id IN (SELECT i_id FROM review GROUP BY i_id HAVING AVG(rating) = (SELECT MAX(AVG_Rating) FROM (SELECT AVG(rating) AS AVG_Rating FROM review GROUP BY i_id)))	epinions_1
SELECT first.title, first.i_id FROM (SELECT item.title, item.i_id, AVG(review.rank) AS avg_rank FROM item JOIN review ON item.i_id = review.i_id GROUP BY item.i_id) first WHERE first.avg_rank = (SELECT MAX(second.avg_rank) FROM (SELECT AVG(review.rank) AS avg_rank FROM item JOIN review ON item.i_id = review.i_id GROUP BY item.i_id) second)	epinions_1
SELECT T1.name ,  avg(T2.rating) FROM useracct AS T1 JOIN review AS T2 ON T1.u_id  =  T2.u_id GROUP BY T2.u_id	epinions_1
SELECT name, COUNT(review.u_id) AS reviews_total FROM useracct LEFT JOIN review ON useracct.u_id = review.u_id GROUP BY useracct.u_id	epinions_1
SELECT u.name FROM useracct u JOIN review r ON u.u_id = r.u_id WHERE r.rating = (SELECT MAX(rating) FROM review)	epinions_1
SELECT T1.name FROM useracct AS T1 JOIN trust AS T2 ON T1.u_id  =  T2.source_u_id GROUP BY T2.source_u_id ORDER BY avg(trust) DESC LIMIT 1	epinions_1
SELECT T1.name ,  avg(trust) FROM useracct AS T1 JOIN trust AS T2 ON T1.u_id  =  T2.target_u_id GROUP BY T2.target_u_id	epinions_1
SELECT name FROM useracct JOIN trust ON useracct.u_id = trust.target_u_id WHERE trust IN (SELECT MIN(trust) FROM trust)	epinions_1
SELECT title FROM item WHERE i_id NOT IN (SELECT i_id FROM review)	epinions_1
SELECT name FROM useracct WHERE u_id NOT IN (SELECT u_id FROM review)	epinions_1
SELECT count(*) FROM useracct WHERE u_id NOT IN (SELECT u_id FROM review)	epinions_1
SELECT count(*) FROM item WHERE i_id NOT IN (SELECT i_id FROM review)	epinions_1
SELECT count(*) FROM player	riding_club
SELECT Player_name FROM player ORDER BY Votes ASC	riding_club
SELECT Gender ,  Occupation FROM player	riding_club
SELECT Player_name ,  residence FROM player WHERE Occupation != 'Researcher'	riding_club
SELECT Sponsor_name FROM player WHERE Residence  =  'Brandon' OR Residence  =  'Birtle'	riding_club
SELECT p.player_name FROM player p WHERE p.votes = (SELECT MAX(votes) FROM player)	riding_club
SELECT Occupation ,  COUNT(*) FROM player GROUP BY Occupation	riding_club
SELECT occupation FROM player GROUP BY occupation HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM player GROUP BY occupation) as cnt)	riding_club
SELECT Residence FROM player GROUP BY Residence HAVING COUNT(*)  >=  2	riding_club
SELECT T3.Player_name ,  T2.coach_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID	riding_club
SELECT T3.Player_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T2.Rank  =  1	riding_club
SELECT player_name, gender FROM player WHERE player_id IN (SELECT player_id FROM player_coach WHERE starting_year > 2011)	riding_club
SELECT T3.Player_name ,  T2.coach_name FROM player_coach AS T1 JOIN coach AS T2 ON T1.Coach_ID  =  T2.Coach_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID ORDER BY T3.Votes DESC	riding_club
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM player_coach)	riding_club
SELECT Residence FROM player WHERE gender  =  'M' INTERSECT SELECT Residence FROM player WHERE gender  =  'F'	riding_club
SELECT club.club_id, club.club_name, COUNT(DISTINCT coach.coach_id) AS num_coaches FROM club LEFT JOIN coach ON club.club_id = coach.club_id GROUP BY club.club_id, club.club_name	riding_club
SELECT gold FROM match_result WHERE club_id IN (SELECT club_id FROM coach GROUP BY club_id ORDER BY COUNT(coach_id) DESC LIMIT 1)	riding_club
SELECT count(*) FROM gymnast	gymnast
SELECT count(*) FROM gymnast	gymnast
SELECT Total_Points FROM gymnast ORDER BY Total_Points DESC	gymnast
SELECT Total_Points FROM gymnast ORDER BY Total_Points DESC	gymnast
SELECT total_points FROM gymnast ORDER BY floor_exercise_points DESC, gymnast_id	gymnast
SELECT g.total_points FROM gymnast g WHERE g.gymnast_id IN (SELECT people_id FROM people) ORDER BY g.floor_exercise_points DESC	gymnast
SELECT avg(Horizontal_Bar_Points) FROM gymnast	gymnast
SELECT avg(Horizontal_Bar_Points) FROM gymnast	gymnast
SELECT Name FROM People ORDER BY Name ASC	gymnast
SELECT Name FROM People ORDER BY Name ASC	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID WHERE T2.Hometown != 'Santo Domingo'	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID WHERE T2.Hometown != 'Santo Domingo'	gymnast
SELECT age FROM people WHERE height = (SELECT MAX(height) FROM people)	gymnast
SELECT age FROM people WHERE height = (SELECT MAX(height) FROM people)	gymnast
SELECT Name FROM People ORDER BY Age DESC LIMIT 5	gymnast
SELECT Name FROM People ORDER BY Age DESC LIMIT 5	gymnast
SELECT SUM(g.total_points) FROM gymnast g JOIN people p ON g.gymnast_id = p.people_id WHERE p.age = (SELECT MIN(age) FROM people)	gymnast
SELECT g.total_points FROM gymnast g INNER JOIN people p ON g.gymnast_id = p.people_id WHERE p.age = (SELECT MIN(age) FROM people)	gymnast
SELECT avg(T2.Age) FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT avg(T2.Age) FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT DISTINCT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID WHERE T1.Total_Points  >  57.5	gymnast
SELECT DISTINCT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID WHERE T1.Total_Points  >  57.5	gymnast
SELECT T2.Hometown ,  COUNT(*) FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID GROUP BY T2.Hometown	gymnast
SELECT T2.Hometown ,  COUNT(*) FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID GROUP BY T2.Hometown	gymnast
SELECT P.hometown FROM people P INNER JOIN gymnast G ON P.people_id = G.gymnast_id GROUP BY P.hometown HAVING COUNT(P.hometown) = (SELECT MAX(gCount) FROM (SELECT COUNT(P.hometown) as gCount FROM people P INNER JOIN gymnast G ON P.people_id = G.gymnast_id GROUP BY P.hometown))	gymnast
SELECT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID GROUP BY T2.Hometown ORDER BY COUNT(*) DESC LIMIT 1	gymnast
SELECT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID GROUP BY T2.Hometown HAVING COUNT(*)  >=  2	gymnast
SELECT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID GROUP BY T2.Hometown HAVING COUNT(*)  >=  2	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID ORDER BY T2.Height ASC	gymnast
SELECT T2.Name FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID ORDER BY T2.Height ASC	gymnast
SELECT DISTINCT Hometown FROM people EXCEPT SELECT DISTINCT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT DISTINCT Hometown FROM people EXCEPT SELECT DISTINCT T2.Hometown FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID	gymnast
SELECT Hometown FROM people WHERE Age  >  23 INTERSECT SELECT Hometown FROM people WHERE Age  <  20	gymnast
SELECT Hometown FROM people WHERE Age  >  23 INTERSECT SELECT Hometown FROM people WHERE Age  <  20	gymnast
SELECT count(DISTINCT Hometown) FROM people	gymnast
SELECT count(DISTINCT Hometown) FROM people	gymnast
SELECT T2.Age FROM gymnast AS T1 JOIN people AS T2 ON T1.Gymnast_ID  =  T2.People_ID ORDER BY T1.Total_Points DESC	gymnast
SELECT age FROM people WHERE people_id IN (SELECT gymnast_id FROM gymnast ORDER BY total_points DESC)	gymnast
SELECT sum(T2.balance) FROM accounts AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid WHERE T1.name != 'Brown'	small_bank_1
SELECT SUM(s.balance) FROM savings s WHERE s.custid NOT IN (SELECT a.custid FROM accounts a WHERE a.name = 'Brown')	small_bank_1
SELECT count(*) FROM accounts	small_bank_1
SELECT count(*) FROM accounts	small_bank_1
SELECT sum(balance) FROM checking	small_bank_1
SELECT sum(balance) FROM checking	small_bank_1
SELECT avg(balance) FROM checking	small_bank_1
SELECT avg(balance) FROM checking	small_bank_1
SELECT count(*) FROM savings WHERE balance  >  (SELECT avg(balance) FROM savings)	small_bank_1
SELECT count(*) FROM savings WHERE balance  >  (SELECT avg(balance) FROM savings)	small_bank_1
SELECT T1.custid ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T2.balance  <  (SELECT max(balance) FROM checking)	small_bank_1
SELECT T1.custid ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T2.balance  <  (SELECT max(balance) FROM checking)	small_bank_1
SELECT T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T1.name LIKE '%ee%'	small_bank_1
SELECT T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T1.name LIKE '%ee%'	small_bank_1
SELECT checking.balance AS 'Checking', savings.balance AS 'Savings' FROM accounts LEFT JOIN checking ON accounts.custid = checking.custid LEFT JOIN savings ON accounts.custid = savings.custid WHERE accounts.name = 'Brown'	small_bank_1
SELECT T2.balance ,  T3.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T1.name  =  'Brown'	small_bank_1
SELECT ac.name FROM accounts ac JOIN checking ch ON ac.custid = ch.custid JOIN savings sa ON ac.custid = sa.custid WHERE ch.balance > (SELECT AVG(balance) FROM checking) AND sa.balance < (SELECT AVG(balance) FROM savings)	small_bank_1
SELECT A.name FROM accounts A JOIN checking C ON A.custid = C.custid JOIN savings S ON A.custid = S.custid WHERE C.balance > (SELECT AVG(balance) FROM checking) AND S.balance < (SELECT AVG(balance) FROM savings)	small_bank_1
SELECT c.balance FROM checking c WHERE c.custid IN (SELECT s.custid FROM savings s WHERE s.balance > (SELECT AVG(balance) FROM savings))	small_bank_1
SELECT c.balance FROM checking c JOIN accounts a ON c.custid = a.custid WHERE c.custid IN (SELECT s.custid FROM savings s WHERE s.balance > (SELECT AVG(balance) FROM savings))	small_bank_1
SELECT name FROM accounts ORDER BY name	small_bank_1
SELECT name FROM accounts ORDER BY name	small_bank_1
SELECT name FROM accounts INNER JOIN (SELECT custid, SUM(balance) AS total FROM (SELECT custid, balance FROM checking UNION ALL SELECT custid, balance FROM savings) GROUP BY custid ORDER BY total ASC LIMIT 1) totals ON accounts.custid = totals.custid	small_bank_1
SELECT T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T2.balance + T3.balance LIMIT 1	small_bank_1
SELECT T1.name ,  T2.balance + T3.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T3.balance  >  (SELECT avg(balance) FROM savings)	small_bank_1
SELECT T1.name ,  T2.balance + T3.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T3.balance  >  (SELECT avg(balance) FROM savings)	small_bank_1
SELECT T1.name ,  T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T3.balance LIMIT 1	small_bank_1
SELECT T1.name ,  T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T3.balance LIMIT 1	small_bank_1
SELECT count(*) ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid GROUP BY T1.name	small_bank_1
SELECT count(*) ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid GROUP BY T1.name	small_bank_1
SELECT sum(T2.balance) ,  T1.name FROM accounts AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid GROUP BY T1.name	small_bank_1
SELECT sum(T2.balance) ,  T1.name FROM accounts AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid GROUP BY T1.name	small_bank_1
SELECT T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T2.balance  <  (SELECT avg(balance) FROM checking)	small_bank_1
SELECT T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid WHERE T2.balance  <  (SELECT avg(balance) FROM checking)	small_bank_1
SELECT s.balance FROM savings s INNER JOIN checking c ON s.custid = c.custid WHERE c.balance = (SELECT MAX(balance) FROM checking)	small_bank_1
SELECT balance FROM savings WHERE custid IN (SELECT custid FROM checking WHERE balance = (SELECT MAX(balance) FROM checking))	small_bank_1
SELECT T1.balance + T2.balance FROM checking AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid ORDER BY T1.balance + T2.balance	small_bank_1
SELECT T1.balance + T2.balance FROM checking AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid ORDER BY T1.balance + T2.balance	small_bank_1
SELECT T2.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T3.balance LIMIT 1	small_bank_1
SELECT T2.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T3.balance LIMIT 1	small_bank_1
SELECT T2.balance ,  T3.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid	small_bank_1
SELECT T2.balance ,  T3.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid	small_bank_1
SELECT T2.balance ,  T3.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T2.balance + T3.balance DESC	small_bank_1
SELECT T2.balance ,  T3.balance ,  T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid ORDER BY T2.balance + T3.balance DESC	small_bank_1
SELECT T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T2.balance  >  T3.balance	small_bank_1
SELECT T1.name FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T2.balance  >  T3.balance	small_bank_1
SELECT T1.name ,  T3.balance + T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T3.balance  <  T2.balance	small_bank_1
SELECT T1.name ,  T3.balance + T2.balance FROM accounts AS T1 JOIN checking AS T2 ON T1.custid  =  T2.custid JOIN savings AS T3 ON T1.custid  =  T3.custid WHERE T3.balance  <  T2.balance	small_bank_1
SELECT name, balance FROM accounts CROSS JOIN savings USING(custid) ORDER BY balance DESC LIMIT 3	small_bank_1
SELECT T1.name ,  T2.balance FROM accounts AS T1 JOIN savings AS T2 ON T1.custid  =  T2.custid ORDER BY T2.balance DESC LIMIT 3	small_bank_1
SELECT count(*) FROM browser WHERE market_share  >=  5	browser_web
SELECT name FROM browser ORDER BY market_share DESC, name ASC	browser_web
SELECT id ,  name ,  market_share FROM browser	browser_web
SELECT max(market_share) ,  min(market_share) ,  avg(market_share) FROM browser	browser_web
SELECT id ,  market_share FROM browser WHERE name  =  'Safari'	browser_web
SELECT name ,  operating_system FROM web_client_accelerator WHERE CONNECTION != 'Broadband'	browser_web
SELECT name FROM browser WHERE id IN (SELECT ab.browser_id FROM accelerator_compatible_browser ab JOIN web_client_accelerator w ON ab.accelerator_id = w.id WHERE w.name = 'CProxy' AND ab.compatible_since_year > 1998)	browser_web
SELECT T1.id ,  T1.Name FROM web_client_accelerator AS T1 JOIN accelerator_compatible_browser AS T2 ON T2.accelerator_id  =  T1.id GROUP BY T1.id HAVING count(*)  >=  2	browser_web
SELECT b.id, b.name FROM browser b INNER JOIN accelerator_compatible_browser acb ON b.id = acb.browser_id GROUP BY b.id, b.name HAVING COUNT(acb.accelerator_id) = (SELECT MAX(count) FROM (SELECT COUNT(acb.accelerator_id) AS count FROM accelerator_compatible_browser acb GROUP BY acb.browser_id))	browser_web
SELECT T1.compatible_since_year FROM accelerator_compatible_browser AS T1 JOIN browser AS T2 ON T1.browser_id  =  T2.id JOIN web_client_accelerator AS T3 ON T1.accelerator_id  =  T3.id WHERE T3.name  =  'CACHEbox' AND T2.name  =  'Internet Explorer'	browser_web
SELECT count(DISTINCT client) FROM web_client_accelerator	browser_web
SELECT count(*) FROM web_client_accelerator WHERE id NOT IN ( SELECT accelerator_id FROM accelerator_compatible_browser );	browser_web
SELECT DISTINCT T1.name FROM web_client_accelerator AS T1 JOIN accelerator_compatible_browser AS T2 ON T2.accelerator_id  =  T1.id JOIN browser AS T3 ON T2.browser_id  =  T3.id WHERE T3.market_share  >  15;	browser_web
SELECT br.name FROM browser br WHERE EXISTS (SELECT 1 FROM accelerator_compatible_browser acb JOIN web_client_accelerator wa ON acb.accelerator_id = wa.id WHERE wa.name = 'CACHEbox' AND acb.browser_id = br.id) AND EXISTS (SELECT 1 FROM accelerator_compatible_browser acb JOIN web_client_accelerator wa ON acb.accelerator_id = wa.id WHERE wa.name = 'Fasterfox' AND acb.browser_id = br.id)	browser_web
SELECT wca.name, wca.operating_system FROM web_client_accelerator wca WHERE wca.id NOT IN (SELECT acb.accelerator_id FROM accelerator_compatible_browser acb JOIN browser b ON acb.browser_id = b.id WHERE b.name = 'Opera')	browser_web
SELECT name FROM web_client_accelerator WHERE name LIKE '%Opera%'	browser_web
SELECT Operating_system ,  count(*) FROM web_client_accelerator GROUP BY Operating_system	browser_web
SELECT T2.name ,  T3.name FROM accelerator_compatible_browser AS T1 JOIN browser AS T2 ON T1.browser_id  =  T2.id JOIN web_client_accelerator AS T3 ON T1.accelerator_id  =  T3.id ORDER BY T1.compatible_since_year DESC	browser_web
SELECT count(*) FROM wrestler	wrestler
SELECT count(*) FROM wrestler	wrestler
SELECT Name FROM wrestler ORDER BY Days_held DESC	wrestler
SELECT Name FROM wrestler ORDER BY Days_held DESC	wrestler
SELECT w1.name FROM wrestler w1, wrestler w2 WHERE w1.days_held < w2.days_held ORDER BY w1.days_held LIMIT 1	wrestler
SELECT Name FROM wrestler ORDER BY Days_held ASC LIMIT 1	wrestler
SELECT DISTINCT Reign FROM wrestler WHERE LOCATION != 'Tokyo , Japan'	wrestler
SELECT DISTINCT Reign FROM wrestler WHERE LOCATION != 'Tokyo , Japan'	wrestler
SELECT Name ,  LOCATION FROM wrestler	wrestler
SELECT Name ,  LOCATION FROM wrestler	wrestler
SELECT Elimination_Move FROM Elimination WHERE Team  =  'Team Orton'	wrestler
SELECT Elimination_Move FROM Elimination WHERE Team  =  'Team Orton'	wrestler
SELECT T2.Name ,  T1.Elimination_Move FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID	wrestler
SELECT T2.Name ,  T1.Elimination_Move FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID	wrestler
SELECT T2.Name ,  T1.Team FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID ORDER BY T2.Days_held DESC	wrestler
SELECT T2.Name ,  T1.Team FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID ORDER BY T2.Days_held DESC	wrestler
SELECT time FROM elimination INNER JOIN (SELECT wrestler_id, MAX(days_held) AS max_days FROM wrestler GROUP BY wrestler_id) sub ON elimination.wrestler_id = sub.wrestler_id	wrestler
SELECT e.time FROM elimination e JOIN wrestler w ON e.wrestler_id = w.wrestler_id WHERE w.days_held = (SELECT MAX(days_held) FROM wrestler)	wrestler
SELECT T1.Time FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID WHERE T2.Days_held  >  50	wrestler
SELECT T1.Time FROM elimination AS T1 JOIN wrestler AS T2 ON T1.Wrestler_ID  =  T2.Wrestler_ID WHERE T2.Days_held  >  50	wrestler
SELECT Team ,  COUNT(*) FROM elimination GROUP BY Team	wrestler
SELECT Team ,  COUNT(*) FROM elimination GROUP BY Team	wrestler
SELECT Team FROM elimination GROUP BY Team HAVING COUNT(*)  >  3	wrestler
SELECT Team FROM elimination GROUP BY Team HAVING COUNT(*)  >  3	wrestler
SELECT Reign ,  Days_held FROM wrestler	wrestler
SELECT Reign ,  Days_held FROM wrestler	wrestler
SELECT DISTINCT name FROM wrestler WHERE days_held < 100	wrestler
SELECT name FROM wrestler WHERE days_held < 100 AND Reign > 0	wrestler
SELECT Reign FROM wrestler GROUP BY Reign ORDER BY COUNT(*) DESC LIMIT 1	wrestler
SELECT w.reign FROM wrestler w GROUP BY w.reign HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) as c FROM wrestler GROUP BY reign))	wrestler
SELECT LOCATION FROM wrestler GROUP BY LOCATION HAVING COUNT(*)  >  2	wrestler
SELECT LOCATION FROM wrestler GROUP BY LOCATION HAVING COUNT(*)  >  2	wrestler
SELECT Name FROM wrestler WHERE Wrestler_ID NOT IN (SELECT Wrestler_ID FROM elimination)	wrestler
SELECT Name FROM wrestler WHERE Wrestler_ID NOT IN (SELECT Wrestler_ID FROM elimination)	wrestler
SELECT Team FROM Elimination WHERE Eliminated_By  =  'Orton' INTERSECT SELECT Team FROM Elimination WHERE Eliminated_By  =  'Benjamin'	wrestler
SELECT Team FROM Elimination WHERE Eliminated_By  =  'Orton' INTERSECT SELECT Team FROM Elimination WHERE Eliminated_By  =  'Benjamin'	wrestler
SELECT COUNT (DISTINCT team) FROM elimination	wrestler
SELECT COUNT (DISTINCT team) FROM elimination	wrestler
SELECT TIME FROM elimination WHERE Eliminated_By  =  'Punk' OR Eliminated_By  =  'Orton'	wrestler
SELECT TIME FROM elimination WHERE Eliminated_By  =  'Punk' OR Eliminated_By  =  'Orton'	wrestler
SELECT count(*) FROM school	school_finance
SELECT count(*) FROM school	school_finance
SELECT school_name FROM school ORDER BY school_name	school_finance
SELECT school_name ,  LOCATION ,  mascot FROM school	school_finance
SELECT sum(enrollment) ,  avg(enrollment) FROM school	school_finance
SELECT mascot FROM school WHERE enrollment  >  (SELECT avg(enrollment) FROM school)	school_finance
SELECT school_name FROM school WHERE enrollment = (SELECT MIN(enrollment) FROM school)	school_finance
SELECT avg(enrollment) ,  max(enrollment) ,  min(enrollment) FROM school	school_finance
SELECT county ,  count(*) ,  sum(enrollment) FROM school GROUP BY county	school_finance
SELECT count(DISTINCT T1.donator_name) FROM endowment AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id WHERE T2.school_name  =  'Glenn'	school_finance
SELECT donator_name, amount FROM endowment ORDER BY amount DESC	school_finance
SELECT school_name FROM school WHERE school_id NOT IN (SELECT school_id FROM endowment)	school_finance
SELECT school_name FROM school WHERE school_id IN (SELECT school_id FROM endowment WHERE amount <= 10)	school_finance
SELECT T1.donator_name FROM endowment AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id WHERE T2.school_name  =  'Glenn' INTERSECT SELECT T1.donator_name FROM endowment AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id WHERE T2.school_name  =  'Triton'	school_finance
SELECT donator_name FROM endowment WHERE amount >= 9	school_finance
SELECT e.amount, e.donator_name FROM endowment e WHERE e.amount = (SELECT MAX(amount) FROM endowment)	school_finance
SELECT count(*) FROM budget WHERE budgeted  >  3000 AND YEAR  <=  2001	school_finance
SELECT count(*) FROM budget WHERE budgeted  >  3000 AND YEAR  <=  2001	school_finance
SELECT T2.school_name ,  T1.budgeted ,  T1.invested FROM budget AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id WHERE T1.year  >=  2002	school_finance
SELECT donator_name FROM endowment	school_finance
SELECT count(*) FROM budget WHERE budgeted  <  invested	school_finance
SELECT sum(T1.budgeted) FROM budget AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id WHERE T2.school_name  =  'Glenn'	school_finance
SELECT T2.school_name FROM budget AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id JOIN endowment AS T3 ON T2.school_id  =  T3.school_id GROUP BY T2.school_name HAVING sum(T1.budgeted)  >  100 OR sum(T3.amount)  >  10	school_finance
SELECT school_name FROM school WHERE school_id IN (SELECT school_id FROM endowment WHERE amount > 8.5 GROUP BY school_id HAVING COUNT(DISTINCT donator_name) > 1)	school_finance
SELECT COUNT(DISTINCT school_id) FROM (SELECT school_id FROM endowment WHERE amount < 8.5 GROUP BY school_id, donator_name HAVING COUNT(donator_name) > 1)	school_finance
SELECT T1.School_name ,  T1.Mascot ,  T1.IHSAA_Football_Class FROM school AS T1 JOIN budget AS T2 ON T1.school_id  =  T2.school_id WHERE Budgeted  >  6000 OR YEAR  <  2003 ORDER BY T2.total_budget_percent_invested ,  T2.total_budget_percent_budgeted	school_finance
SELECT count(*) FROM building	protein_institute
SELECT name ,  street_address ,  floors FROM building ORDER BY floors	protein_institute
SELECT b.name FROM building b WHERE b.height_feet = (SELECT MAX(height_feet) FROM building)	protein_institute
SELECT avg(floors) ,  max(floors) ,  min(floors) FROM building	protein_institute
SELECT COUNT(*) FROM building WHERE height_feet > (SELECT AVG(height_feet) FROM building) GROUP BY building_id HAVING COUNT(building_id) > 0 UNION ALL SELECT COUNT(*) FROM building WHERE floors > (SELECT AVG(floors) FROM building) GROUP BY building_id HAVING COUNT(building_id) > 0	protein_institute
SELECT name FROM building WHERE height_feet  >=  200 AND floors  >=  20	protein_institute
SELECT institution ,  LOCATION FROM institution WHERE founded  >  1990 AND TYPE  =  'Private'	protein_institute
SELECT TYPE ,  count(*) ,  sum(enrollment) FROM institution GROUP BY TYPE	protein_institute
SELECT type FROM institution GROUP BY type HAVING COUNT(type) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM institution GROUP BY type))	protein_institute
SELECT TYPE FROM institution WHERE founded  >  1990 AND enrollment  >=  1000	protein_institute
SELECT name FROM building WHERE building_id NOT IN (SELECT building_id FROM institution)	protein_institute
SELECT B.name FROM building B WHERE B.building_id NOT IN (SELECT building_id FROM institution WHERE founded = 2003)	protein_institute
SELECT name, (SELECT COUNT(institution_id) FROM institution WHERE building_id = building.building_id) FROM building	protein_institute
SELECT T1.name ,  T1.height_feet FROM building AS T1 JOIN institution AS T2 ON T1.building_id  =  T2.building_id WHERE T2.founded  >  1880 GROUP BY T1.building_id HAVING count(*)  >=  2	protein_institute
SELECT DISTINCT TYPE FROM institution	protein_institute
SELECT T1.institution ,  count(*) FROM institution AS T1 JOIN protein AS T2 ON T1.institution_id  =  T2.institution_id GROUP BY T1.institution_id	protein_institute
SELECT count(*) FROM institution AS T1 JOIN protein AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1880 OR T1.type  =  'Private'	protein_institute
SELECT T2.protein_name ,  T1.institution FROM institution AS T1 JOIN protein AS T2 ON T1.institution_id  =  T2.institution_id	protein_institute
SELECT count(*) FROM institution AS T1 JOIN protein AS T2 ON T1.institution_id  =  T2.institution_id JOIN building AS T3 ON T3.building_id  =  T1.building_id WHERE T3.floors  >=  20	protein_institute
SELECT count(*) FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM protein)	protein_institute
SELECT LOCATION FROM cinema EXCEPT SELECT LOCATION FROM cinema WHERE capacity  >  800	cinema
SELECT LOCATION FROM cinema WHERE openning_year  =  2010 INTERSECT SELECT LOCATION FROM cinema WHERE openning_year  =  2011	cinema
SELECT count(*) FROM cinema	cinema
SELECT count(*) FROM cinema	cinema
SELECT name ,  openning_year ,  capacity FROM cinema	cinema
SELECT name ,  LOCATION FROM cinema WHERE capacity  >  (SELECT avg(capacity) FROM cinema)	cinema
SELECT DISTINCT LOCATION FROM cinema	cinema
SELECT DISTINCT LOCATION FROM cinema	cinema
SELECT name ,  openning_year FROM cinema ORDER BY openning_year DESC	cinema
SELECT c.name, c.location FROM cinema c WHERE c.capacity = (SELECT MAX(capacity) FROM cinema)	cinema
SELECT avg(capacity) ,  min(capacity) ,  max(capacity) FROM cinema WHERE openning_year  >=  2011	cinema
SELECT LOCATION ,  count(*) FROM cinema GROUP BY LOCATION	cinema
SELECT location FROM cinema WHERE openning_year >= 2010 GROUP BY location HAVING COUNT(cinema_id) = (SELECT MAX(C1.cinema_count) FROM (SELECT COUNT(cinema_id) AS cinema_count FROM cinema WHERE openning_year >= 2010 GROUP BY location) C1)	cinema
SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >=  2	cinema
SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >=  2	cinema
SELECT title ,  directed_by FROM film	cinema
SELECT title ,  directed_by FROM film	cinema
SELECT directed_by FROM film WHERE directed_by IS NOT NULL	cinema
SELECT directed_by FROM film WHERE directed_by IS NOT NULL	cinema
SELECT directed_by ,  count(*) FROM film GROUP BY directed_by	cinema
SELECT T2.name ,  sum(T1.show_times_per_day) FROM schedule AS T1 JOIN cinema AS T2 ON T1.cinema_id  =  T2.cinema_id GROUP BY T1.cinema_id	cinema
SELECT T2.title ,  max(T1.price) FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id GROUP BY T1.film_id	cinema
SELECT f.title, (SELECT MAX(price) FROM schedule WHERE film_id = f.film_id) AS highest_price FROM film f	cinema
SELECT T3.name ,  T2.title ,  T1.date ,  T1.price FROM schedule AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id JOIN cinema AS T3 ON T1.cinema_id  =  T3.cinema_id	cinema
SELECT title ,  directed_by FROM film WHERE film_id NOT IN (SELECT film_id FROM schedule)	cinema
SELECT directed_by FROM film JOIN (SELECT film_id FROM schedule GROUP BY film_id HAVING SUM(show_times_per_day) = MAX((SELECT SUM(show_times_per_day) FROM schedule GROUP BY film_id))) AS MaxShows ON film.film_id = MaxShows.film_id	cinema
SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >  1	cinema
SELECT LOCATION FROM cinema WHERE capacity  >  300 GROUP BY LOCATION HAVING count(*)  >  1	cinema
SELECT count(*) FROM film WHERE title LIKE '%Dummy%'	cinema
SELECT count(*) FROM film WHERE title LIKE '%Dummy%'	cinema
SELECT T1.good_or_bad_customer FROM customers AS T1 JOIN discount_coupons AS T2 ON T1.coupon_id  =  T2.coupon_id WHERE T2.coupon_amount  =  500	products_for_hire
SELECT customer_id, first_name, (SELECT COUNT(*) FROM bookings WHERE customers.customer_id = bookings.customer_id) AS booking_count FROM customers	products_for_hire
SELECT customer_id ,  sum(amount_paid) FROM Payments GROUP BY customer_id ORDER BY sum(amount_paid) DESC LIMIT 1	products_for_hire
SELECT b.booking_id, b.amount_of_refund FROM bookings b WHERE b.booking_id IN (SELECT booking_id FROM payments GROUP BY booking_id HAVING COUNT(payment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(payment_id) AS cnt FROM payments GROUP BY booking_id)))	products_for_hire
SELECT product_id FROM products_booked GROUP BY product_id HAVING count(*)  =  3	products_for_hire
SELECT pfh.product_description FROM products_for_hire pfh WHERE EXISTS (SELECT 1 FROM products_booked pb WHERE pb.product_id = pfh.product_id AND pb.booked_amount = 102.76)	products_for_hire
SELECT T3.booking_start_date ,   T3.booking_end_date FROM Products_for_hire AS T1 JOIN products_booked AS T2 ON T1.product_id  =  T2.product_id JOIN bookings AS T3 ON T2.booking_id  =  T3.booking_id WHERE T1.product_name  =  'Book collection A'	products_for_hire
SELECT product_name FROM products_for_hire WHERE product_id IN (SELECT product_id FROM view_product_availability WHERE available_yn = 1)	products_for_hire
SELECT count(DISTINCT product_type_code) FROM products_for_hire	products_for_hire
SELECT first_name ,  last_name ,  gender_mf FROM customers WHERE good_or_bad_customer  =  'good' ORDER BY last_name	products_for_hire
SELECT avg(amount_due) FROM payments	products_for_hire
SELECT max(booked_count) ,  min(booked_count) ,  avg(booked_count) FROM products_booked	products_for_hire
SELECT DISTINCT payment_type_code FROM payments	products_for_hire
SELECT daily_hire_cost FROM Products_for_hire WHERE product_name LIKE '%Book%'	products_for_hire
SELECT COUNT(DISTINCT p.product_id) FROM products_for_hire p WHERE NOT EXISTS (SELECT 1 FROM products_booked pb JOIN bookings b ON pb.booking_id = b.booking_id JOIN payments pm ON pm.booking_id = b.booking_id WHERE pb.product_id = p.product_id AND pm.amount_paid > 200)	products_for_hire
SELECT DISTINCT dc.coupon_amount FROM discount_coupons dc JOIN customers c1 ON dc.coupon_id = c1.coupon_id WHERE EXISTS (SELECT 1 FROM customers c2 WHERE c2.coupon_id = c1.coupon_id AND c2.good_or_bad_customer = 'good') AND EXISTS (SELECT 1 FROM customers c3 WHERE c3.coupon_id = c1.coupon_id AND c3.good_or_bad_customer = 'bad')	products_for_hire
SELECT payment_date FROM payments WHERE amount_paid  >  300 OR payment_type_code  =  'Check'	products_for_hire
SELECT product_name ,  product_description FROM products_for_hire WHERE product_type_code  =  'Cutlery' AND daily_hire_cost  <  20	products_for_hire
SELECT count(*) FROM phone	phone_market
SELECT Name FROM phone ORDER BY Price ASC	phone_market
SELECT Memory_in_G ,  Carrier FROM phone	phone_market
SELECT DISTINCT Carrier FROM phone WHERE Memory_in_G  >  32	phone_market
SELECT Name FROM phone WHERE Carrier  =  'Sprint' OR Carrier  =  'TMobile'	phone_market
SELECT carrier FROM phone WHERE price = (SELECT MAX(price) FROM phone);	phone_market
SELECT Carrier ,  COUNT(*) FROM phone GROUP BY Carrier	phone_market
SELECT p.carr FROM (SELECT carrier as carr, COUNT(*) as ccount FROM phone GROUP BY carrier) p WHERE p.ccount = (SELECT MAX(ccount) FROM (SELECT COUNT(*) as ccount FROM phone GROUP BY carrier))	phone_market
SELECT Carrier FROM phone WHERE Memory_in_G  <  32 INTERSECT SELECT Carrier FROM phone WHERE Memory_in_G  >  64	phone_market
SELECT T3.Name ,  T2.District FROM phone_market AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID JOIN phone AS T3 ON T1.Phone_ID  =  T3.Phone_ID	phone_market
SELECT T3.Name ,  T2.District FROM phone_market AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID JOIN phone AS T3 ON T1.Phone_ID  =  T3.Phone_ID ORDER BY T2.Ranking	phone_market
SELECT DISTINCT p.name FROM phone p JOIN phone_market pm ON p.phone_id = pm.phone_id JOIN market m ON pm.market_id = m.market_id WHERE m.num_of_shops > 50	phone_market
SELECT T2.Name ,  sum(T1.Num_of_stock) FROM phone_market AS T1 JOIN phone AS T2 ON T1.Phone_ID  =  T2.Phone_ID GROUP BY T2.Name	phone_market
SELECT name FROM phone WHERE phone_id IN (SELECT phone_id FROM phone_market GROUP BY phone_id HAVING SUM(num_of_stock) > 2000) ORDER BY (SELECT SUM(num_of_stock) FROM phone_market WHERE phone_market.phone_id = phone.phone_id) DESC	phone_market
SELECT Name FROM phone WHERE Phone_id NOT IN (SELECT Phone_ID FROM phone_market)	phone_market
SELECT COUNT(DISTINCT company_id) FROM company WHERE main_industry = 'Gas';	gas_company
SELECT count(*) FROM company	gas_company
SELECT company ,  rank FROM company ORDER BY Sales_billion DESC	gas_company
SELECT company ,  rank FROM company ORDER BY Sales_billion DESC	gas_company
SELECT company ,  main_industry FROM company WHERE headquarters != 'USA'	gas_company
SELECT company ,  main_industry FROM company WHERE headquarters != 'USA'	gas_company
SELECT company ,  headquarters FROM company ORDER BY market_value DESC	gas_company
SELECT company ,  headquarters FROM company ORDER BY market_value DESC	gas_company
SELECT min(market_value) ,  max(market_value) ,  avg(market_value) FROM company	gas_company
SELECT min(market_value) ,  max(market_value) ,  avg(market_value) FROM company	gas_company
SELECT main_industry FROM company WHERE main_industry IS NOT NULL	gas_company
SELECT DISTINCT main_industry FROM company	gas_company
SELECT headquarters ,  count(*) FROM company GROUP BY headquarters	gas_company
SELECT headquarters ,  count(*) FROM company GROUP BY headquarters	gas_company
SELECT main_industry ,  sum(market_value) FROM company GROUP BY main_industry	gas_company
SELECT main_industry ,  sum(market_value) FROM company GROUP BY main_industry	gas_company
WITH RankedIndustries AS (SELECT main_industry, SUM(market_value) AS total_value, COUNT(company_id) AS num_companies FROM company GROUP BY main_industry) SELECT main_industry, num_companies FROM RankedIndustries WHERE total_value = (SELECT MAX(total_value) FROM RankedIndustries)	gas_company
SELECT main_industry ,  count(*) FROM company GROUP BY main_industry ORDER BY sum(market_value) DESC LIMIT 1	gas_company
SELECT headquarters FROM company WHERE main_industry  =  'Banking' GROUP BY headquarters HAVING count(*)  >=  2	gas_company
SELECT headquarters FROM company WHERE main_industry  =  'Banking' GROUP BY headquarters HAVING count(*)  >=  2	gas_company
SELECT station_id ,  LOCATION ,  manager_name FROM gas_station ORDER BY open_year	gas_company
SELECT station_id ,  LOCATION ,  manager_name FROM gas_station ORDER BY open_year	gas_company
SELECT count(*) FROM gas_station WHERE open_year BETWEEN 2000 AND 2005	gas_company
SELECT count(*) FROM gas_station WHERE open_year BETWEEN 2000 AND 2005	gas_company
SELECT sub.location, sub.station_count FROM (SELECT location, COUNT(station_id) AS station_count FROM gas_station GROUP BY location) sub ORDER BY sub.station_count DESC	gas_company
SELECT LOCATION ,  count(*) FROM gas_station GROUP BY LOCATION ORDER BY count(*)	gas_company
SELECT headquarters FROM company WHERE main_industry  =  'Banking' INTERSECT SELECT headquarters FROM company WHERE main_industry  =  'Oil and gas'	gas_company
SELECT headquarters FROM company WHERE main_industry  =  'Banking' INTERSECT SELECT headquarters FROM company WHERE main_industry  =  'Oil and gas'	gas_company
SELECT headquarters FROM company EXCEPT SELECT headquarters FROM company WHERE main_industry  =  'Banking'	gas_company
SELECT headquarters FROM company EXCEPT SELECT headquarters FROM company WHERE main_industry  =  'Banking'	gas_company
SELECT T2.company ,  count(*) FROM station_company AS T1 JOIN company AS T2 ON T1.company_id  =  T2.company_id GROUP BY T1.company_id	gas_company
SELECT cmp.company_id, cmp.company, COUNT(DISTINCT sc.station_id) AS station_count FROM company AS cmp LEFT JOIN station_company AS sc ON cmp.company_id = sc.company_id GROUP BY cmp.company_id	gas_company
SELECT company ,  main_industry FROM company WHERE company_id NOT IN (SELECT company_id FROM station_company)	gas_company
SELECT company ,  main_industry FROM company WHERE company_id NOT IN (SELECT company_id FROM station_company)	gas_company
SELECT gs.manager_name FROM gas_station gs WHERE EXISTS (SELECT 1 FROM station_company sc JOIN company c ON sc.company_id = c.company_id WHERE c.company = 'ExxonMobil' AND sc.station_id = gs.station_id)	gas_company
SELECT g.manager_name FROM gas_station g WHERE g.station_id IN (SELECT sc.station_id FROM station_company sc JOIN company c ON c.company_id = sc.company_id AND c.company = 'ExxonMobil')	gas_company
SELECT location FROM gas_station WHERE EXISTS (SELECT 1 FROM station_company INNER JOIN company ON station_company.company_id = company.company_id WHERE station_company.station_id = gas_station.station_id AND company.market_value > 100)	gas_company
SELECT DISTINCT gs.location FROM gas_station gs JOIN station_company sc ON gs.station_id = sc.station_id JOIN company c ON sc.company_id = c.company_id WHERE c.market_value > 100	gas_company
SELECT manager_name FROM gas_station WHERE open_year > 2000 GROUP BY manager_name HAVING COUNT(station_id) = (SELECT MAX(count) FROM (SELECT COUNT(station_id) AS count FROM gas_station WHERE open_year > 2000 GROUP BY manager_name))	gas_company
SELECT manager_name FROM gas_station WHERE open_year > 2000 GROUP BY manager_name HAVING COUNT(station_id) = (SELECT MAX(count) FROM (SELECT COUNT(station_id) as count FROM gas_station WHERE open_year > 2000 GROUP BY manager_name) t)	gas_company
SELECT LOCATION FROM gas_station ORDER BY open_year	gas_company
SELECT location FROM gas_station ORDER BY open_year, location	gas_company
SELECT c.rank, c.company, c.market_value FROM company c WHERE c.main_industry = 'Banking' ORDER BY c.sales_billion DESC, c.market_value ASC	gas_company
SELECT rank, company, market_value FROM company WHERE main_industry = 'Banking' ORDER BY sales_billion DESC, market_value	gas_company
WITH RankedCompanies AS (SELECT company_id FROM company ORDER BY assets_billion DESC LIMIT 3) SELECT gs.location, gs.representative_name FROM gas_station gs JOIN station_company sc ON gs.station_id = sc.station_id WHERE sc.company_id IN (SELECT company_id FROM RankedCompanies)	gas_company
SELECT location, representative_name FROM gas_station INNER JOIN station_company ON gas_station.station_id = station_company.station_id INNER JOIN company ON station_company.company_id = company.company_id WHERE company.assets_billion IN (SELECT assets_billion FROM company ORDER BY assets_billion DESC LIMIT 3)	gas_company
SELECT count(*) FROM region	party_people
SELECT count(*) FROM region	party_people
SELECT DISTINCT region_name FROM region ORDER BY Label	party_people
SELECT DISTINCT region_name FROM region ORDER BY Label	party_people
SELECT COUNT(*) FROM party	party_people
SELECT count(DISTINCT party_name) FROM party	party_people
SELECT minister ,  took_office ,  left_office FROM party ORDER BY left_office	party_people
SELECT minister ,  took_office ,  left_office FROM party ORDER BY left_office	party_people
SELECT DISTINCT minister FROM party WHERE took_office NOT BETWEEN '1959' AND '1961'	party_people
SELECT minister FROM party WHERE DATE(took_office) NOT BETWEEN '1959-01-01' AND '1961-12-31'	party_people
SELECT minister FROM party WHERE party_name != 'Progress Party'	party_people
SELECT minister FROM party WHERE party_name != 'Progress Party'	party_people
SELECT minister ,  party_name FROM party ORDER BY took_office DESC	party_people
SELECT minister ,  party_name FROM party ORDER BY took_office DESC	party_people
SELECT minister FROM party ORDER BY left_office DESC LIMIT 1	party_people
SELECT minister FROM party ORDER BY left_office DESC LIMIT 1	party_people
SELECT T1.member_name ,  T2.party_name FROM Member AS T1 JOIN party AS T2 ON T1.party_id  =  T2.party_id	party_people
SELECT T1.member_name ,  T2.party_name FROM Member AS T1 JOIN party AS T2 ON T1.party_id  =  T2.party_id	party_people
SELECT p.party_name, (SELECT COUNT(member_id) FROM member WHERE party_id = p.party_id) as members_count FROM party p	party_people
SELECT T2.party_name ,  count(*) FROM Member AS T1 JOIN party AS T2 ON T1.party_id  =  T2.party_id GROUP BY T1.party_id	party_people
SELECT party_name FROM party WHERE party_id IN (SELECT party_id FROM member GROUP BY party_id HAVING COUNT(member_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(member_id) Cnt FROM member GROUP BY party_id)))	party_people
SELECT p.party_name FROM member m, party p WHERE m.party_id = p.party_id GROUP BY p.party_name HAVING COUNT(m.member_id) = (SELECT MAX(c.total) FROM (SELECT COUNT(member_id) AS total FROM member GROUP BY party_id) c)	party_people
SELECT T1.party_name ,  T2.region_name FROM party AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id	party_people
SELECT T1.party_name ,  T2.region_name FROM party AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id	party_people
SELECT party_name FROM party WHERE party_id NOT IN (SELECT party_id FROM Member)	party_people
SELECT party_name FROM party WHERE party_id NOT IN (SELECT party_id FROM Member)	party_people
SELECT member_name FROM member WHERE party_id  =  3 INTERSECT SELECT member_name FROM member WHERE party_id  =  1	party_people
SELECT member_name FROM member WHERE party_id  =  3 INTERSECT SELECT member_name FROM member WHERE party_id  =  1	party_people
SELECT member_name FROM member WHERE party_id NOT IN (SELECT party_id FROM party WHERE party_name = 'Progress Party')	party_people
SELECT T1.member_name FROM Member AS T1 JOIN party AS T2 ON T1.party_id  =  T2.party_id WHERE T2.Party_name != 'Progress Party'	party_people
SELECT count(*) FROM party_events	party_people
SELECT count(*) FROM party_events	party_people
SELECT party.party_name, (SELECT COUNT(*) FROM party_events WHERE party_events.party_id = party.party_id) AS event_count FROM party	party_people
SELECT T2.party_name ,  count(*) FROM party_events AS T1 JOIN party AS T2 ON T1.party_id  =  T2.party_id GROUP BY T1.party_id	party_people
SELECT member_name FROM member WHERE member_id NOT IN (SELECT member_in_charge_id FROM party_events)	party_people
SELECT member_name FROM member WHERE member_id NOT IN (SELECT member_in_charge_id FROM party_events)	party_people
SELECT DISTINCT p.party_name FROM party p WHERE (SELECT COUNT(*) FROM party_events pe WHERE pe.party_id = p.party_id) >= 2	party_people
SELECT DISTINCT p.party_name FROM party p JOIN party_events pe ON p.party_id = pe.party_id GROUP BY p.party_id HAVING COUNT(pe.event_id) >= 2	party_people
SELECT member_name FROM member WHERE member_id IN (SELECT member_in_charge_id FROM party_events GROUP BY member_in_charge_id HAVING COUNT(event_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(event_id) AS Cnt FROM party_events GROUP BY member_in_charge_id)))	party_people
SELECT T1.member_name FROM member AS T1 JOIN party_events AS T2 ON T1.member_id  =  T2.member_in_charge_id GROUP BY T2.member_in_charge_id ORDER BY count(*) DESC LIMIT 1	party_people
SELECT event_name FROM party_events GROUP BY event_name HAVING count(*)  >  2	party_people
SELECT event_name FROM party_events GROUP BY event_name HAVING count(*)  >  2	party_people
SELECT count(*) FROM region AS t1 JOIN party AS t2 ON t1.region_id  =  t2.region_id JOIN party_events AS t3 ON t2.party_id  =  t3.party_id WHERE t1.region_name  =  'United Kingdom' AND t3.Event_Name  =  'Annaual Meeting'	party_people
SELECT count(*) FROM region AS t1 JOIN party AS t2 ON t1.region_id  =  t2.region_id JOIN party_events AS t3 ON t2.party_id  =  t3.party_id WHERE t1.region_name  =  'United Kingdom' AND t3.Event_Name  =  'Annaual Meeting'	party_people
SELECT count(*) FROM pilot	pilot_record
SELECT Pilot_name FROM pilot ORDER BY Rank ASC	pilot_record
SELECT POSITION ,  Team FROM pilot	pilot_record
SELECT DISTINCT POSITION FROM pilot WHERE Age  >  30	pilot_record
SELECT Pilot_name FROM pilot WHERE Team  =  'Bradley' OR Team  =  'Fordham'	pilot_record
SELECT Join_Year FROM pilot ORDER BY Rank ASC LIMIT 1	pilot_record
SELECT Nationality ,  COUNT(*) FROM pilot GROUP BY Nationality	pilot_record
SELECT p.nationality FROM pilot p GROUP BY p.nationality HAVING COUNT(p.nationality) = (SELECT MAX(count) FROM (SELECT COUNT(p.nationality) AS count FROM pilot p GROUP BY p.nationality) temp)	pilot_record
SELECT POSITION FROM pilot WHERE Join_Year  <  2000 INTERSECT SELECT POSITION FROM pilot WHERE Join_Year  >  2005	pilot_record
SELECT T3.Pilot_name ,  T2.Model FROM pilot_record AS T1 JOIN aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN pilot AS T3 ON T1.Pilot_ID  =  T3.Pilot_ID	pilot_record
SELECT a.pilot_name AS Pilot, b.fleet_series AS Series FROM pilot a, aircraft b WHERE EXISTS (SELECT 1 FROM pilot_record WHERE pilot_id = a.pilot_id AND aircraft_id = b.aircraft_id) ORDER BY a.rank	pilot_record
SELECT DISTINCT aircraft.fleet_series FROM aircraft JOIN pilot_record ON aircraft.aircraft_id = pilot_record.aircraft_id JOIN pilot ON pilot_record.pilot_id = pilot.pilot_id WHERE pilot.age < 34	pilot_record
SELECT p.pilot_name, COUNT(pr.record_id) AS total_records FROM pilot AS p LEFT JOIN pilot_record AS pr ON p.pilot_id = pr.pilot_id GROUP BY p.pilot_name	pilot_record
SELECT p.pilot_name FROM pilot p JOIN pilot_record pr ON p.pilot_id = pr.pilot_id GROUP BY p.pilot_id HAVING COUNT(pr.record_id) > 1	pilot_record
SELECT Pilot_name FROM pilot WHERE Pilot_ID NOT IN (SELECT Pilot_ID FROM pilot_record)	pilot_record
SELECT document_status_code FROM Ref_Document_Status;	cre_Doc_Control_Systems
SELECT document_status_description FROM Ref_Document_Status WHERE document_status_code = 'working';	cre_Doc_Control_Systems
SELECT document_type_code FROM Ref_Document_Types;	cre_Doc_Control_Systems
SELECT document_type_description FROM Ref_Document_Types WHERE document_type_code = 'Paper';	cre_Doc_Control_Systems
SELECT shipping_agent_name FROM Ref_Shipping_Agents;	cre_Doc_Control_Systems
SELECT shipping_agent_code FROM Ref_Shipping_Agents WHERE shipping_agent_name = 'UPS';	cre_Doc_Control_Systems
SELECT role_code FROM ROLES;	cre_Doc_Control_Systems
SELECT role_description FROM ROLES WHERE role_code = 'ED';	cre_Doc_Control_Systems
SELECT count(*) FROM Employees;	cre_Doc_Control_Systems
SELECT T1.role_description FROM ROLES AS T1 JOIN Employees AS T2 ON T1.role_code = T2.role_code WHERE T2.employee_name = 'Koby';	cre_Doc_Control_Systems
SELECT document_id ,  receipt_date FROM Documents;	cre_Doc_Control_Systems
SELECT roles.role_description, roles.role_code, COUNT(employees.employee_id) AS num_employees FROM roles LEFT JOIN employees ON roles.role_code = employees.role_code GROUP BY roles.role_code, roles.role_description	cre_Doc_Control_Systems
SELECT Roles.role_description , count(Employees.employee_id) FROM ROLES JOIN Employees ON Employees.role_code = Roles.role_code GROUP BY Employees.role_code HAVING count(Employees.employee_id)  >  1;	cre_Doc_Control_Systems
SELECT Ref_Document_Status.document_status_description FROM Ref_Document_Status JOIN Documents ON Documents.document_status_code = Ref_Document_Status.document_status_code WHERE Documents.document_id = 1;	cre_Doc_Control_Systems
SELECT count(*) FROM Documents WHERE document_status_code = 'done';	cre_Doc_Control_Systems
SELECT document_type_code FROM Documents WHERE document_id = 2;	cre_Doc_Control_Systems
SELECT document_id FROM Documents WHERE document_status_code = 'done' AND document_type_code = 'Paper';	cre_Doc_Control_Systems
SELECT Ref_Shipping_Agents.shipping_agent_name FROM Ref_Shipping_Agents JOIN Documents ON Documents.shipping_agent_code = Ref_Shipping_Agents.shipping_agent_code WHERE Documents.document_id = 2;	cre_Doc_Control_Systems
SELECT count(*) FROM Ref_Shipping_Agents JOIN Documents ON Documents.shipping_agent_code = Ref_Shipping_Agents.shipping_agent_code WHERE Ref_Shipping_Agents.shipping_agent_name = 'USPS';	cre_Doc_Control_Systems
SELECT Ref_Shipping_Agents.shipping_agent_name , count(Documents.document_id) FROM Ref_Shipping_Agents JOIN Documents ON Documents.shipping_agent_code = Ref_Shipping_Agents.shipping_agent_code GROUP BY Ref_Shipping_Agents.shipping_agent_code ORDER BY count(Documents.document_id) DESC LIMIT 1;	cre_Doc_Control_Systems
SELECT receipt_date FROM Documents WHERE document_id = 3;	cre_Doc_Control_Systems
SELECT Addresses.address_details FROM Addresses JOIN Documents_Mailed ON Documents_Mailed.mailed_to_address_id = Addresses.address_id WHERE document_id = 4;	cre_Doc_Control_Systems
SELECT mailing_date FROM Documents_Mailed WHERE document_id = 7;	cre_Doc_Control_Systems
SELECT document_id FROM Documents WHERE document_status_code  =  'done' AND document_type_code = 'Paper' EXCEPT SELECT document_id FROM Documents JOIN Ref_Shipping_Agents ON Documents.shipping_agent_code = Ref_Shipping_Agents.shipping_agent_code WHERE Ref_Shipping_Agents.shipping_agent_name = 'USPS';	cre_Doc_Control_Systems
SELECT document_id FROM Documents WHERE document_status_code  =  'done' AND document_type_code = 'Paper' INTERSECT SELECT document_id FROM Documents JOIN Ref_Shipping_Agents ON Documents.shipping_agent_code = Ref_Shipping_Agents.shipping_agent_code WHERE Ref_Shipping_Agents.shipping_agent_name = 'USPS';	cre_Doc_Control_Systems
SELECT draft_details FROM Document_Drafts WHERE document_id = 7;	cre_Doc_Control_Systems
SELECT count(*) FROM Draft_Copies WHERE document_id = 2;	cre_Doc_Control_Systems
SELECT document_id , count(copy_number) FROM Draft_Copies GROUP BY document_id ORDER BY count(copy_number) DESC LIMIT 1;	cre_Doc_Control_Systems
SELECT document_id , count(*) FROM Draft_Copies GROUP BY document_id HAVING count(*)  >  1;	cre_Doc_Control_Systems
SELECT Employees.employee_name FROM Employees JOIN Circulation_History ON Circulation_History.employee_id = Employees.employee_id WHERE Circulation_History.document_id = 1;	cre_Doc_Control_Systems
SELECT employee_name FROM employees WHERE employee_id NOT IN (SELECT employee_id FROM circulation_history)	cre_Doc_Control_Systems
SELECT Employees.employee_name , count(*) FROM Employees JOIN Circulation_History ON Circulation_History.employee_id = Employees.employee_id GROUP BY Circulation_History.document_id , Circulation_History.draft_number , Circulation_History.copy_number ORDER BY count(*) DESC LIMIT 1;	cre_Doc_Control_Systems
SELECT d.document_id, COUNT(DISTINCT emp.employee_id) AS num_employees FROM documents d LEFT JOIN circulation_history ch ON d.document_id = ch.document_id LEFT JOIN employees emp ON ch.employee_id = emp.employee_id GROUP BY d.document_id	cre_Doc_Control_Systems
SELECT dname FROM department ORDER BY mgr_start_date	company_1
SELECT Dependent_name FROM dependent WHERE relationship  =  'Spouse'	company_1
SELECT count(*) FROM dependent WHERE sex  =  'F'	company_1
SELECT t1.dname FROM department AS t1 JOIN dept_locations AS t2 ON t1.dnumber  =  t2.dnumber WHERE t2.dlocation  =  'Houston'	company_1
SELECT fname ,  lname FROM employee WHERE salary  >  30000	company_1
SELECT count(*) ,  sex FROM employee WHERE salary  <  50000 GROUP BY sex	company_1
SELECT fname ,  lname ,  address FROM employee ORDER BY Bdate	company_1
SELECT T1.event_details FROM EVENTS AS T1 JOIN Services AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Service_Type_Code  =  'Marriage'	local_govt_in_alabama
SELECT T1.event_id ,  T1.event_details FROM EVENTS AS T1 JOIN Participants_in_Events AS T2 ON T1.Event_ID  =  T2.Event_ID GROUP BY T1.Event_ID HAVING count(*)  >  1	local_govt_in_alabama
SELECT T1.Participant_ID ,  T1.Participant_Type_Code ,  count(*) FROM Participants AS T1 JOIN Participants_in_Events AS T2 ON T1.Participant_ID  =  T2.Participant_ID GROUP BY T1.Participant_ID	local_govt_in_alabama
SELECT Participant_ID ,  Participant_Type_Code ,  Participant_Details FROM  Participants	local_govt_in_alabama
SELECT count(*) FROM participants WHERE participant_type_code  =  'Organizer'	local_govt_in_alabama
SELECT service_type_code FROM services ORDER BY service_type_code	local_govt_in_alabama
SELECT service_id ,  event_details FROM EVENTS	local_govt_in_alabama
SELECT COUNT(DISTINCT e.event_id) FROM events e JOIN participants_in_events pie ON e.event_id = pie.event_id JOIN participants p ON pie.participant_id = p.participant_id WHERE p.participant_details LIKE '%Dr.%'	local_govt_in_alabama
SELECT participant_type_code FROM participants GROUP BY participant_type_code HAVING COUNT(participant_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(participant_id) AS Cnt FROM participants GROUP BY participant_type_code) Temp);	local_govt_in_alabama
SELECT s.service_id, s.service_type_code FROM services s JOIN events e ON s.service_id = e.service_id LEFT JOIN participants_in_events p ON e.event_id = p.event_id GROUP BY s.service_id, s.service_type_code ORDER BY COUNT(p.participant_id) ASC LIMIT 1	local_govt_in_alabama
SELECT pi.event_id FROM participants_in_events pi GROUP BY pi.event_id HAVING COUNT(pi.participant_id) = (SELECT MAX(count) FROM (SELECT COUNT(participant_id) as count FROM participants_in_events GROUP BY event_id))	local_govt_in_alabama
SELECT event_id FROM EVENTS EXCEPT SELECT T1.event_id FROM Participants_in_Events AS T1 JOIN Participants AS T2 ON T1.Participant_ID  =  T2.Participant_ID WHERE Participant_Details  =  'Kenyatta Kuhn'	local_govt_in_alabama
SELECT T1.service_type_code FROM services AS T1 JOIN EVENTS AS T2 ON T1.service_id  =  T2.service_id WHERE T2.event_details  =  'Success' INTERSECT SELECT T1.service_type_code FROM services AS T1 JOIN EVENTS AS T2 ON T1.service_id  =  T2.service_id WHERE T2.event_details  =  'Fail'	local_govt_in_alabama
SELECT count(*) FROM EVENTS WHERE event_id NOT IN (SELECT event_id FROM Participants_in_Events)	local_govt_in_alabama
SELECT DISTINCT participant_id FROM participants_in_events	local_govt_in_alabama
SELECT name FROM races ORDER BY date DESC LIMIT 1	formula_1
SELECT name FROM races ORDER BY date DESC LIMIT 1	formula_1
SELECT name ,  date FROM races ORDER BY date DESC LIMIT 1	formula_1
SELECT name ,  date FROM races ORDER BY date DESC LIMIT 1	formula_1
SELECT name FROM races WHERE YEAR = 2017	formula_1
SELECT name FROM races WHERE YEAR = 2017	formula_1
SELECT DISTINCT name FROM races WHERE YEAR BETWEEN 2014 AND 2017	formula_1
SELECT DISTINCT name FROM races WHERE YEAR BETWEEN 2014 AND 2017	formula_1
SELECT DISTINCT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds < 93000	formula_1
SELECT DISTINCT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds < 93000	formula_1
SELECT DISTINCT T1.driverid ,  T1.nationality FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds >  100000	formula_1
SELECT DISTINCT T1.driverid ,  T1.nationality FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds >  100000	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE EXISTS (SELECT 1 FROM laptimes l WHERE l.driverid = d.driverid ORDER BY l.time LIMIT 1)	formula_1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds DESC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds DESC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE POSITION  =  '1' GROUP BY T1.driverid HAVING count(*)  >=  2	formula_1
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE POSITION  =  '1' GROUP BY T1.driverid HAVING count(*)  >=  2	formula_1
SELECT count(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Australian Grand Prix' AND YEAR = 2009	formula_1
SELECT count(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Australian Grand Prix' AND YEAR = 2009	formula_1
SELECT COUNT(*) FROM drivers WHERE driverid NOT IN (SELECT DISTINCT results.driverid FROM results JOIN races ON results.raceid = races.raceid WHERE races.year = 2009)	formula_1
SELECT COUNT(*) FROM drivers WHERE driverid NOT IN (SELECT r.driverid FROM results r JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2009)	formula_1
SELECT DISTINCT races.name, races.year FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis'	formula_1
SELECT races.name, races.year FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON drivers.driverid = results.driverid WHERE drivers.surname = 'Lewis'	formula_1
SELECT forename ,  surname FROM drivers WHERE nationality = 'German'	formula_1
SELECT forename ,  surname FROM drivers WHERE nationality = 'German'	formula_1
SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = 'Australian Grand Prix' INTERSECT SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = 'Chinese Grand Prix'	formula_1
SELECT d.driverid, d.forename FROM drivers d INNER JOIN (SELECT r.driverid FROM results r JOIN races ra ON r.raceid = ra.raceid WHERE ra.name = 'Australian Grand Prix' UNION SELECT r.driverid FROM results r JOIN races ra ON r.raceid = ra.raceid WHERE ra.name = 'Chinese Grand Prix') AS res ON d.driverid = res.driverid	formula_1
SELECT forename, surname FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE raceid IN (SELECT raceid FROM races WHERE name = 'Australian Grand Prix')) AND driverid NOT IN (SELECT driverid FROM results WHERE raceid IN (SELECT raceid FROM races WHERE name = 'Chinese Grand Prix'))	formula_1
SELECT D.forename, D.surname FROM drivers D WHERE D.driverid IN (SELECT R1.driverid FROM results R1 JOIN races R on R1.raceid = R.raceid WHERE R.name = 'Australian Grand Prix') AND D.driverid NOT IN (SELECT R2.driverid FROM results R2 JOIN races R on R2.raceid = R.raceid WHERE R.name = 'Chinese Grand Prix')	formula_1
SELECT DISTINCT d.forename FROM drivers d INNER JOIN driverstandings ds ON d.driverid = ds.driverid WHERE ds.position = 1 AND ds.wins > 0	formula_1
SELECT DISTINCT drivers.forename FROM drivers JOIN driverstandings ON drivers.driverid = driverstandings.driverid WHERE driverstandings.position = driverstandings.position AND driverstandings.wins > 0	formula_1
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1 AND T2.points > 20	formula_1
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1 AND T2.points > 20	formula_1
SELECT count(*) ,  nationality FROM constructors GROUP BY nationality	formula_1
SELECT count(*) ,  nationality FROM constructors GROUP BY nationality	formula_1
SELECT count(*) ,  constructorid FROM constructorStandings GROUP BY constructorid	formula_1
SELECT count(*) ,  constructorid FROM constructorStandings GROUP BY constructorid	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain' AND T1.year > 2017	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain' AND T1.year > 2017	formula_1
SELECT DISTINCT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain' AND T1.year > 2000	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Spain' AND races.year > 2000	formula_1
SELECT DISTINCT driverid ,  STOP FROM pitstops WHERE duration  <  (SELECT max(duration) FROM pitstops WHERE raceid  =  841)	formula_1
SELECT p.driverid, p.stop FROM pitstops p WHERE p.time < (SELECT MIN(p2.time) FROM pitstops p2 WHERE p2.raceid = 841) AND p.raceid != 841	formula_1
SELECT DISTINCT driverid FROM pitstops WHERE duration > (SELECT MIN(duration) FROM pitstops ps WHERE ps.raceid = 841 AND ps.driverid != driverid) AND raceid = 841	formula_1
SELECT p.driverid, MAX(p.duration) AS MaxDuration FROM pitstops p WHERE p.duration > (SELECT MAX(p2.duration) FROM pitstops p2 WHERE p2.raceid = 841) GROUP BY p.driverid	formula_1
SELECT DISTINCT forename FROM drivers ORDER BY forename ASC	formula_1
SELECT DISTINCT forename FROM drivers ORDER BY forename ASC	formula_1
SELECT DISTINCT name FROM races ORDER BY name DESC	formula_1
SELECT DISTINCT name FROM races ORDER BY name DESC	formula_1
SELECT name FROM races WHERE YEAR BETWEEN 2009 AND 2011	formula_1
SELECT name FROM races WHERE YEAR BETWEEN 2009 AND 2011	formula_1
SELECT name FROM races WHERE TIME > '12:00:00' OR TIME < '09:00:00'	formula_1
SELECT name FROM races WHERE STRFTIME('%H:%M:%S', time) < '09:00:00' OR STRFTIME('%H:%M:%S', time) > '12:00:00';	formula_1
SELECT d.driverid, d.forename, d.surname FROM drivers d WHERE d.driverid IN (SELECT driverid FROM pitstops GROUP BY driverid HAVING COUNT(DISTINCT stop) > 8) OR d.driverid IN (SELECT driverid FROM results GROUP BY driverid HAVING COUNT(DISTINCT raceid) > 5)	formula_1
SELECT d.forename, d.surname, d.driverid FROM drivers d JOIN pitstops p ON d.driverid = p.driverid GROUP BY d.driverid HAVING COUNT(p.stop) > 8 OR COUNT(DISTINCT p.raceid) > 5	formula_1
SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  =  11 INTERSECT SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5	formula_1
SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  =  11 INTERSECT SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5	formula_1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year > 2010 GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1	formula_1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year > 2010 GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1	formula_1
SELECT name FROM circuits WHERE country = 'UK' OR country = 'Malaysia'	formula_1
SELECT name FROM circuits WHERE country = 'UK' OR country = 'Malaysia'	formula_1
SELECT circuitid ,  LOCATION FROM circuits WHERE country = 'France' OR country = 'Belgium'	formula_1
SELECT circuitid ,  LOCATION FROM circuits WHERE country = 'France' OR country = 'Belgium'	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'Japanese' AND T2.points > 5	formula_1
SELECT name FROM constructors WHERE nationality = 'Japanese' AND constructorid IN (SELECT constructorid FROM constructorstandings WHERE points > 5)	formula_1
SELECT avg(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Monaco Grand Prix'	formula_1
SELECT avg(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Monaco Grand Prix'	formula_1
SELECT max(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Monaco Grand Prix'	formula_1
SELECT max(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Monaco Grand Prix'	formula_1
SELECT max(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year	formula_1
SELECT r.name, MAX(fastestlapspeed) FROM races r LEFT JOIN results rs ON r.raceid = rs.raceid WHERE r.year > 2004 GROUP BY r.name ORDER BY r.year	formula_1
SELECT avg(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year	formula_1
SELECT avg(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year	formula_1
SELECT T1.driverid ,  T1.forename ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  >=  2	formula_1
SELECT d.driverid, d.forename, COUNT(DISTINCT r.raceid) AS races_participated FROM drivers d INNER JOIN results rs ON d.driverid = rs.driverid INNER JOIN races r ON rs.raceid = r.raceid GROUP BY d.driverid HAVING races_participated >= 2	formula_1
SELECT T1.driverid ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  <=  30	formula_1
SELECT T1.driverid ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  <=  30	formula_1
SELECT driverid, surname FROM (SELECT d.driverid, d.surname, COUNT(r.raceid) as num_races FROM drivers d JOIN results r ON d.driverid = r.driverid GROUP BY d.driverid) WHERE num_races = (SELECT MAX(num_races) FROM (SELECT COUNT(rr.raceid) AS num_races FROM results rr GROUP BY rr.driverid))	formula_1
SELECT drivers.driverid, drivers.surname FROM drivers JOIN results ON drivers.driverid = results.driverid GROUP BY drivers.driverid HAVING COUNT(results.raceid) = (SELECT MAX(total_races) FROM (SELECT COUNT(results.raceid) AS total_races FROM results GROUP BY results.driverid))	formula_1
SELECT count(*) FROM technician	machine_repair
SELECT count(*) FROM technician	machine_repair
SELECT Name FROM technician ORDER BY Age ASC	machine_repair
SELECT Name FROM technician ORDER BY Age ASC	machine_repair
SELECT Team ,  Starting_Year FROM technician	machine_repair
SELECT Team ,  Starting_Year FROM technician	machine_repair
SELECT Name FROM technician WHERE Team != 'NYY'	machine_repair
SELECT Name FROM technician WHERE Team != 'NYY'	machine_repair
SELECT Name FROM technician WHERE Age  =  36 OR Age  =  37	machine_repair
SELECT Name FROM technician WHERE Age  =  36 OR Age  =  37	machine_repair
SELECT Starting_Year FROM technician ORDER BY Age DESC LIMIT 1	machine_repair
SELECT Starting_Year FROM technician ORDER BY Age DESC LIMIT 1	machine_repair
SELECT Team ,  COUNT(*) FROM technician GROUP BY Team	machine_repair
SELECT Team ,  COUNT(*) FROM technician GROUP BY Team	machine_repair
SELECT t.team FROM technician t GROUP BY t.team HAVING COUNT(t.technician_id) = (SELECT MAX(count) FROM (SELECT COUNT(technician_id) AS count FROM technician GROUP BY team))	machine_repair
SELECT t.team FROM technician AS t GROUP BY t.team HAVING COUNT(t.technician_id) = (SELECT MAX(COUNTED) FROM (SELECT COUNT(technician_id) AS COUNTED FROM technician GROUP BY team))	machine_repair
SELECT Team FROM technician GROUP BY Team HAVING COUNT(*)  >=  2	machine_repair
SELECT Team FROM technician GROUP BY Team HAVING COUNT(*)  >=  2	machine_repair
SELECT T3.Name ,  T2.Machine_series FROM repair_assignment AS T1 JOIN machine AS T2 ON T1.machine_id  =  T2.machine_id JOIN technician AS T3 ON T1.technician_ID  =  T3.technician_ID	machine_repair
SELECT T3.Name ,  T2.Machine_series FROM repair_assignment AS T1 JOIN machine AS T2 ON T1.machine_id  =  T2.machine_id JOIN technician AS T3 ON T1.technician_ID  =  T3.technician_ID	machine_repair
SELECT T3.Name FROM repair_assignment AS T1 JOIN machine AS T2 ON T1.machine_id  =  T2.machine_id JOIN technician AS T3 ON T1.technician_ID  =  T3.technician_ID ORDER BY T2.quality_rank	machine_repair
SELECT T3.Name FROM repair_assignment AS T1 JOIN machine AS T2 ON T1.machine_id  =  T2.machine_id JOIN technician AS T3 ON T1.technician_ID  =  T3.technician_ID ORDER BY T2.quality_rank	machine_repair
SELECT name FROM technician WHERE EXISTS (SELECT 1 FROM repair_assignment INNER JOIN machine ON repair_assignment.machine_id = machine.machine_id WHERE technician.technician_id = repair_assignment.technician_id AND machine.value_points > 70)	machine_repair
SELECT T3.Name FROM repair_assignment AS T1 JOIN machine AS T2 ON T1.machine_id  =  T2.machine_id JOIN technician AS T3 ON T1.technician_ID  =  T3.technician_ID WHERE T2.value_points  >  70	machine_repair
SELECT tm.name AS Technician_Name, COUNT(DISTINCT tm.machine_id) AS Repaired_Machines FROM (SELECT t.name, ra.machine_id FROM technician AS t LEFT JOIN repair_assignment AS ra ON t.technician_id = ra.technician_id) tm GROUP BY tm.name	machine_repair
SELECT name, machine_count FROM (SELECT t.name AS name, COUNT(DISTINCT m.machine_id) AS machine_count FROM technician t LEFT JOIN repair_assignment ra ON ra.technician_id = t.technician_id LEFT JOIN machine m ON ra.machine_id = m.machine_id GROUP BY t.name)	machine_repair
SELECT Name FROM technician WHERE technician_id NOT IN (SELECT technician_id FROM repair_assignment)	machine_repair
SELECT Name FROM technician WHERE technician_id NOT IN (SELECT technician_id FROM repair_assignment)	machine_repair
SELECT Starting_Year FROM technician WHERE Team  =  'CLE' INTERSECT SELECT Starting_Year FROM technician WHERE Team  =  'CWS'	machine_repair
SELECT Starting_Year FROM technician WHERE Team  =  'CLE' INTERSECT SELECT Starting_Year FROM technician WHERE Team  =  'CWS'	machine_repair
SELECT count(*) FROM entrepreneur	entrepreneur
SELECT count(*) FROM entrepreneur	entrepreneur
SELECT Company FROM entrepreneur ORDER BY Money_Requested DESC	entrepreneur
SELECT Company FROM entrepreneur ORDER BY Money_Requested DESC	entrepreneur
SELECT Company ,  Investor FROM entrepreneur	entrepreneur
SELECT Company ,  Investor FROM entrepreneur	entrepreneur
SELECT avg(Money_Requested) FROM entrepreneur	entrepreneur
SELECT avg(Money_Requested) FROM entrepreneur	entrepreneur
SELECT Name FROM People ORDER BY Weight ASC	entrepreneur
SELECT Name FROM People ORDER BY Weight ASC	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Investor != 'Rachel Elnaugh'	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Investor != 'Rachel Elnaugh'	entrepreneur
SELECT p.weight FROM people p WHERE p.height = (SELECT MIN(height) FROM people)	entrepreneur
SELECT weight FROM people WHERE height = (SELECT MIN(height) FROM people)	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Weight DESC LIMIT 1	entrepreneur
SELECT T2.Name FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Weight DESC LIMIT 1	entrepreneur
SELECT sum(T1.Money_Requested) FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Height  >  1.85	entrepreneur
SELECT sum(T1.Money_Requested) FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Height  >  1.85	entrepreneur
SELECT T2.Date_of_Birth FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Investor  =  'Simon Woodroffe' OR T1.Investor  =  'Peter Jones'	entrepreneur
SELECT date_of_birth FROM people WHERE people_id IN (SELECT people_id FROM entrepreneur WHERE investor IN ('Peter Jones', 'Simon Woodroffe'))	entrepreneur
SELECT T2.Weight FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Money_Requested DESC	entrepreneur
SELECT T2.Weight FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Money_Requested DESC	entrepreneur
SELECT Investor ,  COUNT(*) FROM entrepreneur GROUP BY Investor	entrepreneur
SELECT Investor ,  COUNT(*) FROM entrepreneur GROUP BY Investor	entrepreneur
SELECT Investor FROM entrepreneur GROUP BY Investor ORDER BY COUNT(*) DESC LIMIT 1	entrepreneur
SELECT investor FROM entrepreneur GROUP BY investor HAVING COUNT(entrepreneur_id) = (SELECT MAX(totalInvestments) FROM (SELECT COUNT(entrepreneur_id) AS totalInvestments FROM entrepreneur GROUP BY investor))	entrepreneur
SELECT Investor FROM entrepreneur GROUP BY Investor HAVING COUNT(*)  >=  2	entrepreneur
SELECT Investor FROM entrepreneur GROUP BY Investor HAVING COUNT(*)  >=  2	entrepreneur
SELECT p.name, e.company FROM entrepreneur e JOIN people p ON e.people_id = p.people_id ORDER BY e.money_requested DESC	entrepreneur
SELECT p.name, e.investor FROM people p CROSS JOIN entrepreneur e ON e.people_id = p.people_id ORDER BY e.money_requested DESC	entrepreneur
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM entrepreneur)	entrepreneur
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM entrepreneur)	entrepreneur
SELECT Investor FROM entrepreneur WHERE Money_Requested  >  140000 INTERSECT SELECT Investor FROM entrepreneur WHERE Money_Requested  <  120000	entrepreneur
SELECT Investor FROM entrepreneur WHERE Money_Requested  >  140000 INTERSECT SELECT Investor FROM entrepreneur WHERE Money_Requested  <  120000	entrepreneur
SELECT count(DISTINCT Company) FROM entrepreneur	entrepreneur
SELECT count(DISTINCT Company) FROM entrepreneur	entrepreneur
SELECT e.company FROM entrepreneur e, people p WHERE e.people_id = p.people_id AND p.height = (SELECT MAX(height) FROM people)	entrepreneur
SELECT T1.Company FROM entrepreneur AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Height DESC LIMIT 1	entrepreneur
SELECT count(*) FROM perpetrator	perpetrator
SELECT Date FROM perpetrator ORDER BY Killed DESC	perpetrator
SELECT Injured FROM perpetrator ORDER BY Injured ASC	perpetrator
SELECT avg(Injured) FROM perpetrator	perpetrator
SELECT LOCATION FROM perpetrator ORDER BY Killed DESC LIMIT 1	perpetrator
SELECT Name FROM People ORDER BY Height ASC	perpetrator
SELECT T1.Name FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID	perpetrator
SELECT T1.Name FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Country != 'China'	perpetrator
SELECT T1.Name FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Weight DESC LIMIT 1	perpetrator
SELECT sum(T2.Killed) FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Height  >  1.84	perpetrator
SELECT T1.Name FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Country  =  'China' OR T2.Country  =  'Japan'	perpetrator
SELECT T1.Height FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Injured DESC	perpetrator
SELECT Country ,  COUNT(*) FROM perpetrator GROUP BY Country	perpetrator
SELECT country FROM perpetrator GROUP BY country HAVING COUNT(perpetrator_id) = (SELECT MAX(Count) FROM (SELECT COUNT(perpetrator_id) AS Count FROM perpetrator GROUP BY country) sub)	perpetrator
SELECT country FROM perpetrator GROUP BY country HAVING COUNT(DISTINCT perpetrator_id) >= 2	perpetrator
SELECT T1.Name FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Year DESC	perpetrator
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM perpetrator)	perpetrator
SELECT Country FROM perpetrator WHERE Injured  >  50 INTERSECT SELECT Country FROM perpetrator WHERE Injured  <  20	perpetrator
SELECT count(DISTINCT LOCATION) FROM perpetrator	perpetrator
SELECT T2.Date FROM people AS T1 JOIN perpetrator AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Height DESC LIMIT 1	perpetrator
SELECT max(YEAR) FROM perpetrator;	perpetrator
SELECT campus FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT campus FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT campus FROM campuses WHERE LOCATION  =  'Chico'	csu_1
SELECT campus FROM campuses WHERE LOCATION  =  'Chico'	csu_1
SELECT campus FROM campuses WHERE YEAR  =  1958	csu_1
SELECT campus FROM campuses WHERE YEAR  =  1958	csu_1
SELECT campus FROM campuses WHERE YEAR  <  1800	csu_1
SELECT campus FROM campuses WHERE YEAR  <  1800	csu_1
SELECT campus FROM campuses WHERE YEAR  >=  1935 AND YEAR  <=  1939	csu_1
SELECT campus FROM campuses WHERE YEAR  >=  1935 AND YEAR  <=  1939	csu_1
SELECT campus FROM campuses WHERE LOCATION  =  'Northridge' AND county  =  'Los Angeles' UNION SELECT campus FROM campuses WHERE LOCATION  =  'San Francisco' AND county  =  'San Francisco'	csu_1
SELECT campus FROM campuses WHERE LOCATION  =  'Northridge' AND county  =  'Los Angeles' UNION SELECT campus FROM campuses WHERE LOCATION  =  'San Francisco' AND county  =  'San Francisco'	csu_1
SELECT campusfee FROM campuses AS T1 JOIN csu_fees AS T2 ON T1.id  =  t2.campus WHERE t1.campus  =  'San Jose State University' AND T2.year  =  1996	csu_1
SELECT campusfee FROM campuses AS T1 JOIN csu_fees AS T2 ON T1.id  =  t2.campus WHERE t1.campus  =  'San Jose State University' AND T2.year  =  1996	csu_1
SELECT campusfee FROM campuses AS T1 JOIN csu_fees AS T2 ON T1.id  =  t2.campus WHERE t1.campus  =  'San Francisco State University' AND T2.year  =  1996	csu_1
SELECT campusfee FROM campuses AS T1 JOIN csu_fees AS T2 ON T1.id  =  t2.campus WHERE t1.campus  =  'San Francisco State University' AND T2.year  =  1996	csu_1
SELECT count(*) FROM csu_fees WHERE campusfee  >  (SELECT avg(campusfee) FROM csu_fees)	csu_1
SELECT count(*) FROM csu_fees WHERE campusfee  >  (SELECT avg(campusfee) FROM csu_fees)	csu_1
SELECT count(*) FROM csu_fees WHERE campusfee  >  (SELECT avg(campusfee) FROM csu_fees)	csu_1
SELECT count(*) FROM csu_fees WHERE campusfee  >  (SELECT avg(campusfee) FROM csu_fees)	csu_1
SELECT campus FROM campuses WHERE county  =  'Los Angeles' AND YEAR  >  1950	csu_1
SELECT campus FROM campuses WHERE county  =  'Los Angeles' AND YEAR  >  1950	csu_1
SELECT year FROM degrees GROUP BY year HAVING SUM(degrees) = (SELECT MAX(total_degrees) FROM (SELECT SUM(degrees) AS total_degrees FROM degrees GROUP BY year))	csu_1
SELECT year FROM degrees GROUP BY year HAVING SUM(degrees) = (SELECT MAX(degrees_sum) FROM (SELECT SUM(degrees) as degrees_sum FROM degrees GROUP BY year))	csu_1
SELECT Ca.campus FROM degrees AS D JOIN campuses AS Ca ON D.campus = Ca.id GROUP BY D.campus ORDER BY SUM(D.degrees) DESC LIMIT 1	csu_1
SELECT c.campus FROM campuses c WHERE c.id IN (SELECT d.campus FROM degrees d GROUP BY d.campus ORDER BY SUM(d.degrees) DESC LIMIT 1)	csu_1
SELECT T1.campus FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2003 ORDER BY T2.faculty DESC LIMIT 1	csu_1
SELECT T1.campus FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2003 ORDER BY T2.faculty DESC LIMIT 1	csu_1
SELECT avg(campusfee) FROM csu_fees WHERE YEAR  =  1996	csu_1
SELECT avg(campusfee) FROM csu_fees WHERE YEAR  =  1996	csu_1
SELECT avg(campusfee) FROM csu_fees WHERE YEAR  =  2005	csu_1
SELECT avg(campusfee) FROM csu_fees WHERE YEAR  =  2005	csu_1
SELECT TOTAL(degrees.degrees) FROM degrees WHERE degrees.year >= 1998 AND degrees.year <= 2002	csu_1
SELECT TOTAL(degrees.degrees) FROM degrees WHERE degrees.year >= 1998 AND degrees.year <= 2002	csu_1
SELECT T1.campus ,  sum(T2.degrees) FROM campuses AS T1 JOIN degrees AS T2 ON T1.id  =  T2.campus WHERE T1.county  =  'Orange' AND T2.year  >=  2000 GROUP BY T1.campus	csu_1
SELECT T1.campus ,  sum(T2.degrees) FROM campuses AS T1 JOIN degrees AS T2 ON T1.id  =  T2.campus WHERE T1.county  =  'Orange' AND T2.year  >=  2000 GROUP BY T1.campus	csu_1
SELECT T1.campus FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2002 AND faculty  >  (SELECT max(faculty) FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2002 AND T1.county  =  'Orange')	csu_1
SELECT T1.campus FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2002 AND faculty  >  (SELECT max(faculty) FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  T2.campus WHERE T2.year  =  2002 AND T1.county  =  'Orange')	csu_1
SELECT T1.campus FROM campuses AS t1 JOIN enrollments AS t2 ON t1.id  =  t2.campus WHERE t2.year  =  1956 AND totalenrollment_ay  >  400 AND FTE_AY  >  200	csu_1
SELECT campuses.location FROM campuses JOIN enrollments ON campuses.id = enrollments.campus WHERE campuses.year = 1948 AND enrollments.fte_ay > 200 AND enrollments.totalenrollment_ay > 400	csu_1
SELECT count(*) FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT count(*) FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT campus FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT campus FROM campuses WHERE county  =  'Los Angeles'	csu_1
SELECT TOTAL(degrees) FROM degrees WHERE campus IN (SELECT id FROM campuses WHERE campus = 'San Jose State University' AND year = 2000)	csu_1
SELECT degrees FROM campuses AS T1 JOIN degrees AS T2 ON t1.id  =  t2.campus WHERE t1.campus  =  'San Jose State University' AND t2.year  =  2000	csu_1
SELECT degrees FROM campuses AS T1 JOIN degrees AS T2 ON t1.id  =  t2.campus WHERE t1.campus  =  'San Francisco State University' AND t2.year  =  2001	csu_1
SELECT degrees FROM campuses AS T1 JOIN degrees AS T2 ON t1.id  =  t2.campus WHERE t1.campus  =  'San Francisco State University' AND t2.year  =  2001	csu_1
SELECT TOTAL(faculty) FROM faculty WHERE year = 2002	csu_1
SELECT TOTAL(faculty) FROM faculty WHERE year = 2002	csu_1
SELECT faculty FROM faculty AS T1 JOIN campuses AS T2 ON T1.campus  =  T2.id WHERE T1.year  =  2002 AND T2.campus  =  'Long Beach State University'	csu_1
SELECT faculty.faculty FROM faculty WHERE faculty.campus = (SELECT id FROM campuses WHERE campus = 'Long Beach State University') AND faculty.year = 2002	csu_1
SELECT faculty FROM faculty AS T1 JOIN campuses AS T2 ON T1.campus  =  T2.id WHERE T1.year  =  2004 AND T2.campus  =  'San Francisco State University'	csu_1
SELECT COUNT(faculty) AS faculty_count FROM faculty INNER JOIN campuses ON faculty.campus = campuses.id WHERE campuses.campus = 'San Francisco State University' AND faculty.year = 2004	csu_1
SELECT DISTINCT c.campus FROM faculty f JOIN campuses c ON f.campus = c.id WHERE f.year = 2004 AND f.faculty BETWEEN 600 AND 1000	csu_1
SELECT T1.campus FROM campuses AS t1 JOIN faculty AS t2 ON t1.id  =  t2.campus WHERE t2.faculty  >=  600 AND t2.faculty  <=  1000 AND T1.year  =  2004	csu_1
SELECT T2.faculty FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  t2.campus JOIN degrees AS T3 ON T1.id  =  t3.campus AND t2.year  =  t3.year WHERE t2.year  =  2002 ORDER BY t3.degrees DESC LIMIT 1	csu_1
SELECT F.faculty FROM faculty F JOIN degrees D ON F.campus = D.campus WHERE D.year = 2002 AND D.degrees = (SELECT MAX(degrees) FROM degrees WHERE year = 2002)	csu_1
SELECT T2.faculty FROM campuses AS T1 JOIN faculty AS T2 ON T1.id  =  t2.campus JOIN degrees AS T3 ON T1.id  =  t3.campus AND t2.year  =  t3.year WHERE t2.year  =  2001 ORDER BY t3.degrees LIMIT 1	csu_1
SELECT SUM(faculty.faculty) FROM faculty WHERE campus IN (SELECT d.campus FROM degrees d WHERE d.year = 2001 GROUP BY d.campus ORDER BY SUM(d.degrees) ASC LIMIT 1) AND year = 2001	csu_1
SELECT TOTAL(d.undergraduate) FROM discipline_enrollments AS d JOIN campuses AS c ON d.campus = c.id WHERE c.campus = 'San Jose State University' AND d.year = 2004	csu_1
SELECT sum(t1.undergraduate) FROM discipline_enrollments AS t1 JOIN campuses AS t2 ON t1.campus  =  t2.id WHERE t1.year  =  2004 AND t2.campus  =  'San Jose State University'	csu_1
SELECT SUM(d.graduate) AS Total_Graduates FROM discipline_enrollments d JOIN campuses c ON d.campus = c.id WHERE c.campus = 'San Francisco State University' AND d.year = 2004 GROUP BY d.year	csu_1
SELECT TOTAL(degrees.degrees) FROM degrees JOIN campuses ON degrees.campus = campuses.id WHERE campuses.campus = 'San Francisco State University' AND degrees.year = 2004	csu_1
SELECT campusfee FROM csu_fees WHERE campus = (SELECT id FROM campuses WHERE campus = 'San Francisco State University') AND year = 2000	csu_1
SELECT cf.campusfee FROM csu_fees AS cf INNER JOIN campuses AS c ON cf.campus = c.id WHERE c.campus = 'San Francisco State perpetrators' AND cf.year = 2000	csu_1
SELECT t1.campusfee FROM csu_fees AS t1 JOIN campuses AS t2 ON t1.campus  =  t2.id WHERE t2.campus  =  'San Jose State University' AND t1.year  =  2000	csu_1
SELECT t1.campusfee FROM csu_fees AS t1 JOIN campuses AS t2 ON t1.campus  =  t2.id WHERE t2.campus  =  'San Jose State University' AND t1.year  =  2000	csu_1
SELECT count(*) FROM campuses	csu_1
SELECT count(*) FROM campuses	csu_1
SELECT count(*) FROM candidate	candidate_poll
SELECT count(*) FROM candidate	candidate_poll
WITH PollCounts AS (SELECT poll_source, COUNT(*) AS TotalCandidates FROM candidate GROUP BY poll_source) SELECT poll_source FROM PollCounts WHERE TotalCandidates = (SELECT MAX(TotalCandidates) FROM PollCounts)	candidate_poll
SELECT poll_source FROM candidate GROUP BY poll_source HAVING COUNT(DISTINCT candidate_id) = (SELECT MAX(c) FROM (SELECT COUNT(DISTINCT candidate_id) AS c FROM candidate GROUP BY poll_source))	candidate_poll
SELECT support_rate FROM candidate ORDER BY support_rate DESC LIMIT 3	candidate_poll
SELECT support_rate FROM candidate ORDER BY support_rate DESC LIMIT 3	candidate_poll
SELECT c.candidate_id FROM candidate AS c WHERE c.oppose_rate = (SELECT MIN(c2.oppose_rate) FROM candidate AS c2)	candidate_poll
WITH RankedCandidates AS (SELECT candidate_id, oppose_rate, RANK() OVER (ORDER BY oppose_rate) AS rank FROM candidate) SELECT candidate_id FROM RankedCandidates WHERE rank = 1	candidate_poll
SELECT Support_rate ,  Consider_rate ,  Oppose_rate FROM candidate ORDER BY unsure_rate	candidate_poll
SELECT Support_rate ,  Consider_rate ,  Oppose_rate FROM candidate ORDER BY unsure_rate	candidate_poll
SELECT poll_source FROM candidate ORDER BY oppose_rate DESC LIMIT 1	candidate_poll
SELECT poll_source FROM candidate WHERE oppose_rate IS NOT NULL	candidate_poll
SELECT name FROM people ORDER BY date_of_birth	candidate_poll
SELECT name FROM people ORDER BY date_of_birth	candidate_poll
SELECT avg(height) ,  avg(weight) FROM people WHERE sex  =  'M'	candidate_poll
SELECT avg(height) ,  avg(weight) FROM people WHERE sex  =  'M'	candidate_poll
SELECT name FROM people WHERE height  >  200 OR height  <  190	candidate_poll
SELECT name FROM people WHERE height  >  200 OR height  <  190	candidate_poll
SELECT avg(weight) ,  min(weight) ,  sex FROM people GROUP BY sex	candidate_poll
SELECT avg(weight) ,  min(weight) ,  sex FROM people GROUP BY sex	candidate_poll
SELECT p.name, p.sex FROM candidate c JOIN people p ON c.people_id = p.people_id WHERE c.support_rate = (SELECT MAX(support_rate) FROM candidate)	candidate_poll
SELECT p.name, p.sex FROM people p JOIN candidate c ON p.people_id = c.people_id WHERE c.support_rate = (SELECT MAX(support_rate) FROM candidate)	candidate_poll
SELECT p.name FROM people p JOIN candidate c ON p.people_id = c.people_id WHERE c.oppose_rate = (SELECT MIN(c2.oppose_rate) FROM candidate c2 WHERE c2.people_id = p.people_id) GROUP BY p.sex;	candidate_poll
SELECT p.sex, p.name FROM people p JOIN candidate c ON p.people_id = c.people_id WHERE c.oppose_rate = (SELECT MAX(c2.oppose_rate) FROM candidate c2 WHERE c2.people_id = p.people_id)	candidate_poll
SELECT P.sex FROM people P, candidate C WHERE P.people_id = C.people_id GROUP BY P.sex HAVING AVG(C.unsure_rate) = (SELECT MAX(AVG_C) FROM (SELECT AVG(unsure_rate) AS AVG_C FROM people JOIN candidate ON people.people_id = candidate.people_id GROUP BY sex));	candidate_poll
SELECT sex FROM people WHERE people_id IN (SELECT people_id FROM candidate WHERE unsure_rate = (SELECT MAX(unsure_rate) FROM candidate))	candidate_poll
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM candidate)	candidate_poll
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM candidate)	candidate_poll
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t2.support_rate  <  t2.oppose_rate	candidate_poll
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t2.support_rate  <  t2.oppose_rate	candidate_poll
SELECT count(*) ,  sex FROM people WHERE weight  >  85 GROUP BY sex	candidate_poll
SELECT count(*) ,  sex FROM people WHERE weight  >  85 GROUP BY sex	candidate_poll
SELECT max(support_rate) ,  min(consider_rate) ,  min(oppose_rate) FROM candidate	candidate_poll
SELECT max(support_rate) ,  min(consider_rate) ,  min(oppose_rate) FROM candidate	candidate_poll
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t1.sex  =  'F' ORDER BY t1.name	candidate_poll
SELECT p.name FROM people p WHERE p.people_id IN (SELECT c.people_id FROM candidate c) AND p.sex = 'F' ORDER BY p.name	candidate_poll
SELECT name FROM people WHERE height  <  (SELECT avg(height) FROM people)	candidate_poll
SELECT name FROM people WHERE height  <  (SELECT avg(height) FROM people)	candidate_poll
SELECT * FROM people	candidate_poll
SELECT * FROM people	candidate_poll
SELECT title FROM Movie WHERE director = 'Steven Spielberg'	movie_1
SELECT title FROM Movie WHERE director = 'Steven Spielberg'	movie_1
SELECT title FROM Movie WHERE director = 'James Cameron' AND YEAR  >  2000	movie_1
SELECT title FROM Movie WHERE director = 'James Cameron' AND YEAR  >  2000	movie_1
SELECT count(*) FROM Movie WHERE YEAR  <  2000	movie_1
SELECT count(*) FROM Movie WHERE YEAR  <  2000	movie_1
SELECT director FROM Movie WHERE title  = 'Avatar'	movie_1
SELECT director FROM Movie WHERE title  = 'Avatar'	movie_1
SELECT count(*) FROM Reviewer	movie_1
SELECT count(*) FROM Reviewer	movie_1
SELECT rID FROM Reviewer WHERE name LIKE '%Mike%'	movie_1
SELECT rID FROM Reviewer WHERE name LIKE '%Mike%'	movie_1
SELECT rID FROM Reviewer WHERE name  =  'Daniel Lewis'	movie_1
SELECT rID FROM Reviewer WHERE name  =  'Daniel Lewis'	movie_1
SELECT count(*) FROM Rating WHERE stars  >  3	movie_1
SELECT count(*) FROM Rating WHERE stars  >  3	movie_1
SELECT max(stars) ,  min(stars) FROM Rating	movie_1
SELECT max(stars) ,  min(stars) FROM Rating	movie_1
SELECT DISTINCT movie.year FROM movie JOIN rating ON movie.mid = rating.mid WHERE rating.stars IN (4, 5) ORDER BY movie.year ASC	movie_1
SELECT DISTINCT year FROM movie JOIN rating ON movie.mid = rating.mid WHERE stars IN (4, 5) ORDER BY year ASC	movie_1
SELECT T1.director ,  T1.title FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  =  5	movie_1
SELECT T1.director ,  T1.title FROM Movie AS T1 JOIN Rating AS T2 ON T1.mID  =  T2.mID WHERE T2.stars  =  5	movie_1
SELECT T2.name ,  avg(T1.stars) FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T2.name	movie_1
SELECT AVG(stars) AS average_stars FROM rating GROUP BY rid	movie_1
SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating)	movie_1
SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating)	movie_1
SELECT DISTINCT name FROM Reviewer AS T1 JOIN Rating AS T2 ON T1.rID  =  T2.rID WHERE ratingDate  =  'null'	movie_1
SELECT DISTINCT name FROM Reviewer AS T1 JOIN Rating AS T2 ON T1.rID  =  T2.rID WHERE ratingDate  =  'null'	movie_1
SELECT title, (SELECT AVG(stars) FROM rating WHERE rating.mid = movie.mid) AS average_rating FROM movie WHERE year = (SELECT MIN(year) FROM movie)	movie_1
SELECT AVG(r.stars), m.title FROM movie m JOIN rating r ON m.mid = r.mid WHERE m.year = (SELECT MIN(year) FROM movie) GROUP BY m.title	movie_1
SELECT title FROM Movie WHERE YEAR  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT title FROM Movie WHERE YEAR  =  (SELECT max(YEAR) FROM Movie)	movie_1
SELECT MAX(rating.stars) AS MaxStars, movie.year FROM rating, movie WHERE rating.mid = movie.mid AND rating.ratingdate = (SELECT MAX(ratingdate) FROM rating GROUP BY ratingdate)	movie_1
SELECT MAX(r.stars), m.year FROM movie m JOIN rating r ON m.mid = r.mid WHERE m.year = (SELECT MAX(year) FROM movie) GROUP BY m.year;	movie_1
SELECT title FROM Movie WHERE YEAR  >  (SELECT max(YEAR) FROM Movie WHERE director  =  'Steven Spielberg')	movie_1
SELECT DISTINCT title FROM movie AS M1 WHERE M1.year > (SELECT MAX(M2.year) FROM movie AS M2 WHERE M2.director = 'Steven Spielberg')	movie_1
SELECT T2.title ,  T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  >  (SELECT avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.director  =  'James Cameron')	movie_1
SELECT T2.title ,  T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars  >  (SELECT avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T2.director  =  'James Cameron')	movie_1
SELECT T3.name ,  T2.title ,  T1.stars ,  T1.ratingDate FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID ORDER BY T3.name ,  T2.title ,  T1.stars	movie_1
SELECT T3.name ,  T2.title ,  T1.stars ,  T1.ratingDate FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID ORDER BY T3.name ,  T2.title ,  T1.stars	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T1.rID HAVING COUNT(*)  >=  3	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID GROUP BY T1.rID HAVING COUNT(*)  >=  3	movie_1
SELECT r.name FROM reviewer r WHERE EXISTS (SELECT 1 FROM rating rt INNER JOIN movie m ON rt.mid = m.mid WHERE rt.rid = r.rid AND m.title = 'Gone with the Wind')	movie_1
SELECT DISTINCT T3.name FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T2.title  =  'Gone with the Wind'	movie_1
SELECT DISTINCT T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Sarah Martinez'	movie_1
SELECT DISTINCT T2.director FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Sarah Martinez'	movie_1
SELECT r.name, m.title, ra.stars FROM reviewer r JOIN movie m ON r.name = m.director JOIN rating ra ON ra.rid = r.rid AND ra.mid = m.mid	movie_1
SELECT reviewer.name, movie.title, rating.stars FROM reviewer JOIN rating ON reviewer.rid = rating.rid JOIN movie ON movie.mid = rating.mid WHERE reviewer.name = movie.director	movie_1
SELECT merged_list FROM (SELECT name AS merged_list FROM reviewer UNION ALL SELECT title AS merged_list FROM movie)	movie_1
SELECT reviewer.name, movie.title FROM reviewer JOIN rating ON reviewer.rid = rating.rid JOIN movie ON rating.mid = movie.mid	movie_1
SELECT title FROM movie WHERE mid NOT IN (SELECT mid FROM rating WHERE rid IN (SELECT rid FROM reviewer WHERE name = 'Chris Jackson'))	movie_1
SELECT movie.title FROM movie LEFT OUTER JOIN (SELECT rating.mid FROM rating INNER JOIN reviewer ON rating.rid = reviewer.rid WHERE reviewer.name = 'Chris Jackson') res ON movie.mid = res.mid WHERE res.mid IS NULL	movie_1
SELECT m.title, m.director FROM movie m WHERE m.director IN (SELECT director FROM movie GROUP BY director HAVING COUNT(*) > 1) ORDER BY m.director, m.title	movie_1
SELECT director, title FROM movie WHERE director IN (SELECT director FROM movie GROUP BY director HAVING COUNT(mid) > 1)	movie_1
SELECT T1.title ,  T1.year FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title	movie_1
SELECT T1.title ,  T1.year FROM Movie AS T1 JOIN Movie AS T2 ON T1.director  =  T2.director WHERE T1.title != T2.title	movie_1
SELECT director FROM Movie GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie WHERE director != 'null' GROUP BY director HAVING count(*)  =  1	movie_1
SELECT director FROM Movie WHERE director != 'null' GROUP BY director HAVING count(*)  =  1	movie_1
SELECT movie.director, COUNT(rating.stars) AS reviews_received FROM movie LEFT JOIN rating ON movie.mid = rating.mid GROUP BY movie.director	movie_1
SELECT m.director, COUNT(r.rid) FROM movie AS m LEFT OUTER JOIN rating AS r ON m.mid = r.mid GROUP BY m.director	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) DESC LIMIT 1	movie_1
SELECT T2.title ,  avg(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.mID ORDER BY avg(T1.stars) DESC LIMIT 1	movie_1
SELECT title, average_rating FROM (SELECT movie.title AS title, AVG(rating.stars) AS average_rating FROM movie, rating WHERE movie.mid = rating.mid GROUP BY movie.mid) WHERE average_rating = (SELECT MIN(average_rating) FROM (SELECT AVG(stars) AS average_rating FROM rating GROUP BY mid))	movie_1
SELECT M.title, AVG(R.stars) AS average_rating FROM movie M JOIN rating R ON M.mid = R.mid GROUP BY M.mid HAVING AVG(R.stars) = (SELECT MIN(avg_rating) FROM (SELECT AVG(stars) AS avg_rating FROM rating GROUP BY mid))	movie_1
SELECT T2.title ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID ORDER BY T1.stars DESC LIMIT 3	movie_1
SELECT T2.title ,  T2.year FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID ORDER BY T1.stars DESC LIMIT 3	movie_1
SELECT director, title, MAX(stars) FROM movie JOIN rating ON movie.mid = rating.mid WHERE director IS NOT NULL GROUP BY director	movie_1
SELECT director, title, stars FROM movie JOIN rating ON movie.mid = rating.mid	movie_1
SELECT T2.title ,  T1.rID ,  T1.stars ,  min(T1.stars) FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID GROUP BY T1.rID	movie_1
SELECT reviewer.rid, movie.title, rating.stars FROM rating JOIN movie ON rating.mid = movie.mid JOIN reviewer ON rating.rid = reviewer.rid WHERE (rating.rid, rating.stars) IN (SELECT rating.rid, MIN(rating.stars) FROM rating GROUP BY rating.rid)	movie_1
SELECT M.title, MIN(R.stars) FROM movie M JOIN rating R ON M.mid = R.mid GROUP BY M.director	movie_1
SELECT director, title, score FROM (SELECT m.director, m.title, r.stars as score, RANK() OVER (PARTITION BY m.director ORDER BY r.stars ASC) AS rank FROM movie m JOIN rating r ON m.mid = r.mid) WHERE rank = 1	movie_1
SELECT title FROM movie WHERE mid IN (SELECT mid FROM rating GROUP BY mid ORDER BY COUNT(*) DESC LIMIT 1)	movie_1
SELECT title FROM movie WHERE mid IN (SELECT mid FROM rating GROUP BY mid HAVING COUNT(mid) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM rating GROUP BY mid)))	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars BETWEEN 3 AND 5	movie_1
SELECT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID WHERE T1.stars BETWEEN 3 AND 5	movie_1
SELECT T2.name FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T1.stars  >  3	movie_1
SELECT name FROM reviewer WHERE rid IN (SELECT rid FROM rating WHERE stars > 3)	movie_1
SELECT mID ,  avg(stars) FROM Rating WHERE mID NOT IN (SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  'Brittany Harris') GROUP BY mID	movie_1
SELECT mID ,  avg(stars) FROM Rating WHERE mID NOT IN (SELECT T1.mID FROM Rating AS T1 JOIN Reviewer AS T2 ON T1.rID  =  T2.rID WHERE T2.name  =  'Brittany Harris') GROUP BY mID	movie_1
SELECT mid FROM movie WHERE mid NOT IN (SELECT m.mid FROM movie m JOIN rating r ON m.mid = r.mid JOIN reviewer rev ON r.rid = rev.rid WHERE rev.name = 'Brittany Harris')	movie_1
SELECT mid FROM movie WHERE mid NOT IN (SELECT mid FROM rating JOIN reviewer ON rating.rid = reviewer.rid WHERE name = 'Britanny Harris')	movie_1
SELECT mID ,  avg(stars) FROM Rating GROUP BY mID HAVING count(*)  >=  2	movie_1
SELECT m.title, AVG(r.stars) AS AverageRating FROM movie m JOIN rating r ON m.mid = r.mid GROUP BY m.mid HAVING COUNT(r.rid) > 3	movie_1
SELECT reviewer.rid FROM reviewer WHERE reviewer.rid NOT IN (SELECT rating.rid FROM rating WHERE rating.stars = 4)	movie_1
SELECT r.rid FROM reviewer r WHERE r.rid NOT IN (SELECT ra.rid FROM rating ra WHERE ra.stars = 4)	movie_1
SELECT rid FROM reviewer EXCEPT SELECT rid FROM rating WHERE stars = 4	movie_1
SELECT rid FROM reviewer WHERE rid NOT IN (SELECT rid FROM rating WHERE stars = 4)	movie_1
SELECT movie.title FROM movie WHERE movie.year > 2000 OR movie.mid IN (SELECT rating.mid FROM rating JOIN reviewer ON reviewer.rid = rating.rid WHERE reviewer.name = 'Brittany Harris')	movie_1
SELECT DISTINCT T2.title FROM Rating AS T1 JOIN Movie AS T2 ON T1.mID  =  T2.mID JOIN Reviewer AS T3 ON T1.rID  =  T3.rID WHERE T3.name  =  'Brittany Harris' OR T2.year  >  2000	movie_1
SELECT title FROM Movie WHERE director  =  'James Cameron' OR YEAR   <  1980	movie_1
SELECT title FROM Movie WHERE director  =  'James Cameron' OR YEAR   <  1980	movie_1
SELECT name FROM reviewer WHERE rid IN (SELECT rid FROM rating WHERE stars = 3 OR stars = 4)	movie_1
SELECT name FROM reviewer WHERE rid IN (SELECT rating.rid FROM rating WHERE stars IN (3, 4))	movie_1
SELECT title FROM movie WHERE mid IN (SELECT mid FROM rating WHERE stars = 3 OR stars = 4)	movie_1
SELECT movie.title FROM movie INNER JOIN rating ON movie.mid = rating.mid WHERE rating.stars >= 3 AND rating.stars <= 4	movie_1
SELECT count(*) FROM county_public_safety	county_public_safety
SELECT count(*) FROM county_public_safety	county_public_safety
SELECT Name FROM county_public_safety ORDER BY Population DESC	county_public_safety
SELECT Name FROM county_public_safety ORDER BY Population DESC	county_public_safety
SELECT DISTINCT Police_force FROM county_public_safety WHERE LOCATION != 'East'	county_public_safety
SELECT DISTINCT Police_force FROM county_public_safety WHERE LOCATION != 'East'	county_public_safety
SELECT min(Crime_rate) ,  max(Crime_rate) FROM county_public_safety	county_public_safety
SELECT min(Crime_rate) ,  max(Crime_rate) FROM county_public_safety	county_public_safety
SELECT Crime_rate FROM county_public_safety ORDER BY Police_officers ASC	county_public_safety
SELECT Crime_rate FROM county_public_safety ORDER BY Police_officers ASC	county_public_safety
SELECT Name FROM city ORDER BY Name ASC	county_public_safety
SELECT Name FROM city ORDER BY Name ASC	county_public_safety
SELECT Hispanic FROM city WHERE Black  >  10	county_public_safety
SELECT Hispanic FROM city WHERE Black  >  10	county_public_safety
SELECT name FROM county_public_safety WHERE population = (SELECT MAX(population) FROM county_public_safety)	county_public_safety
SELECT name FROM county_public_safety WHERE population = (SELECT MAX(population) FROM county_public_safety)	county_public_safety
SELECT Name FROM city ORDER BY White DESC LIMIT 5	county_public_safety
SELECT Name FROM city ORDER BY White DESC LIMIT 5	county_public_safety
SELECT T1.Name ,  T2.Name FROM city AS T1 JOIN county_public_safety AS T2 ON T1.County_ID  =  T2.County_ID	county_public_safety
SELECT T1.Name ,  T2.Name FROM city AS T1 JOIN county_public_safety AS T2 ON T1.County_ID  =  T2.County_ID	county_public_safety
SELECT T1.White ,  T2.Crime_rate FROM city AS T1 JOIN county_public_safety AS T2 ON T1.County_ID  =  T2.County_ID	county_public_safety
SELECT T1.White ,  T2.Crime_rate FROM city AS T1 JOIN county_public_safety AS T2 ON T1.County_ID  =  T2.County_ID	county_public_safety
SELECT c.name FROM city c INNER JOIN county_public_safety cps ON c.county_id = cps.county_id WHERE cps.police_officers = (SELECT MAX(police_officers) FROM county_public_safety)	county_public_safety
WITH MaxOfficers AS (SELECT MAX(police_officers) AS max_officers FROM county_public_safety) SELECT city.name FROM city JOIN county_public_safety ON city.county_id = county_public_safety.county_id AND county_public_safety.police_officers = (SELECT max_officers FROM MaxOfficers)	county_public_safety
SELECT count(*) FROM city WHERE county_ID IN (SELECT county_ID FROM county_public_safety WHERE population  >  20000)	county_public_safety
SELECT COUNT(*) FROM city c JOIN county_public_safety cps ON c.county_id = cps.county_id WHERE cps.population > 20000 GROUP BY c.city_id	county_public_safety
SELECT cps.crime_rate FROM county_public_safety cps WHERE EXISTS (SELECT 1 FROM city c WHERE cps.county_id = c.county_id AND c.white > 90)	county_public_safety
SELECT crime_rate FROM county_public_safety WHERE county_id IN (SELECT county_id FROM city WHERE white > 90)	county_public_safety
SELECT Police_force ,  COUNT(*) FROM county_public_safety GROUP BY Police_force	county_public_safety
SELECT Police_force ,  COUNT(*) FROM county_public_safety GROUP BY Police_force	county_public_safety
SELECT location FROM county_public_safety GROUP BY location HAVING COUNT(county_id) = (SELECT MAX(c) FROM (SELECT COUNT(county_id) AS c FROM county_public_safety GROUP BY location))	county_public_safety
SELECT cp.location FROM (SELECT location, RANK() OVER (ORDER BY COUNT(county_id) DESC) as rank FROM county_public_safety GROUP BY location) cp WHERE rank = 1	county_public_safety
SELECT Name FROM county_public_safety WHERE County_ID NOT IN (SELECT County_ID FROM city)	county_public_safety
SELECT Name FROM county_public_safety WHERE County_ID NOT IN (SELECT County_ID FROM city)	county_public_safety
SELECT Police_force FROM county_public_safety WHERE LOCATION  =  'East' INTERSECT SELECT Police_force FROM county_public_safety WHERE LOCATION  =  'West'	county_public_safety
SELECT Police_force FROM county_public_safety WHERE LOCATION  =  'East' INTERSECT SELECT Police_force FROM county_public_safety WHERE LOCATION  =  'West'	county_public_safety
SELECT name FROM city WHERE county_id IN (SELECT county_id FROM county_public_safety WHERE Crime_rate  <  100)	county_public_safety
SELECT name FROM city WHERE county_id IN (SELECT county_id FROM county_public_safety WHERE Crime_rate  <  100)	county_public_safety
SELECT county_public_safety.case_burden FROM county_public_safety ORDER BY county_public_safety.population DESC, county_public_safety.county_id	county_public_safety
SELECT Case_burden FROM county_public_safety ORDER BY Population DESC	county_public_safety
SELECT roomName FROM Rooms WHERE basePrice  <  160 AND beds =  2 AND decor  =  'modern';	inn_1
SELECT roomName FROM Rooms WHERE basePrice  <  160 AND beds =  2 AND decor  =  'modern';	inn_1
SELECT roomName ,  RoomId FROM Rooms WHERE basePrice  >  160 AND maxOccupancy  >  2;	inn_1
SELECT roomName ,  RoomId FROM Rooms WHERE basePrice  >  160 AND maxOccupancy  >  2;	inn_1
SELECT T2.roomName FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId GROUP BY T1.Room ORDER BY count(*) DESC LIMIT 1;	inn_1
SELECT roomname FROM rooms JOIN (SELECT room, COUNT(*) AS reservation_count FROM reservations GROUP BY room) AS ReservationCount ON rooms.roomid = ReservationCount.room WHERE ReservationCount.reservation_count = (SELECT MAX(reservation_count) FROM (SELECT room, COUNT(*) AS reservation_count FROM reservations GROUP BY room) AS Counts)	inn_1
SELECT TOTAL(reservations.kids) FROM reservations INNER JOIN rooms ON reservations.room = rooms.roomid WHERE reservations.firstname = 'ROY' AND reservations.lastname = 'SWEAZY'	inn_1
SELECT TOTAL(res.kids) FROM reservations res INNER JOIN rooms rm ON rm.roomid = res.room WHERE res.firstname = 'ROY' AND res.lastname = 'SWEAZ'	inn_1
SELECT count(*) FROM Reservations WHERE FirstName = 'ROY' AND LastName  =  'SWEAZY';	inn_1
SELECT count(*) FROM Reservations WHERE FirstName = 'ROY' AND LastName  =  'SWEAZY';	inn_1
SELECT r.roomname, rs.rate, rs.checkin, rs.checkout FROM reservations rs JOIN rooms r ON rs.room = r.roomid ORDER BY rs.rate DESC LIMIT 1	inn_1
SELECT roomname, rate, checkin, checkout FROM rooms JOIN reservations ON roomid = room WHERE rate = (SELECT MAX(rate) FROM reservations)	inn_1
SELECT Adults FROM Reservations WHERE CheckIn  =  '2010-10-23' AND FirstName  =  'CONRAD' AND LastName  =  'SELBIG';	inn_1
SELECT Adults FROM Reservations WHERE CheckIn  =  '2010-10-23' AND FirstName  =  'CONRAD' AND LastName  =  'SELBIG';	inn_1
SELECT Kids FROM Reservations WHERE CheckIn  =  '2010-09-21' AND FirstName  =  'DAMIEN' AND LastName  =  'TRACHSEL';	inn_1
SELECT Kids FROM Reservations WHERE CheckIn  =  '2010-09-21' AND FirstName  =  'DAMIEN' AND LastName  =  'TRACHSEL';	inn_1
SELECT sum(beds) FROM Rooms WHERE bedtype  =  'King';	inn_1
SELECT TOTAL(beds) FROM rooms WHERE bedtype = 'King'	inn_1
SELECT roomName ,  decor FROM Rooms WHERE bedtype  =  'King' ORDER BY basePrice;	inn_1
SELECT roomName ,  decor FROM Rooms WHERE bedtype  =  'King' ORDER BY basePrice;	inn_1
SELECT roomname, baseprice FROM rooms WHERE baseprice = (SELECT MIN(baseprice) FROM rooms);	inn_1
SELECT roomname, baseprice FROM rooms WHERE baseprice = (SELECT MIN(baseprice) FROM rooms)	inn_1
SELECT decor FROM Rooms WHERE roomName  =  'Recluse and defiance';	inn_1
SELECT decor FROM Rooms WHERE roomName  =  'Recluse and defiance';	inn_1
SELECT bedType ,  avg(basePrice) FROM Rooms GROUP BY bedType;	inn_1
SELECT bedType ,  avg(basePrice) FROM Rooms GROUP BY bedType;	inn_1
SELECT TOTAL(rooms.maxoccupancy) FROM rooms WHERE rooms.decor = 'modern'	inn_1
SELECT TOTAL(maxoccupancy) FROM rooms WHERE decor = 'modern'	inn_1
SELECT decor FROM (SELECT rooms.decor, COUNT(reservations.code) as res_count FROM rooms LEFT JOIN reservations ON rooms.roomid = reservations.room GROUP BY rooms.decor ORDER BY res_count ASC LIMIT 1)	inn_1
SELECT T2.decor FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId GROUP BY T2.decor ORDER BY count(T2.decor) ASC LIMIT 1;	inn_1
SELECT count(*) FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId WHERE T2.maxOccupancy  =  T1.Adults + T1.Kids;	inn_1
SELECT count(*) FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId WHERE T2.maxOccupancy  =  T1.Adults + T1.Kids;	inn_1
SELECT T1.firstname ,  T1.lastname FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId WHERE T1.Rate - T2.basePrice  >  0	inn_1
SELECT T1.firstname ,  T1.lastname FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId WHERE T1.Rate - T2.basePrice  >  0	inn_1
SELECT count(*) FROM Rooms;	inn_1
SELECT count(*) FROM Rooms;	inn_1
SELECT count(*) FROM Rooms WHERE bedType  =  'King';	inn_1
SELECT count(*) FROM Rooms WHERE bedType  =  'King';	inn_1
SELECT bedType ,  count(*) FROM Rooms GROUP BY bedType;	inn_1
SELECT bedType ,  count(*) FROM Rooms GROUP BY bedType;	inn_1
SELECT roomname FROM rooms WHERE maxoccupancy = (SELECT MAX(maxoccupancy) FROM rooms)	inn_1
SELECT roomname FROM rooms WHERE maxoccupancy = (SELECT MAX(maxoccupancy) FROM rooms)	inn_1
SELECT r.roomid, r.roomname FROM rooms AS r WHERE r.baseprice = (SELECT MAX(baseprice) FROM rooms)	inn_1
SELECT RoomId ,  roomName FROM Rooms ORDER BY basePrice DESC LIMIT 1;	inn_1
SELECT roomName ,  bedType FROM Rooms WHERE decor = 'traditional';	inn_1
SELECT roomName ,  bedType FROM Rooms WHERE decor = 'traditional';	inn_1
SELECT decor ,  count(*) FROM Rooms WHERE bedType = 'King' GROUP BY decor;	inn_1
SELECT decor ,  count(*) FROM Rooms WHERE bedType = 'King' GROUP BY decor;	inn_1
SELECT decor , avg(basePrice) ,  min(basePrice) FROM Rooms GROUP BY decor;	inn_1
SELECT decor, AVG(baseprice) AS AveragePrice FROM rooms GROUP BY decor	inn_1
SELECT roomName FROM Rooms ORDER BY basePrice;	inn_1
SELECT roomName FROM Rooms ORDER BY basePrice;	inn_1
SELECT decor , count(*) FROM Rooms WHERE basePrice  >  120 GROUP BY decor;	inn_1
SELECT decor , count(*) FROM Rooms WHERE basePrice  >  120 GROUP BY decor;	inn_1
SELECT bedType ,  avg(basePrice) FROM Rooms GROUP BY bedType;	inn_1
SELECT bedType ,  avg(basePrice) FROM Rooms GROUP BY bedType;	inn_1
SELECT roomName FROM Rooms WHERE bedType  =  'King' OR bedType  =  'Queen';	inn_1
SELECT roomName FROM Rooms WHERE bedType  =  'King' OR bedType  =  'Queen';	inn_1
SELECT count(DISTINCT bedType) FROM Rooms;	inn_1
SELECT count(DISTINCT bedType) FROM Rooms;	inn_1
SELECT RoomId ,  roomName FROM Rooms ORDER BY basePrice DESC LIMIT 3;	inn_1
SELECT RoomId ,  roomName FROM Rooms ORDER BY basePrice DESC LIMIT 3;	inn_1
SELECT roomName FROM Rooms WHERE basePrice  >  ( SELECT avg(basePrice) FROM Rooms );	inn_1
SELECT roomName FROM Rooms WHERE basePrice  >  ( SELECT avg(basePrice) FROM Rooms );	inn_1
SELECT count(*) FROM rooms WHERE roomid NOT IN (SELECT DISTINCT room FROM reservations)	inn_1
SELECT count(*) FROM rooms WHERE roomid NOT IN (SELECT DISTINCT room FROM reservations)	inn_1
SELECT rooms.roomname, COUNT(reservations.code) AS reservation_count FROM rooms JOIN reservations ON rooms.roomid = reservations.room GROUP BY rooms.roomid;	inn_1
SELECT r.roomname, COUNT(reservations.room) FROM rooms r LEFT JOIN reservations ON r.roomid = reservations.room GROUP BY r.roomname;	inn_1
SELECT T2.roomName FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId GROUP BY T1.Room HAVING count(*)  >  60	inn_1
SELECT T2.roomName FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId GROUP BY T1.Room HAVING count(*)  >  60	inn_1
SELECT roomname FROM rooms WHERE baseprice BETWEEN 120 AND 150	inn_1
SELECT roomname FROM rooms WHERE baseprice BETWEEN 120 AND 150	inn_1
SELECT roomname FROM rooms WHERE roomid IN (SELECT room FROM reservations WHERE firstname LIKE '%ROY%')	inn_1
SELECT T2.roomName FROM Reservations AS T1 JOIN Rooms AS T2 ON T1.Room  =  T2.RoomId WHERE firstname LIKE '%ROY%'	inn_1
SELECT T1.cmi_details FROM Customer_Master_Index AS T1 JOIN CMI_Cross_References AS T2 ON T1.master_customer_id  =  T2.master_customer_id WHERE T2.source_system_code  =  'Tax'	local_govt_mdm
SELECT T1.cmi_cross_ref_id ,  T1.source_system_code FROM CMI_Cross_References AS T1 JOIN Council_Tax AS T2 ON T1.cmi_cross_ref_id  =  T2.cmi_cross_ref_id GROUP BY T1.cmi_cross_ref_id HAVING count(*)  >=  1	local_govt_mdm
SELECT crx.cmi_cross_ref_id, crx.master_customer_id, COUNT(br.business_rates_id) AS num_business_rates FROM cmi_cross_references crx LEFT JOIN business_rates br ON crx.cmi_cross_ref_id = br.cmi_cross_ref_id GROUP BY crx.cmi_cross_ref_id, crx.master_customer_id	local_govt_mdm
SELECT T1.source_system_code ,  T2.council_tax_id FROM CMI_Cross_References AS T1 JOIN Benefits_Overpayments AS T2 ON T1.cmi_cross_ref_id  =  T2.cmi_cross_ref_id ORDER BY T2.council_tax_id	local_govt_mdm
SELECT T1.source_system_code ,  T1.master_customer_id ,  T2.council_tax_id FROM CMI_Cross_References AS T1 JOIN Parking_Fines AS T2 ON T1.cmi_cross_ref_id  =  T2.cmi_cross_ref_id	local_govt_mdm
SELECT T1.council_tax_id FROM Rent_Arrears AS T1 JOIN CMI_Cross_References AS T2 ON T1.cmi_cross_ref_id  =  T2.cmi_cross_ref_id JOIN Customer_Master_Index AS T3 ON T3.master_customer_id  =  T2.master_customer_id WHERE T3.cmi_details != 'Schmidt ,  Kertzmann and Lubowitz'	local_govt_mdm
SELECT T1.electoral_register_id FROM Electoral_Register AS T1 JOIN CMI_Cross_References AS T2 ON T1.cmi_cross_ref_id  =  T2.cmi_cross_ref_id WHERE T2.source_system_code  =  'Electoral' OR T2.source_system_code  =  'Tax'	local_govt_mdm
SELECT count(DISTINCT source_system_code) FROM CMI_cross_references	local_govt_mdm
SELECT * FROM customer_master_index ORDER BY cmi_details DESC	local_govt_mdm
SELECT council_tax_id ,  cmi_cross_ref_id FROM parking_fines	local_govt_mdm
SELECT count(*) FROM rent_arrears	local_govt_mdm
SELECT DISTINCT T2.source_system_code FROM customer_master_index AS T1 JOIN cmi_cross_references AS T2 ON T1.master_customer_id  =  T2.master_customer_id WHERE T1.cmi_details  =  'Gottlieb ,  Becker and Wyman'	local_govt_mdm
SELECT cmi_cross_ref_id FROM cmi_cross_references EXCEPT SELECT cmi_cross_ref_id FROM parking_fines	local_govt_mdm
SELECT DISTINCT source_system_code FROM cmi_cross_references WHERE source_system_code LIKE '%en%'	local_govt_mdm
SELECT count(*) FROM party	party_host
SELECT count(*) FROM party	party_host
SELECT Party_Theme FROM party ORDER BY Number_of_hosts ASC	party_host
SELECT Party_Theme FROM party ORDER BY Number_of_hosts ASC	party_host
SELECT Party_Theme ,  LOCATION FROM party	party_host
SELECT Party_Theme ,  LOCATION FROM party	party_host
SELECT First_year ,  Last_year FROM party WHERE Party_Theme  =  'Spring' OR Party_Theme  =  'Teqnology'	party_host
SELECT First_year ,  Last_year FROM party WHERE Party_Theme  =  'Spring' OR Party_Theme  =  'Teqnology'	party_host
SELECT avg(Number_of_hosts) FROM party	party_host
SELECT avg(Number_of_hosts) FROM party	party_host
SELECT LOCATION FROM party ORDER BY Number_of_hosts DESC LIMIT 1	party_host
SELECT LOCATION FROM party ORDER BY Number_of_hosts DESC LIMIT 1	party_host
SELECT Nationality ,  COUNT(*) FROM HOST GROUP BY Nationality	party_host
SELECT Nationality ,  COUNT(*) FROM HOST GROUP BY Nationality	party_host
SELECT nationality FROM host GROUP BY nationality HAVING COUNT(nationality) = (SELECT MAX(count_national) FROM (SELECT nationality, COUNT(nationality) as count_national FROM host GROUP BY nationality) as stats)	party_host
SELECT nationality FROM host GROUP BY nationality HAVING COUNT(nationality) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM host GROUP BY nationality) T)	party_host
SELECT Nationality FROM HOST WHERE Age  >  45 INTERSECT SELECT Nationality FROM HOST WHERE Age  <  35	party_host
SELECT nationality FROM host GROUP BY nationality HAVING MAX(age) > 45 AND MIN(age) < 35;	party_host
SELECT T3.Party_Theme ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID	party_host
SELECT T3.Party_Theme ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID	party_host
SELECT T3.Location ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID ORDER BY T2.Age	party_host
SELECT T3.Location ,  T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID ORDER BY T2.Age	party_host
SELECT T3.Location FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T2.Age  >  50	party_host
SELECT T3.Location FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T2.Age  >  50	party_host
SELECT T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T3.Number_of_hosts  >  20	party_host
SELECT T2.Name FROM party_host AS T1 JOIN HOST AS T2 ON T1.Host_ID  =  T2.Host_ID JOIN party AS T3 ON T1.Party_ID  =  T3.Party_ID WHERE T3.Number_of_hosts  >  20	party_host
SELECT name, nationality FROM host WHERE age = (SELECT MAX(age) FROM host)	party_host
SELECT name, nationality FROM host WHERE age = (SELECT MAX(age) FROM host)	party_host
SELECT Name FROM HOST WHERE Host_ID NOT IN (SELECT Host_ID FROM party_host)	party_host
SELECT Name FROM HOST WHERE Host_ID NOT IN (SELECT Host_ID FROM party_host)	party_host
SELECT count(*) FROM region	storm_record
SELECT count(*) FROM region	storm_record
SELECT region_code ,  region_name FROM region ORDER BY region_code	storm_record
SELECT r.region_code, r.region_name FROM region r ORDER BY r.region_code ASC, r.region_name ASC	storm_record
SELECT region_name FROM region ORDER BY region_name	storm_record
SELECT region_name FROM region ORDER BY region_name	storm_record
SELECT region_name FROM region WHERE region_name != 'Denmark'	storm_record
SELECT region_name FROM region WHERE region_name != 'Denmark'	storm_record
SELECT count(*) FROM storm WHERE Number_Deaths  >  0	storm_record
SELECT count(*) FROM storm WHERE Number_Deaths  >  0	storm_record
SELECT name ,  dates_active ,  number_deaths FROM storm WHERE number_deaths  >=  1	storm_record
SELECT name ,  dates_active ,  number_deaths FROM storm WHERE number_deaths  >=  1	storm_record
SELECT avg(damage_millions_USD) ,  max(damage_millions_USD) FROM storm WHERE max_speed  >  1000	storm_record
SELECT avg(damage_millions_USD) ,  max(damage_millions_USD) FROM storm WHERE max_speed  >  1000	storm_record
SELECT sum(number_deaths) ,  sum(damage_millions_USD) FROM storm WHERE max_speed  >  (SELECT avg(max_speed) FROM storm)	storm_record
SELECT TOTAL(number_deaths), TOTAL(damage_millions_usd) FROM storm WHERE max_speed > (SELECT AVG(max_speed) FROM storm)	storm_record
SELECT name ,  damage_millions_USD FROM storm ORDER BY max_speed DESC	storm_record
SELECT name ,  damage_millions_USD FROM storm ORDER BY max_speed DESC	storm_record
SELECT count(DISTINCT region_id) FROM affected_region	storm_record
SELECT count(DISTINCT region_id) FROM affected_region	storm_record
SELECT region_name FROM region WHERE region_id NOT IN (SELECT region_id FROM affected_region)	storm_record
SELECT region_name FROM region WHERE region_id NOT IN (SELECT region_id FROM affected_region)	storm_record
SELECT T1.region_name ,  count(*) FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id	storm_record
SELECT T1.region_name ,  count(*) FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id	storm_record
SELECT T1.name ,  count(*) FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id	storm_record
SELECT T1.name ,  count(*) FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id	storm_record
SELECT s.name as storm_name, s.max_speed FROM storm s, affected_region ar WHERE s.storm_id = ar.storm_id GROUP BY ar.storm_id HAVING COUNT(DISTINCT ar.region_id) = (SELECT MAX(rc.count) FROM (SELECT storm_id, COUNT(DISTINCT region_id) as count FROM affected_region GROUP BY storm_id) rc)	storm_record
SELECT T1.name ,  T1.max_speed FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id ORDER BY count(*) DESC LIMIT 1	storm_record
SELECT name FROM storm WHERE storm_id NOT IN (SELECT storm_id FROM affected_region)	storm_record
SELECT name FROM storm WHERE storm_id NOT IN (SELECT storm_id FROM affected_region)	storm_record
SELECT name FROM storm WHERE storm_id IN (SELECT storm_id FROM affected_region GROUP BY storm_id HAVING SUM(number_city_affected) >= 10 AND COUNT(DISTINCT region_id) >= 2)	storm_record
SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING count(*)  >=  2 INTERSECT SELECT T1.name FROM storm AS T1 JOIN affected_region AS T2 ON T1.storm_id  =  T2.storm_id GROUP BY T1.storm_id HAVING sum(T2.number_city_affected)  >=  10	storm_record
SELECT name FROM storm WHERE storm_id NOT IN (SELECT storm_id FROM affected_region GROUP BY storm_id HAVING COUNT(DISTINCT region_id) >= 2)	storm_record
SELECT s.name FROM storm s WHERE s.storm_id NOT IN (SELECT ar.storm_id FROM affected_region ar GROUP BY ar.storm_id HAVING COUNT(DISTINCT ar.region_id) >= 2)	storm_record
SELECT region_name FROM region WHERE region_id IN (SELECT region_id FROM affected_region WHERE storm_id IN (SELECT storm_id FROM storm WHERE number_deaths >= 10))	storm_record
SELECT T2.region_name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T3.number_deaths  >=  10	storm_record
SELECT T3.name FROM affected_region AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id JOIN storm AS T3 ON T1.storm_id  =  T3.storm_id WHERE T2.region_name  =  'Denmark'	storm_record
SELECT s.name FROM storm s WHERE EXISTS (SELECT 1 FROM affected_region ar JOIN region r ON ar.region_id = r.region_id WHERE ar.storm_id = s.storm_id AND r.region_name = 'Denmark')	storm_record
SELECT T1.region_name FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id HAVING count(*)  >=  2	storm_record
SELECT T1.region_name FROM region AS T1 JOIN affected_region AS T2 ON T1.region_id = T2.region_id GROUP BY T1.region_id HAVING count(*)  >=  2	storm_record
SELECT region.region_name FROM region INNER JOIN affected_region ON region.region_id = affected_region.region_id WHERE affected_region.storm_id IN (SELECT storm_id FROM storm WHERE number_deaths = (SELECT MAX(number_deaths) FROM storm))	storm_record
SELECT r.region_name FROM region r WHERE EXISTS (SELECT 1 FROM affected_region ar JOIN storm s ON ar.storm_id = s.storm_id AND s.number_deaths = (SELECT MAX(number_deaths) FROM storm) WHERE ar.region_id = r.region_id)	storm_record
SELECT DISTINCT s.name FROM storm s JOIN affected_region ar ON s.storm_id = ar.storm_id JOIN region r ON r.region_id = ar.region_id WHERE r.region_name IN ('Afghanistan', 'Albania') GROUP BY s.storm_id HAVING COUNT(DISTINCT r.region_name) = 2	storm_record
SELECT DISTINCT S.name FROM storm S JOIN affected_region AR ON S.storm_id = AR.storm_id JOIN region R ON AR.region_id = R.region_id WHERE R.region_name IN ('Afghanistan', 'Albania') GROUP BY S.storm_id HAVING COUNT(DISTINCT R.region_name) = 2	storm_record
SELECT count(*) FROM county	election
SELECT count(*) FROM county	election
SELECT County_name ,  Population FROM county	election
SELECT County_name ,  Population FROM county	election
SELECT avg(Population) FROM county	election
SELECT avg(Population) FROM county	election
SELECT max(Population) ,  min(Population) FROM county	election
SELECT max(Population) ,  min(Population) FROM county	election
SELECT DISTINCT District FROM election	election
SELECT DISTINCT District FROM election	election
SELECT Zip_code FROM county WHERE County_name  =  'Howard'	election
SELECT Zip_code FROM county WHERE County_name  =  'Howard'	election
SELECT Delegate FROM election WHERE District  =  1	election
SELECT Delegate FROM election WHERE District  =  1	election
SELECT Delegate ,  Committee FROM election	election
SELECT Delegate ,  Committee FROM election	election
SELECT count(DISTINCT Governor) FROM party	election
SELECT count(DISTINCT Governor) FROM party	election
SELECT Lieutenant_Governor ,  Comptroller FROM party WHERE Party  =  'Democratic'	election
SELECT Lieutenant_Governor ,  Comptroller FROM party WHERE Party  =  'Democratic'	election
SELECT DISTINCT YEAR FROM party WHERE Governor  =  'Eliot Spitzer'	election
SELECT DISTINCT YEAR FROM party WHERE Governor  =  'Eliot Spitzer'	election
SELECT * FROM election	election
SELECT * FROM election	election
SELECT T2.Delegate ,  T1.County_name FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District	election
SELECT T2.Delegate ,  T1.County_name FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District	election
SELECT T2.Delegate FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District WHERE T1.Population  <  100000	election
SELECT T2.Delegate FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District WHERE T1.Population  <  100000	election
SELECT count(DISTINCT T2.Delegate) FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District WHERE T1.Population  >  50000	election
SELECT count(DISTINCT T2.Delegate) FROM county AS T1 JOIN election AS T2 ON T1.County_id  =  T2.District WHERE T1.Population  >  50000	election
SELECT county_name FROM county WHERE county_id IN (SELECT district FROM election WHERE committee = 'Appropriations')	election
SELECT county_name FROM county WHERE county_id IN (SELECT district FROM election WHERE committee = 'Appropriations')	election
SELECT T1.Delegate ,  T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID	election
SELECT T1.Delegate ,  T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID	election
SELECT governor FROM party WHERE party_id IN (SELECT party FROM election WHERE district = 1)	election
SELECT governor FROM party WHERE party_id IN (SELECT DISTINCT party FROM election WHERE district = 1)	election
SELECT comptroller FROM party WHERE party_id IN (SELECT DISTINCT party FROM election WHERE district IN (1, 2))	election
SELECT comptroller FROM party WHERE party_id IN (SELECT party FROM election WHERE district = 1 OR district = 2)	election
SELECT DISTINCT e.committee FROM election e JOIN party p ON e.party = p.party_id WHERE p.party = 'Democratic';	election
SELECT T1.Committee FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T2.Party  =  'Democratic'	election
SELECT c.county_name, (SELECT COUNT(delegate) FROM election WHERE district = c.county_id) as delegate_count FROM county c	election
SELECT county_name, (SELECT COUNT(delegate) FROM Election WHERE County.county_id = Election.district) AS num_delegates FROM County	election
SELECT T2.Party ,  COUNT(*) FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID GROUP BY T1.Party	election
SELECT T2.Party ,  COUNT(*) FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID GROUP BY T1.Party	election
SELECT County_name FROM county ORDER BY Population ASC	election
SELECT County_name FROM county ORDER BY Population ASC	election
SELECT County_name FROM county ORDER BY County_name DESC	election
SELECT County_name FROM county ORDER BY County_name DESC	election
SELECT c.county_name FROM county c WHERE c.population = (SELECT MAX(population) FROM county)	election
SELECT c.county_name FROM county c WHERE c.population = (SELECT MAX(population) FROM county)	election
SELECT County_name FROM county ORDER BY Population ASC LIMIT 3	election
SELECT County_name FROM county ORDER BY Population ASC LIMIT 3	election
SELECT C.county_name FROM county C WHERE C.county_id IN (SELECT E.district FROM election E GROUP BY E.district HAVING COUNT(DISTINCT E.delegate) >= 2)	election
SELECT C.county_name FROM county C INNER JOIN (SELECT district FROM election GROUP BY district HAVING COUNT(distinct delegate) >= 2) E ON C.county_id = E.district	election
SELECT Party FROM party GROUP BY Party HAVING COUNT(*)  >=  2	election
SELECT Party FROM party GROUP BY Party HAVING COUNT(*)  >=  2	election
SELECT T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID GROUP BY T1.Party ORDER BY COUNT(*) DESC LIMIT 1	election
SELECT p.party FROM party p JOIN election e ON p.party_id = e.party GROUP BY p.party ORDER BY COUNT(e.delegate) DESC LIMIT 1	election
SELECT governor FROM party GROUP BY governor HAVING COUNT(governor) = (SELECT MAX(governor_count) FROM (SELECT COUNT(*) as governor_count FROM party GROUP BY governor))	election
WITH GovFrequency AS (SELECT governor, COUNT(*) AS frequency FROM party GROUP BY governor) SELECT governor FROM GovFrequency WHERE frequency = (SELECT MAX(frequency) FROM GovFrequency)	election
SELECT p.comptroller, COUNT(*) as count FROM party p GROUP BY p.comptroller HAVING count = (SELECT MAX(Total) FROM (SELECT comptroller, COUNT(*) as Total FROM party GROUP BY comptroller))	election
SELECT comptroller, COUNT(comptroller) FROM party GROUP BY comptroller HAVING COUNT(comptroller) = (SELECT MAX(count) FROM (SELECT COUNT(comptroller) AS count FROM party GROUP BY comptroller))	election
SELECT Party FROM party WHERE Party_ID NOT IN (SELECT Party FROM election)	election
SELECT Party FROM party WHERE Party_ID NOT IN (SELECT Party FROM election)	election
SELECT T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T1.Committee  =  'Appropriations' INTERSECT SELECT T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T1.Committee  =  'Economic Matters'	election
SELECT T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T1.Committee  =  'Appropriations' INTERSECT SELECT T2.Party FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T1.Committee  =  'Economic Matters'	election
SELECT T1.Committee FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T2.Party  =  'Democratic' INTERSECT SELECT T1.Committee FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T2.Party  =  'Liberal'	election
SELECT T1.Committee FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T2.Party  =  'Democratic' INTERSECT SELECT T1.Committee FROM election AS T1 JOIN party AS T2 ON T1.Party  =  T2.Party_ID WHERE T2.Party  =  'Liberal'	election
SELECT count(*) FROM journalist	news_report
SELECT name FROM journalist ORDER BY years_working, name	news_report
SELECT Nationality ,  Age FROM journalist	news_report
SELECT Name FROM journalist WHERE Nationality  =  'England' OR Nationality  =  'Wales'	news_report
SELECT avg(Years_working) FROM journalist	news_report
SELECT j.nationality FROM journalist j WHERE j.years_working = (SELECT MAX(years_working) FROM journalist)	news_report
SELECT Nationality ,  COUNT(*) FROM journalist GROUP BY Nationality	news_report
WITH NationalityCount AS (SELECT nationality, COUNT(*) AS count FROM journalist GROUP BY nationality) SELECT nationality FROM NationalityCount WHERE count = (SELECT MAX(count) FROM NationalityCount)	news_report
SELECT Nationality FROM journalist WHERE Years_working  >  10 INTERSECT SELECT Nationality FROM journalist WHERE Years_working  <  3	news_report
SELECT Date ,  Name ,  venue FROM event ORDER BY Event_Attendance DESC	news_report
SELECT T3.Name ,  T2.Date FROM news_report AS T1 JOIN event AS T2 ON T1.Event_ID  =  T2.Event_ID JOIN journalist AS T3 ON T1.journalist_ID  =  T3.journalist_ID	news_report
SELECT j.name, e.name FROM journalist j JOIN news_report nr ON j.journalist_id = nr.journalist_id JOIN event e ON nr.event_id = e.event_id ORDER BY j.name ASC, e.name ASC	news_report
SELECT j.name, COUNT(r.event_id) AS reported_events FROM journalist j LEFT JOIN news_report r ON j.journalist_id = r.journalist_id GROUP BY j.journalist_id	news_report
SELECT j.name FROM journalist j JOIN news_report nr ON j.journalist_id = nr.journalist_id GROUP BY j.journalist_id HAVING COUNT(DISTINCT nr.event_id) > 1	news_report
SELECT Name FROM journalist WHERE journalist_ID NOT IN (SELECT journalist_ID FROM news_report)	news_report
SELECT avg(Event_Attendance) ,  max(Event_Attendance) FROM event	news_report
SELECT avg(t1.age) ,  avg(Years_working) ,  t2.work_type FROM journalist AS t1 JOIN news_report AS t2 ON t1.journalist_id  =  t2.journalist_id GROUP BY t2.work_type	news_report
WITH RankedEvents AS (SELECT venue, name, RANK() OVER (ORDER BY event_attendance DESC) as rank FROM event) SELECT venue, name FROM RankedEvents WHERE rank <= 2	news_report
SELECT * FROM restaurant;	restaurant_1
SELECT Address FROM Restaurant WHERE ResName = 'Subway';	restaurant_1
SELECT Rating FROM Restaurant WHERE ResName = 'Subway';	restaurant_1
SELECT ResTypeName FROM Restaurant_Type;	restaurant_1
SELECT ResTypeDescription FROM Restaurant_Type WHERE ResTypeName = 'Sandwich';	restaurant_1
SELECT resname, rating FROM restaurant WHERE rating = (SELECT MAX(rating) FROM restaurant)	restaurant_1
SELECT Age FROM Student WHERE Fname = 'Linda' AND Lname = 'Smith';	restaurant_1
SELECT Sex FROM Student WHERE Fname = 'Linda' AND Lname = 'Smith';	restaurant_1
SELECT Fname , Lname FROM Student WHERE Major  =  600;	restaurant_1
SELECT city_code FROM Student WHERE Fname = 'Linda' AND Lname = 'Smith';	restaurant_1
SELECT count(*) FROM Student WHERE Advisor =  1121;	restaurant_1
SELECT advisor, COUNT(stuid) FROM student GROUP BY advisor HAVING COUNT(stuid) = (SELECT MAX(student_count) FROM (SELECT COUNT(stuid) AS student_count FROM student GROUP BY advisor))	restaurant_1
WITH StudentCounts AS (SELECT major, COUNT(stuid) AS num_students FROM student GROUP BY major) SELECT major, num_students FROM StudentCounts WHERE num_students = (SELECT MIN(num_students) FROM StudentCounts)	restaurant_1
SELECT Major ,  count(*) FROM Student GROUP BY Major HAVING count(Major) BETWEEN 2 AND 30;	restaurant_1
SELECT Fname , Lname FROM Student WHERE Age  >  18 AND Major = 600;	restaurant_1
SELECT Fname , Lname FROM Student WHERE Age  >  18 AND Major != 600 AND Sex = 'F';	restaurant_1
SELECT COUNT(DISTINCT restaurant.resid) FROM restaurant INNER JOIN type_of_restaurant ON restaurant.resid = type_of_restaurant.resid INNER JOIN restaurant_type ON type_of_restaurant.restypeid = restaurant_type.restypeid WHERE restaurant_type.restypename = 'Sandwich'	restaurant_1
SELECT sum(Spent) FROM Student JOIN Visits_Restaurant ON Student.StuID = Visits_Restaurant.StuID WHERE Student.Fname = 'Linda' AND Student.Lname = 'Smith';	restaurant_1
SELECT count(*) FROM Student JOIN Visits_Restaurant ON Student.StuID = Visits_Restaurant.StuID JOIN Restaurant ON Visits_Restaurant.ResID = Restaurant.ResID WHERE Student.Fname = 'Linda' AND Student.Lname = 'Smith' AND Restaurant.ResName = 'Subway';	restaurant_1
SELECT TIME FROM Student JOIN Visits_Restaurant ON Student.StuID = Visits_Restaurant.StuID JOIN Restaurant ON Visits_Restaurant.ResID = Restaurant.ResID WHERE Student.Fname = 'Linda' AND Student.Lname = 'Smith' AND Restaurant.ResName = 'Subway';	restaurant_1
SELECT Restaurant.ResName ,  sum(Visits_Restaurant.Spent) FROM Visits_Restaurant JOIN Restaurant ON Visits_Restaurant.ResID = Restaurant.ResID GROUP BY Restaurant.ResID ORDER BY sum(Visits_Restaurant.Spent) ASC LIMIT 1;	restaurant_1
SELECT first_name, last_name FROM (SELECT s.fname AS first_name, s.lname AS last_name, COUNT(v.resid) AS visit_count FROM student s JOIN visits_restaurant v ON s.stuid = v.stuid GROUP BY v.stuid) ORDER BY visit_count DESC LIMIT 1	restaurant_1
SELECT actual_order_id FROM actual_orders WHERE order_status_code  =  'Success'	customer_deliveries
SELECT t1.product_name ,   t1.product_price FROM products AS t1 JOIN regular_order_products AS t2 ON t1.product_id  =  t2.product_id GROUP BY t2.product_id ORDER BY count(*) DESC LIMIT 1	customer_deliveries
SELECT count(*) FROM customers	customer_deliveries
SELECT count(DISTINCT payment_method) FROM customers	customer_deliveries
SELECT truck_details FROM trucks ORDER BY truck_licence_number	customer_deliveries
SELECT product_name FROM products WHERE product_price = (SELECT MAX(product_price) FROM products)	customer_deliveries
SELECT DISTINCT customer_name FROM customers AS c WHERE NOT EXISTS (SELECT * FROM customer_addresses AS ca INNER JOIN addresses AS a ON ca.address_id = a.address_id WHERE a.state_province_county = 'California' AND ca.customer_id = c.customer_id)	customer_deliveries
SELECT customer_email ,  customer_name FROM customers WHERE payment_method  =  'Visa'	customer_deliveries
SELECT customer_name, customer_phone FROM customers WHERE exists (SELECT 1 FROM customer_addresses JOIN addresses ON customer_addresses.address_id = addresses.address_id WHERE addresses.state_province_county = 'California' AND customer_addresses.customer_id = customers.customer_id)	customer_deliveries
SELECT state_province_county FROM addresses EXCEPT SELECT state_province_county FROM addresses WHERE address_id IN (SELECT employee_address_id FROM employees)	customer_deliveries
SELECT customer_name ,  customer_phone ,  customer_email FROM Customers ORDER BY date_became_customer	customer_deliveries
SELECT customer_name FROM Customers ORDER BY date_became_customer LIMIT 5	customer_deliveries
WITH PaymentCount AS (SELECT payment_method, COUNT(*) AS num FROM customers GROUP BY payment_method) SELECT payment_method FROM PaymentCount WHERE num = (SELECT MAX(num) FROM PaymentCount)	customer_deliveries
SELECT route_name FROM delivery_routes ORDER BY route_name COLLATE NOCASE	customer_deliveries
SELECT route_name FROM delivery_routes WHERE route_id IN (SELECT route_id FROM delivery_route_locations JOIN order_deliveries USING(location_code) GROUP BY route_id ORDER BY COUNT(*) DESC LIMIT 1)	customer_deliveries
SELECT state_province_county AS state, COUNT(DISTINCT customers.customer_id) AS customer_count FROM customers JOIN customer_addresses ON customers.customer_id = customer_addresses.customer_id JOIN addresses ON customer_addresses.address_id = addresses.address_id GROUP BY state_province_county	customer_deliveries
SELECT count(*) FROM authors	icfp_1
SELECT count(*) FROM authors	icfp_1
SELECT count(*) FROM inst	icfp_1
SELECT count(*) FROM inst	icfp_1
SELECT count(*) FROM papers	icfp_1
SELECT count(*) FROM papers	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Jeremy' AND t1.lname  =  'Gibbons'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Jeremy' AND t1.lname  =  'Gibbons'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Aaron' AND t1.lname  =  'Turon'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Aaron' AND t1.lname  =  'Turon'	icfp_1
SELECT count(*) FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Atsushi' AND t1.lname  =  'Ohori'	icfp_1
SELECT count(*) FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE  t1.fname  =  'Atsushi' AND t1.lname  =  'Ohori'	icfp_1
SELECT DISTINCT t3.name FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t1.fname  =  'Matthias' AND t1.lname  =  'Blume'	icfp_1
SELECT DISTINCT t3.name FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t1.fname  =  'Matthias' AND t1.lname  =  'Blume'	icfp_1
SELECT DISTINCT t3.name FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t1.fname  =  'Katsuhiro' AND t1.lname  =  'Ueno'	icfp_1
SELECT i.name FROM inst i JOIN authorship a ON i.instid = a.instid JOIN authors au ON a.authid = au.authid WHERE au.fname = 'Katsuhiro' AND au.lname = 'Ueno'	icfp_1
SELECT fname, lname FROM authors WHERE authid IN (SELECT authid FROM authorship WHERE instid IN (SELECT instid FROM inst WHERE name = 'University of Oxford'))	icfp_1
SELECT a.fname, a.lname From authors a WHERE EXISTS (SELECT 1 FROM inst i JOIN authorship au ON i.instid = au.instid WHERE au.authid = a.authid AND i.name = 'University of Oxford');	icfp_1
SELECT DISTINCT t1.fname ,  t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t3.name  =  'Google'	icfp_1
SELECT DISTINCT t1.fname ,  t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t3.name  =  'Google'	icfp_1
SELECT t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t3.title  =  'Binders Unbound'	icfp_1
SELECT lname FROM authors WHERE authid IN (SELECT authorship.authid FROM authorship JOIN papers ON authorship.paperid = papers.paperid WHERE papers.title = 'Binders Unbound')	icfp_1
SELECT t1.fname ,  t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t3.title  =  'Nameless ,  Painless'	icfp_1
SELECT t1.fname ,  t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t3.title  =  'Nameless ,  Painless'	icfp_1
SELECT DISTINCT t1.title FROM papers AS t1 JOIN authorship AS t2 ON t1.paperid  =  t2.paperid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t3.name  =  'Indiana University'	icfp_1
SELECT DISTINCT t1.title FROM papers AS t1 JOIN authorship AS t2 ON t1.paperid  =  t2.paperid JOIN inst AS t3 ON t2.instid  =  t3.instid WHERE t3.name  =  'Indiana University'	icfp_1
SELECT title FROM papers WHERE EXISTS (SELECT 1 FROM authorship JOIN inst ON authorship.instid = inst.instid WHERE inst.name = 'Google' AND authorship.paperid = papers.paperid)	icfp_1
SELECT title FROM papers WHERE paperid IN (SELECT paperid FROM authorship WHERE instid IN (SELECT instid FROM inst WHERE name = 'Google'));	icfp_1
SELECT COUNT(*) FROM (SELECT DISTINCT paperid FROM authorship WHERE instid IN (SELECT instid FROM inst WHERE name = 'Tokohu University'))	icfp_1
SELECT COUNT(DISTINCT papers.paperid) FROM papers JOIN authorship ON papers.paperid = authorship.paperid JOIN inst ON authorship.instid = inst.instid WHERE inst.name = 'Tokohu University'	icfp_1
SELECT COUNT(DISTINCT papers.paperid) FROM papers JOIN authorship ON papers.paperid = authorship.paperid JOIN inst ON authorship.instid = inst.instid WHERE inst.name = 'University of Pennsylvania'	icfp_1
SELECT COUNT(DISTINCT p.paperid) FROM papers AS p INNER JOIN authorship AS a ON p.paperid = a. paperid INNER JOIN inst AS i ON a.instid = i.instid WHERE i.name = 'University of Pennsylvania'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t1.fname  =  'Olin' AND t1.lname  =  'Shivers'	icfp_1
SELECT title FROM papers WHERE paperid IN (SELECT paperid FROM authorship WHERE authid = (SELECT authid FROM authors WHERE fname = 'Olin' AND lname = 'Shivers'))	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t1.fname  =  'Stephanie' AND t1.lname  =  'Weirich'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t1.fname  =  'Stephanie' AND t1.lname  =  'Weirich'	icfp_1
SELECT title FROM papers WHERE paperid IN (SELECT paperid FROM authorship WHERE authid IN (SELECT authid FROM authors WHERE lname = 'Turon') AND authorder = 2 AND instid IN (SELECT instid FROM inst WHERE country = 'USA'))	icfp_1
SELECT title FROM papers WHERE paperid IN (SELECT paperid FROM authorship WHERE authid IN (SELECT authid FROM authors WHERE lname = 'Turon') AND instid IN (SELECT instid FROM inst WHERE country = 'USA') AND authorder = 2)	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid JOIN inst AS t4 ON t2.instid  =  t4.instid WHERE t4.country  =  'Japan' AND t2.authorder  =  1 AND t1.lname  =  'Ohori'	icfp_1
SELECT t3.title FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid JOIN inst AS t4 ON t2.instid  =  t4.instid WHERE t4.country  =  'Japan' AND t2.authorder  =  1 AND t1.lname  =  'Ohori'	icfp_1
SELECT maximum_author.lname FROM authors maximum_author JOIN (SELECT authorship.authid FROM authorship GROUP BY authorship.authid HAVING COUNT(authorship.paperid) = (SELECT MAX(publication_counts.pc) FROM (SELECT COUNT(paperid) AS pc FROM authorship GROUP BY authid) publication_counts)) winners ON maximum_author.authid = winners.authid	icfp_1
SELECT lname FROM authors WHERE authid IN (SELECT authid FROM authorship GROUP BY authid HAVING COUNT(paperid) = (SELECT MAX(TotPapers) FROM (SELECT COUNT(paperid) AS TotPapers FROM authorship GROUP BY authid)))	icfp_1
SELECT t1.country FROM inst AS t1 JOIN authorship AS t2 ON t1.instid  =  t2.instid JOIN papers AS t3 ON t2.paperid  =  t3.paperid GROUP BY t1.country ORDER BY count(*) DESC LIMIT 1	icfp_1
SELECT i.country FROM (SELECT instid FROM authorship GROUP BY instid HAVING COUNT(paperid) = (SELECT MAX(p_count) FROM (SELECT COUNT(paperid) AS p_count FROM authorship GROUP BY instid))) t INNER JOIN inst i ON i.instid = t.instid	icfp_1
SELECT I.name FROM inst I INNER JOIN authorship A ON I.instid = A.instid GROUP BY I.instid HAVING COUNT(DISTINCT A.paperid) = (SELECT MAX(Cnt) FROM (SELECT COUNT(DISTINCT A2.paperid) AS Cnt FROM authorship A2 GROUP BY A2.instid))	icfp_1
SELECT name FROM inst WHERE instid IN (SELECT instid FROM authorship GROUP BY instid HAVING COUNT(paperid) = (SELECT MAX(Cnt) FROM (SELECT COUNT(paperid) AS Cnt FROM authorship GROUP BY instid)))	icfp_1
SELECT title FROM papers WHERE INSTR(title, 'ML') > 0;	icfp_1
SELECT p.title FROM papers AS p WHERE p.title GLOB '*ML*'	icfp_1
SELECT title FROM papers WHERE title LIKE '%Database%'	icfp_1
SELECT title FROM papers WHERE title LIKE '%Database%'	icfp_1
SELECT DISTINCT a.fname FROM authors a JOIN authorship ash ON a.authid = ash.authid JOIN papers p ON ash.paperid = p.paperid WHERE p.title LIKE '%Functional%'	icfp_1
SELECT authors.fname FROM authors WHERE EXISTS (SELECT 1 FROM authorship WHERE authorship.authid = authors.authid AND authorship.paperid IN (SELECT paperid FROM papers WHERE title LIKE '%Functional%'))	icfp_1
SELECT lname FROM authors WHERE authid IN (SELECT authid FROM authorship WHERE paperid IN (SELECT paperid FROM papers WHERE title LIKE '%Monadic%'))	icfp_1
SELECT t1.lname FROM authors AS t1 JOIN authorship AS t2 ON t1.authid  =  t2.authid JOIN papers AS t3 ON t2.paperid  =  t3.paperid WHERE t3.title LIKE '%Monadic%'	icfp_1
SELECT papers.title FROM papers INNER JOIN (SELECT paperid, COUNT(authid) AS num_authors FROM authorship GROUP BY paperid) AS temp ON papers.paperid = temp.paperid WHERE num_authors = (SELECT MAX(num_authors) FROM (SELECT COUNT(authid) AS num_authors FROM authorship GROUP BY paperid))	icfp_1
SELECT p.title FROM papers p WHERE p.paperid = (SELECT a.paperid FROM authorship a GROUP BY a.paperid ORDER BY COUNT(a.authid) DESC LIMIT 1)	icfp_1
SELECT fname FROM authors WHERE lname  =  'Ueno'	icfp_1
SELECT fname FROM authors WHERE lname  =  'Ueno'	icfp_1
SELECT lname FROM authors WHERE fname  =  'Amal'	icfp_1
SELECT lname FROM authors WHERE fname  =  'Amal'	icfp_1
SELECT fname FROM authors ORDER BY fname	icfp_1
SELECT fname FROM authors ORDER BY fname	icfp_1
SELECT lname FROM authors ORDER BY lname	icfp_1
SELECT lname FROM authors ORDER BY lname	icfp_1
SELECT fname ,  lname FROM authors ORDER BY lname	icfp_1
SELECT fname ,  lname FROM authors ORDER BY lname	icfp_1
SELECT count(DISTINCT last_name) FROM actor	sakila_1
SELECT count(DISTINCT last_name) FROM actor	sakila_1
SELECT first_name FROM actor GROUP BY first_name ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT first FROM (SELECT first_name as first, COUNT(actor_id) as cnt FROM actor GROUP BY first_name) WHERE cnt = (SELECT MAX(c) FROM (SELECT COUNT(actor_id) as c FROM actor GROUP BY first_name))	sakila_1
SELECT first_name || ' ' || last_name FROM actor JOIN film_actor ON film_actor.actor_id = actor.actor_id GROUP BY first_name, last_name HAVING COUNT(film_actor.film_id) = MAX((SELECT COUNT(film_id) FROM film_actor GROUP BY actor_id))	sakila_1
WITH Counter AS (SELECT first_Name || ' ' || last_name AS full_name, COUNT(*) AS times FROM actor GROUP BY full_name) SELECT full_name FROM Counter WHERE times = (SELECT MAX(times) FROM Counter)	sakila_1
SELECT district FROM address GROUP BY district HAVING count(*)  >=  2	sakila_1
SELECT district FROM address GROUP BY district HAVING count(*)  >=  2	sakila_1
SELECT phone ,  postal_code FROM address WHERE address  =  '1031 Daugavpils Parkway'	sakila_1
SELECT phone ,  postal_code FROM address WHERE address  =  '1031 Daugavpils Parkway'	sakila_1
SELECT c.city, COUNT(a.address_id) AS address_count, c.city_id FROM city c, address a WHERE c.city_id = a.city_id GROUP BY c.city_id HAVING address_count = (SELECT MAX(count) FROM (SELECT COUNT(address_id) AS count FROM address GROUP BY city_id))	sakila_1
SELECT city.city, city.city_id, COUNT(address.address_id) AS address_count FROM city LEFT JOIN address ON city.city_id = address.city_id GROUP BY city.city_id HAVING address_count = (SELECT MAX(count) FROM (SELECT COUNT(address_id) AS count FROM address GROUP BY city_id))	sakila_1
SELECT count(*) FROM address WHERE district  =  'California'	sakila_1
SELECT count(*) FROM address WHERE district  =  'California'	sakila_1
SELECT title ,  film_id FROM film WHERE rental_rate  =  0.99 INTERSECT SELECT T1.title ,  T1.film_id FROM film AS T1 JOIN inventory AS T2 ON T1.film_id  =  T2.film_id GROUP BY T1.film_id HAVING count(*)  <  3	sakila_1
SELECT f.title, f.film_id FROM film f WHERE f.rental_rate = 0.99 AND (SELECT COUNT(*) FROM inventory WHERE film_id = f.film_id) < 3	sakila_1
SELECT count(*) FROM city AS T1 JOIN country AS T2 ON T1.country_id  =  T2.country_id WHERE T2.country  =  'Australia'	sakila_1
SELECT count(*) FROM city AS T1 JOIN country AS T2 ON T1.country_id  =  T2.country_id WHERE T2.country  =  'Australia'	sakila_1
SELECT DISTINCT cntry.country FROM country cntry, city cty WHERE cntry.country_id = cty.country_id GROUP BY cntry.country_id, cntry.country HAVING COUNT(cty.city_id) >= 3	sakila_1
SELECT T2.country FROM city AS T1 JOIN country AS T2 ON T1.country_id  =  T2.country_id GROUP BY T2.country_id HAVING count(*)  >=  3	sakila_1
SELECT DISTINCT p.payment_date FROM payment p JOIN staff s ON p.staff_id = s.staff_id WHERE p.amount > 10 AND s.first_name = 'Elsa'	sakila_1
SELECT p.payment_date FROM payment p JOIN staff s ON p.staff_id = s.staff_id WHERE p.amount > 10 OR s.first_name = 'Elsa'	sakila_1
SELECT count(*) FROM customer WHERE active = '1'	sakila_1
SELECT count(*) FROM customer WHERE active = '1'	sakila_1
SELECT title, rental_rate FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film)	sakila_1
SELECT f.title, f.rental_rate FROM film f WHERE f.rental_rate = (SELECT MAX(rental_rate) FROM film)	sakila_1
SELECT T2.title ,  T2.film_id ,  T2.description FROM film_actor AS T1 JOIN film AS T2 ON T1.film_id  =  T2.film_id GROUP BY T2.film_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT f1.title, f1.film_id, f1.description FROM film f1 WHERE EXISTS (SELECT NULL FROM film_actor fa WHERE fa.film_id = f1.film_id GROUP BY fa.film_id HAVING COUNT(fa.actor_id) = (SELECT MAX(c) FROM (SELECT COUNT(fa2.actor_id) AS c FROM film_actor fa2 GROUP BY fa2.film_id)))	sakila_1
SELECT A.first_name, A.last_name, A.actor_id FROM actor A WHERE A.actor_id IN (SELECT FA.actor_id FROM film_actor FA GROUP BY FA.actor_id HAVING COUNT(FA.film_id) = (SELECT MAX(COUNT_FILM) FROM (SELECT COUNT(film_id) AS COUNT_FILM FROM film_actor GROUP BY actor_id)))	sakila_1
SELECT a.actor_id, a.first_name || ' ' || a.last_name AS full_name FROM actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id GROUP BY a.actor_id ORDER BY COUNT(fa.film_id) DESC LIMIT 1	sakila_1
SELECT T2.first_name ,  T2.last_name FROM film_actor AS T1 JOIN actor AS T2 ON T1.actor_id  =  T2.actor_id GROUP BY T2.actor_id HAVING count(*)  >  30	sakila_1
SELECT a.first_name || ' ' || a.last_name AS full_name FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id GROUP BY a.actor_id HAVING COUNT(fa.film_id) > 30	sakila_1
SELECT store_id FROM inventory GROUP BY store_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT store_id FROM inventory GROUP BY store_id HAVING COUNT(*) = (SELECT MAX(total_inventory) FROM (SELECT COUNT(*) AS total_inventory FROM inventory GROUP BY store_id))	sakila_1
SELECT sum(amount) FROM payment	sakila_1
SELECT sum(amount) FROM payment	sakila_1
SELECT c.first_name, c.last_name, c.customer_id FROM customer c WHERE c.customer_id IN (SELECT customer_id FROM payment GROUP BY customer_id HAVING SUM(amount) = (SELECT MIN(total_spent) FROM (SELECT SUM(amount) AS total_spent FROM payment GROUP BY customer_id)))	sakila_1
SELECT T1.first_name ,  T1.last_name ,  T1.customer_id FROM customer AS T1 JOIN payment AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY sum(amount) ASC LIMIT 1	sakila_1
SELECT c.name FROM category c WHERE EXISTS ( SELECT 1 FROM film_category fc JOIN film f ON fc.film_id = f.film_id WHERE fc.category_id = c.category_id AND f.title = 'HUNGER ROOF')	sakila_1
SELECT CA.name FROM category AS CA WHERE EXISTS(SELECT 1 FROM film_category AS FC JOIN film AS F ON FC.film_id = F.film_id WHERE F.title = 'HUNGER ROOF' AND FC.category_id = CA.category_id)	sakila_1
SELECT name, category_id, (SELECT COUNT(*) FROM film_category WHERE category_id = c.category_id) AS total_films FROM category c	sakila_1
SELECT name, category_id, (SELECT COUNT(*) FROM film_category WHERE film_category.category_id = category.category_id) AS film_count FROM category	sakila_1
SELECT T1.title ,  T1.film_id FROM film AS T1 JOIN inventory AS T2 ON T1.film_id  =  T2.film_id GROUP BY T1.film_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT title, film.film_id FROM film, inventory WHERE film.film_id = inventory.film_id GROUP BY inventory.film_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM inventory GROUP BY film_id))	sakila_1
SELECT T1.title ,  T2.inventory_id FROM film AS T1 JOIN inventory AS T2 ON T1.film_id  =  T2.film_id JOIN rental AS T3 ON T2.inventory_id  =  T3.inventory_id GROUP BY T2.inventory_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT T1.title ,  T2.inventory_id FROM film AS T1 JOIN inventory AS T2 ON T1.film_id  =  T2.film_id JOIN rental AS T3 ON T2.inventory_id  =  T3.inventory_id GROUP BY T2.inventory_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT count(DISTINCT language_id) FROM film	sakila_1
SELECT count(DISTINCT language_id) FROM film	sakila_1
SELECT title FROM film WHERE rating  =  'R'	sakila_1
SELECT title FROM film WHERE rating  =  'R'	sakila_1
SELECT T2.address FROM store AS T1 JOIN address AS T2 ON T1.address_id  =  T2.address_id WHERE store_id  =  1	sakila_1
SELECT T2.address FROM store AS T1 JOIN address AS T2 ON T1.address_id  =  T2.address_id WHERE store_id  =  1	sakila_1
WITH CountedPayments AS (SELECT staff_id, COUNT(payment_id) AS Total FROM payment GROUP BY staff_id), MinimalPayments AS (SELECT staff_id FROM CountedPayments WHERE Total = (SELECT MIN(Total) FROM CountedPayments)) SELECT staff.staff_id, staff.first_name || ' ' || staff.last_name AS full_name FROM staff INNER JOIN MinimalPayments ON staff.staff_id = MinimalPayments.staff_id	sakila_1
SELECT T1.first_name ,  T1.last_name ,  T1.staff_id FROM staff AS T1 JOIN payment AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T1.staff_id ORDER BY count(*) ASC LIMIT 1	sakila_1
SELECT T2.name FROM film AS T1 JOIN LANGUAGE AS T2 ON T1.language_id  =  T2.language_id WHERE T1.title  =  'AIRPORT POLLOCK'	sakila_1
SELECT T2.name FROM film AS T1 JOIN LANGUAGE AS T2 ON T1.language_id  =  T2.language_id WHERE T1.title  =  'AIRPORT POLLOCK'	sakila_1
SELECT count(*) FROM store	sakila_1
SELECT count(*) FROM store	sakila_1
SELECT count(DISTINCT rating) FROM film	sakila_1
SELECT count(DISTINCT rating) FROM film	sakila_1
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%'	sakila_1
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%'	sakila_1
SELECT count(*) FROM inventory WHERE store_id  =  1	sakila_1
SELECT count(*) FROM inventory WHERE store_id  =  1	sakila_1
SELECT payment_date FROM payment ORDER BY payment_date ASC LIMIT 1	sakila_1
SELECT payment_date FROM payment ORDER BY payment_date ASC LIMIT 1	sakila_1
SELECT T2.address ,  T1.email FROM customer AS T1 JOIN address AS T2 ON T2.address_id  =  T1.address_id WHERE T1.first_name  =  'LINDA'	sakila_1
SELECT T2.address ,  T1.email FROM customer AS T1 JOIN address AS T2 ON T2.address_id  =  T1.address_id WHERE T1.first_name  =  'LINDA'	sakila_1
SELECT title FROM film WHERE (length > 100 OR rating = 'PG') AND replacement_cost <= 200	sakila_1
SELECT title FROM film WHERE (length > 100 OR rating = 'PG') AND replacement_cost <= 200	sakila_1
SELECT T1.first_name ,  T1.last_name FROM customer AS T1 JOIN rental AS T2 ON T1.customer_id  =  T2.customer_id ORDER BY T2.rental_date ASC LIMIT 1	sakila_1
SELECT customer.first_name || ' ' || customer.last_name AS full_name FROM rental INNER JOIN customer ON rental.customer_id = customer.customer_id ORDER BY rental.rental_date ASC LIMIT 1	sakila_1
SELECT DISTINCT T1.first_name ,  T1.last_name FROM staff AS T1 JOIN rental AS T2 ON T1.staff_id  =  T2.staff_id JOIN customer AS T3 ON T2.customer_id  =  T3.customer_id WHERE T3.first_name  =  'APRIL' AND T3.last_name  =  'BURNS'	sakila_1
SELECT DISTINCT T1.first_name ,  T1.last_name FROM staff AS T1 JOIN rental AS T2 ON T1.staff_id  =  T2.staff_id JOIN customer AS T3 ON T2.customer_id  =  T3.customer_id WHERE T3.first_name  =  'APRIL' AND T3.last_name  =  'BURNS'	sakila_1
SELECT store_id FROM customer GROUP BY store_id ORDER BY count(*) DESC LIMIT 1	sakila_1
SELECT store_id FROM customer GROUP BY store_id HAVING COUNT(customer_id) = (SELECT MAX(count) FROM (SELECT store_id, COUNT(customer_id) as count FROM customer GROUP BY store_id) as MaxCount)	sakila_1
SELECT amount FROM payment ORDER BY amount DESC LIMIT 1	sakila_1
SELECT amount FROM payment ORDER BY amount DESC LIMIT 1	sakila_1
SELECT T2.address FROM staff AS T1 JOIN address AS T2 ON T1.address_id  =  T2.address_id WHERE T1.first_name  =  'Elsa'	sakila_1
SELECT T2.address FROM staff AS T1 JOIN address AS T2 ON T1.address_id  =  T2.address_id WHERE T1.first_name  =  'Elsa'	sakila_1
SELECT first_name FROM customer WHERE customer_id NOT IN( SELECT customer_id FROM rental WHERE rental_date  >  '2005-08-23 02:06:01' )	sakila_1
SELECT first_name FROM customer WHERE customer_id NOT IN( SELECT customer_id FROM rental WHERE rental_date  >  '2005-08-23 02:06:01' )	sakila_1
SELECT count(*) FROM bank	loan_1
SELECT count(*) FROM bank	loan_1
SELECT COUNT(*) FROM customer	loan_1
SELECT sum(no_of_customers) FROM bank	loan_1
SELECT sum(no_of_customers) FROM bank WHERE city  =  'New York City'	loan_1
SELECT TOTAL(no_of_customers) FROM bank WHERE city = 'New York City'	loan_1
SELECT avg(no_of_customers) FROM bank WHERE state  =  'Utah'	loan_1
SELECT avg(no_of_customers) FROM bank WHERE state  =  'Utah'	loan_1
SELECT avg(no_of_customers) FROM bank	loan_1
SELECT avg(no_of_customers) FROM bank	loan_1
SELECT city ,  state FROM bank WHERE bname  =  'morningside'	loan_1
SELECT city ,  state FROM bank WHERE bname  =  'morningside'	loan_1
SELECT bname FROM bank WHERE state  =  'New York'	loan_1
SELECT bname FROM bank WHERE state  =  'New York'	loan_1
SELECT cust_name FROM customer ORDER BY acc_bal	loan_1
SELECT cust_name FROM customer ORDER BY acc_bal	loan_1
SELECT cust_name FROM customer WHERE cust_id IN (SELECT cust_id FROM loan GROUP BY cust_id ORDER BY SUM(amount) DESC)	loan_1
SELECT cust_name FROM (SELECT cust_name, SUM(amount) AS total_amount FROM customer JOIN loan ON customer.cust_id = loan.cust_id GROUP BY cust_name) ORDER BY total_amount DESC	loan_1
SELECT state ,  acc_type ,  credit_score FROM customer WHERE no_of_loans  =  0	loan_1
SELECT state ,  acc_type ,  credit_score FROM customer WHERE no_of_loans  =  0	loan_1
SELECT count(DISTINCT city) FROM bank	loan_1
SELECT count(DISTINCT city) FROM bank	loan_1
SELECT count(DISTINCT state) FROM bank	loan_1
SELECT count(DISTINCT state) FROM bank	loan_1
SELECT count(DISTINCT acc_type) FROM customer	loan_1
SELECT count(DISTINCT acc_type) FROM customer	loan_1
SELECT cust_name ,  acc_bal FROM customer WHERE cust_name LIKE '%a%'	loan_1
SELECT cust_name ,  acc_bal FROM customer WHERE cust_name LIKE '%a%'	loan_1
SELECT cust_id, SUM(acc_bal) AS total_balance FROM customer WHERE state IN ('Texas', 'Utah') GROUP BY cust_id	loan_1
SELECT cust_name, SUM(acc_bal) AS TotalBalance FROM customer WHERE state IN ('Texas', 'Utah') GROUP BY cust_id;	loan_1
SELECT c.cust_name FROM customer c WHERE EXISTS (SELECT 1 FROM customer co WHERE co.cust_id = c.cust_id AND co.acc_type = 'saving') AND EXISTS (SELECT 1 FROM customer co WHERE co.cust_id = c.cust_id AND co.acc_type = 'checking')	loan_1
SELECT cust_name FROM customer WHERE acc_type  =  'saving' INTERSECT SELECT cust_name FROM customer WHERE acc_type  =  'checking'	loan_1
SELECT DISTINCT cust_name FROM customer WHERE acc_type IS NOT 'saving'	loan_1
SELECT cust_name FROM customer EXCEPT SELECT cust_name FROM customer WHERE acc_type  =  'saving'	loan_1
SELECT cust_name FROM customer WHERE cust_id NOT IN (SELECT cust_id FROM loan WHERE loan_type = 'Mortgages')	loan_1
SELECT c.cust_name FROM customer c WHERE c.cust_id NOT IN (SELECT l.cust_id FROM loan l WHERE l.loan_type = 'Mortage')	loan_1
SELECT cust_name FROM customer WHERE cust_id IN (SELECT cust_id FROM loan WHERE loan_type = 'Auto') AND cust_id IN (SELECT cust_id FROM loan WHERE loan_type = 'Mortgages')	loan_1
SELECT c.cust_name FROM customer c WHERE EXISTS (SELECT 1 FROM loan l1 WHERE l1.cust_id = c.cust_id AND l1.loan_type = 'Auto') AND EXISTS (SELECT 1 FROM loan l2 WHERE l2.cust_id = c.cust_id AND l2.loan_type = 'Mortgages')	loan_1
SELECT cust_name FROM customer WHERE credit_score  <  (SELECT avg(credit_score) FROM customer)	loan_1
SELECT cust_name FROM customer WHERE credit_score  <  (SELECT avg(credit_score) FROM customer)	loan_1
SELECT bname FROM bank WHERE no_of_customers = (SELECT MAX(no_of_customers) FROM bank)	loan_1
SELECT bname FROM bank WHERE no_of_customers = (SELECT MAX(no_of_customers) FROM bank)	loan_1
SELECT cust_name FROM customer WHERE credit_score = (SELECT MIN(credit_score) FROM customer)	loan_1
SELECT cust_name FROM customer WHERE credit_score = (SELECT MIN(credit_score) FROM customer)	loan_1
SELECT cust_name, acc_type, acc_bal FROM customer WHERE credit_score = (SELECT MAX(credit_score) FROM customer)	loan_1
SELECT cust_name, acc_type, acc_bal FROM customer WHERE credit_score = (SELECT MAX(credit_score) FROM customer)	loan_1
SELECT cust_name FROM customer WHERE cust_id = (SELECT cust_id FROM loan ORDER BY amount DESC LIMIT 1)	loan_1
SELECT cust_name FROM customer WHERE cust_id = (SELECT cust_id FROM loan GROUP BY cust_id ORDER BY SUM(amount) DESC LIMIT 1)	loan_1
SELECT state FROM (SELECT state, COUNT(*) as num_customers FROM customer GROUP BY state) WHERE num_customers = (SELECT MAX(num_customers) FROM (SELECT state, COUNT(*) as num_customers FROM customer GROUP BY state))	loan_1
SELECT state FROM bank GROUP BY state ORDER BY sum(no_of_customers) DESC LIMIT 1	loan_1
SELECT avg(acc_bal) ,  acc_type FROM customer WHERE credit_score  <  50 GROUP BY acc_type	loan_1
SELECT avg(acc_bal) ,  acc_type FROM customer WHERE credit_score  <  50 GROUP BY acc_type	loan_1
SELECT sum(acc_bal) ,  state FROM customer WHERE credit_score  >  100 GROUP BY state	loan_1
SELECT sum(acc_bal) ,  state FROM customer WHERE credit_score  >  100 GROUP BY state	loan_1
SELECT bank.branch_id, SUM(loan.amount) FROM bank JOIN loan ON bank.branch_id = loan.branch_id GROUP BY bank.branch_id	loan_1
SELECT bank.bname, IFNULL(SUM(loan.amount), 0) AS total_loan_amount FROM bank LEFT JOIN loan ON bank.branch_id = loan.branch_id GROUP BY bank.bname	loan_1
SELECT cust_name FROM customer WHERE cust_id IN (SELECT cust_id FROM loan GROUP BY cust_id HAVING COUNT(loan_id) > 1)	loan_1
SELECT cust_name FROM customer WHERE cust_id IN (SELECT loan.cust_id FROM loan GROUP BY loan.cust_id HAVING COUNT(loan_id) > 1)	loan_1
SELECT cust_name, acc_bal FROM customer WHERE cust_id IN (SELECT cust_id FROM loan GROUP BY cust_id HAVING SUM(amount) > 5000)	loan_1
SELECT c.cust_name, c.acc_bal FROM customer c JOIN loan l ON c.cust_id = l.cust_id GROUP BY c.cust_id HAVING SUM(l.amount) > 5000	loan_1
SELECT b.bname FROM bank b JOIN loan l ON b.branch_id = l.branch_id GROUP BY b.branch_id ORDER BY SUM(l.amount) DESC LIMIT 1	loan_1
SELECT B.bname FROM bank B INNER JOIN loan L ON B.branch_id = L.branch_id GROUP BY B.branch_id ORDER BY SUM(L.amount) DESC LIMIT 1	loan_1
SELECT T2.bname FROM loan AS T1 JOIN bank AS T2 ON T1.branch_id  =  T2.branch_id JOIN customer AS T3 ON T1.cust_id  =  T3.cust_id WHERE T3.credit_score  <  100 GROUP BY T2.bname ORDER BY sum(T1.amount) DESC LIMIT 1	loan_1
SELECT bname FROM bank WHERE branch_id IN (SELECT branch_id FROM loan WHERE cust_id IN (SELECT cust_id FROM customer WHERE credit_score < 100) GROUP BY branch_id ORDER BY SUM(amount) DESC LIMIT 1)	loan_1
SELECT bank.bname FROM bank WHERE EXISTS (SELECT 1 FROM loan WHERE loan.branch_id = bank.branch_id)	loan_1
SELECT DISTINCT T1.bname FROM bank AS T1 JOIN loan AS T2 ON T1.branch_id  =  T2.branch_id	loan_1
SELECT cust_name, credit_score FROM customer WHERE cust_id IN (SELECT cust_id FROM loan)	loan_1
SELECT cust_name, credit_score FROM customer WHERE cust_id IN (SELECT cust_id FROM loan)	loan_1
SELECT cust_name FROM customer WHERE cust_id IN (SELECT cust_id FROM loan WHERE amount > 3000)	loan_1
SELECT cust_name FROM customer c WHERE EXISTS (SELECT 1 FROM loan l WHERE l.cust_id = c.cust_id AND l.amount > 3000)	loan_1
SELECT b.city, b.bname FROM bank b WHERE EXISTS (SELECT 1 FROM loan l WHERE l.branch_id = b.branch_id AND l.loan_type = 'Business')	loan_1
SELECT bname, city FROM bank WHERE branch_id IN (SELECT branch_id FROM loan WHERE loan_type = 'Business')	loan_1
SELECT DISTINCT b.bname FROM bank b, loan l, customer c WHERE b.branch_id = l.branch_id AND l.cust_id = c.cust_id AND c.credit_score < 100	loan_1
SELECT DISTINCT b.bname FROM bank b INNER JOIN customer c ON b.branch_id = c.branch_id INNER JOIN loan l ON c.cust_id = l.cust_id WHERE c.credit_score < 100	loan_1
SELECT sum(T2.amount) FROM bank AS T1 JOIN loan AS T2 ON T1.branch_id  =  T2.branch_id WHERE T1.state  =  'New York'	loan_1
SELECT sum(T2.amount) FROM bank AS T1 JOIN loan AS T2 ON T1.branch_id  =  T2.branch_id WHERE T1.state  =  'New York'	loan_1
SELECT avg(credit_score) FROM customer WHERE cust_id IN (SELECT cust_id FROM loan)	loan_1
SELECT avg(credit_score) FROM customer WHERE cust_id IN (SELECT cust_id FROM loan)	loan_1
SELECT avg(credit_score) FROM customer WHERE cust_id NOT IN (SELECT cust_id FROM loan)	loan_1
SELECT avg(credit_score) FROM customer WHERE cust_id NOT IN (SELECT cust_id FROM loan)	loan_1
SELECT count(*) FROM ASSESSMENT_NOTES	behavior_monitoring
SELECT date_of_notes FROM Assessment_Notes	behavior_monitoring
SELECT count(*) FROM ADDRESSES WHERE zip_postcode  =  '197'	behavior_monitoring
SELECT count(DISTINCT incident_type_code) FROM Behavior_Incident	behavior_monitoring
SELECT DISTINCT detention_type_code FROM ref_detention_type	behavior_monitoring
SELECT date_incident_start ,  date_incident_end FROM Behavior_Incident WHERE incident_type_code  =  'NOISE'	behavior_monitoring
SELECT detention_summary FROM Detention	behavior_monitoring
SELECT cell_mobile_number ,  email_address FROM STUDENTS	behavior_monitoring
SELECT email_address FROM Students WHERE first_name  =  'Emma' AND last_name  =  'Rohan'	behavior_monitoring
SELECT count(DISTINCT student_id) FROM Students_in_Detention	behavior_monitoring
SELECT gender FROM TEACHERS WHERE last_name  =  'Medhurst'	behavior_monitoring
SELECT incident_type_description FROM Ref_Incident_Type WHERE incident_type_code  =  'VIOLENCE'	behavior_monitoring
SELECT max(monthly_rental) ,  min(monthly_rental) FROM Student_Addresses	behavior_monitoring
SELECT first_name FROM Teachers WHERE email_address LIKE '%man%'	behavior_monitoring
SELECT * FROM Assessment_Notes ORDER BY date_of_notes ASC	behavior_monitoring
SELECT city FROM Addresses ORDER BY city	behavior_monitoring
SELECT t.first_name, t.last_name FROM teachers t ORDER BY t.last_name, t.first_name	behavior_monitoring
SELECT * FROM Student_Addresses ORDER BY monthly_rental DESC	behavior_monitoring
SELECT s.student_id, s.first_name FROM students s, assessment_notes an WHERE s.student_id = an.student_id GROUP BY s.student_id HAVING COUNT(an.notes_id) = (SELECT MAX(cnt_notes) FROM (SELECT COUNT(notes_id) AS cnt_notes FROM assessment_notes GROUP BY student_id) sub)	behavior_monitoring
SELECT T1.teacher_id ,  T2.first_name FROM Assessment_Notes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 3	behavior_monitoring
SELECT student_id, last_name FROM students WHERE student_id IN (SELECT student_id FROM behavior_incident GROUP BY student_id HAVING COUNT(incident_id) = (SELECT MAX(incident_count) FROM (SELECT student_id, COUNT(incident_id) AS incident_count FROM behavior_incident GROUP BY student_id) tmp))	behavior_monitoring
SELECT T1.teacher_id ,  T2.last_name FROM Detention AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T1.detention_type_code  =  'AFTER' GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT s.student_id, s.first_name FROM students s WHERE s.student_id IN (SELECT student_id FROM student_addresses GROUP BY student_id HAVING AVG(monthly_rental) = (SELECT MAX(average_rent) FROM (SELECT AVG(monthly_rental) as average_rent FROM student_addresses GROUP BY student_id)))	behavior_monitoring
SELECT T2.address_id ,  T1.city FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id GROUP BY T2.address_id ORDER BY AVG(monthly_rental) DESC LIMIT 1	behavior_monitoring
SELECT T1.incident_type_code ,  T2.incident_type_description FROM Behavior_Incident AS T1 JOIN Ref_Incident_Type AS T2 ON T1.incident_type_code  =  T2.incident_type_code GROUP BY T1.incident_type_code ORDER BY count(*) DESC LIMIT 1	behavior_monitoring
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1	behavior_monitoring
SELECT T1.date_of_notes FROM Assessment_Notes AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.first_name  =  'Fanny'	behavior_monitoring
SELECT T1.text_of_notes FROM Assessment_Notes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.last_name  =  'Schuster'	behavior_monitoring
SELECT T1.date_incident_start ,  date_incident_end FROM Behavior_Incident AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.last_name  =  'Fahey'	behavior_monitoring
SELECT T1.datetime_detention_start ,  datetime_detention_end FROM Detention AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.last_name  =  'Schultz'	behavior_monitoring
SELECT T2.address_id ,  T1.zip_postcode FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id ORDER BY monthly_rental DESC LIMIT 1	behavior_monitoring
SELECT s.cell_mobile_number FROM students s WHERE EXISTS (SELECT 1 FROM student_addresses sa WHERE sa.student_id = s.student_id AND sa.monthly_rental = (SELECT MIN(monthly_rental) FROM student_addresses))	behavior_monitoring
SELECT T2.monthly_rental FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id WHERE T1.state_province_county  =  'Texas'	behavior_monitoring
SELECT T2.first_name ,  T2.last_name FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.address_id WHERE T1.state_province_county  =  'Wisconsin'	behavior_monitoring
SELECT T1.line_1 ,  avg(T2.monthly_rental) FROM Addresses AS T1 JOIN Student_Addresses AS T2 ON T1.address_id  =  T2.address_id GROUP BY T2.address_id	behavior_monitoring
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Teachers AS T2 ON T1.address_id  =  T2.address_id WHERE T2.first_name  =  'Lyla'	behavior_monitoring
SELECT T2.email_address FROM Addresses AS T1 JOIN Teachers AS T2 ON T1.address_id  =  T2.address_id WHERE T1.zip_postcode  =  '918'	behavior_monitoring
SELECT count(*) FROM STUDENTS WHERE student_id NOT IN ( SELECT student_id FROM Behavior_Incident )	behavior_monitoring
SELECT last_name FROM teachers WHERE teacher_id NOT IN (SELECT teacher_id FROM detention)	behavior_monitoring
SELECT DISTINCT a.line_1 FROM addresses a, students s, teachers t WHERE a.address_id = s.address_id AND a.address_id = t.address_id	behavior_monitoring
SELECT DISTINCT a.asset_id, a.asset_details FROM assets a WHERE (SELECT COUNT(*) FROM asset_parts WHERE asset_id = a.asset_id) = 2 AND (SELECT COUNT(*) FROM fault_log WHERE asset_id = a.asset_id) < 2	assets_maintenance
SELECT mc.maintenance_contract_id, COUNT(a.asset_id) AS total_assets FROM maintenance_contracts mc LEFT JOIN assets a ON mc.maintenance_contract_id = a.maintenance_contract_id GROUP BY mc.maintenance_contract_id	assets_maintenance
SELECT count(*) ,  T1.company_id FROM Third_Party_Companies AS T1 JOIN Assets AS T2 ON T1.company_id  =  T2.supplier_company_id GROUP BY T1.company_id	assets_maintenance
SELECT T1.company_id ,  T1.company_name FROM Third_Party_Companies AS T1 JOIN Maintenance_Engineers AS T2 ON T1.company_id  =  T2.company_id GROUP BY T1.company_id HAVING count(*)  >=  2 UNION SELECT T3.company_id ,  T3.company_name FROM Third_Party_Companies AS T3 JOIN Maintenance_Contracts AS T4 ON T3.company_id  =  T4.maintenance_contract_company_id GROUP BY T3.company_id HAVING count(*)  >=  2	assets_maintenance
SELECT T1.staff_name ,  T1.staff_id FROM Staff AS T1 JOIN Fault_Log AS T2 ON T1.staff_id  =  T2.recorded_by_staff_id EXCEPT SELECT T3.staff_name ,  T3.staff_id FROM Staff AS T3 JOIN Engineer_Visits AS T4 ON T3.staff_id  =  T4.contact_staff_id	assets_maintenance
SELECT me.engineer_id, me.first_name, me.last_name FROM maintenance_engineers me JOIN engineer_visits ev ON ev.engineer_id = me.engineer_id GROUP BY me.engineer_id HAVING COUNT(ev.engineer_id) = (SELECT MAX(Count) FROM (SELECT COUNT(engineer_id) AS Count FROM engineer_visits GROUP BY engineer_id) AS SubQuery)	assets_maintenance
SELECT T1.part_name ,  T1.part_id FROM Parts AS T1 JOIN Part_Faults AS T2 ON T1.part_id  =  T2.part_id GROUP BY T1.part_id HAVING count(*)  >  2	assets_maintenance
SELECT T1.first_name ,  T1.last_name ,  T1.other_details ,  T3.skill_description FROM Maintenance_Engineers AS T1 JOIN Engineer_Skills AS T2 ON T1.engineer_id  =  T2.engineer_id JOIN Skills AS T3 ON T2.skill_id  =  T3.skill_id	assets_maintenance
SELECT T1.fault_short_name ,  T3.skill_description FROM Part_Faults AS T1 JOIN Skills_Required_To_Fix AS T2 ON T1.part_fault_id  =  T2.part_fault_id JOIN Skills AS T3 ON T2.skill_id  =  T3.skill_id	assets_maintenance
SELECT T1.part_name ,  count(*) FROM Parts AS T1 JOIN Asset_Parts AS T2 ON T1.part_id  =  T2.part_id GROUP BY T1.part_name	assets_maintenance
SELECT T1.fault_description ,  T2.fault_status FROM Fault_Log AS T1 JOIN Fault_Log_Parts AS T2 ON T1.fault_log_entry_id  =  T2.fault_log_entry_id	assets_maintenance
SELECT count(*) ,  T1.fault_log_entry_id FROM Fault_Log AS T1 JOIN Engineer_Visits AS T2 ON T1.fault_log_entry_id  =  T2.fault_log_entry_id GROUP BY T1.fault_log_entry_id ORDER BY count(*) DESC LIMIT 1	assets_maintenance
SELECT DISTINCT last_name FROM Maintenance_Engineers	assets_maintenance
SELECT COUNT(DISTINCT fault_status) FROM fault_log_parts	assets_maintenance
SELECT first_name ,  last_name FROM Maintenance_Engineers WHERE engineer_id NOT IN (SELECT engineer_id FROM Engineer_Visits)	assets_maintenance
SELECT asset_id ,  asset_details ,  asset_make ,  asset_model FROM Assets	assets_maintenance
SELECT asset_acquired_date FROM Assets ORDER BY asset_acquired_date ASC LIMIT 1	assets_maintenance
SELECT p.part_id, p.part_name FROM parts p JOIN part_faults pf ON p.part_id = pf.part_id JOIN skills_required_to_fix s ON pf.part_fault_id = s.part_fault_id GROUP BY p.part_id, p.part_name ORDER BY COUNT(s.skill_id) DESC LIMIT 1	assets_maintenance
SELECT T1.part_name FROM Parts AS T1 JOIN Part_Faults AS T2 ON T1.part_id  =  T2.part_id GROUP BY T1.part_name ORDER BY count(*) ASC LIMIT 1	assets_maintenance
SELECT me.engineer_id, me.first_name, me.last_name FROM maintenance_engineers me JOIN (SELECT engineer_id, COUNT(*) AS visit_count FROM engineer_visits GROUP BY engineer_id) ev ON me.engineer_id = ev.engineer_id WHERE ev.visit_count = (SELECT MIN(ev2.visit_count) FROM (SELECT engineer_id, COUNT(*) AS visit_count FROM engineer_visits GROUP BY engineer_id) ev2)	assets_maintenance
SELECT T1.staff_name ,  T3.first_name ,  T3.last_name FROM Staff AS T1 JOIN Engineer_Visits AS T2 ON T1.staff_id  =  T2.contact_staff_id JOIN Maintenance_Engineers AS T3 ON T2.engineer_id  =  T3.engineer_id	assets_maintenance
SELECT T1.fault_log_entry_id ,  T1.fault_description ,  T1.fault_log_entry_datetime FROM Fault_Log AS T1 JOIN Fault_Log_Parts AS T2 ON T1.fault_log_entry_id  =  T2.fault_log_entry_id GROUP BY T1.fault_log_entry_id ORDER BY count(*) DESC LIMIT 1	assets_maintenance
SELECT x.skill_id, x.skill_description FROM skills x WHERE x.skill_id IN (SELECT skill_id FROM skills_required_to_fix GROUP BY skill_id HAVING COUNT(part_fault_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(part_fault_id) AS cnt FROM skills_required_to_fix GROUP BY skill_id) tmp))	assets_maintenance
SELECT DISTINCT asset_model FROM Assets	assets_maintenance
SELECT asset_make ,  asset_model ,  asset_details FROM Assets ORDER BY asset_disposed_date ASC	assets_maintenance
SELECT parts.part_id, parts.chargeable_amount FROM parts WHERE parts.chargeable_amount = (SELECT MIN(chargeable_amount) FROM parts)	assets_maintenance
SELECT tpc.company_name FROM third_party_companies tpc JOIN maintenance_contracts mc ON tpc.company_id = mc.maintenance_contract_company_id WHERE mc.contract_start_date = (SELECT MIN(contract_start_date) FROM maintenance_contracts)	assets_maintenance
SELECT T1.company_name FROM Third_Party_Companies AS T1 JOIN Maintenance_Contracts AS T2 ON T1.company_id  =  T2.maintenance_contract_company_id JOIN Ref_Company_Types AS T3 ON T1.company_type_code  =  T3.company_type_code ORDER BY T2.contract_end_date DESC LIMIT 1	assets_maintenance
SELECT gender FROM staff GROUP BY gender ORDER BY count(*) DESC LIMIT 1	assets_maintenance
SELECT s.staff_name, COUNT(DISTINCT ev.engineer_id) AS engineers_contacted FROM staff s JOIN engineer_visits ev ON s.staff_id = ev.contact_staff_id GROUP BY s.staff_name	assets_maintenance
SELECT asset_model FROM Assets WHERE asset_id NOT IN (SELECT asset_id FROM Fault_Log)	assets_maintenance
SELECT local_authority ,  services FROM station	station_weather
SELECT train_number ,  name FROM train ORDER BY TIME	station_weather
SELECT TIME ,  train_number FROM train WHERE destination  =  'Chennai' ORDER BY TIME	station_weather
SELECT count(*) FROM train WHERE name LIKE '%Express%'	station_weather
SELECT train_number ,  TIME FROM train WHERE origin  =  'Chennai' AND destination  =  'Guruvayur'	station_weather
SELECT origin ,  count(*) FROM train GROUP BY origin	station_weather
SELECT t1.name FROM train AS t1 JOIN route AS t2 ON t1.id  =  t2.train_id GROUP BY t2.train_id ORDER BY count(*) DESC LIMIT 1	station_weather
SELECT network_name, services, (SELECT COUNT(*) FROM train WHERE id IN (SELECT train_id FROM route WHERE station_id = station.id)) AS num_trains FROM station	station_weather
SELECT avg(high_temperature) ,  day_of_week FROM weekly_weather GROUP BY day_of_week	station_weather
SELECT max(t1.low_temperature) ,  avg(t1.precipitation) FROM weekly_weather AS t1 JOIN station AS t2 ON t1.station_id  =  t2.id WHERE t2.network_name  =  'Amersham'	station_weather
SELECT name, time FROM train WHERE EXISTS (SELECT 1 FROM route JOIN station ON route.station_id = station.id WHERE station.local_authority = 'Chiltern' AND route.train_id = train.id)	station_weather
SELECT count(DISTINCT services) FROM station	station_weather
SELECT t2.id ,  t2.local_authority FROM weekly_weather AS t1 JOIN station AS t2 ON t1.station_id  =  t2.id GROUP BY t1.station_id ORDER BY avg(high_temperature) DESC LIMIT 1	station_weather
SELECT t2.id ,  t2.local_authority FROM weekly_weather AS t1 JOIN station AS t2 ON t1.station_id  =  t2.id GROUP BY t1.station_id HAVING max(t1.precipitation)  >  50	station_weather
SELECT min(low_temperature) ,  max(wind_speed_mph) FROM weekly_weather	station_weather
SELECT origin FROM train GROUP BY origin HAVING count(*)  >  1	station_weather
SELECT count(*) FROM professor AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code WHERE DEPT_NAME  =  'Accounting'	college_1
SELECT count(*) FROM professor AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code WHERE DEPT_NAME  =  'Accounting'	college_1
SELECT count(DISTINCT PROF_NUM) FROM CLASS WHERE CRS_CODE  =  'ACCT-211'	college_1
SELECT count(DISTINCT PROF_NUM) FROM CLASS WHERE CRS_CODE  =  'ACCT-211'	college_1
SELECT emp_fname, emp_lname FROM employee WHERE emp_num IN (SELECT emp_num FROM professor WHERE dept_code IN (SELECT dept_code FROM department WHERE dept_name = 'Biology'))	college_1
SELECT T3.EMP_FNAME ,  T3.EMP_LNAME FROM professor AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code JOIN employee AS T3 ON T1.EMP_NUM  =  T3.EMP_NUM WHERE DEPT_NAME  =  'Biology'	college_1
SELECT DISTINCT T1.EMP_FNAME ,  T1.EMP_DOB FROM employee AS T1 JOIN CLASS AS T2 ON T1.EMP_NUM  =  T2.PROF_NUM WHERE CRS_CODE  =  'ACCT-211'	college_1
SELECT DISTINCT T1.EMP_FNAME ,  T1.EMP_DOB FROM employee AS T1 JOIN CLASS AS T2 ON T1.EMP_NUM  =  T2.PROF_NUM WHERE CRS_CODE  =  'ACCT-211'	college_1
SELECT count(*) FROM employee AS T1 JOIN CLASS AS T2 ON T1.EMP_NUM  =  T2.PROF_NUM WHERE T1.EMP_LNAME  =  'Graztevski'	college_1
SELECT count(*) FROM employee AS T1 JOIN CLASS AS T2 ON T1.EMP_NUM  =  T2.PROF_NUM WHERE T1.EMP_LNAME  =  'Graztevski'	college_1
SELECT school_code FROM department WHERE dept_name  =  'Accounting'	college_1
SELECT school_code FROM department WHERE dept_name  =  'Accounting'	college_1
SELECT crs_credit ,  crs_description FROM course WHERE crs_code  =  'CIS-220'	college_1
SELECT crs_credit ,  crs_description FROM course WHERE crs_code  =  'CIS-220'	college_1
SELECT dept_address FROM department WHERE dept_name  =  'History'	college_1
SELECT dept_address FROM department WHERE dept_name  =  'History'	college_1
SELECT count(DISTINCT dept_address) FROM department WHERE school_code  =  'BUS'	college_1
SELECT DISTINCT dept_address FROM department WHERE school_code = 'BUS';	college_1
SELECT count(DISTINCT dept_address) ,  school_code FROM department GROUP BY school_code	college_1
SELECT count(DISTINCT dept_address) ,  school_code FROM department GROUP BY school_code	college_1
SELECT crs_credit ,  crs_description FROM course WHERE crs_code  =  'QM-261'	college_1
SELECT crs_credit ,  crs_description FROM course WHERE crs_code  =  'QM-261'	college_1
SELECT school_code, COUNT(dept_code) AS num_departments FROM department GROUP BY school_code	college_1
SELECT school_code, COUNT(dept_code) FROM department GROUP BY school_code	college_1
SELECT school_code, COUNT(dept_code) FROM department GROUP BY school_code HAVING COUNT(dept_code) < 5;	college_1
SELECT school_code, COUNT(DISTINCT dept_code) FROM department WHERE (SELECT COUNT(*) FROM department dep WHERE dep.school_code = department.school_code) < 5 GROUP BY school_code	college_1
SELECT count(*) ,  crs_code FROM CLASS GROUP BY crs_code	college_1
SELECT DISTINCT c.crs_code, COUNT(cl.class_section) OVER (PARTITION BY c.crs_code) as sections from course c LEFT JOIN class cl ON c.crs_code = cl.crs_code	college_1
SELECT sum(crs_credit) ,  dept_code FROM course GROUP BY dept_code	college_1
SELECT SUM(course.crs_credit) FROM course JOIN department ON course.dept_code = department.dept_code	college_1
SELECT count(*) ,  class_room FROM CLASS GROUP BY class_room HAVING count(*)  >=  2	college_1
SELECT count(*) ,  class_room FROM CLASS GROUP BY class_room HAVING count(*)  >=  2	college_1
SELECT count(*) ,  dept_code FROM CLASS AS T1 JOIN course AS T2 ON T1.crs_code  =  T2.crs_code GROUP BY dept_code	college_1
SELECT count(*) ,  dept_code FROM CLASS AS T1 JOIN course AS T2 ON T1.crs_code  =  T2.crs_code GROUP BY dept_code	college_1
SELECT count(*) ,  T3.school_code FROM CLASS AS T1 JOIN course AS T2 ON T1.crs_code  =  T2.crs_code JOIN department AS T3 ON T2.dept_code  =  T3.dept_code GROUP BY T3.school_code	college_1
SELECT COUNT(c.class_code) AS NumberOfClasses, d.school_code FROM department d LEFT JOIN course cu ON d.dept_code = cu.dept_code LEFT JOIN class c ON cu.crs_code = c.crs_code GROUP BY d.school_code;	college_1
SELECT count(*) ,  T1.school_code FROM department AS T1 JOIN professor AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.school_code	college_1
SELECT count(*) ,  T1.school_code FROM department AS T1 JOIN professor AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.school_code	college_1
SELECT emp_jobcode ,  count(*) FROM employee GROUP BY emp_jobcode ORDER BY count(*) DESC LIMIT 1	college_1
SELECT emp_jobcode ,  count(*) FROM employee GROUP BY emp_jobcode ORDER BY count(*) DESC LIMIT 1	college_1
SELECT T1.school_code FROM department AS T1 JOIN professor AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.school_code ORDER BY count(*) LIMIT 1	college_1
SELECT T1.school_code FROM department AS T1 JOIN professor AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.school_code ORDER BY count(*) LIMIT 1	college_1
SELECT count(*) ,  dept_code FROM professor WHERE prof_high_degree  =  'Ph.D.' GROUP BY dept_code	college_1
SELECT count(*) ,  dept_code FROM professor WHERE prof_high_degree  =  'Ph.D.' GROUP BY dept_code	college_1
SELECT count(*) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT count(*) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT sum(stu_hrs) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT sum(stu_hrs) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT max(stu_gpa) ,  avg(stu_gpa) ,  min(stu_gpa) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT max(stu_gpa) ,  avg(stu_gpa) ,  min(stu_gpa) ,  dept_code FROM student GROUP BY dept_code	college_1
SELECT dept_name, avg_gpa FROM (SELECT dept_name, AVG(stu_gpa) AS avg_gpa, RANK() OVER (ORDER BY AVG(stu_gpa) DESC) AS rank FROM student JOIN department USING(dept_code) GROUP BY dept_code) WHERE rank = 1	college_1
SELECT T2.dept_name ,  avg(T1.stu_gpa) FROM student AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.dept_code ORDER BY avg(T1.stu_gpa) DESC LIMIT 1	college_1
SELECT count(DISTINCT school_code) FROM department	college_1
SELECT count(DISTINCT school_code) FROM department	college_1
SELECT count(DISTINCT class_code) FROM CLASS	college_1
SELECT count(DISTINCT class_code) FROM CLASS	college_1
SELECT COUNT(DISTINCT crs_code) FROM course	college_1
SELECT COUNT(DISTINCT crs_code) FROM course	college_1
SELECT COUNT(*) FROM department	college_1
SELECT COUNT(DISTINCT dept_code) FROM department	college_1
SELECT count(*) FROM department AS T1 JOIN course AS T2 ON T1.dept_code  =  T2.dept_code WHERE dept_name  =  'Computer Info. Systems'	college_1
SELECT count(*) FROM department AS T1 JOIN course AS T2 ON T1.dept_code  =  T2.dept_code WHERE dept_name  =  'Computer Info. Systems'	college_1
SELECT count(DISTINCT class_section) FROM CLASS WHERE crs_code  =  'ACCT-211'	college_1
SELECT count(DISTINCT class_section) FROM CLASS WHERE crs_code  =  'ACCT-211'	college_1
SELECT sum(T1.crs_credit) ,  T1.dept_code FROM course AS T1 JOIN CLASS AS T2 ON T1.crs_code  =  T2.crs_code GROUP BY T1.dept_code	college_1
SELECT d.dept_name, SUM(c.crs_credit) as TotalCredits FROM department d JOIN course c ON d.dept_code = c.dept_code GROUP BY d.dept_name	college_1
SELECT T3.dept_name FROM course AS T1 JOIN CLASS AS T2 ON T1.crs_code  =  T2.crs_code JOIN department AS T3 ON T1.dept_code  =  T3.dept_code GROUP BY T1.dept_code ORDER BY sum(T1.crs_credit) DESC LIMIT 1	college_1
SELECT d.dept_name FROM department d JOIN course c ON d.dept_code = c.dept_code GROUP BY d.dept_name ORDER BY SUM(c.crs_credit) DESC LIMIT 1	college_1
SELECT count(*) FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code WHERE T1.crs_code  =  'ACCT-211'	college_1
SELECT COUNT(DISTINCT e.stu_num) FROM enroll e, class c WHERE e.class_code = c.class_code AND c.crs_code = 'ACCT-211'	college_1
SELECT stu_fname FROM student WHERE stu_num IN (SELECT stu_num FROM enroll WHERE class_code IN (SELECT class_code FROM class WHERE crs_code = 'ACCT-211'))	college_1
SELECT T3.stu_fname FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN student AS T3 ON T2.stu_num  =  T3.stu_num WHERE T1.crs_code  =  'ACCT-211'	college_1
SELECT stu_fname FROM student WHERE stu_num IN (SELECT enroll.stu_num FROM enroll JOIN class ON enroll.class_code = class.class_code WHERE class.crs_code = 'ACCT-211' AND enroll.enroll_grade = 'C')	college_1
SELECT stu_fname FROM student WHERE stu_num IN (SELECT stu_num FROM enroll WHERE class_code IN (SELECT class_code FROM class WHERE crs_code = 'ACCT-211') AND enroll_grade = 'C')	college_1
SELECT count(*) FROM employee	college_1
SELECT count(*) FROM employee	college_1
SELECT COUNT(DISTINCT p.emp_num) FROM professor p WHERE p.prof_high_degree = 'Ph.D.'	college_1
SELECT count(*) FROM professor WHERE prof_high_degree  =  'Ph.D.'	college_1
SELECT COUNT(DISTINCT e.stu_num) FROM enroll e JOIN class c ON e.class_code = c.class_code JOIN professor p ON c.prof_num = p.emp_num JOIN department d ON p.dept_code = d.dept_code WHERE d.dept_name = 'Accounting'	college_1
SELECT COUNT(DISTINCT e.stu_num) FROM enroll e INNER JOIN class c ON e.class_code = c.class_code INNER JOIN professor p ON c.prof_num = p.emp_num WHERE p.dept_code = 'ACC'	college_1
SELECT T4.dept_name FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN course AS T3 ON T1.crs_code  =  T3.crs_code JOIN department AS T4 ON T3.dept_code  =  T4.dept_code GROUP BY T3.dept_code ORDER BY count(*) DESC LIMIT 1	college_1
SELECT T4.dept_name FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN course AS T3 ON T1.crs_code  =  T3.crs_code JOIN department AS T4 ON T3.dept_code  =  T4.dept_code GROUP BY T3.dept_code ORDER BY count(*) DESC LIMIT 1	college_1
SELECT dept_name FROM department ORDER BY dept_name	college_1
SELECT dept_name FROM department ORDER BY dept_name	college_1
SELECT class.crs_code FROM class WHERE class.class_room = 'KLR209'	college_1
SELECT DISTINCT class.crs_code FROM class WHERE class.class_room = 'KLR209'	college_1
SELECT emp_fname FROM employee WHERE emp_jobcode  =  'PROF' ORDER BY emp_dob	college_1
SELECT emp_fname FROM employee WHERE emp_num IN (SELECT emp_num FROM professor) ORDER BY emp_dob	college_1
SELECT T2.emp_fname ,  T1.prof_office FROM professor AS T1 JOIN employee AS T2 ON T1.emp_num  =  T2.emp_num ORDER BY T2.emp_fname	college_1
SELECT T2.emp_fname ,  T1.prof_office FROM professor AS T1 JOIN employee AS T2 ON T1.emp_num  =  T2.emp_num ORDER BY T2.emp_fname	college_1
SELECT E.emp_fname, E.emp_lname FROM employee E WHERE E.emp_dob = (SELECT MIN(emp_dob) FROM employee)	college_1
SELECT e.emp_fname, e.emp_lname FROM employee e WHERE e.emp_dob = (SELECT MIN(emp_dob) FROM employee)	college_1
SELECT stu_fname ,  stu_lname ,  stu_gpa FROM student WHERE stu_gpa  >  3 ORDER BY stu_dob DESC LIMIT 1	college_1
SELECT Z.stu_fname, Z.stu_lname, Z.stu_gpa FROM (SELECT * FROM student WHERE stu_gpa > 3) Z ORDER BY Z.stu_dob LIMIT 1	college_1
SELECT s.stu_fname FROM student AS s INNER JOIN enroll AS e ON s.stu_num = e.stu_num WHERE e.enroll_grade = 'C'	college_1
SELECT s.stu_fname FROM student s JOIN enroll e ON s.stu_num = e.stu_num WHERE e.enroll_grade = 'C'	college_1
SELECT dept_name FROM department WHERE dept_code IN (SELECT dept_code FROM (SELECT dept_code, COUNT(emp_num) AS num_profs FROM professor GROUP BY dept_code ORDER BY num_profs ASC) tmp WHERE num_profs = (SELECT MIN(num_profs) FROM (SELECT COUNT(emp_num) AS num_profs FROM professor GROUP BY dept_code)))	college_1
SELECT d.dept_name FROM department d LEFT JOIN professor p ON d.dept_code = p.dept_code GROUP BY d.dept_name ORDER BY COUNT(p.emp_num) ASC LIMIT 1	college_1
SELECT d.dept_name FROM department d, professor p WHERE d.dept_code = p.dept_code AND p.prof_high_degree = 'Ph.D.' GROUP BY d.dept_name HAVING COUNT(p.emp_num) = (SELECT MAX(ProfCount) FROM (SELECT COUNT(emp_num) AS ProfCount FROM professor WHERE prof_high_degree = 'Ph.D.' GROUP BY dept_code))	college_1
SELECT D.dept_name FROM department D WHERE EXISTS (SELECT 1 FROM professor P WHERE P.dept_code = D.dept_code AND P.prof_high_degree = 'Ph.D.' GROUP BY P.dept_code ORDER BY COUNT(*) DESC LIMIT 1)	college_1
SELECT emp_fname FROM employee WHERE emp_num IN (SELECT emp_num FROM professor EXCEPT SELECT prof_num FROM class)	college_1
SELECT emp_fname FROM employee WHERE emp_jobcode  =  'PROF' EXCEPT SELECT T1.emp_fname FROM employee AS T1 JOIN CLASS AS T2 ON T1.emp_num  =  T2.prof_num	college_1
SELECT emp_fname FROM employee WHERE emp_num IN (SELECT emp_num FROM professor WHERE dept_code IN (SELECT dept_code FROM department WHERE dept_name = 'History') AND emp_num NOT IN (SELECT prof_num FROM class))	college_1
SELECT T1.emp_fname FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T2.dept_code  =  T3.dept_code WHERE T3.dept_name  =  'History' EXCEPT SELECT T4.emp_fname FROM employee AS T4 JOIN CLASS AS T5 ON T4.emp_num  =  T5.prof_num	college_1
SELECT T1.emp_lname ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T2.dept_code  =  T3.dept_code WHERE T3.dept_name  =  'History'	college_1
SELECT T1.emp_lname ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T2.dept_code  =  T3.dept_code WHERE T3.dept_name  =  'History'	college_1
SELECT T3.dept_name  ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T2.dept_code  =  T3.dept_code WHERE T1.emp_lname  =  'Heffington'	college_1
SELECT T3.dept_name  ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T2.dept_code  =  T3.dept_code WHERE T1.emp_lname  =  'Heffington'	college_1
SELECT T1.emp_lname ,  T1.emp_hiredate FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num WHERE T2.prof_office  =  'DRE 102'	college_1
SELECT E.emp_lname, E.emp_hiredate FROM employee E WHERE EXISTS (SELECT 1 FROM professor P WHERE P.emp_num = E.emp_num AND P.prof_office = 'DRE 102')	college_1
SELECT T1.crs_code FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN student AS T3 ON T3.stu_num  =  T2.stu_num WHERE T3.stu_lname  =  'Smithson'	college_1
SELECT DISTINCT c.crs_code FROM course c JOIN class cl ON c.crs_code = cl.crs_code JOIN enroll e ON cl.class_code = e.class_code JOIN student s ON e.stu_num = s.stu_num WHERE s.stu_lname = 'Smithson'	college_1
SELECT T4.crs_description ,  T4.crs_credit FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN student AS T3 ON T3.stu_num  =  T2.stu_num JOIN course AS T4 ON T4.crs_code  =  T1.crs_code WHERE T3.stu_lname  =  'Smithson'	college_1
SELECT T4.crs_description ,  T4.crs_credit FROM CLASS AS T1 JOIN enroll AS T2 ON T1.class_code  =  T2.class_code JOIN student AS T3 ON T3.stu_num  =  T2.stu_num JOIN course AS T4 ON T4.crs_code  =  T1.crs_code WHERE T3.stu_lname  =  'Smithson'	college_1
SELECT COUNT(DISTINCT emp_num) FROM professor WHERE prof_high_degree = 'Ph.D.' OR prof_high_degree = 'MA'	college_1
SELECT count(*) FROM professor WHERE prof_high_degree  =  'Ph.D.' OR prof_high_degree  =  'MA'	college_1
SELECT count(*) FROM professor AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code WHERE T2.dept_name  =  'Accounting' OR T2.dept_name  =  'Biology'	college_1
SELECT count(*) FROM professor AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code WHERE T2.dept_name  =  'Accounting' OR T2.dept_name  =  'Biology'	college_1
SELECT P.prof_office FROM professor P WHERE EXISTS (SELECT * FROM class C JOIN course CO ON C.crs_code = CO.crs_code WHERE CO.crs_code = 'CIS-220' AND CO.dept_code = P.dept_code AND EXISTS (SELECT * FROM class C2 JOIN course CO2 ON C2.crs_code = CO2.crs_code WHERE CO2.crs_code = 'QM-261' AND CO2.dept_code = P.dept_code AND C.class_code = C2.class_code))	college_1
SELECT emp_fname FROM employee WHERE emp_num IN (SELECT professor.emp_num FROM professor JOIN class ON professor.emp_num = class.prof_num WHERE class.crs_code = 'CIS-220' INTERSECT SELECT professor.emp_num FROM professor JOIN class ON professor.emp_num = class.prof_num WHERE class.crs_code = 'QM-261')	college_1
SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code JOIN department AS T5 ON T5.dept_code  =  T4.dept_code WHERE T5.dept_name  =  'Accounting' INTERSECT SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code JOIN department AS T5 ON T5.dept_code  =  T4.dept_code WHERE T5.dept_name  =  'Computer Info. Systems'	college_1
SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code JOIN department AS T5 ON T5.dept_code  =  T4.dept_code WHERE T5.dept_name  =  'Accounting' INTERSECT SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code JOIN department AS T5 ON T5.dept_code  =  T4.dept_code WHERE T5.dept_name  =  'Computer Info. Systems'	college_1
SELECT avg(T2.stu_gpa) FROM enroll AS T1 JOIN student AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T1.class_code  =  T3.class_code WHERE T3.crs_code  =  'ACCT-211'	college_1
SELECT AVG(stu_gpa) FROM student WHERE stu_num IN (SELECT enroll.stu_num FROM enroll JOIN class ON enroll.class_code = class.class_code WHERE class.crs_code = 'ACCT-211')	college_1
SELECT stu_gpa ,  stu_phone ,  stu_fname FROM student ORDER BY stu_gpa DESC LIMIT 5	college_1
SELECT stu_gpa ,  stu_phone ,  stu_fname FROM student ORDER BY stu_gpa DESC LIMIT 5	college_1
SELECT D.dept_name FROM department D INNER JOIN student S ON D.dept_code = S.dept_code WHERE S.stu_gpa = (SELECT MIN(stu_gpa) FROM student)	college_1
SELECT dept_name FROM department WHERE dept_code IN (SELECT dept_code FROM student WHERE stu_gpa = (SELECT MIN(stu_gpa) FROM student))	college_1
SELECT stu_fname ,  stu_gpa FROM student WHERE stu_gpa  <  (SELECT avg(stu_gpa) FROM student)	college_1
SELECT stu_fname ,  stu_gpa FROM student WHERE stu_gpa  <  (SELECT avg(stu_gpa) FROM student)	college_1
SELECT T2.dept_name ,  T2.dept_address FROM student AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.dept_code ORDER BY count(*) DESC LIMIT 1	college_1
SELECT department.dept_name, department.dept_address FROM department JOIN (SELECT dept_code FROM student GROUP BY dept_code HAVING COUNT(stu_num) = (SELECT MAX(stu_count) FROM (SELECT COUNT(stu_num) AS stu_count FROM student GROUP BY dept_code))) AS max_dept ON department.dept_code = max_dept.dept_code	college_1
SELECT department.dept_name, department.dept_address, COUNT(student.stu_num) AS num_students FROM department LEFT JOIN student ON department.dept_code = student.dept_code GROUP BY department.dept_code ORDER BY num_students DESC LIMIT 3	college_1
SELECT T2.dept_name ,  T2.dept_address ,  count(*) FROM student AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code GROUP BY T1.dept_code ORDER BY count(*) DESC LIMIT 3	college_1
SELECT T1.emp_fname ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T3.dept_code  =  T2.dept_code WHERE T3.dept_name  =  'History' AND T2.prof_high_degree  =  'Ph.D.'	college_1
SELECT T1.emp_fname ,  T2.prof_office FROM employee AS T1 JOIN professor AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T3.dept_code  =  T2.dept_code WHERE T3.dept_name  =  'History' AND T2.prof_high_degree  =  'Ph.D.'	college_1
SELECT emp_fname, crs_code FROM employee e JOIN (SELECT DISTINCT prof_num, crs_code FROM class) cls ON e.emp_num = cls.prof_num	college_1
SELECT T2.emp_fname ,  T1.crs_code FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num	college_1
SELECT T2.emp_fname ,  T3.crs_description FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN course AS T3 ON T1.crs_code  =  T3.crs_code	college_1
SELECT T2.emp_fname ,  T3.crs_description FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN course AS T3 ON T1.crs_code  =  T3.crs_code	college_1
SELECT T2.emp_fname ,  T4.prof_office ,  T3.crs_description FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN course AS T3 ON T1.crs_code  =  T3.crs_code JOIN professor AS T4 ON T2.emp_num  =  T4.emp_num	college_1
SELECT DISTINCT emp_fname, prof_office FROM professor INNER JOIN employee ON professor.emp_num = employee.emp_num INNER JOIN class ON employee.emp_num = class.prof_num;	college_1
SELECT T2.emp_fname ,  T4.prof_office ,  T3.crs_description ,  T5.dept_name FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN course AS T3 ON T1.crs_code  =  T3.crs_code JOIN professor AS T4 ON T2.emp_num  =  T4.emp_num JOIN department AS T5 ON T4.dept_code  =  T5.dept_code	college_1
SELECT E.emp_fname, P.prof_office, D.dept_name, C.crs_description FROM employee E JOIN professor P ON E.emp_num = P.emp_num JOIN department D ON P.dept_code = D.dept_code JOIN course C ON D.dept_code = C.dept_code	college_1
SELECT T1.stu_fname ,  T1.stu_lname ,  T4.crs_description FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code	college_1
SELECT T1.stu_fname ,  T1.stu_lname ,  T4.crs_description FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code JOIN course AS T4 ON T3.crs_code  =  T4.crs_code	college_1
SELECT T1.stu_fname ,  T1.stu_lname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num WHERE T2.enroll_grade  =  'C' OR T2.enroll_grade  =  'A'	college_1
SELECT T1.stu_fname ,  T1.stu_lname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num WHERE T2.enroll_grade  =  'C' OR T2.enroll_grade  =  'A'	college_1
SELECT T2.emp_fname ,  T1.class_room FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN professor AS T3 ON T2.emp_num  =  T3.emp_num JOIN department AS T4 ON T4.dept_code  =  T3.dept_code WHERE T4.dept_name  =  'Accounting'	college_1
SELECT T2.emp_fname ,  T1.class_room FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN professor AS T3 ON T2.emp_num  =  T3.emp_num JOIN department AS T4 ON T4.dept_code  =  T3.dept_code WHERE T4.dept_name  =  'Accounting'	college_1
SELECT DISTINCT T2.emp_fname ,  T3.prof_high_degree FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN professor AS T3 ON T2.emp_num  =  T3.emp_num JOIN department AS T4 ON T4.dept_code  =  T3.dept_code WHERE T4.dept_name  =  'Computer Info. Systems'	college_1
SELECT DISTINCT T2.emp_fname ,  T3.prof_high_degree FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num JOIN professor AS T3 ON T2.emp_num  =  T3.emp_num JOIN department AS T4 ON T4.dept_code  =  T3.dept_code WHERE T4.dept_name  =  'Computer Info. Systems'	college_1
SELECT T1.stu_lname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num WHERE T2.enroll_grade  =  'A' AND T2.class_code  =  10018	college_1
SELECT T1.stu_lname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num WHERE T2.enroll_grade  =  'A' AND T2.class_code  =  10018	college_1
SELECT T2.emp_fname ,  T1.prof_office FROM professor AS T1 JOIN employee AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T1.dept_code  =  T3.dept_code WHERE T3.dept_name  =  'History' AND T1.prof_high_degree != 'Ph.D.'	college_1
SELECT T2.emp_fname ,  T1.prof_office FROM professor AS T1 JOIN employee AS T2 ON T1.emp_num  =  T2.emp_num JOIN department AS T3 ON T1.dept_code  =  T3.dept_code WHERE T3.dept_name  =  'History' AND T1.prof_high_degree != 'Ph.D.'	college_1
SELECT DISTINCT p.emp_num FROM professor p JOIN class c ON p.emp_num = c.prof_num GROUP BY p.emp_num HAVING COUNT(DISTINCT c.class_code) > 1	college_1
SELECT T2.emp_fname FROM CLASS AS T1 JOIN employee AS T2 ON T1.prof_num  =  T2.emp_num GROUP BY T1.prof_num HAVING count(*)  >  1	college_1
SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num GROUP BY T2.stu_num HAVING count(*)  =  1	college_1
SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num GROUP BY T2.stu_num HAVING count(*)  =  1	college_1
SELECT T2.dept_name FROM course AS T1 JOIN department AS T2 ON T1.dept_code  =  T2.dept_code WHERE T1.crs_description LIKE '%Statistics%'	college_1
SELECT dept_name FROM department WHERE dept_code IN (SELECT dept_code FROM course WHERE crs_description LIKE '%Statistics%')	college_1
SELECT stu_fname FROM student WHERE stu_num IN (SELECT enroll.stu_num FROM enroll JOIN class ON enroll.class_code = class.class_code WHERE class.crs_code = 'ACCT-211') AND stu_lname LIKE 'S%'	college_1
SELECT T1.stu_fname FROM student AS T1 JOIN enroll AS T2 ON T1.stu_num  =  T2.stu_num JOIN CLASS AS T3 ON T2.class_code  =  T3.class_code WHERE T3.crs_code  =  'ACCT-211' AND T1.stu_lname LIKE 'S%'	college_1
SELECT count(*) FROM club	sports_competition
SELECT count(*) FROM club	sports_competition
SELECT DISTINCT Region FROM club ORDER BY Region ASC	sports_competition
SELECT DISTINCT Region FROM club ORDER BY Region ASC	sports_competition
SELECT avg(Gold) FROM club_rank	sports_competition
SELECT avg(Gold) FROM club_rank	sports_competition
SELECT Competition_type ,  Country FROM competition	sports_competition
SELECT Competition_type ,  Country FROM competition	sports_competition
SELECT DISTINCT YEAR FROM competition WHERE Competition_type != 'Tournament'	sports_competition
SELECT DISTINCT YEAR FROM competition WHERE Competition_type != 'Tournament'	sports_competition
SELECT max(Silver) ,  min(Silver) FROM club_rank	sports_competition
SELECT max(Silver) ,  min(Silver) FROM club_rank	sports_competition
SELECT COUNT(DISTINCT club_rank.club_id) FROM club_rank WHERE club_rank.total < 10	sports_competition
SELECT COUNT(DISTINCT club_id) FROM club_rank WHERE total < 10	sports_competition
SELECT name FROM club ORDER BY Start_year ASC	sports_competition
SELECT c.name FROM club AS c WHERE c.start_year = (SELECT MIN(start_year) FROM club)	sports_competition
SELECT name FROM club ORDER BY name DESC	sports_competition
SELECT name FROM club ORDER BY name DESC	sports_competition
SELECT T1.name ,  T2.Player_id FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	sports_competition
SELECT T1.name ,  T2.Player_id FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	sports_competition
SELECT name FROM club WHERE club_id IN (SELECT club_id FROM player WHERE position = 'Right Wing')	sports_competition
SELECT club.name FROM club WHERE club_id IN (SELECT club_id FROM player WHERE position = 'Right Wing')	sports_competition
SELECT avg(T2.Points) FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.name  =  'AIB'	sports_competition
SELECT avg(T2.Points) FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.name  =  'AIB'	sports_competition
SELECT p.position, ROUND(AVG(p.points), 2) FROM player p GROUP BY p.position	sports_competition
SELECT POSITION ,  avg(Points) FROM player GROUP BY POSITION	sports_competition
SELECT position FROM player GROUP BY position HAVING AVG(points) > 20	sports_competition
SELECT position FROM player GROUP BY position HAVING AVG(points) > 20	sports_competition
SELECT Competition_type ,  COUNT(*) FROM competition GROUP BY Competition_type	sports_competition
SELECT Competition_type ,  COUNT(*) FROM competition GROUP BY Competition_type	sports_competition
SELECT competition_type FROM competition GROUP BY competition_type HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM competition GROUP BY competition_type))	sports_competition
SELECT competition_type FROM competition GROUP BY competition_type HAVING COUNT(competition_type) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM competition GROUP BY competition_type))	sports_competition
SELECT Competition_type FROM competition GROUP BY Competition_type HAVING COUNT(*)  <=  5	sports_competition
SELECT c.competition_type FROM (SELECT competition_type, COUNT(competition_id) AS cnt FROM competition GROUP BY competition_type ORDER BY cnt DESC) c LIMIT 5	sports_competition
SELECT name FROM CLub WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	sports_competition
SELECT name FROM CLub WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	sports_competition
SELECT POSITION FROM player WHERE Points  >  20 INTERSECT SELECT POSITION FROM player WHERE Points  <  10	sports_competition
SELECT position FROM player WHERE points > 20 UNION SELECT position FROM player WHERE points < 10	sports_competition
SELECT sum(Points) FROM player	sports_competition
SELECT sum(Points) FROM player	sports_competition
SELECT count(DISTINCT POSITION) FROM player	sports_competition
SELECT count(DISTINCT POSITION) FROM player	sports_competition
SELECT name FROM player WHERE points  >  (SELECT avg(points) FROM player)	sports_competition
SELECT name FROM player WHERE points  >  (SELECT avg(points) FROM player)	sports_competition
SELECT count(*) ,  POSITION FROM player WHERE points  <  30 GROUP BY POSITION	sports_competition
SELECT count(*) ,  POSITION FROM player WHERE points  <  30 GROUP BY POSITION	sports_competition
SELECT country FROM competition WHERE competition_type  =  'Tournament' GROUP BY country ORDER BY count(*) DESC LIMIT 1	sports_competition
SELECT country FROM competition GROUP BY country ORDER BY COUNT(competition_id) DESC LIMIT 1	sports_competition
SELECT country FROM competition WHERE competition_type  =  'Friendly' INTERSECT SELECT country FROM competition WHERE competition_type  =  'Tournament'	sports_competition
SELECT country FROM competition WHERE competition_type  =  'Friendly' INTERSECT SELECT country FROM competition WHERE competition_type  =  'Tournament'	sports_competition
SELECT country FROM competition EXCEPT SELECT country FROM competition WHERE competition_type  =  'Friendly'	sports_competition
SELECT country FROM competition EXCEPT SELECT country FROM competition WHERE competition_type  =  'Friendly'	sports_competition
SELECT sum(num_of_component) FROM furniture	manufacturer
SELECT f.name, f.furniture_id FROM furniture f WHERE f.market_rate = (SELECT MAX(market_rate) FROM furniture)	manufacturer
SELECT SUM(market_rate) FROM (SELECT market_rate FROM furniture ORDER BY market_rate DESC LIMIT 2)	manufacturer
SELECT Num_of_Component ,  name FROM furniture WHERE Num_of_Component  >  10	manufacturer
SELECT f.name, f.num_of_component FROM furniture AS f WHERE f.market_rate = (SELECT MIN(market_rate) FROM furniture)	manufacturer
SELECT t1.name FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID WHERE t2.Price_in_Dollar  <  (SELECT max(Price_in_Dollar) FROM furniture_manufacte)	manufacturer
SELECT name, open_year FROM manufacturer WHERE num_of_shops = (SELECT MAX(num_of_shops) FROM manufacturer);	manufacturer
SELECT avg(Num_of_Factories) FROM manufacturer WHERE num_of_shops  >  20	manufacturer
SELECT name ,  manufacturer_id FROM manufacturer ORDER BY open_year	manufacturer
SELECT name ,  open_year FROM manufacturer WHERE num_of_shops  >  10 OR Num_of_Factories  <  10	manufacturer
SELECT max(num_of_shops) ,  avg(Num_of_Factories) FROM manufacturer WHERE open_year  <  1990	manufacturer
SELECT m.manufacturer_id, m.num_of_shops FROM manufacturer m WHERE EXISTS (SELECT 1 FROM furniture_manufacte fm WHERE m.manufacturer_id = fm.manufacturer_id AND fm.price_in_dollar = (SELECT MAX(price_in_dollar) FROM furniture_manufacte))	manufacturer
SELECT m.name AS ManufacturerName, COUNT(DISTINCT f.furniture_id) AS FurnitureTypes FROM manufacturer m LEFT JOIN furniture_manufacte fm ON m.manufacturer_id = fm.manufacturer_id LEFT JOIN furniture f ON fm.furniture_id = f.furniture_id GROUP BY m.manufacturer_id	manufacturer
SELECT t1.name ,  t2.price_in_dollar FROM furniture AS t1 JOIN furniture_manufacte AS t2 ON t1.Furniture_ID  =  t2.Furniture_ID	manufacturer
SELECT Market_Rate ,  name FROM furniture WHERE Furniture_ID NOT IN (SELECT Furniture_ID FROM furniture_manufacte)	manufacturer
SELECT m.name FROM manufacturer m WHERE EXISTS (SELECT 1 FROM furniture f JOIN furniture_manufacte fm ON fm.furniture_id = f.furniture_id WHERE fm.manufacturer_id = m.manufacturer_id AND f.num_of_component < 6) AND EXISTS (SELECT 1 FROM furniture f JOIN furniture_manufacte fm ON fm.furniture_id = f.furniture_id WHERE fm.manufacturer_id = m.manufacturer_id AND f.num_of_component > 10)	manufacturer
SELECT T1.first_name ,  T2.department_name FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id	hr_1
SELECT T1.first_name ,  T2.department_name FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id	hr_1
SELECT first_name || ' ' || last_name AS full_name, salary FROM employees WHERE salary < 6000	hr_1
SELECT first_name || ' ' || last_name AS full_name, salary FROM employees WHERE salary < 6000	hr_1
SELECT first_name ,  department_id FROM employees WHERE last_name  =  'McEwen'	hr_1
SELECT first_name ,  department_id FROM employees WHERE last_name  =  'McEwen'	hr_1
SELECT * FROM employees WHERE department_id  =  'null'	hr_1
SELECT * FROM employees WHERE department_id  =  'null'	hr_1
SELECT * FROM  departments WHERE department_name  =  'Marketing'	hr_1
SELECT * FROM  departments WHERE department_name  =  'Marketing'	hr_1
SELECT hire_date FROM employees WHERE first_name NOT LIKE '%M%'	hr_1
SELECT hire_date FROM employees WHERE instr(first_name, 'M') = 0	hr_1
SELECT first_name || ' ' || last_name AS full_name, hire_date, salary, department_id FROM employees WHERE first_name NOT LIKE '%M%'	hr_1
SELECT first_name || ' ' || last_name AS full_name, hire_date, salary, department_id FROM employees WHERE first_name NOT LIKE '%M%'	hr_1
SELECT first_name || ' ' || last_name AS full_name, hire_date, salary, department_id FROM employees WHERE first_name NOT LIKE '%M%' ORDER BY department_id ASC	hr_1
SELECT first_name || ' ' || last_name AS full_name, hire_date, salary, department_id FROM employees WHERE first_name NOT LIKE '%M%' ORDER BY department_id ASC	hr_1
SELECT phone_number FROM employees WHERE salary BETWEEN 8000 AND 12000	hr_1
SELECT phone_number FROM employees WHERE salary BETWEEN 8000 AND 12000	hr_1
SELECT * FROM employees WHERE salary BETWEEN 8000 AND 12000 AND commission_pct != 'null' OR  department_id != 40	hr_1
SELECT * FROM employees WHERE salary BETWEEN 8000 AND 12000 AND commission_pct != 'null' OR  department_id != 40	hr_1
SELECT first_name ,  last_name ,  salary FROM  employees WHERE commission_pct  =  'null'	hr_1
SELECT first_name ,  last_name ,  salary FROM  employees WHERE commission_pct  =  'null'	hr_1
SELECT first_name, last_name, salary FROM employees WHERE first_name GLOB '*m'	hr_1
SELECT first_name ,  last_name ,  salary FROM employees WHERE first_name LIKE '%m'	hr_1
SELECT job_id ,  hire_date FROM employees WHERE hire_date BETWEEN '2007-11-05' AND '2009-07-05'	hr_1
SELECT e.job_id, e.hire_date FROM employees e WHERE e.hire_date BETWEEN '2007-11-06' AND '2009-07-04'	hr_1
SELECT first_name ,  last_name FROM employees WHERE department_id  =  70 OR department_id  =  90	hr_1
SELECT first_name || ' ' || last_name AS full_name FROM employees WHERE department_id IN (70, 90)	hr_1
SELECT e.salary, e.manager_id FROM employees e WHERE e.manager_id > 0	hr_1
SELECT salary ,  manager_id FROM employees WHERE manager_id != 'null'	hr_1
SELECT * FROM employees WHERE hire_date  <  '2002-06-21'	hr_1
SELECT * FROM employees WHERE hire_date  <  '2002-06-21'	hr_1
SELECT * FROM employees WHERE first_name LIKE '%D%' OR first_name LIKE '%S%' ORDER BY salary DESC	hr_1
SELECT * FROM employees WHERE first_name LIKE '%D%' OR first_name LIKE '%S%' ORDER BY salary DESC	hr_1
SELECT * FROM employees WHERE hire_date  >  '1987-09-07'	hr_1
SELECT * FROM employees WHERE hire_date  >  '1987-09-07'	hr_1
SELECT job_title FROM jobs WHERE min_salary  >  9000	hr_1
SELECT job_title FROM jobs WHERE max_salary > 9000	hr_1
SELECT job_title ,  max_salary - min_salary FROM jobs WHERE max_salary BETWEEN 12000 AND 18000	hr_1
SELECT job_title ,  max_salary - min_salary FROM jobs WHERE max_salary BETWEEN 12000 AND 18000	hr_1
SELECT email FROM employees WHERE commission_pct  =  'null' AND salary BETWEEN 7000 AND 12000 AND department_id = 50	hr_1
SELECT email FROM employees WHERE commission_pct  =  'null' AND salary BETWEEN 7000 AND 12000 AND department_id = 50	hr_1
SELECT employee_id ,  MAX(end_date) FROM job_history GROUP BY employee_id	hr_1
SELECT employee_id ,  MAX(end_date) FROM job_history GROUP BY employee_id	hr_1
SELECT D.department_name FROM departments D JOIN employees E ON D.department_id = E.department_id WHERE E.commission_pct IS NOT NULL GROUP BY D.department_id HAVING COUNT(E.employee_id) > 10;	hr_1
SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(commission_pct) > 10	hr_1
SELECT DISTINCT department_id FROM employees GROUP BY department_id ,  manager_id HAVING COUNT(employee_id)  >= 4	hr_1
SELECT DISTINCT department_id FROM employees GROUP BY department_id ,  manager_id HAVING COUNT(employee_id)  >= 4	hr_1
SELECT department_id ,  AVG(salary) FROM employees WHERE commission_pct != 'null' GROUP BY department_id	hr_1
SELECT department_id ,  AVG(salary) FROM employees WHERE commission_pct != 'null' GROUP BY department_id	hr_1
SELECT country_id, (SELECT COUNT(DISTINCT city) FROM locations WHERE locations.country_id = countries.country_id) FROM countries	hr_1
SELECT C.country_id, COUNT(DISTINCT L.city) AS city_count FROM countries C LEFT JOIN locations L ON C.country_id = L.country_id GROUP BY C.country_id	hr_1
SELECT job_id FROM (SELECT job_id, employee_id FROM job_history WHERE (job_history.end_date - job_history.start_date) > 300 GROUP BY job_id, employee_id HAVING COUNT(employee_id) > 1) GROUP BY job_id	hr_1
SELECT job_id FROM job_history WHERE end_date - start_date  > 300 GROUP BY job_id HAVING COUNT(*) >= 2	hr_1
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(*)  >= 2	hr_1
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(*)  >= 2	hr_1
SELECT e.employee_id, c.country_name FROM employees e JOIN locations l ON e.department_id = l.location_id JOIN countries c ON l.country_id = c.country_id	hr_1
SELECT T1.employee_id ,  T4.country_name FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id JOIN countries AS T4 ON T3.country_id  =  T4.country_id	hr_1
SELECT d.department_name, (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) AS employee_count FROM departments d	hr_1
SELECT d.department_name, COUNT(e.employee_id) FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_id	hr_1
SELECT * FROM  job_history AS T1 JOIN employees AS T2 ON T1.employee_id  =  T2.employee_id WHERE T2.salary  >=  12000	hr_1
SELECT jh.* FROM job_history jh JOIN employees e ON jh.employee_id = e.employee_id WHERE e.salary >= 12000	hr_1
SELECT job_title ,  AVG(salary) FROM employees AS T1 JOIN jobs AS T2 ON T1.job_id  =  T2.job_id GROUP BY T2.job_title	hr_1
SELECT job_title ,  AVG(salary) FROM employees AS T1 JOIN jobs AS T2 ON T1.job_id  =  T2.job_id GROUP BY T2.job_title	hr_1
SELECT first_name ,  last_name FROM employees WHERE salary  >  (SELECT salary FROM employees WHERE employee_id = 163 )	hr_1
SELECT first_name ,  last_name FROM employees WHERE salary  >  (SELECT salary FROM employees WHERE employee_id = 163 )	hr_1
SELECT MIN(salary) ,  department_id FROM employees GROUP BY department_id	hr_1
SELECT MIN(salary) ,  department_id FROM employees GROUP BY department_id	hr_1
SELECT first_name, last_name, department_id FROM employees WHERE salary = (SELECT MIN(salary) FROM employees WHERE department_id = employees.department_id)	hr_1
SELECT first_name || ' ' || last_name, department_id FROM employees WHERE salary = (SELECT MIN(salary) FROM employees)	hr_1
SELECT employee_id FROM employees WHERE salary  >  (SELECT AVG(salary) FROM employees)	hr_1
SELECT employee_id FROM employees WHERE salary  >  (SELECT AVG(salary) FROM employees)	hr_1
SELECT e.employee_id, e.salary FROM employees e INNER JOIN employees m ON e.manager_id = m.employee_id WHERE m.first_name = 'Payam'	hr_1
SELECT employee_id ,  salary FROM employees WHERE manager_id  =  (SELECT employee_id FROM employees WHERE first_name  =  'Payam' )	hr_1
SELECT department_name FROM departments WHERE department_id IN (SELECT department_id FROM employees)	hr_1
SELECT department_name FROM departments WHERE department_id IN (SELECT department_id FROM employees)	hr_1
SELECT * FROM employees WHERE employee_id IN (SELECT manager_id FROM departments)	hr_1
SELECT * FROM employees WHERE employee_id IN (SELECT manager_id FROM departments)	hr_1
SELECT * FROM  departments WHERE department_name  =  'Marketing'	hr_1
SELECT * FROM  departments WHERE department_name  =  'Marketing'	hr_1
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(*)  >= 2	hr_1
SELECT employee_id FROM job_history GROUP BY employee_id HAVING COUNT(DISTINCT job_id) >= 2	hr_1
SELECT DISTINCT department_id FROM employees GROUP BY department_id ,  manager_id HAVING COUNT(employee_id)  >= 4	hr_1
SELECT DISTINCT department_id FROM employees GROUP BY department_id ,  manager_id HAVING COUNT(employee_id)  >= 4	hr_1
SELECT job_id FROM employees GROUP BY job_id HAVING AVG(salary) > 8000	hr_1
SELECT job_id FROM employees GROUP BY job_id HAVING AVG(salary) > 8000	hr_1
SELECT T1.employee_id ,  T2.job_title FROM employees AS T1 JOIN jobs AS T2 ON T1.job_id  =  T2.job_id WHERE T1.department_id = 80	hr_1
SELECT T1.employee_id ,  T2.job_title FROM employees AS T1 JOIN jobs AS T2 ON T1.job_id  =  T2.job_id WHERE T1.department_id = 80	hr_1
SELECT T1.first_name ,  T1.job_id FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id WHERE T2.department_name  =  'Finance'	hr_1
SELECT T1.first_name ,  T1.job_id FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id WHERE T2.department_name  =  'Finance'	hr_1
SELECT * FROM employees WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 2500	hr_1
SELECT * FROM employees WHERE salary > (SELECT min_salary FROM jobs WHERE jobs.job_id = employees.job_id) AND salary < 2500	hr_1
SELECT employee_id FROM employees WHERE department_id NOT IN (SELECT department_id FROM employees WHERE manager_id BETWEEN 100 AND 200)	hr_1
SELECT employee_id FROM employees WHERE department_id NOT IN (SELECT department_id FROM departments WHERE manager_id BETWEEN 100 AND 200)	hr_1
SELECT first_name, last_name, hire_date FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE first_name = 'Clara')	hr_1
SELECT e.first_name || ' ' || e.last_name AS full_name, e.hire_date FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE d.department_id IN (SELECT department_id FROM employees WHERE first_name = 'Clara')	hr_1
SELECT first_name, last_name, hire_date FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE first_name = 'Clara') AND first_name != 'Clara'	hr_1
SELECT e2.first_name || ' ' || e2.last_name AS full_name, e2.hire_date FROM employees e1 JOIN employees e2 ON e1.department_id = e2.department_id WHERE e1.first_name = 'Clara' AND e2.first_name <> 'Clara'	hr_1
SELECT employee_id ,  first_name ,  last_name FROM employees WHERE department_id IN ( SELECT department_id FROM employees WHERE first_name LIKE '%T%' )	hr_1
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS full_name FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE EXISTS (SELECT 1 FROM employees e2 WHERE e2.department_id = d.department_id AND e2.first_name LIKE '%T%')	hr_1
SELECT e.employee_id, (e.first_name || ' ' || e.last_name) as name, e.salary FROM employees e WHERE e.salary > (SELECT AVG(salary) FROM employees) AND e.department_id IN (SELECT d.department_id FROM departments d JOIN employees e2 ON d.department_id = e2.department_id WHERE e2.first_name LIKE '%J%')	hr_1
SELECT e.employee_id, e.first_name || ' ' || e.last_name as full_name, e.salary FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE e.salary > (SELECT AVG(e2.salary) FROM employees e2) AND e.department_id IN (SELECT DISTINCT e3.department_id FROM employees e3 WHERE e3.first_name LIKE '%J%')	hr_1
SELECT employee_id ,  job_id FROM employees WHERE salary  <  ( SELECT min(salary) FROM employees WHERE job_id  =  'MK_MAN' )	hr_1
SELECT e.employee_id, e.job_id FROM employees e WHERE e.salary < (SELECT MIN(e2.salary) FROM employees e2 JOIN jobs j ON e2.job_id = j.job_id WHERE j.job_title = 'MK_MAN')	hr_1
SELECT employee_id ,  first_name ,  last_name ,  job_id FROM employees WHERE salary  >  ( SELECT max(salary) FROM employees WHERE job_id  =  'PU_MAN' )	hr_1
SELECT employee_id ,  first_name ,  last_name ,  job_id FROM employees WHERE salary  >  ( SELECT max(salary) FROM employees WHERE job_id  =  'PU_MAN' )	hr_1
SELECT department_id ,  SUM(salary) FROM employees GROUP BY department_id HAVING count(*)  >=  2	hr_1
SELECT SUM(e.salary) AS TotalSalaries, e.department_id FROM employees e GROUP BY e.department_id HAVING COUNT(e.employee_id) > 2	hr_1
SELECT * FROM employees WHERE employee_id NOT IN (SELECT employee_id FROM job_history)	hr_1
SELECT * FROM employees WHERE employee_id NOT IN (SELECT employee_id FROM job_history)	hr_1
SELECT d.department_id, e.first_name || ' ' || e.last_name AS full_name, e.salary FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE (e.department_id, e.salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id);	hr_1
SELECT e.department_id, e.first_name || ' ' || e.last_name AS full_name, e.salary FROM employees e WHERE e.salary = (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id)	hr_1
SELECT T1.first_name ,  T1.last_name ,  T2.department_name ,  T3.city ,  T3.state_province FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id	hr_1
SELECT T1.first_name ,  T1.last_name ,  T2.department_name ,  T3.city ,  T3.state_province FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id	hr_1
SELECT T1.first_name ,  T1.last_name ,  T3.city FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id WHERE T1.first_name LIKE '%z%'	hr_1
SELECT e.first_name || ' ' || e.last_name AS full_name, l.city FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN locations l ON d.location_id = l.location_id WHERE e.first_name LIKE '%Z%'	hr_1
SELECT T1.department_name ,  T2.city ,  T2.state_province FROM departments AS T1 JOIN locations AS T2 ON T2.location_id  =  T1.location_id	hr_1
SELECT T1.department_name ,  T2.city ,  T2.state_province FROM departments AS T1 JOIN locations AS T2 ON T2.location_id  =  T1.location_id	hr_1
SELECT T1.first_name ,  T1.last_name , T1.employee_id ,  T4.country_name FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id JOIN countries AS T4 ON T3.country_id  =  T4.country_id	hr_1
SELECT T1.first_name ,  T1.last_name , T1.employee_id ,  T4.country_name FROM employees AS T1 JOIN departments AS T2 ON T1.department_id  =  T2.department_id JOIN locations AS T3 ON T2.location_id  =  T3.location_id JOIN countries AS T4 ON T3.country_id  =  T4.country_id	hr_1
SELECT D.department_name, COUNT(E.employee_id) AS num_employees FROM departments D LEFT JOIN employees E ON D.department_id = E.department_id GROUP BY D.department_id	hr_1
SELECT department_name, (SELECT COUNT(employee_id) FROM employees WHERE departments.department_id = employees.department_id) AS employee_count FROM departments	hr_1
SELECT employees.first_name || ' ' || employees.last_name AS full_name, employees.salary FROM employees JOIN departments ON employees.department_id = departments.department_id JOIN locations ON departments.location_id = locations.location_id WHERE locations.city = 'London'	hr_1
SELECT first_name || ' ' || last_name AS full_name, salary FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE city = 'London'))	hr_1
SELECT song_name ,  releasedate FROM song ORDER BY releasedate DESC LIMIT 1	music_1
SELECT song_name ,  releasedate FROM song ORDER BY releasedate DESC LIMIT 1	music_1
SELECT f_id FROM files ORDER BY duration DESC LIMIT 1	music_1
SELECT f_id FROM files ORDER BY duration DESC LIMIT 1	music_1
SELECT song_name FROM song WHERE languages  =  'english'	music_1
SELECT song_name FROM song WHERE languages  =  'english'	music_1
SELECT song.f_id FROM song JOIN files ON song.f_id = files.f_id WHERE files.formats = 'mp3'	music_1
SELECT f_id FROM files WHERE formats  =  'mp3'	music_1
SELECT DISTINCT T1.artist_name ,  T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.rating  >  9	music_1
SELECT DISTINCT T1.artist_name ,  T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.rating  >  9	music_1
SELECT DISTINCT T1.file_size ,  T1.formats FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T2.resolution  <  800	music_1
SELECT DISTINCT T1.file_size ,  T1.formats FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T2.resolution  <  800	music_1
SELECT T1.artist_name FROM song AS T1 JOIN files AS T2 ON T1.f_id  =  T2.f_id ORDER BY T2.duration LIMIT 1	music_1
SELECT T1.artist_name FROM song AS T1 JOIN files AS T2 ON T1.f_id  =  T2.f_id ORDER BY T2.duration LIMIT 1	music_1
SELECT DISTINCT artist.artist_name, artist.country FROM artist JOIN song ON artist.artist_name = song.artist_name ORDER BY song.rating DESC LIMIT 3	music_1
SELECT T1.artist_name ,  T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name ORDER BY T2.rating DESC LIMIT 3	music_1
SELECT count(*) FROM files WHERE duration LIKE '4:%'	music_1
SELECT COUNT(*) FROM song JOIN files ON song.f_id = files.f_id WHERE duration BETWEEN 230 AND 250	music_1
SELECT count(*) FROM artist WHERE country  =  'Bangladesh'	music_1
SELECT count(*) FROM artist WHERE country  =  'Bangladesh'	music_1
SELECT avg(T2.rating) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T1.gender  =  'Female'	music_1
SELECT avg(T2.rating) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T1.gender  =  'Female'	music_1
SELECT formats FROM files GROUP BY formats ORDER BY COUNT (*) DESC LIMIT 1	music_1
SELECT formats FROM files GROUP BY formats ORDER BY COUNT (*) DESC LIMIT 1	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' INTERSECT SELECT artist_name FROM song WHERE languages  =  'english'	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' INTERSECT SELECT artist_name FROM song WHERE languages  =  'english'	music_1
SELECT f_id FROM files WHERE formats  =  'mp4' INTERSECT SELECT f_id FROM song WHERE resolution  <  1000	music_1
SELECT f_id FROM files WHERE formats  =  'mp4' INTERSECT SELECT f_id FROM song WHERE resolution  <  1000	music_1
SELECT T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T1.gender  =  'Female' AND T2.languages  =  'bangla'	music_1
SELECT DISTINCT artist.country FROM artist JOIN song ON artist.artist_name = song.artist_name WHERE artist.gender = 'Female' AND song.languages = 'bangla'	music_1
SELECT avg(T1.duration) FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.formats  =  'mp3' AND T2.resolution   <  800	music_1
SELECT avg(T1.duration) FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.formats  =  'mp3' AND T2.resolution   <  800	music_1
SELECT count(*) ,  gender FROM artist GROUP BY gender	music_1
SELECT count(*) ,  gender FROM artist GROUP BY gender	music_1
SELECT avg(rating) ,  languages FROM song GROUP BY languages	music_1
SELECT avg(rating) ,  languages FROM song GROUP BY languages	music_1
SELECT T1.gender ,  T1.artist_name FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name ORDER BY T2.resolution LIMIT 1	music_1
SELECT T1.gender ,  T1.artist_name FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name ORDER BY T2.resolution LIMIT 1	music_1
SELECT count(*) ,  formats FROM files GROUP BY formats	music_1
SELECT formats, COUNT(song_name) AS song_count FROM files JOIN song ON files.f_id = song.f_id GROUP BY formats	music_1
SELECT DISTINCT song_name FROM song WHERE resolution  >  (SELECT min(resolution) FROM song WHERE languages  =  'english')	music_1
SELECT DISTINCT s1.song_name FROM song s1 WHERE s1.resolution > (SELECT MAX(s2.resolution) FROM song s2 WHERE s2.languages = 'english')	music_1
SELECT song_name FROM song WHERE rating  <  (SELECT max(rating) FROM song WHERE genre_is  =  'blues')	music_1
SELECT DISTINCT s1.song_name FROM song s1 WHERE s1.rating < (SELECT MIN(s2.rating) FROM song s2 INNER JOIN genre g ON s2.genre_is = g.g_name WHERE g.g_name = 'blues')	music_1
SELECT a.artist_name, a.country FROM artist a WHERE EXISTS (SELECT 1 FROM song s WHERE s.artist_name = a.artist_name AND s.song_name LIKE '%love%')	music_1
SELECT DISTINCT artist.artist_name, artist.country FROM artist JOIN song ON artist.artist_name = song.artist_name WHERE song.song_name LIKE '%love%';	music_1
SELECT T1.artist_name ,  T1.gender FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.releasedate LIKE '%Mar%'	music_1
SELECT T1.artist_name ,  T1.gender FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.releasedate LIKE '%Mar%'	music_1
SELECT g_name ,  rating FROM genre ORDER BY g_name	music_1
SELECT g_name ,  rating FROM genre ORDER BY g_name	music_1
SELECT song_name FROM song ORDER BY resolution	music_1
SELECT song_name FROM song ORDER BY resolution	music_1
SELECT f_id FROM files WHERE formats  =  'mp4' UNION SELECT f_id FROM song WHERE resolution  >  720	music_1
SELECT f_id FROM files WHERE formats  =  'mp4' UNION SELECT f_id FROM song WHERE resolution  >  720	music_1
SELECT T2.song_name FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.duration LIKE '4:%' UNION SELECT song_name FROM song WHERE languages  =  'english'	music_1
SELECT T2.song_name FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.duration LIKE '4:%' UNION SELECT song_name FROM song WHERE languages  =  'english'	music_1
SELECT languages FROM song GROUP BY languages ORDER BY count(*) DESC LIMIT 1	music_1
SELECT languages FROM song GROUP BY languages ORDER BY count(*) DESC LIMIT 1	music_1
SELECT languages FROM song WHERE resolution > 500 GROUP BY languages ORDER BY COUNT(*) DESC LIMIT 1	music_1
SELECT artist_name FROM song WHERE resolution  >  500 GROUP BY languages ORDER BY count(*) DESC LIMIT 1	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' AND gender  =  'Male'	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' AND gender  =  'Male'	music_1
SELECT song_name FROM song WHERE genre_is  =  'modern' OR languages  =  'english'	music_1
SELECT song_name FROM song WHERE genre_is  =  'modern' OR languages  =  'english'	music_1
SELECT T2.song_name FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.formats  =  'mp3' INTERSECT SELECT song_name FROM song WHERE resolution  <  1000	music_1
SELECT T2.song_name FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.formats  =  'mp3' INTERSECT SELECT song_name FROM song WHERE resolution  <  1000	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' INTERSECT SELECT T1.artist_name FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.languages  =  'english'	music_1
SELECT artist_name FROM artist WHERE country  =  'UK' INTERSECT SELECT T1.artist_name FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.languages  =  'english'	music_1
SELECT avg(rating) ,  avg(resolution) FROM song WHERE languages  =  'bangla'	music_1
SELECT avg(rating) ,  avg(resolution) FROM song WHERE languages  =  'bangla'	music_1
SELECT max(T2.resolution) ,  min(T2.resolution) FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.duration LIKE '3:%'	music_1
SELECT max(T2.resolution) ,  min(T2.resolution) FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T1.duration LIKE '3:%'	music_1
SELECT max(T1.duration) ,  max(T2.resolution) ,  T2.languages FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id GROUP BY T2.languages ORDER BY T2.languages	music_1
SELECT max(T1.duration) ,  max(T2.resolution) ,  T2.languages FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id GROUP BY T2.languages ORDER BY T2.languages	music_1
SELECT min(T1.duration) ,  min(T2.rating) ,  T2.genre_is FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id GROUP BY T2.genre_is ORDER BY T2.genre_is	music_1
SELECT min(T1.duration) ,  min(T2.rating) ,  T2.genre_is FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id GROUP BY T2.genre_is ORDER BY T2.genre_is	music_1
SELECT T1.artist_name ,  count(*) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.languages  =  'english' GROUP BY T2.artist_name HAVING count(*)  >=  1	music_1
SELECT T1.artist_name ,  count(*) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.languages  =  'english' GROUP BY T2.artist_name HAVING count(*)  >=  1	music_1
SELECT T1.artist_name ,  T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.resolution  >  900 GROUP BY T2.artist_name HAVING count(*)  >=  1	music_1
SELECT T1.artist_name ,  T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name WHERE T2.resolution  >  900 GROUP BY T2.artist_name HAVING count(*)  >=  1	music_1
SELECT T1.artist_name ,  count(*) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name GROUP BY T2.artist_name ORDER BY count(*) DESC LIMIT 3	music_1
SELECT T1.artist_name ,  count(*) FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name GROUP BY T2.artist_name ORDER BY count(*) DESC LIMIT 3	music_1
SELECT T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name GROUP BY T2.artist_name ORDER BY count(*) LIMIT 1	music_1
SELECT T1.country FROM artist AS T1 JOIN song AS T2 ON T1.artist_name  =  T2.artist_name GROUP BY T2.artist_name ORDER BY count(*) LIMIT 1	music_1
SELECT song_name FROM song WHERE rating  <   (SELECT min(rating) FROM song WHERE languages  =  'english')	music_1
SELECT song_name FROM song WHERE rating  <   (SELECT min(rating) FROM song WHERE languages  =  'english')	music_1
SELECT f_id FROM song WHERE resolution  >  (SELECT max(resolution) FROM song WHERE rating  <  8)	music_1
SELECT s.f_id FROM song s WHERE s.resolution > (SELECT resolution FROM song WHERE rating < 8)	music_1
SELECT f_id FROM song WHERE resolution  >  (SELECT avg(resolution) FROM song WHERE genre_is  =  'modern')	music_1
SELECT s.f_id FROM song s JOIN genre g ON s.genre_is = g.g_name WHERE s.resolution > (SELECT AVG(resolution) FROM song s2 JOIN genre g2 ON s2.genre_is = g2.g_name WHERE g2.g_name = 'modern') AND g.g_name = 'modern'	music_1
SELECT artist_name FROM (SELECT artist_name, COUNT(*) AS count_song FROM song WHERE languages = 'bangla' GROUP BY artist_name) ORDER BY count_song DESC LIMIT 3	music_1
SELECT artist FROM (SELECT artist_name AS artist, COUNT(*) as numSongs FROM song WHERE languages = 'bangla' GROUP BY artist_name) AS tb ORDER BY numSongs DESC LIMIT 5	music_1
SELECT f_id ,  genre_is ,  artist_name FROM song WHERE languages  =   'english' ORDER BY rating	music_1
SELECT f_id ,  genre_is ,  artist_name FROM song WHERE languages  =   'english' ORDER BY rating	music_1
SELECT T1.duration ,  T1.file_size ,  T1.formats FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T2.genre_is  =  'pop' ORDER BY T2.song_name	music_1
SELECT T1.duration ,  T1.file_size ,  T1.formats FROM files AS T1 JOIN song AS T2 ON T1.f_id  =  T2.f_id WHERE T2.genre_is  =  'pop' ORDER BY T2.song_name	music_1
SELECT DISTINCT artist_name FROM song WHERE languages  =  'english' EXCEPT SELECT DISTINCT artist_name FROM song WHERE rating  >  8	music_1
SELECT DISTINCT artist_name FROM song WHERE languages  =  'english' EXCEPT SELECT DISTINCT artist_name FROM song WHERE rating  >  8	music_1
SELECT DISTINCT artist_name FROM artist WHERE country  =  'Bangladesh' EXCEPT SELECT DISTINCT artist_name FROM song WHERE rating  >  7	music_1
SELECT DISTINCT artist_name FROM artist WHERE country  =  'Bangladesh' EXCEPT SELECT DISTINCT artist_name FROM song WHERE rating  >  7	music_1
SELECT name_full, college.college_id FROM college, (SELECT college_id FROM player_college GROUP BY college_id HAVING COUNT(player_id) = (SELECT MAX(Count) FROM (SELECT COUNT(player_id) AS Count FROM player_college GROUP BY college_id))) AS MaxPlayers WHERE college.college_id = MaxPlayers.college_id	baseball_1
SELECT DISTINCT name_full, c.college_id FROM college c JOIN (SELECT college_id, COUNT(*) as num_players FROM player_college GROUP BY college_id ORDER BY num_players DESC LIMIT 1) pc ON c.college_id = pc.college_id	baseball_1
SELECT AVG(s.salary) FROM salary s JOIN team t ON s.team_id = t.team_id WHERE t.name = 'Boston Red Stockings'	baseball_1
SELECT AVG(salary.salary) FROM salary JOIN team ON team.team_id = salary.team_id WHERE team.name = 'Boston Red Stockings'	baseball_1
SELECT name_first, name_last FROM player WHERE player_id IN (SELECT player_id FROM all_star WHERE year = 1998)	baseball_1
SELECT name_first ,  name_last FROM player AS T1 JOIN all_star AS T2 ON T1.player_id  =  T2.player_id WHERE YEAR  =  1998	baseball_1
SELECT p.name_first, p.name_last, a.player_id, COUNT(a.game_id) FROM player p JOIN all_star a ON p.player_id = a.player_id GROUP BY a.player_id HAVING COUNT(a.game_id) = (SELECT MAX(total) FROM (SELECT COUNT(game_id) AS total FROM all_star GROUP BY player_id))	baseball_1
SELECT p.player_id, p.name_first, p.name_last, all_star_games from player p JOIN (SELECT player_id, COUNT(*) as all_star_games FROM all_star GROUP BY player_id) a ON p.player_id = a.player_id ORDER BY a.all_star_games DESC LIMIT 1	baseball_1
SELECT yearid ,  count(*) FROM hall_of_fame GROUP BY yearid;	baseball_1
SELECT yearid ,  count(*) FROM hall_of_fame GROUP BY yearid;	baseball_1
SELECT YEAR ,  avg(attendance) FROM home_game GROUP BY YEAR;	baseball_1
SELECT YEAR ,  avg(attendance) FROM home_game GROUP BY YEAR;	baseball_1
SELECT T2.team_id ,  T2.rank FROM home_game AS T1 JOIN team AS T2 ON T1.team_id  =  T2.team_id WHERE T1.year  =  2014 GROUP BY T1.team_id ORDER BY avg(T1.attendance) DESC LIMIT 1;	baseball_1
SELECT T2.team_id ,  T2.rank FROM home_game AS T1 JOIN team AS T2 ON T1.team_id  =  T2.team_id WHERE T1.year  =  2014 GROUP BY T1.team_id ORDER BY avg(T1.attendance) DESC LIMIT 1;	baseball_1
SELECT p.name_first, p.name_last, p.player_id FROM player p WHERE p.player_id IN (SELECT player_id FROM manager_award GROUP BY player_id HAVING COUNT(award_id) = (SELECT MAX(award_count) FROM (SELECT player_id, COUNT(award_id) as award_count FROM manager_award GROUP BY player_id) t))	baseball_1
SELECT first.name_first, first.name_last, first.player_id FROM (SELECT p.name_first AS name_first, p.name_last AS name_last, p.player_id AS player_id, COUNT(ma.award_id) AWARDS_COUNT FROM player p JOIN manager_award ma ON p.player_id = ma.player_id GROUP BY p.player_id) AS first ORDER BY first.AWARDS_COUNT DESC LIMIT 1	baseball_1
SELECT count(*) FROM park WHERE state  =  'NY';	baseball_1
SELECT count(*) FROM park WHERE state  =  'NY';	baseball_1
SELECT p.player_id, p.name_first || ' ' || p.name_last AS full_name FROM player p JOIN player_award pa ON p.player_id = pa.player_id GROUP BY p.player_id ORDER BY COUNT(pa.award_id) DESC LIMIT 3	baseball_1
SELECT name_first, name_last, player.player_id FROM player INNER JOIN (SELECT player_id, COUNT(award_id) as num_awards FROM player_award GROUP BY player_id ORDER BY num_awards DESC LIMIT 3) as award_winners ON player.player_id = award_winners.player_id	baseball_1
SELECT p.birth_country FROM player p WHERE p.birth_country IS NOT NULL GROUP BY p.birth_country ORDER BY COUNT(p.birth_country) ASC, p.birth_country DESC LIMIT 3	baseball_1
SELECT birth_country FROM player GROUP BY birth_country ORDER BY count(*) ASC LIMIT 3;	baseball_1
SELECT name_first ,  name_last FROM player WHERE death_year = '';	baseball_1
SELECT name_first ,  name_last FROM player WHERE death_year = '';	baseball_1
SELECT count(*) FROM player WHERE birth_country = 'USA' AND bats  =  'R';	baseball_1
SELECT count(*) FROM player WHERE birth_country = 'USA' AND bats  =  'R';	baseball_1
SELECT avg(T1.height) FROM player AS T1 JOIN player_college AS T2 ON T1.player_id  =  T2.player_id JOIN college AS T3 ON T3.college_id  =  T2.college_id WHERE T3.name_full  =  'Yale University';	baseball_1
SELECT avg(T1.height) FROM player AS T1 JOIN player_college AS T2 ON T1.player_id  =  T2.player_id JOIN college AS T3 ON T3.college_id  =  T2.college_id WHERE T3.name_full  =  'Yale University';	baseball_1
SELECT t.name, t.team_id, MAX(s.salary) AS max_salary FROM team t JOIN salary s ON t.team_id = s.team_id GROUP BY t.team_id, t.name	baseball_1
SELECT T1.name ,  T1.team_id ,  max(T2.salary) FROM team AS T1 JOIN salary AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id;	baseball_1
SELECT name, team_id FROM team WHERE team_id IN (SELECT team_id FROM salary GROUP BY team_id ORDER BY AVG(salary) LIMIT 1)	baseball_1
SELECT t.name, t.team_id FROM team t, salary s WHERE t.team_id = s.team_id GROUP BY s.team_id HAVING AVG(s.salary) = (SELECT MIN(AVG_SB) FROM (SELECT AVG(salary) AVG_SB FROM salary GROUP BY team_id))	baseball_1
SELECT p.name_first, p.name_last FROM player p INNER JOIN player_award pa ON p.player_id = pa.player_id GROUP BY p.player_id HAVING SUM(CASE WHEN pa.year IN (1960, 1961) THEN 1 ELSE 0 END) = 2;	baseball_1
SELECT DISTINCT p.name_first, p.name_last FROM player p WHERE player_id IN (SELECT player_id FROM player_award pa1 WHERE pa1.year = 1960) AND player_id IN (SELECT player_id FROM player_award pa2 WHERE pa2.year = 1961)	baseball_1
SELECT name_first ,  name_last FROM player WHERE weight  >  220 OR height  <  75	baseball_1
SELECT name_first ,  name_last FROM player WHERE weight  >  220 OR height  <  75	baseball_1
SELECT MAX(postseason.wins) FROM postseason JOIN team ON postseason.team_id_winner = team.team_id WHERE team.ws_win = 'Y' AND team.team_id = 'Boston Red Stockings';	baseball_1
SELECT MAX(wins) FROM team t JOIN postseason p ON t.team_id = p.team_id_winner WHERE t.name = 'Boston Red Stockmgs' GROUP BY p.team_id_winner;	baseball_1
SELECT count(*) FROM postseason AS T1 JOIN team AS T2 ON T1.team_id_loser  =  T2.team_id_br WHERE T2.name  =  'Boston Red Stockings' AND T1.year = 2009;	baseball_1
SELECT COUNT(*) FROM postseason WHERE team_id_loser IN (SELECT team_id FROM team WHERE name = 'Boston Red Stockings' AND year = 2009) AND year = 2009;	baseball_1
SELECT T2.name ,  T1.team_id_winner FROM postseason AS T1 JOIN team AS T2 ON T1.team_id_winner  =  T2.team_id_br WHERE T1.year  =  2008 GROUP BY T1.team_id_winner ORDER BY count(*) DESC LIMIT 1;	baseball_1
SELECT T2.name ,  T1.team_id_winner FROM postseason AS T1 JOIN team AS T2 ON T1.team_id_winner  =  T2.team_id_br WHERE T1.year  =  2008 GROUP BY T1.team_id_winner ORDER BY count(*) DESC LIMIT 1;	baseball_1
SELECT P.year, SUM(P.wins) AS wins FROM postseason P JOIN team T ON P.team_id_winner = T.team_id JOIN team_franchise TF ON T.team_id = TF.franchise_id WHERE TF.franchise_name = 'Boston Red Stockings' GROUP BY P.year	baseball_1
SELECT p.year, COUNT(*) AS wins FROM postseason p JOIN team t ON p.team_id_winner = t.team_id WHERE t.name = 'Boston Red Stockings' GROUP BY p.year	baseball_1
SELECT COUNT(*) FROM postseason WHERE team_id_winner IN (SELECT team_id FROM team WHERE name = 'Boston Red Stockings') OR team_id_loser IN (SELECT team_id FROM team WHERE name = 'Boston Red Stockings')	baseball_1
SELECT COUNT(*) FROM postseason WHERE team_id_winner IN (SELECT team_id FROM team WHERE name = 'Boston Red Stockings') OR team_id_loser IN (SELECT team_id FROM team WHERE name = 'Boston Red Stockings')	baseball_1
SELECT count(*) FROM postseason WHERE YEAR  =  1885 AND ties  =  1;	baseball_1
SELECT count(*) FROM postseason WHERE YEAR  =  1885 AND ties  =  1;	baseball_1
SELECT sum(T1.salary) FROM salary AS T1 JOIN team AS T2 ON T1.team_id  =  T2.team_id_br WHERE T2.name  = 'Boston Red Stockings' AND T1.year  =  2010	baseball_1
SELECT SUM(salary.salary) FROM salary JOIN team ON salary.team_id = team.team_id WHERE team.name = 'Boston Red Stockings' AND team.year = 2010	baseball_1
SELECT COUNT(player.player_id) FROM player INNER JOIN team ON player.player_id = team.team_id WHERE team.name = 'Boston Red Stockings' AND team.year = 2000 GROUP BY player.player_id	baseball_1
SELECT COUNT(DISTINCT p.player_id) FROM player p JOIN team t ON p.birth_city = t.name WHERE t.year = 2000 AND t.name = 'Boston Red Stockings'	baseball_1
SELECT salary FROM salary WHERE YEAR  =  2001 ORDER BY salary DESC LIMIT 3;	baseball_1
SELECT salary FROM salary WHERE YEAR  =  2001 ORDER BY salary DESC LIMIT 3;	baseball_1
SELECT salary FROM salary WHERE year IN (2010, 2001)	baseball_1
SELECT salary FROM salary WHERE year IN (2010, 2001)	baseball_1
SELECT yearid FROM hall_of_fame GROUP BY yearid ORDER BY count(*) ASC LIMIT 1;	baseball_1
SELECT yearid FROM hall_of_fame GROUP BY yearid ORDER BY count(*) ASC LIMIT 1;	baseball_1
SELECT count(*) FROM park WHERE city = 'Atlanta';	baseball_1
SELECT count(*) FROM park WHERE city = 'Atlanta';	baseball_1
SELECT TOTAL(games) FROM home_game hg, park p WHERE hg.park_id = p.park_id AND p.park_name = 'Columbia Park' AND hg.year = 1907	baseball_1
SELECT count(*) FROM home_game AS T1 JOIN park AS T2 ON T1.park_id  =  T2.park_id WHERE T1.year = 1907 AND T2.park_name = 'Columbia Park';	baseball_1
SELECT count(*) FROM home_game AS T1 JOIN park AS T2 ON T1.park_id  =  T2.park_id WHERE T1.year  =  2000 AND T2.city  =  'Atlanta';	baseball_1
SELECT count(*) FROM home_game AS T1 JOIN park AS T2 ON T1.park_id  =  T2.park_id WHERE T1.year  =  2000 AND T2.city  =  'Atlanta';	baseball_1
SELECT sum(T1.attendance) FROM home_game AS T1 JOIN team AS T2 ON T1.team_id  =  T2.team_id_br WHERE T2.name  =  'Boston Red Stockings' AND T1.year BETWEEN 2000 AND 2010;	baseball_1
SELECT TOTAL(g) FROM team WHERE team.name = 'Boston Red Stockings' AND team.year >= 2000 AND team.year <= 2010	baseball_1
SELECT sum(T1.salary) FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id WHERE T2.name_first  =  'Len' AND T2.name_last = 'Barker' AND T1.year BETWEEN 1985 AND 1990;	baseball_1
SELECT sum(T1.salary) FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id WHERE T2.name_first  =  'Len' AND T2.name_last = 'Barker' AND T1.year BETWEEN 1985 AND 1990;	baseball_1
SELECT T2.name_first ,  T2.name_last FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id JOIN team AS T3 ON T3.team_id_br = T1.team_id WHERE T1.year = 2005 AND T3.name = 'Washington Nationals' INTERSECT SELECT T2.name_first , T2.name_last FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id JOIN team AS T3 ON T3.team_id_br = T1.team_id WHERE T1.year = 2007 AND T3.name = 'Washington Nationals'	baseball_1
SELECT T2.name_first ,  T2.name_last FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id JOIN team AS T3 ON T3.team_id_br = T1.team_id WHERE T1.year = 2005 AND T3.name = 'Washington Nationals' INTERSECT SELECT T2.name_first , T2.name_last FROM salary AS T1 JOIN player AS T2 ON T1.player_id = T2.player_id JOIN team AS T3 ON T3.team_id_br = T1.team_id WHERE T1.year = 2007 AND T3.name = 'Washington Nationals'	baseball_1
SELECT TOTAL(hg.games) FROM home_game hg INNER JOIN team t ON t.team_id = hg.team_id WHERE t.name = 'Boston Red Stockings' AND hg.year >= 1990 AND hg.year <= 2000	baseball_1
SELECT COUNT(*) FROM home_game WHERE EXISTS(SELECT * FROM team WHERE team.team_id = home_game.team_id AND team.name = 'Boston Red Stockings' AND team.year BETWEEN 1990 AND 2000)	baseball_1
SELECT T2.name FROM home_game AS T1 JOIN team AS T2 ON T1.team_id = T2.team_id_br WHERE T1.year = 1980 ORDER BY T1.attendance ASC LIMIT 1;	baseball_1
SELECT T2.name FROM home_game AS T1 JOIN team AS T2 ON T1.team_id = T2.team_id_br WHERE T1.year = 1980 ORDER BY T1.attendance ASC LIMIT 1;	baseball_1
SELECT state FROM park GROUP BY state HAVING count(*)  >  2;	baseball_1
SELECT state FROM park GROUP BY state HAVING count(*)  >  2;	baseball_1
SELECT count(*) FROM team_franchise WHERE active = 'Y';	baseball_1
SELECT count(*) FROM team_franchise WHERE active = 'Y';	baseball_1
SELECT city FROM park GROUP BY city HAVING count(*) BETWEEN 2 AND 4;	baseball_1
SELECT city FROM park GROUP BY city HAVING count(*) BETWEEN 2 AND 4;	baseball_1
SELECT park_name FROM park WHERE park_id = (SELECT park_id FROM home_game WHERE year = 2008 GROUP BY park_id ORDER BY SUM(attendance) DESC LIMIT 1)	baseball_1
SELECT park_name FROM park WHERE park_id = (SELECT park_id FROM home_game WHERE year = 2008 GROUP BY park_id ORDER BY SUM(attendance) DESC LIMIT 1)	baseball_1
SELECT count(*) FROM camera_lens WHERE focal_length_mm  >  15	mountain_photos
SELECT brand ,  name FROM camera_lens ORDER BY max_aperture DESC	mountain_photos
SELECT id ,  color ,  name FROM photos	mountain_photos
SELECT max(height) ,  avg(height) FROM mountain	mountain_photos
SELECT avg(prominence) FROM mountain WHERE country  =  'Morocco'	mountain_photos
SELECT name ,  height ,  prominence FROM mountain WHERE range != 'Aberdare Range'	mountain_photos
SELECT photos.id, photos.name FROM photos JOIN mountain ON photos.mountain_id = mountain.id	mountain_photos
SELECT T1.id ,  T1.name FROM mountain AS T1 JOIN photos AS T2 ON T1.id  =  T2.mountain_id GROUP BY T1.id HAVING count(*)  >=  2	mountain_photos
SELECT camera_lens.name FROM photos INNER JOIN camera_lens ON photos.camera_lens_id = camera_lens.id GROUP BY camera_lens.id HAVING COUNT(DISTINCT photos.mountain_id) = (SELECT MAX(m_count) FROM (SELECT COUNT(DISTINCT photos.mountain_id) AS m_count FROM photos GROUP BY photos.camera_lens_id))	mountain_photos
SELECT p.name FROM photos p INNER JOIN camera_lens cl ON p.camera_lens_id = cl.id WHERE cl.brand IN ('Sigma', 'Olympus')	mountain_photos
SELECT count(DISTINCT brand) FROM camera_lens	mountain_photos
SELECT count(*) FROM camera_lens WHERE id NOT IN ( SELECT camera_lens_id FROM photos )	mountain_photos
SELECT count(DISTINCT T2.camera_lens_id) FROM mountain AS T1 JOIN photos AS T2 ON T1.id  =  T2.mountain_id WHERE T1.country  =  'Ethiopia'	mountain_photos
SELECT DISTINCT lens.brand FROM camera_lens lens WHERE EXISTS (SELECT 1 FROM photos ph JOIN mountain mt ON ph.mountain_id = mt.id WHERE mt.range = 'Toubkal Atlas' AND lens.id = ph.camera_lens_id) AND EXISTS (SELECT 1 FROM photos ph JOIN mountain mt ON ph.mountain_id = mt.id WHERE mt.range = 'Lasta Massif' AND lens.id = ph.camera_lens_id)	mountain_photos
SELECT DISTINCT m.name, m.prominence FROM mountain m LEFT OUTER JOIN photos p ON m.id = p.mountain_id LEFT OUTER JOIN camera_lens cl ON p.camera_lens_id = cl.id WHERE cl.brand <> 'Sigma' OR cl.id IS NULL	mountain_photos
SELECT name FROM camera_lens WHERE name LIKE '%Digital%'	mountain_photos
SELECT T1.name ,  count(*) FROM camera_lens AS T1 JOIN photos AS T2 ON T1.id  =  T2.camera_lens_id GROUP BY T1.id ORDER BY count(*)	mountain_photos
SELECT name FROM channel WHERE OWNER != 'CCTV'	program_share
SELECT name FROM channel WHERE OWNER != 'CCTV'	program_share
SELECT name FROM channel ORDER BY rating_in_percent DESC	program_share
SELECT name FROM channel ORDER BY rating_in_percent DESC	program_share
SELECT owner FROM channel WHERE rating_in_percent = (SELECT MAX(rating_in_percent) FROM channel)	program_share
SELECT owner FROM channel WHERE rating_in_percent = (SELECT MAX(rating_in_percent) FROM channel)	program_share
SELECT count(*) FROM program	program_share
SELECT count(*) FROM program	program_share
SELECT name FROM program ORDER BY launch	program_share
SELECT name FROM program ORDER BY launch	program_share
SELECT name ,  origin ,  OWNER FROM program	program_share
SELECT name ,  origin ,  OWNER FROM program	program_share
SELECT P.name FROM program P WHERE P.launch = (SELECT MAX(launch) FROM program)	program_share
SELECT p.name FROM program p WHERE p.launch = (SELECT MAX(launch) FROM program)	program_share
SELECT sum(Share_in_percent) FROM channel WHERE OWNER  =  'CCTV'	program_share
SELECT sum(Share_in_percent) FROM channel WHERE OWNER  =  'CCTV'	program_share
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning'	program_share
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning'	program_share
WITH Morning AS (SELECT channel_id FROM broadcast WHERE time_of_day = 'Morning'), Night AS (SELECT channel_id FROM broadcast WHERE time_of_day = 'Night') SELECT name FROM channel WHERE channel_id IN (SELECT channel_id FROM Morning INTERSECT SELECT channel_id FROM Night)	program_share
SELECT name FROM channel WHERE channel_id IN (SELECT channel_id FROM broadcast WHERE time_of_day = 'Morning' INTERSECT SELECT channel_id FROM broadcast WHERE time_of_day = 'Night')	program_share
SELECT count(*) ,  time_of_day FROM broadcast GROUP BY time_of_day	program_share
SELECT count(*) ,  time_of_day FROM broadcast GROUP BY time_of_day	program_share
SELECT count(DISTINCT program_id) FROM broadcast WHERE time_of_day  =  'Night'	program_share
SELECT count(DISTINCT program_id) FROM broadcast WHERE time_of_day  =  'Night'	program_share
SELECT DISTINCT name FROM program WHERE program_id NOT IN (SELECT DISTINCT program_id FROM broadcast WHERE time_of_day = 'Morning')	program_share
SELECT DISTINCT name FROM program WHERE program_id NOT IN (SELECT program_id FROM broadcast WHERE time_of_day = 'Morning')	program_share
SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  'Morning' INTERSECT SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  'Night'	program_share
SELECT DISTINCT p.owner FROM program p JOIN broadcast b ON p.program_id = b.program_id WHERE b.time_of_day = 'Morning' AND p.program_id IN (SELECT program_id FROM broadcast WHERE time_of_day = 'Night')	program_share
SELECT origin FROM program ORDER BY origin	program_share
SELECT origin FROM program ORDER BY origin	program_share
SELECT count(DISTINCT OWNER) FROM channel	program_share
SELECT count(DISTINCT OWNER) FROM channel	program_share
SELECT name FROM program WHERE origin != 'Beijing'	program_share
SELECT name FROM program WHERE origin != 'Beijing'	program_share
SELECT name FROM channel WHERE OWNER  =  'CCTV' OR OWNER  =  'HBS'	program_share
SELECT name FROM channel WHERE OWNER  =  'CCTV' OR OWNER  =  'HBS'	program_share
SELECT sum(Rating_in_percent) ,  OWNER FROM channel GROUP BY OWNER	program_share
SELECT sum(Rating_in_percent) ,  OWNER FROM channel GROUP BY OWNER	program_share
SELECT t1.name FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id GROUP BY t2.program_id ORDER BY count(*) DESC LIMIT 1	program_share
SELECT p.name FROM program p WHERE p.program_id IN (SELECT b.program_id FROM broadcast b GROUP BY b.program_id HAVING COUNT(b.program_id) = (SELECT MAX(count) FROM (SELECT COUNT(program_id) AS count FROM broadcast GROUP BY program_id)))	program_share
SELECT count(*) FROM COURSES	e_learning
SELECT count(*) FROM COURSES	e_learning
SELECT course_description FROM COURSES WHERE course_name  =  'database'	e_learning
SELECT course_description FROM COURSES WHERE course_name  =  'database'	e_learning
SELECT address_line_1 FROM Course_Authors_and_Tutors WHERE personal_name  =  'Cathrine'	e_learning
SELECT address_line_1 FROM Course_Authors_and_Tutors WHERE personal_name  =  'Cathrine'	e_learning
SELECT address_line_1 FROM Course_Authors_and_Tutors	e_learning
SELECT address_line_1 FROM Course_Authors_and_Tutors	e_learning
SELECT login_name ,  family_name FROM Course_Authors_and_Tutors	e_learning
SELECT login_name ,  family_name FROM Course_Authors_and_Tutors	e_learning
SELECT date_of_enrolment ,  date_of_completion FROM Student_Course_Enrolment	e_learning
SELECT date_of_enrolment ,  date_of_completion FROM Student_Course_Enrolment	e_learning
SELECT count(DISTINCT student_id) FROM Student_Course_Enrolment	e_learning
SELECT count(DISTINCT student_id) FROM Student_Course_Enrolment	e_learning
SELECT COUNT(DISTINCT course_id) FROM student_course_enrolment	e_learning
SELECT COUNT(DISTINCT s.course_id) FROM student_course_enrolment s	e_learning
SELECT date_test_taken FROM Student_Tests_Taken WHERE test_result  =  'Pass'	e_learning
SELECT date_test_taken FROM Student_Tests_Taken WHERE test_result  =  'Pass'	e_learning
SELECT count(*) FROM Student_Tests_Taken WHERE test_result  =  'Fail'	e_learning
SELECT count(*) FROM Student_Tests_Taken WHERE test_result  =  'Fail'	e_learning
SELECT login_name FROM Students WHERE family_name  =  'Ward'	e_learning
SELECT login_name FROM Students WHERE family_name  =  'Ward'	e_learning
SELECT date_of_latest_logon FROM Students WHERE family_name  =  'Jaskolski' OR family_name  =  'Langosh'	e_learning
SELECT date_of_latest_logon FROM students WHERE (family_name = 'Jaskolski' OR family_name = 'Langosh') ORDER BY date_of_latest_logon DESC LIMIT 1	e_learning
SELECT COUNT(*) FROM Students WHERE personal_name LIKE '%son%'	e_learning
SELECT COUNT(*) FROM Students WHERE personal_name LIKE '%son%'	e_learning
SELECT subject_name FROM SUBJECTS	e_learning
SELECT subject_name FROM SUBJECTS	e_learning
SELECT * FROM Course_Authors_and_Tutors ORDER BY personal_name	e_learning
SELECT * FROM Course_Authors_and_Tutors ORDER BY personal_name	e_learning
SELECT personal_name ,  family_name FROM Students ORDER BY family_name	e_learning
SELECT personal_name ,  family_name FROM Students ORDER BY family_name	e_learning
SELECT test_result ,  COUNT(*) FROM Student_Tests_Taken GROUP BY test_result ORDER BY COUNT(*) DESC	e_learning
SELECT test_result, COUNT(DISTINCT student_id) FROM student_tests_taken JOIN student_course_enrolment ON student_tests_taken.registration_id = student_course_enrolment.registration_id GROUP BY test_result	e_learning
SELECT login_name FROM course_authors_and_tutors WHERE author_id IN (SELECT author_id FROM courses WHERE course_name = 'advanced database')	e_learning
SELECT login_name FROM course_authors_and_tutors WHERE author_id IN (SELECT author_id FROM courses WHERE course_name = 'advanced database')	e_learning
SELECT address_line_1 FROM course_authors_and_tutors WHERE author_id IN (SELECT author_id FROM courses WHERE course_name IN ('operating system', 'data structure'))	e_learning
SELECT DISTINCT address_line_1 FROM course_authors_and_tutors WHERE author_id IN (SELECT author_id FROM courses WHERE course_name IN ('data structure', 'operating system'))	e_learning
SELECT personal_name, family_name, author_id FROM course_authors_and_tutors WHERE author_id IN (SELECT author_id FROM courses GROUP BY author_id HAVING COUNT(course_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(course_id) AS cnt FROM courses GROUP BY author_id) y))	e_learning
SELECT T1.personal_name ,  T1.family_name ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
SELECT T1.address_line_1 ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id HAVING Count(*)  >=  2	e_learning
SELECT T1.address_line_1 ,  T2.author_id FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id HAVING Count(*)  >=  2	e_learning
SELECT T2.course_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T1.personal_name  =  'Julio'	e_learning
SELECT T2.course_name FROM Course_Authors_and_Tutors AS T1 JOIN Courses AS T2 ON T1.author_id  =  T2.author_id WHERE T1.personal_name  =  'Julio'	e_learning
SELECT T1.course_name ,  T1.course_description FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id WHERE T2.subject_name  =  'Computer Science'	e_learning
SELECT T1.course_name ,  T1.course_description FROM Courses AS T1 JOIN Subjects AS T2 ON T1.subject_id  =  T2.subject_id WHERE T2.subject_name  =  'Computer Science'	e_learning
SELECT subjects.subject_id, subjects.subject_name, COUNT(courses.course_id) AS num_courses FROM subjects LEFT JOIN courses ON subjects.subject_id = courses.subject_id GROUP BY subjects.subject_id, subjects.subject_name	e_learning
SELECT subjects.subject_id, subjects.subject_name, COUNT(courses.course_id) AS NumberOfCourses FROM subjects LEFT JOIN courses ON subjects.subject_id = courses.subject_id GROUP BY subjects.subject_id, subjects.subject_name	e_learning
SELECT subjects.subject_id, subjects.subject_name, (SELECT COUNT(*) FROM courses WHERE courses.subject_id = subjects.subject_id) AS total_courses FROM subjects ORDER BY total_courses ASC	e_learning
SELECT s.subject_id, s.subject_name, COUNT(c.course_id) AS number_of_courses FROM subjects s LEFT JOIN courses c ON s.subject_id = c.subject_id GROUP BY s.subject_id, s.subject_name ORDER BY number_of_courses ASC	e_learning
SELECT T2.date_of_enrolment FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id WHERE T1.course_name  =  'Spanish'	e_learning
SELECT T2.date_of_enrolment FROM Courses AS T1 JOIN Student_Course_Enrolment AS T2 ON T1.course_id  =  T2.course_id WHERE T1.course_name  =  'Spanish'	e_learning
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_course_enrolment GROUP BY course_id HAVING COUNT(student_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(student_id) AS Cnt FROM student_course_enrolment GROUP BY course_id)))	e_learning
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_course_enrolment GROUP BY course_id HAVING COUNT(student_id) = (SELECT MAX(num_students) FROM (SELECT COUNT(student_id) AS num_students FROM student_course_enrolment GROUP BY course_id)))	e_learning
SELECT c.course_name FROM courses c JOIN (SELECT course_id FROM student_course_enrolment GROUP BY course_id HAVING COUNT(student_id) = 1) filtered_courses ON c.course_id = filtered_courses.course_id	e_learning
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_course_enrolment GROUP BY course_id HAVING COUNT(DISTINCT student_id) = 1)	e_learning
SELECT c.course_description, c.course_name FROM courses c WHERE (SELECT COUNT(*) FROM student_course_enrolment sce WHERE sce.course_id = c.course_id) > 2	e_learning
SELECT DISTINCT course_description, course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_course_enrolment GROUP BY course_id HAVING COUNT(student_id) > 2)	e_learning
SELECT c.course_name, (SELECT COUNT(student_id) FROM student_course_enrolment WHERE course_id = c.course_id) AS total_enrollment FROM courses c	e_learning
SELECT course_name, (SELECT COUNT(*) FROM student_course_enrolment WHERE course_id = courses.course_id) AS student_number FROM courses	e_learning
SELECT T1.date_of_enrolment FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  'Pass'	e_learning
SELECT T1.date_of_enrolment FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  'Pass'	e_learning
SELECT T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  'Fail'	e_learning
SELECT T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Student_Tests_Taken AS T2 ON T1.registration_id  =  T2.registration_id WHERE T2.test_result  =  'Fail'	e_learning
SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.personal_name  =  'Karson'	e_learning
SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.personal_name  =  'Karson'	e_learning
SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.family_name  =  'Zieme' AND T2.personal_name  =  'Bernie'	e_learning
SELECT T1.date_of_enrolment ,  T1.date_of_completion FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T2.family_name  =  'Zieme' AND T2.personal_name  =  'Bernie'	e_learning
SELECT T1.student_id ,  T2.login_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1	e_learning
SELECT s.student_id, s.login_name FROM students s WHERE s.student_id IN (SELECT student_id FROM student_course_enrolment GROUP BY student_id HAVING COUNT(course_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(course_id) AS cnt FROM student_course_enrolment GROUP BY student_id)))	e_learning
SELECT T1.student_id ,  T2.personal_name FROM Student_Course_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  >=  2	e_learning
SELECT s.student_id, s.personal_name FROM students s JOIN student_course_enrolment sce ON s.student_id = sce.student_id GROUP BY s.student_id, s.personal_name HAVING COUNT(DISTINCT sce.course_id) >= 2	e_learning
SELECT S.student_id, S.middle_name FROM students S WHERE (SELECT COUNT(*) FROM student_course_enrolment E WHERE E.student_id = S.student_id) <= 2	e_learning
SELECT student_id, middle_name FROM students s WHERE (SELECT COUNT(DISTINCT course_id) FROM student_course_enrolment WHERE student_id = s.student_id) <= 2	e_learning
SELECT personal_name FROM students WHERE student_id NOT IN (SELECT student_id FROM student_course_enrolment)	e_learning
SELECT s.personal_name FROM students s WHERE NOT EXISTS (SELECT 1 FROM student_course_enrolment sce WHERE sce.student_id = s.student_id)	e_learning
SELECT count(*) FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Course_Enrolment)	e_learning
SELECT count(*) FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Course_Enrolment)	e_learning
SELECT login_name FROM Course_Authors_and_Tutors INTERSECT SELECT login_name FROM Students	e_learning
SELECT login_name FROM Course_Authors_and_Tutors INTERSECT SELECT login_name FROM Students	e_learning
SELECT personal_name FROM Course_Authors_and_Tutors INTERSECT SELECT personal_name FROM Students	e_learning
SELECT personal_name FROM Course_Authors_and_Tutors INTERSECT SELECT personal_name FROM Students	e_learning
SELECT c.date_claim_made, c.claim_id FROM claims c WHERE c.claim_id IN (SELECT claim_id FROM settlements GROUP BY claim_id HAVING COUNT(claim_id) > 2) OR c.amount_claimed = (SELECT MAX(amount_claimed) FROM claims)	insurance_policies
SELECT claims.date_claim_made, claims.claim_id FROM claims LEFT JOIN settlements ON claims.claim_id = settlements.claim_id GROUP BY claims.claim_id HAVING COUNT(settlements.settlement_id) > 2 OR claims.amount_claimed = (SELECT MAX(amount_claimed) FROM claims)	insurance_policies
SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 EXCEPT SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.customer_id JOIN Claims AS T3 ON T2.policy_id  =  T3.policy_id	insurance_policies
SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 EXCEPT SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.customer_id JOIN Claims AS T3 ON T2.policy_id  =  T3.policy_id	insurance_policies
SELECT Payment_Method_Code ,  Date_Payment_Made ,  Amount_Payment FROM Payments ORDER BY Date_Payment_Made ASC	insurance_policies
SELECT Payment_Method_Code ,  Date_Payment_Made ,  Amount_Payment FROM Payments ORDER BY Date_Payment_Made ASC	insurance_policies
SELECT amount_settled, amount_claimed FROM claims WHERE amount_claimed = (SELECT MAX(amount_claimed) FROM claims)	insurance_policies
SELECT s.amount_settled, c.amount_claimed FROM settlements s JOIN claims c ON s.claim_id = c.claim_id WHERE c.amount_claimed = (SELECT MAX(amount_claimed) FROM claims)	insurance_policies
SELECT MIN(settlements.amount_settled) AS MinSettledAmount, claims.amount_claimed FROM settlements JOIN claims ON settlements.claim_id = claims.claim_id GROUP BY claims.amount_claimed ORDER BY MinSettledAmount LIMIT 1	insurance_policies
SELECT Amount_Settled ,  Amount_Claimed FROM Claims ORDER BY Amount_Settled ASC LIMIT 1	insurance_policies
SELECT Date_Claim_Made ,  Date_Claim_Settled FROM Claims WHERE Amount_Claimed  >  ( SELECT avg(Amount_Claimed) FROM Claims )	insurance_policies
SELECT Date_Claim_Made ,  Date_Claim_Settled FROM Claims WHERE Amount_Claimed  >  ( SELECT avg(Amount_Claimed) FROM Claims )	insurance_policies
SELECT cp.start_date FROM customer_policies cp, claims c, settlements s WHERE cp.policy_id = c.policy_id AND c.claim_id = s.claim_id AND s.amount_claimed <= (SELECT AVG(amount_claimed) FROM settlements)	insurance_policies
SELECT date_claim_made FROM claims WHERE amount_claimed <= (SELECT AVG(amount_claimed) FROM claims)	insurance_policies
SELECT T1.Claim_id ,  count(*) FROM Claims AS T1 JOIN Settlements AS T2 ON T1.claim_id  =  T2.claim_id GROUP BY T1.claim_id	insurance_policies
SELECT c.claim_id, COUNT(DISTINCT s.settlement_id) AS settlements_count FROM claims c LEFT JOIN settlements s ON c.claim_id = s.claim_id GROUP BY c.claim_id	insurance_policies
SELECT T1.claim_id ,  T1.date_claim_made ,  count(*) FROM Claims AS T1 JOIN Settlements AS T2 ON T1.claim_id  =  T2.claim_id GROUP BY T1.claim_id ORDER BY count(*) DESC LIMIT 1	insurance_policies
SELECT T1.claim_id ,  T1.date_claim_made ,  count(*) FROM Claims AS T1 JOIN Settlements AS T2 ON T1.claim_id  =  T2.claim_id GROUP BY T1.claim_id ORDER BY count(*) DESC LIMIT 1	insurance_policies
SELECT count(*) ,  T1.claim_id FROM Claims AS T1 JOIN Settlements AS T2 ON T1.claim_id  =  T2.claim_id GROUP BY T1.claim_id ORDER BY T1.Date_Claim_Settled DESC LIMIT 1	insurance_policies
SELECT count(*) ,  T1.claim_id FROM Claims AS T1 JOIN Settlements AS T2 ON T1.claim_id  =  T2.claim_id GROUP BY T1.claim_id ORDER BY T1.Date_Claim_Settled DESC LIMIT 1	insurance_policies
SELECT Date_Claim_Made FROM Claims ORDER BY Date_Claim_Made ASC LIMIT 1	insurance_policies
SELECT Date_Claim_Made FROM Claims ORDER BY Date_Claim_Made ASC LIMIT 1	insurance_policies
SELECT sum(Amount_Settled) FROM Settlements	insurance_policies
SELECT sum(Amount_Settled) FROM Settlements	insurance_policies
SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.Customer_id GROUP BY T1.customer_id HAVING count(*)  >  1	insurance_policies
SELECT T1.customer_details ,  T1.customer_id FROM Customers AS T1 JOIN Customer_Policies AS T2 ON T1.Customer_id  =  T2.Customer_id GROUP BY T1.customer_id HAVING count(*)  >  1	insurance_policies
SELECT Date_Claim_Made ,  Date_Claim_Settled FROM Settlements	insurance_policies
SELECT Date_Claim_Made ,  Date_Claim_Settled FROM Settlements	insurance_policies
SELECT P.payment_method_code FROM PAYMENTS P GROUP BY P.payment_method_code HAVING COUNT(P.payment_method_code) = (SELECT MAX(COUNT) FROM (SELECT COUNT(*) AS COUNT FROM PAYMENTS GROUP BY payment_method_code))	insurance_policies
SELECT payment_method_code FROM payments GROUP BY payment_method_code HAVING COUNT(payment_method_code) = (SELECT MAX(count) FROM (SELECT COUNT(payment_method_code) as count FROM payments GROUP BY payment_method_code))	insurance_policies
SELECT Payment_Method_Code FROM Payments GROUP BY Payment_Method_Code ORDER BY count(*) ASC LIMIT 1	insurance_policies
WITH PaymentCounts AS (SELECT payment_method_code, COUNT(*) AS CountUsage FROM payments GROUP BY payment_method_code) SELECT payment_method_code FROM PaymentCounts WHERE CountUsage = (SELECT MIN(CountUsage) FROM PaymentCounts)	insurance_policies
SELECT sum(Amount_Payment) FROM Payments	insurance_policies
SELECT sum(Amount_Payment) FROM Payments	insurance_policies
SELECT DISTINCT customer_details FROM Customers	insurance_policies
SELECT DISTINCT customer_details FROM Customers	insurance_policies
SELECT policy_type_code FROM customer_policies GROUP BY policy_type_code HAVING COUNT(DISTINCT customer_id) = (SELECT MAX(cust_count) FROM (SELECT COUNT(DISTINCT customer_id) AS cust_count FROM customer_policies GROUP BY policy_type_code))	insurance_policies
WITH PolicyCounts AS (SELECT policy_type_code, COUNT(DISTINCT customer_id) AS customer_count FROM customer_policies GROUP BY policy_type_code) SELECT policy_type_code FROM PolicyCounts ORDER BY customer_count DESC LIMIT 1	insurance_policies
SELECT count(*) FROM Settlements	insurance_policies
SELECT count(*) FROM Settlements	insurance_policies
SELECT Payment_ID ,  Date_Payment_Made ,  Amount_Payment FROM Payments WHERE Payment_Method_Code  =  'Visa'	insurance_policies
SELECT Payment_ID ,  Date_Payment_Made ,  Amount_Payment FROM Payments WHERE Payment_Method_Code  =  'Visa'	insurance_policies
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_policies)	insurance_policies
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_policies)	insurance_policies
SELECT claims.date_claim_made, claims.date_claim_settled, claims.amount_settled FROM claims JOIN settlements ON claims.claim_id = settlements.claim_id GROUP BY claims.claim_id HAVING COUNT(settlements.settlement_id) = 1	insurance_policies
SELECT c.date_claim_made, c.date_claim_settled, c.amount_settled FROM claims c WHERE EXISTS (SELECT 1 FROM settlements s WHERE s.claim_id = c.claim_id GROUP BY s.claim_id HAVING COUNT(*) = 1)	insurance_policies
SELECT sum(Amount_Claimed) FROM Claims	insurance_policies
SELECT sum(Amount_Claimed) FROM Claims	insurance_policies
SELECT D.name FROM department D WHERE (SELECT COUNT(*) FROM affiliated_with WHERE department = D.departmentid) = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM affiliated_with GROUP BY department) AS Stats)	hospital_1
SELECT department.name FROM department INNER JOIN affiliated_with ON department.departmentid = affiliated_with.department GROUP BY department.departmentid HAVING COUNT(affiliated_with.physician) = (SELECT MAX(cnt) FROM (SELECT COUNT(physician) AS cnt FROM affiliated_with GROUP BY department))	hospital_1
SELECT head FROM department GROUP BY departmentID ORDER BY count(departmentID) LIMIT 1;	hospital_1
SELECT head FROM department GROUP BY departmentID ORDER BY count(departmentID) LIMIT 1;	hospital_1
SELECT p.name, p.position FROM physician p JOIN department d ON p.employeeid = d.head WHERE d.departmentid = (SELECT department FROM affiliated_with GROUP BY department ORDER BY COUNT(physician) ASC LIMIT 1)	hospital_1
SELECT T2.name ,  T2.position FROM department AS T1 JOIN physician AS T2 ON T1.head  =  T2.EmployeeID GROUP BY departmentID ORDER BY count(departmentID) LIMIT 1;	hospital_1
SELECT name FROM appointment AS T1 JOIN patient AS T2 ON T1.patient  =  T2.ssn	hospital_1
SELECT p.name FROM patient p WHERE EXISTS (SELECT 1 FROM appointment a WHERE a.patient = p.ssn)	hospital_1
SELECT name ,  phone FROM appointment AS T1 JOIN patient AS T2 ON T1.patient  =  T2.ssn GROUP BY T1.patient HAVING count(*)  >  1	hospital_1
SELECT name ,  phone FROM appointment AS T1 JOIN patient AS T2 ON T1.patient  =  T2.ssn GROUP BY T1.patient HAVING count(*)  >  1	hospital_1
SELECT a.appointmentid FROM appointment AS a WHERE a.start = (SELECT MAX(start) FROM appointment)	hospital_1
SELECT appointmentid FROM appointment ORDER BY START DESC LIMIT 1	hospital_1
SELECT p.name FROM physician p WHERE EXISTS (SELECT 1 FROM appointment a WHERE a.physician = p.employeeid)	hospital_1
SELECT T2.name FROM appointment AS T1 JOIN physician AS T2 ON T1.Physician  =  T2.EmployeeID	hospital_1
SELECT name FROM physician WHERE employeeid NOT IN (SELECT physician FROM appointment)	hospital_1
SELECT p.name FROM physician p LEFT JOIN appointment a ON p.employeeid = a.physician WHERE a.physician IS NULL	hospital_1
SELECT T1.name ,  T3.name FROM physician AS T1 JOIN affiliated_with AS T2 ON T1.EmployeeID  =  T2.physician JOIN department AS T3 ON T2.department  =  T3.DepartmentID WHERE T2.PrimaryAffiliation  =  1	hospital_1
SELECT T1.name ,  T3.name FROM physician AS T1 JOIN affiliated_with AS T2 ON T1.EmployeeID  =  T2.physician JOIN department AS T3 ON T2.department  =  T3.DepartmentID WHERE T2.PrimaryAffiliation  =  1	hospital_1
SELECT T1.name FROM patient AS T1 JOIN appointment AS T2 ON T1.ssn = T2.patient ORDER BY T2.start DESC LIMIT 1	hospital_1
SELECT name FROM patient WHERE ssn IN (SELECT patient FROM appointment WHERE start = (SELECT MAX(start) FROM appointment))	hospital_1
SELECT COUNT(DISTINCT patient.ssn) FROM patient JOIN stay ON patient.ssn = stay.patient WHERE stay.room = 112	hospital_1
SELECT COUNT(DISTINCT stay.patient) FROM stay WHERE stay.room = 112	hospital_1
SELECT COUNT(DISTINCT patient) FROM prescribes JOIN physician ON prescribes.physician = physician.employeeid WHERE physician.name = 'John Dorian'	hospital_1
SELECT count(T1.SSN) FROM patient AS T1 JOIN prescribes AS T2 ON T1.SSN  =  T2.patient JOIN physician AS T3 ON T2.physician  =  T3.employeeid WHERE T3.name = 'John Dorian'	hospital_1
SELECT T4.name FROM stay AS T1 JOIN patient AS T2 ON T1.Patient  =  T2.SSN JOIN Prescribes AS T3 ON T3.Patient  =  T2.SSN JOIN Medication AS T4 ON T3.Medication  =  T4.Code WHERE room  =  111	hospital_1
SELECT T4.name FROM stay AS T1 JOIN patient AS T2 ON T1.Patient  =  T2.SSN JOIN Prescribes AS T3 ON T3.Patient  =  T2.SSN JOIN Medication AS T4 ON T3.Medication  =  T4.Code WHERE room  =  111	hospital_1
SELECT patient.name FROM patient JOIN stay ON patient.ssn = stay.patient WHERE stay.room = 111 ORDER BY stay.stayend DESC LIMIT 1	hospital_1
SELECT s.patient FROM stay s JOIN room r ON s.room = r.roomnumber WHERE r.roomnumber = 111 ORDER BY s.stayend DESC LIMIT 1	hospital_1
SELECT T1.name FROM nurse AS T1 JOIN appointment AS T2 ON T1.employeeid  =  T2.prepnurse GROUP BY T1.employeeid ORDER BY count(*) DESC LIMIT 1	hospital_1
SELECT T1.name FROM nurse AS T1 JOIN appointment AS T2 ON T1.employeeid  =  T2.prepnurse GROUP BY T1.employeeid ORDER BY count(*) DESC LIMIT 1	hospital_1
SELECT p.name, (SELECT COUNT(*) FROM patient WHERE patient.pcp = p.employeeid) AS patient_count FROM physician AS p	hospital_1
SELECT T1.name ,  count(*) FROM physician AS T1 JOIN patient AS T2 ON T1.employeeid  =  T2.PCP GROUP BY T1.employeeid	hospital_1
SELECT T1.name FROM physician AS T1 JOIN patient AS T2 ON T1.employeeid  =  T2.PCP GROUP BY T1.employeeid HAVING count(*)  >  1	hospital_1
SELECT T1.name FROM physician AS T1 JOIN patient AS T2 ON T1.employeeid  =  T2.PCP GROUP BY T1.employeeid HAVING count(*)  >  1	hospital_1
SELECT blockfloor, COUNT(*) AS num_rooms FROM room GROUP BY blockfloor	hospital_1
SELECT room.blockfloor, COUNT(*) AS num_of_rooms FROM room LEFT JOIN block ON room.blockfloor = block.blockfloor AND room.blockcode = block.blockcode GROUP BY room.blockfloor	hospital_1
SELECT blockcode, COUNT(roomnumber) AS total_rooms FROM room GROUP BY blockcode;	hospital_1
SELECT blockcode, COUNT(*) AS total_rooms FROM room GROUP BY blockcode	hospital_1
SELECT DISTINCT blockcode FROM room WHERE unavailable  =  0	hospital_1
SELECT DISTINCT blockcode FROM room WHERE unavailable  =  0	hospital_1
SELECT count(DISTINCT roomtype) FROM room	hospital_1
SELECT count(DISTINCT roomtype) FROM room	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM prescribes WHERE medication IN (SELECT code FROM medication WHERE name = 'Thesisin'))	hospital_1
SELECT DISTINCT T1.name FROM physician AS T1 JOIN prescribes AS T2 ON T1.employeeid = T2.physician JOIN medication AS T3 ON T3.code = T2.medication WHERE T3.name  =  'Thesisin'	hospital_1
SELECT p.name, p.position FROM physician p WHERE EXISTS (SELECT 1 FROM prescribes pr JOIN medication m ON pr.medication = m.code WHERE pr.physician = p.employeeid AND m.brand = 'X')	hospital_1
SELECT p.name, p.position FROM physician p WHERE EXISTS (SELECT 1 FROM prescribes pr JOIN medication m ON pr.medication = m.code WHERE pr.physician = p.employeeid AND m.brand = 'X')	hospital_1
SELECT m.brand, COUNT(*) FROM medication m JOIN prescribes p ON m.code = p.medication GROUP BY m.brand	hospital_1
SELECT brand, COUNT(DISTINCT medication) AS numOfMedications FROM prescribes JOIN medication ON prescribes.medication = medication.code GROUP BY brand	hospital_1
SELECT name FROM physician WHERE POSITION LIKE '%senior%'	hospital_1
SELECT name FROM physician WHERE POSITION LIKE '%senior%'	hospital_1
SELECT patient.name FROM patient JOIN (SELECT patient, MAX(dateundergoes) AS RecentTreatment FROM undergoes GROUP BY patient) Recent ON patient.ssn = Recent.patient	hospital_1
SELECT p.name FROM patient p WHERE p.ssn = (SELECT u.patient FROM undergoes u ORDER BY u.dateundergoes DESC LIMIT 1)	hospital_1
SELECT DISTINCT p.name FROM patient p WHERE EXISTS (SELECT u.patient FROM undergoes u JOIN stay s ON u.stay = s.stayid WHERE s.room = 111 AND p.ssn = s.patient)	hospital_1
SELECT p.name FROM patient p WHERE p.ssn IN (SELECT patient FROM stay WHERE room = 111) AND EXISTS (SELECT * FROM undergoes u WHERE u.patient = p.ssn);	hospital_1
SELECT DISTINCT name FROM nurse ORDER BY name	hospital_1
SELECT DISTINCT name FROM nurse ORDER BY name	hospital_1
SELECT n.name FROM nurse n WHERE EXISTS (SELECT 1 FROM undergoes WHERE assistingnurse = n.employeeid)	hospital_1
SELECT name FROM nurse WHERE EXISTS (SELECT 1 FROM undergoes WHERE nurse.employeeid = undergoes.assistingnurse)	hospital_1
SELECT DISTINCT name FROM medication ORDER BY name	hospital_1
SELECT DISTINCT name FROM medication ORDER BY name	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM prescribes WHERE dose = (SELECT MAX(dose) FROM prescribes))	hospital_1
SELECT T1.name FROM physician AS T1 JOIN prescribes AS T2 ON T1.employeeid = T2.physician ORDER BY T2.dose DESC LIMIT 1	hospital_1
SELECT physician ,  department FROM affiliated_with WHERE primaryaffiliation  =  1	hospital_1
SELECT physician ,  department FROM affiliated_with WHERE primaryaffiliation  =  1	hospital_1
SELECT department.name FROM department WHERE departmentid IN (SELECT department FROM affiliated_with WHERE primaryaffiliation = 1);	hospital_1
SELECT name FROM department WHERE departmentid IN (SELECT department FROM affiliated_with WHERE primaryaffiliation = 1 GROUP BY department)	hospital_1
SELECT n.name FROM nurse n JOIN on_call o ON n.employeeid = o.nurse WHERE o.blockfloor = 1 AND o.blockcode = 1	hospital_1
SELECT DISTINCT nurse.employeeid FROM nurse, on_call WHERE nurse.employeeid = on_call.nurse AND on_call.blockfloor = 1 AND on_call.blockcode = 1	hospital_1
SELECT MAX(cost) ,  MIN(cost) ,  AVG(cost) FROM procedures	hospital_1
SELECT MAX(cost) ,  MIN(cost) ,  AVG(cost) FROM procedures	hospital_1
SELECT name ,  cost FROM procedures ORDER BY cost DESC	hospital_1
SELECT name ,  cost FROM procedures ORDER BY cost DESC	hospital_1
SELECT name, code, cost FROM procedures ORDER BY cost DESC LIMIT 3	hospital_1
SELECT name FROM procedures ORDER BY cost LIMIT 3	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM trained_in WHERE treatment IN (SELECT code FROM procedures WHERE cost > 5000))	hospital_1
SELECT p.name FROM physician p WHERE EXISTS (SELECT 1 FROM trained_in t JOIN procedures pr ON t.treatment = pr.code WHERE t.physician = p.employeeid AND pr.cost > 5000)	hospital_1
SELECT p.name FROM physician p JOIN trained_in ti ON p.employeeid = ti.physician JOIN procedures pr ON ti.treatment = pr.code WHERE pr.cost = (SELECT MAX(cost) FROM procedures)	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM trained_in WHERE treatment IN (SELECT code FROM procedures WHERE cost = (SELECT MAX(cost) FROM procedures)))	hospital_1
SELECT avg(T3.cost) FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT AVG(cost) FROM procedures WHERE code IN (SELECT treatment FROM trained_in WHERE physician IN (SELECT employeeid FROM physician WHERE name = 'John Wen'))	hospital_1
SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT name FROM procedures WHERE code IN (SELECT treatment FROM trained_in WHERE physician IN (SELECT employeeid FROM physician WHERE name = 'John Wen'))	hospital_1
SELECT name FROM procedures WHERE cost  >  1000 UNION SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT p.name FROM procedures p WHERE p.cost > 1000 OR EXISTS (SELECT 1 FROM trained_in t INNER JOIN physician ph ON ph.employeeid = t.physician WHERE t.treatment = p.code AND ph.name = 'John Wen')	hospital_1
SELECT name FROM procedures WHERE cost  >  1000 EXCEPT SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT name FROM procedures WHERE cost  >  1000 EXCEPT SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT name FROM procedures WHERE cost  <  5000 INTERSECT SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT name FROM procedures WHERE cost  <  5000 INTERSECT SELECT T3.name FROM physician AS T1 JOIN trained_in AS T2 ON T1.employeeid  =  T2.physician JOIN procedures AS T3 ON T3.code  =  T2.treatment WHERE T1.name  =  'John Wen'	hospital_1
SELECT p.name FROM physician p WHERE EXISTS (SELECT 1 FROM affiliated_with a JOIN department d ON a.department = d.departmentid WHERE d.name = 'Surgery' AND a.physician = p.employeeid) AND EXISTS (SELECT 1 FROM affiliated_with a JOIN department d ON a.department = d.departmentid WHERE d.name = 'Psychiatry' AND a.physician = p.employeeid)	hospital_1
SELECT p.name FROM physician p WHERE EXISTS (SELECT 1 FROM affiliated_with af JOIN department d ON af.department = d.departmentid WHERE af.physician = p.employeeid AND d.name = 'Surgery') AND EXISTS (SELECT 1 FROM affiliated_with af JOIN department d ON af.department = d.departmentid WHERE af.physician = p.employeeid AND d.name = 'Psychiatry')	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM affiliated_with WHERE department IN (SELECT departmentid FROM department WHERE name IN ('Surgery', 'Psychiatry')))	hospital_1
SELECT name FROM physician WHERE employeeid IN (SELECT physician FROM affiliated_with WHERE department IN (SELECT departmentid FROM department WHERE name = 'Surgery' OR name = 'Psychiatry'))	hospital_1
SELECT p.name FROM patient p WHERE p.ssn NOT IN (SELECT pr.patient FROM prescribes pr INNER JOIN medication m ON pr.medication = m.code WHERE m.name = 'Procrastin-X')	hospital_1
SELECT name FROM patient WHERE ssn NOT IN (SELECT pr.patient FROM prescribes pr JOIN medication m ON pr.medication = m.code WHERE m.name = 'Procrastin-X')	hospital_1
SELECT count(*) FROM patient WHERE SSN NOT IN ( SELECT T1.patient FROM Prescribes AS T1 JOIN Medication AS T2 ON T1.Medication  =  T2.Code WHERE T2.name  =  'Procrastin-X' )	hospital_1
SELECT count(*) FROM patient WHERE SSN NOT IN ( SELECT T1.patient FROM Prescribes AS T1 JOIN Medication AS T2 ON T1.Medication  =  T2.Code WHERE T2.name  =  'Procrastin-X' )	hospital_1
SELECT count(*) FROM appointment	hospital_1
SELECT count(*) FROM appointment	hospital_1
SELECT N.name FROM nurse N INNER JOIN on_call O ON N.employeeid = O.nurse	hospital_1
SELECT DISTINCT T1.name FROM nurse AS T1 JOIN on_call AS T2 ON T1.EmployeeID  =  T2.nurse	hospital_1
SELECT count(*) FROM ship	ship_mission
SELECT count(*) FROM ship	ship_mission
SELECT name FROM ship ORDER BY tonnage ASC, name ASC	ship_mission
SELECT Name FROM ship ORDER BY Tonnage ASC	ship_mission
SELECT TYPE ,  Nationality FROM ship	ship_mission
SELECT TYPE ,  Nationality FROM ship	ship_mission
SELECT Name FROM ship WHERE Nationality != 'United States'	ship_mission
SELECT Name FROM ship WHERE Nationality != 'United States'	ship_mission
SELECT Name FROM ship WHERE Nationality  =  'United States' OR Nationality  =  'United Kingdom'	ship_mission
SELECT Name FROM ship WHERE Nationality  =  'United States' OR Nationality  =  'United Kingdom'	ship_mission
SELECT name FROM ship WHERE tonnage = (SELECT MAX(tonnage) FROM ship)	ship_mission
SELECT s.name FROM ship s WHERE s.tonnage = (SELECT MAX(tonnage) FROM ship)	ship_mission
SELECT TYPE ,  COUNT(*) FROM ship GROUP BY TYPE	ship_mission
SELECT TYPE ,  COUNT(*) FROM ship GROUP BY TYPE	ship_mission
SELECT s.type FROM ship s GROUP BY s.type HAVING COUNT(s.type) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM ship GROUP BY type))	ship_mission
SELECT s.type FROM ship s GROUP BY s.type HAVING COUNT(s.type) = (SELECT MAX(count_type) FROM (SELECT COUNT(type) AS count_type FROM ship GROUP BY type))	ship_mission
SELECT Nationality FROM ship GROUP BY Nationality HAVING COUNT(*)  >  2	ship_mission
SELECT Nationality FROM ship GROUP BY Nationality HAVING COUNT(*)  >  2	ship_mission
SELECT TYPE ,  avg(Tonnage) FROM ship GROUP BY TYPE	ship_mission
SELECT TYPE ,  avg(Tonnage) FROM ship GROUP BY TYPE	ship_mission
SELECT T1.Code ,  T1.Fate ,  T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID	ship_mission
SELECT T1.Code ,  T1.Fate ,  T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID	ship_mission
SELECT T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T1.Launched_Year  >  1928	ship_mission
SELECT T2.Name FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T1.Launched_Year  >  1928	ship_mission
SELECT DISTINCT T1.Fate FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T2.Nationality  =  'United States'	ship_mission
SELECT DISTINCT T1.Fate FROM mission AS T1 JOIN ship AS T2 ON T1.Ship_ID  =  T2.Ship_ID WHERE T2.Nationality  =  'United States'	ship_mission
SELECT Name FROM ship WHERE Ship_ID NOT IN (SELECT Ship_ID FROM mission)	ship_mission
SELECT Name FROM ship WHERE Ship_ID NOT IN (SELECT Ship_ID FROM mission)	ship_mission
SELECT TYPE FROM ship WHERE Tonnage  >  6000 INTERSECT SELECT TYPE FROM ship WHERE Tonnage  <  4000	ship_mission
SELECT TYPE FROM ship WHERE Tonnage  >  6000 INTERSECT SELECT TYPE FROM ship WHERE Tonnage  <  4000	ship_mission
SELECT count(*) FROM list	student_1
SELECT count(*) FROM list	student_1
SELECT lastname FROM list WHERE classroom  =  111	student_1
SELECT lastname FROM list WHERE classroom  =  111	student_1
SELECT firstname FROM list WHERE classroom  =  108	student_1
SELECT firstname FROM list WHERE classroom  =  108	student_1
SELECT firstname FROM list WHERE classroom = 107	student_1
SELECT firstname FROM list WHERE classroom = 107	student_1
SELECT DISTINCT classroom ,  grade FROM list	student_1
SELECT DISTINCT classroom ,  grade FROM list	student_1
SELECT DISTINCT grade FROM list WHERE classroom  =  103	student_1
SELECT DISTINCT grade FROM list WHERE classroom  =  103	student_1
SELECT DISTINCT grade FROM list WHERE classroom  =  105	student_1
SELECT DISTINCT grade FROM list WHERE classroom  =  105	student_1
SELECT DISTINCT classroom FROM list WHERE grade  =  4	student_1
SELECT DISTINCT classroom FROM list WHERE grade  =  4	student_1
SELECT DISTINCT classroom FROM list WHERE grade  =  5	student_1
SELECT DISTINCT classroom FROM list WHERE grade  =  5	student_1
SELECT t.lastname FROM teachers t WHERE EXISTS (SELECT 1 FROM list l WHERE l.classroom = t.classroom AND l.grade = 5)	student_1
SELECT lastname FROM teachers WHERE classroom IN (SELECT classroom FROM list WHERE grade = 5)	student_1
SELECT firstname FROM teachers WHERE classroom IN (SELECT classroom FROM list WHERE grade = 1)	student_1
SELECT t.firstname FROM teachers t WHERE EXISTS (SELECT 1 FROM list l WHERE l.classroom = t.classroom AND l.grade = 1)	student_1
SELECT firstname FROM teachers WHERE classroom  =  110	student_1
SELECT firstname FROM teachers WHERE classroom  =  110	student_1
SELECT lastname FROM teachers WHERE classroom  =  109	student_1
SELECT lastname FROM teachers WHERE classroom  =  109	student_1
SELECT DISTINCT firstname ,  lastname FROM teachers	student_1
SELECT DISTINCT firstname ,  lastname FROM teachers	student_1
SELECT DISTINCT firstname ,  lastname FROM list	student_1
SELECT DISTINCT firstname ,  lastname FROM list	student_1
SELECT T1.firstname ,  T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'OTHA' AND T2.lastname  =  'MOYER'	student_1
SELECT T1.firstname ,  T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'OTHA' AND T2.lastname  =  'MOYER'	student_1
SELECT T1.firstname ,  T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'MARROTTE' AND T2.lastname  =  'KIRK'	student_1
SELECT T1.firstname ,  T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'MARROTTE' AND T2.lastname  =  'KIRK'	student_1
SELECT T2.firstname ,  T2.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'EVELINA' AND T1.lastname  =  'BROMLEY'	student_1
SELECT T2.firstname ,  T2.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'EVELINA' AND T1.lastname  =  'BROMLEY'	student_1
SELECT T2.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'GELL' AND T1.lastname  =  'TAMI'	student_1
SELECT t.lastname FROM teachers t, list l WHERE t.classroom = l.classroom AND l.lastname = 'GELL' AND l.firstname = 'TAMI'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'LORIA' AND T2.lastname  =  'ONDERSMA'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'LORIA' AND T2.lastname  =  'ONDERSMA'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'KAWA' AND T2.lastname  =  'GORDON'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'KAWA' AND T2.lastname  =  'GORDON'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'TARRING' AND T2.lastname  =  'LEIA'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T2.firstname  =  'TARRING' AND T2.lastname  =  'LEIA'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'CHRISSY' AND T1.lastname  =  'NABOZNY'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'CHRISSY' AND T1.lastname  =  'NABOZNY'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'MADLOCK' AND T1.lastname  =  'RAY'	student_1
SELECT count(*) FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.firstname  =  'MADLOCK' AND T1.lastname  =  'RAY'	student_1
SELECT firstname, lastname FROM list WHERE grade = 1 AND classroom NOT IN (SELECT classroom FROM teachers WHERE firstname = 'OTHA' AND lastname = 'MOYER')	student_1
SELECT firstname, lastname FROM list WHERE grade = 1 AND classroom NOT IN (SELECT classroom FROM teachers WHERE firstname = 'OTHA' AND lastname = 'MOYER')	student_1
SELECT DISTINCT T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.grade  =  3 AND T2.firstname != 'COVIN' AND T2.lastname != 'JEROME'	student_1
SELECT DISTINCT T1.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom WHERE T1.grade  =  3 AND T2.firstname != 'COVIN' AND T2.lastname != 'JEROME'	student_1
SELECT grade ,  count(DISTINCT classroom) ,  count(*) FROM list GROUP BY grade	student_1
SELECT grade ,  count(DISTINCT classroom) ,  count(*) FROM list GROUP BY grade	student_1
SELECT classroom ,  count(DISTINCT grade) FROM list GROUP BY classroom	student_1
SELECT classroom ,  count(DISTINCT grade) FROM list GROUP BY classroom	student_1
SELECT l.classroom FROM list l GROUP BY l.classroom HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT classroom, COUNT(*) as count FROM list GROUP BY classroom) e)	student_1
SELECT classroom FROM list GROUP BY classroom ORDER BY count(*) DESC LIMIT 1	student_1
SELECT classroom ,  count(*) FROM list GROUP BY classroom	student_1
SELECT classroom ,  count(*) FROM list GROUP BY classroom	student_1
SELECT classroom ,  count(*) FROM list WHERE grade  =  '0' GROUP BY classroom	student_1
SELECT classroom ,  count(*) FROM list WHERE grade  =  '0' GROUP BY classroom	student_1
SELECT classroom ,  count(*) FROM list WHERE grade  =  '4' GROUP BY classroom	student_1
SELECT classroom ,  count(*) FROM list WHERE grade  =  '4' GROUP BY classroom	student_1
SELECT T2.firstname ,  T2.lastname FROM list AS T1 JOIN teachers AS T2 ON T1.classroom  =  T2.classroom GROUP BY T2.firstname ,  T2.lastname ORDER BY count(*) DESC LIMIT 1	student_1
SELECT t.firstname, t.lastname FROM teachers t WHERE EXISTS (SELECT NULL FROM list l WHERE t.classroom = l.classroom GROUP BY l.classroom ORDER BY COUNT(*) DESC LIMIT 1)	student_1
SELECT count(*) ,  classroom FROM list GROUP BY classroom	student_1
SELECT count(*) ,  classroom FROM list GROUP BY classroom	student_1
SELECT count(*) FROM company WHERE Headquarters  =  'USA'	company_employee
SELECT Name FROM company ORDER BY Sales_in_Billion ASC	company_employee
SELECT Headquarters ,  Industry FROM company	company_employee
SELECT Name FROM company WHERE Industry  =  'Banking' OR Industry  =  'Retailing'	company_employee
SELECT max(Market_Value_in_Billion) ,  min(Market_Value_in_Billion) FROM company	company_employee
SELECT Headquarters FROM company ORDER BY Sales_in_Billion DESC LIMIT 1	company_employee
SELECT Headquarters ,  COUNT(*) FROM company GROUP BY Headquarters	company_employee
SELECT Headquarters FROM company GROUP BY Headquarters ORDER BY COUNT(*) DESC LIMIT 1	company_employee
SELECT Headquarters FROM company GROUP BY Headquarters HAVING COUNT(*)  >=  2	company_employee
SELECT Headquarters FROM company WHERE Industry  =  'Banking' INTERSECT SELECT Headquarters FROM company WHERE Industry  =  'Oil and gas'	company_employee
SELECT T3.Name ,  T2.Name FROM employment AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID JOIN company AS T3 ON T1.Company_ID  =  T3.Company_ID	company_employee
SELECT comp.name AS 'CompanyName', pe.name AS 'EmployeeName' FROM company AS comp CROSS JOIN employment AS employ JOIN people AS pe ON employ.people_id = pe.people_id WHERE comp.company_id = employ.company_id ORDER BY employ.year_working DESC;	company_employee
SELECT T2.Name FROM employment AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID JOIN company AS T3 ON T1.Company_ID  =  T3.Company_ID WHERE T3.Sales_in_Billion  >  200	company_employee
SELECT name, EmployeeCount FROM (SELECT company.name AS name, COUNT(employment.people_id) AS EmployeeCount FROM company LEFT JOIN employment ON company.company_id = employment.company_id GROUP BY company.name)	company_employee
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM employment)	company_employee
SELECT name FROM company WHERE sales_in_billion > 200 ORDER BY sales_in_billion DESC, profits_in_billion DESC	company_employee
SELECT count(*) FROM film	film_rank
SELECT count(*) FROM film	film_rank
SELECT DISTINCT Director FROM film	film_rank
SELECT DISTINCT Director FROM film	film_rank
SELECT avg(Gross_in_dollar) FROM film	film_rank
SELECT avg(Gross_in_dollar) FROM film	film_rank
SELECT Low_Estimate ,  High_Estimate FROM film_market_estimation	film_rank
SELECT Low_Estimate ,  High_Estimate FROM film_market_estimation	film_rank
SELECT TYPE FROM film_market_estimation WHERE YEAR  =  1995	film_rank
SELECT TYPE FROM film_market_estimation WHERE YEAR  =  1995	film_rank
SELECT max(Number_cities) ,  min(Number_cities) FROM market	film_rank
SELECT max(Number_cities) ,  min(Number_cities) FROM market	film_rank
SELECT count(*) FROM market WHERE Number_cities  <  300	film_rank
SELECT count(*) FROM market WHERE Number_cities  <  300	film_rank
SELECT Country FROM market ORDER BY Country ASC	film_rank
SELECT Country FROM market ORDER BY Country ASC	film_rank
SELECT Country FROM market ORDER BY Number_cities DESC	film_rank
SELECT Country FROM market ORDER BY Number_cities DESC	film_rank
SELECT T1.Title ,  T2.Type FROM film AS T1 JOIN film_market_estimation AS T2 ON T1.Film_ID  =  T2.Film_ID	film_rank
SELECT T1.Title ,  T2.Type FROM film AS T1 JOIN film_market_estimation AS T2 ON T1.Film_ID  =  T2.Film_ID	film_rank
SELECT DISTINCT T1.Director FROM film AS T1 JOIN film_market_estimation AS T2 ON T1.Film_ID  =  T2.Film_ID WHERE T2.Year  =  1995	film_rank
SELECT DISTINCT T1.Director FROM film AS T1 JOIN film_market_estimation AS T2 ON T1.Film_ID  =  T2.Film_ID WHERE T2.Year  =  1995	film_rank
SELECT avg(T2.Number_cities) FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID WHERE T1.Low_Estimate  >  10000	film_rank
SELECT AVG(number_cities) FROM market WHERE market_id IN (SELECT market_id FROM film_market_estimation WHERE low_estimate > 10000)	film_rank
SELECT T2.Country ,  T1.Year FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID	film_rank
SELECT T2.Country ,  T1.Year FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID	film_rank
SELECT T1.Year FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID WHERE T2.Country  =  'Japan' ORDER BY T1.Year DESC	film_rank
SELECT T1.Year FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.Market_ID  =  T2.Market_ID WHERE T2.Country  =  'Japan' ORDER BY T1.Year DESC	film_rank
SELECT Studio ,  COUNT(*) FROM film GROUP BY Studio	film_rank
SELECT Studio ,  COUNT(*) FROM film GROUP BY Studio	film_rank
SELECT Studio FROM film GROUP BY Studio ORDER BY COUNT(*) DESC LIMIT 1	film_rank
SELECT studio FROM (SELECT studio, COUNT(*) AS num_films FROM film GROUP BY studio) ORDER BY num_films DESC LIMIT 1	film_rank
SELECT Studio FROM film GROUP BY Studio HAVING COUNT(*)  >=  2	film_rank
SELECT Studio FROM film GROUP BY Studio HAVING COUNT(*)  >=  2	film_rank
SELECT Title FROM film WHERE Film_ID NOT IN (SELECT Film_ID FROM film_market_estimation)	film_rank
SELECT Title FROM film WHERE Film_ID NOT IN (SELECT Film_ID FROM film_market_estimation)	film_rank
SELECT DISTINCT f1.studio FROM film f1 WHERE f1.director IN ('Nicholas Meyer', 'Walter Hill')	film_rank
SELECT Studio FROM film WHERE Director  =  'Nicholas Meyer' INTERSECT SELECT Studio FROM film WHERE Director  =  'Walter Hill'	film_rank
SELECT title ,  Studio FROM film WHERE Studio LIKE '%Universal%'	film_rank
SELECT title ,  Studio FROM film WHERE Studio LIKE '%Universal%'	film_rank
SELECT Studio FROM film EXCEPT SELECT Studio FROM film WHERE Director  =  'Walter Hill'	film_rank
SELECT Studio FROM film EXCEPT SELECT Studio FROM film WHERE Director  =  'Walter Hill'	film_rank
SELECT Studio FROM film GROUP BY Studio HAVING avg(Gross_in_dollar)  >=  4500000	film_rank
SELECT studio FROM film GROUP BY studio HAVING AVG(gross_in_dollar) > 4500000	film_rank
SELECT title FROM (SELECT title, high_estimate, RANK() OVER (ORDER BY high_estimate DESC) AS rank FROM film JOIN film_market_estimation USING (film_id)) WHERE rank = 1	film_rank
SELECT F.title FROM film F INNER JOIN film_market_estimation FME ON F.film_id = FME.film_id WHERE FME.high_estimate = (SELECT MAX(high_estimate) FROM film_market_estimation)	film_rank
SELECT DISTINCT title, director FROM film WHERE film_id NOT IN (SELECT film_id FROM film_market_estimation WHERE market_id IN (SELECT market_id FROM market WHERE country = 'China'))	film_rank
SELECT title ,  director FROM film WHERE film_id NOT IN (SELECT film_id FROM film_market_estimation AS T1 JOIN market AS T2 ON T1.market_id  =  T2.Market_ID WHERE country  =  'China')	film_rank
SELECT count(*) FROM Ref_calendar	cre_Doc_Tracking_DB
SELECT count(*) FROM Ref_calendar	cre_Doc_Tracking_DB
SELECT calendar_date ,  day_Number FROM Ref_calendar	cre_Doc_Tracking_DB
SELECT calendar_date ,  day_Number FROM Ref_calendar	cre_Doc_Tracking_DB
SELECT count(*) FROM Ref_document_types	cre_Doc_Tracking_DB
SELECT count(*) FROM Ref_document_types	cre_Doc_Tracking_DB
SELECT document_type_code ,  document_type_name FROM Ref_document_types	cre_Doc_Tracking_DB
SELECT document_type_code ,  document_type_name FROM Ref_document_types	cre_Doc_Tracking_DB
SELECT document_type_name ,  document_type_description FROM Ref_document_types WHERE document_type_code  =  'RV'	cre_Doc_Tracking_DB
SELECT document_type_name ,  document_type_description FROM Ref_document_types WHERE document_type_code  =  'RV'	cre_Doc_Tracking_DB
SELECT document_type_code FROM Ref_document_types WHERE document_type_name  =  'Paper'	cre_Doc_Tracking_DB
SELECT document_type_code FROM Ref_document_types WHERE document_type_name  =  'Paper'	cre_Doc_Tracking_DB
SELECT count(*) FROM All_documents WHERE document_type_code  =  'CV' OR document_type_code  =  'BK'	cre_Doc_Tracking_DB
SELECT count(*) FROM All_documents WHERE document_type_code  =  'CV' OR document_type_code  =  'BK'	cre_Doc_Tracking_DB
SELECT date_stored FROM All_documents WHERE Document_name  =  'Marry CV'	cre_Doc_Tracking_DB
SELECT date_stored FROM All_documents WHERE Document_name  =  'Marry CV'	cre_Doc_Tracking_DB
SELECT T2.day_Number ,  T1.Date_Stored FROM All_documents AS T1 JOIN Ref_calendar AS T2 ON T1.date_stored  =  T2.calendar_date	cre_Doc_Tracking_DB
SELECT T2.day_Number ,  T1.Date_Stored FROM All_documents AS T1 JOIN Ref_calendar AS T2 ON T1.date_stored  =  T2.calendar_date	cre_Doc_Tracking_DB
SELECT T2.document_type_name FROM All_documents AS T1 JOIN Ref_document_types AS T2 ON T1.document_type_code  =  T2.document_type_code WHERE T1.document_name  =  'How to read a book'	cre_Doc_Tracking_DB
SELECT T2.document_type_name FROM All_documents AS T1 JOIN Ref_document_types AS T2 ON T1.document_type_code  =  T2.document_type_code WHERE T1.document_name  =  'How to read a book'	cre_Doc_Tracking_DB
SELECT count(*) FROM Ref_locations	cre_Doc_Tracking_DB
SELECT count(*) FROM Ref_locations	cre_Doc_Tracking_DB
SELECT location_code ,  location_name FROM Ref_locations	cre_Doc_Tracking_DB
SELECT location_code ,  location_name FROM Ref_locations	cre_Doc_Tracking_DB
SELECT location_name ,  location_description FROM Ref_locations WHERE location_code  =  'x'	cre_Doc_Tracking_DB
SELECT location_name ,  location_description FROM Ref_locations WHERE location_code  =  'x'	cre_Doc_Tracking_DB
SELECT location_code FROM Ref_locations WHERE location_name  =  'Canada'	cre_Doc_Tracking_DB
SELECT location_code FROM Ref_locations WHERE location_name  =  'Canada'	cre_Doc_Tracking_DB
SELECT count(*) FROM ROLES	cre_Doc_Tracking_DB
SELECT count(*) FROM ROLES	cre_Doc_Tracking_DB
SELECT role_code ,  role_name ,  role_description FROM ROLES	cre_Doc_Tracking_DB
SELECT role_code ,  role_name ,  role_description FROM ROLES	cre_Doc_Tracking_DB
SELECT role_name ,  role_description FROM ROLES WHERE role_code  =  'MG'	cre_Doc_Tracking_DB
SELECT role_name ,  role_description FROM ROLES WHERE role_code  =  'MG'	cre_Doc_Tracking_DB
SELECT role_description FROM ROLES WHERE role_name  =  'Proof Reader'	cre_Doc_Tracking_DB
SELECT role_description FROM ROLES WHERE role_name  =  'Proof Reader'	cre_Doc_Tracking_DB
SELECT count(*) FROM Employees	cre_Doc_Tracking_DB
SELECT count(*) FROM Employees	cre_Doc_Tracking_DB
SELECT employee_name ,  role_code ,  date_of_birth FROM Employees WHERE employee_Name  =  'Armani'	cre_Doc_Tracking_DB
SELECT employee_name ,  role_code ,  date_of_birth FROM Employees WHERE employee_Name  =  'Armani'	cre_Doc_Tracking_DB
SELECT employee_ID FROM Employees WHERE employee_name  =  'Ebba'	cre_Doc_Tracking_DB
SELECT employee_ID FROM Employees WHERE employee_name  =  'Ebba'	cre_Doc_Tracking_DB
SELECT employees.employee_name FROM employees JOIN roles ON employees.role_code = roles.role_code WHERE roles.role_name = 'HR'	cre_Doc_Tracking_DB
SELECT employee_name FROM Employees WHERE role_code  =  'HR'	cre_Doc_Tracking_DB
SELECT r.role_code, COUNT(e.employee_id) FROM roles r LEFT JOIN employees e ON r.role_code = e.role_code GROUP BY r.role_code	cre_Doc_Tracking_DB
SELECT r.role_code, (SELECT COUNT(*) FROM employees WHERE role_code = r.role_code) AS employee_count FROM roles r	cre_Doc_Tracking_DB
SELECT role_code FROM Employees GROUP BY role_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Tracking_DB
SELECT role_code FROM employees GROUP BY role_code HAVING COUNT(employee_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(employee_id) as cnt FROM employees GROUP BY role_code))	cre_Doc_Tracking_DB
SELECT role_code FROM Employees GROUP BY role_code HAVING count(*)  >=  3	cre_Doc_Tracking_DB
SELECT role_code FROM Employees GROUP BY role_code HAVING count(*)  >=  3	cre_Doc_Tracking_DB
SELECT e.role_code FROM employees e GROUP BY e.role_code HAVING COUNT(e.employee_id) = (SELECT MIN(emp_count) FROM (SELECT COUNT(employee_id) AS emp_count FROM employees GROUP BY role_code))	cre_Doc_Tracking_DB
SELECT r.role_code FROM roles r LEFT JOIN employees e ON r.role_code = e.role_code GROUP BY r.role_code ORDER BY COUNT(e.employee_id) ASC LIMIT 1	cre_Doc_Tracking_DB
SELECT T2.role_name ,  T2.role_description FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T1.employee_name  =  'Ebba'	cre_Doc_Tracking_DB
SELECT T2.role_name ,  T2.role_description FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T1.employee_name  =  'Ebba'	cre_Doc_Tracking_DB
SELECT T1.employee_name FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T2.role_name  =  'Editor'	cre_Doc_Tracking_DB
SELECT T1.employee_name FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T2.role_name  =  'Editor'	cre_Doc_Tracking_DB
SELECT T1.employee_id FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T2.role_name  =  'Human Resource' OR T2.role_name  =  'Manager'	cre_Doc_Tracking_DB
SELECT T1.employee_id FROM Employees AS T1 JOIN ROLES AS T2 ON T1.role_code  =  T2.role_code WHERE T2.role_name  =  'Human Resource' OR T2.role_name  =  'Manager'	cre_Doc_Tracking_DB
SELECT DISTINCT location_code FROM Document_locations	cre_Doc_Tracking_DB
SELECT DISTINCT location_code FROM Document_locations	cre_Doc_Tracking_DB
SELECT T3.location_name FROM All_documents AS T1 JOIN Document_locations AS T2 ON T1.document_id  =  T2.document_id JOIN Ref_locations AS T3 ON T2.location_code  =  T3.location_code WHERE T1.document_name  =  'Robin CV'	cre_Doc_Tracking_DB
SELECT location_name FROM ref_locations WHERE location_code = (SELECT location_code FROM document_locations dl JOIN all_documents ad ON dl.document_id = ad.document_id WHERE ad.document_name = 'Robin CV')	cre_Doc_Tracking_DB
SELECT location_code ,  date_in_location_from ,  date_in_locaton_to FROM Document_locations	cre_Doc_Tracking_DB
SELECT location_code ,  date_in_location_from ,  date_in_locaton_to FROM Document_locations	cre_Doc_Tracking_DB
SELECT T1.date_in_location_from ,  T1.date_in_locaton_to FROM Document_locations AS T1 JOIN All_documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  'Robin CV'	cre_Doc_Tracking_DB
SELECT T1.date_in_location_from ,  T1.date_in_locaton_to FROM Document_locations AS T1 JOIN All_documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  'Robin CV'	cre_Doc_Tracking_DB
SELECT A.location_code, COUNT(B.document_id) AS doc_count FROM ref_locations A LEFT JOIN document_locations B ON A.location_code = B.location_code GROUP BY A.location_code	cre_Doc_Tracking_DB
SELECT ref_locations.location_code, COUNT(document_locations.document_id) FROM ref_locations LEFT JOIN document_locations ON ref_locations.location_code = document_locations.location_code GROUP BY ref_locations.location_code	cre_Doc_Tracking_DB
SELECT location_code FROM Document_locations GROUP BY location_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Tracking_DB
SELECT location_code FROM document_locations GROUP BY location_code HAVING COUNT(document_id) = (SELECT MAX(counts) FROM (SELECT COUNT(document_id) AS counts FROM document_locations GROUP BY location_code))	cre_Doc_Tracking_DB
SELECT location_code FROM Document_locations GROUP BY location_code HAVING count(*)  >=  3	cre_Doc_Tracking_DB
SELECT location_code FROM document_locations GROUP BY location_code HAVING COUNT(DISTINCT document_id) >= 3	cre_Doc_Tracking_DB
SELECT T2.location_name ,  T1.location_code FROM Document_locations AS T1 JOIN Ref_locations AS T2 ON T1.location_code  =  T2.location_code GROUP BY T1.location_code ORDER BY count(*) ASC LIMIT 1	cre_Doc_Tracking_DB
SELECT location_name, location_code FROM ref_locations WHERE location_code IN (SELECT location_code FROM document_locations GROUP BY location_code HAVING COUNT(document_id) = (SELECT MIN(cnt) FROM (SELECT COUNT(document_id) AS cnt FROM document_locations GROUP BY location_code)))	cre_Doc_Tracking_DB
SELECT T2.employee_name ,  T3.employee_name FROM Documents_to_be_destroyed AS T1 JOIN Employees AS T2 ON T1.Destruction_Authorised_by_Employee_ID = T2.employee_id JOIN Employees AS T3 ON T1.Destroyed_by_Employee_ID = T3.employee_id;	cre_Doc_Tracking_DB
SELECT T2.employee_name ,  T3.employee_name FROM Documents_to_be_destroyed AS T1 JOIN Employees AS T2 ON T1.Destruction_Authorised_by_Employee_ID = T2.employee_id JOIN Employees AS T3 ON T1.Destroyed_by_Employee_ID = T3.employee_id;	cre_Doc_Tracking_DB
SELECT employees.employee_id, COUNT(documents_to_be_destroyed.document_id) AS authorized_count FROM employees LEFT JOIN documents_to_be_destroyed ON employees.employee_id = documents_to_be_destroyed.destruction_authorised_by_employee_id GROUP BY employees.employee_id	cre_Doc_Tracking_DB
SELECT e.employee_id AS id, COUNT(d.document_id) AS documents_count FROM employees e LEFT JOIN documents_to_be_destroyed d ON e.employee_id = d.destruction_authorised_by_employee_id GROUP BY e.employee_id	cre_Doc_Tracking_DB
SELECT employees.employee_id, (SELECT COUNT(*) FROM documents_to_be_destroyed WHERE destroyed_by_employee_id = employees.employee_id) AS num_destroyed_documents FROM employees	cre_Doc_Tracking_DB
SELECT employees.employee_id, IFNULL(SUM(CASE WHEN documents_to_be_destroyed.destroyed_by_employee_id = employees.employee_id THEN 1 ELSE 0 END), 0) AS documents_destroyed FROM employees LEFT JOIN documents_to_be_destroyed ON employees.employee_id = documents_to_be_destroyed.destroyed_by_employee_id GROUP BY employees.employee_id	cre_Doc_Tracking_DB
SELECT employee_id FROM Employees EXCEPT SELECT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT employee_id FROM Employees EXCEPT SELECT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT DISTINCT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT DISTINCT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT DISTINCT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT DISTINCT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT employee_id FROM Employees EXCEPT SELECT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT employee_id FROM Employees EXCEPT SELECT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed UNION SELECT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT Destroyed_by_Employee_ID FROM Documents_to_be_destroyed UNION SELECT Destruction_Authorised_by_Employee_ID FROM Documents_to_be_destroyed	cre_Doc_Tracking_DB
SELECT count(*) FROM club	club_1
SELECT count(*) FROM club	club_1
SELECT clubname FROM club	club_1
SELECT clubname FROM club	club_1
SELECT count(*) FROM student	club_1
SELECT count(*) FROM student	club_1
SELECT fname FROM student	club_1
SELECT fname FROM student	club_1
SELECT DISTINCT lname FROM student JOIN member_of_club ON student.stuid = member_of_club.stuid JOIN club ON member_of_club.clubid = club.clubid WHERE club.clubname = 'Bootup Baltimore'	club_1
SELECT t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore'	club_1
SELECT t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises'	club_1
SELECT t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises'	club_1
SELECT count(*) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Tennis Club'	club_1
SELECT count(*) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Tennis Club'	club_1
SELECT count(*) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Pen and Paper Gaming'	club_1
SELECT COUNT(DISTINCT stuid) FROM member_of_club JOIN club ON member_of_club.clubid = club.clubid WHERE clubname = 'Pen and Paper Gaming'	club_1
SELECT COUNT(DISTINCT club.clubid) FROM club JOIN member_of_club ON club.clubid = member_of_club.clubid JOIN student ON member_of_club.stuid = student.stuid WHERE student.fname = 'Linda' AND student.lname = 'Smith';	club_1
SELECT COUNT(*) FROM club WHERE clubid IN (SELECT clubid FROM member_of_club WHERE stuid = (SELECT stuid FROM student WHERE fname = 'Linda' AND lname = 'Smith'))	club_1
SELECT COUNT(DISTINCT club.clubid) FROM club JOIN member_of_club ON club.clubid = member_of_club.clubid JOIN student ON member_of_club.stuid = student.stuid WHERE student.fname = 'Tracy' AND student.lname = 'Kim'	club_1
SELECT COUNT(DISTINCT clubid) FROM member_of_club WHERE stuid = (SELECT stuid FROM student WHERE fname = 'Tracy' AND lname = 'Kim')	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t3.sex  =  'F'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t3.sex  =  'F'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises' AND t3.sex  =  'M'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises' AND t3.sex  =  'M'	club_1
SELECT DISTINCT student.fname, student.lname FROM student, member_of_club, club WHERE student.stuid = member_of_club.stuid AND member_of_club.clubid = club.clubid AND club.clubname = 'Bootup Baltimore' AND student.major = '600'	club_1
SELECT DISTINCT student.fname, student.lname FROM student, member_of_club, club WHERE student.stuid = member_of_club.stuid AND member_of_club.clubid = club.clubid AND clubname = 'Bootup Baltimore' AND major = '600'	club_1
SELECT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.major  =  '600' GROUP BY t1.clubname ORDER BY count(*) DESC LIMIT 1	club_1
SELECT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.major  =  '600' GROUP BY t1.clubname ORDER BY count(*) DESC LIMIT 1	club_1
SELECT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.sex  =  'F' GROUP BY t1.clubname ORDER BY count(*) DESC LIMIT 1	club_1
SELECT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.sex  =  'F' GROUP BY t1.clubname ORDER BY count(*) DESC LIMIT 1	club_1
SELECT clubdesc FROM club WHERE clubname  =  'Tennis Club'	club_1
SELECT clubdesc FROM club WHERE clubname  =  'Tennis Club'	club_1
SELECT clubdesc FROM club WHERE clubname  =  'Pen and Paper Gaming'	club_1
SELECT clubdesc FROM club WHERE clubname  =  'Pen and Paper Gaming'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Tennis Club'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Tennis Club'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Pen and Paper Gaming'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Pen and Paper Gaming'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Hopkins Student Enterprises'	club_1
SELECT clublocation FROM club WHERE clubname  =  'Hopkins Student Enterprises'	club_1
SELECT clubname FROM club WHERE clublocation  =  'AKW'	club_1
SELECT clubname FROM club WHERE clublocation  =  'AKW'	club_1
SELECT count(*) FROM club WHERE clublocation  =  'HHH'	club_1
SELECT count(*) FROM club WHERE clublocation  =  'HHH'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t2.position  =  'President'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t2.position  =  'President'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises' AND t2.position  =  'CTO'	club_1
SELECT t3.fname ,  t3.lname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises' AND t2.position  =  'CTO'	club_1
SELECT count(DISTINCT t2.position) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid WHERE t1.clubname  =  'Bootup Baltimore'	club_1
SELECT count(DISTINCT t2.position) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid WHERE t1.clubname  =  'Bootup Baltimore'	club_1
SELECT COUNT(DISTINCT student.stuid) FROM student, member_of_club, club WHERE student.stuid = member_of_club.stuid AND member_of_club.clubid = club.clubid AND club.clubname = 'Bootup Baltimore' AND student.age > 18	club_1
SELECT count(*) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t3.age  >  18	club_1
SELECT count(*) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore' AND t3.age  <  18	club_1
SELECT COUNT(DISTINCT s.stuid) FROM student s INNER JOIN member_of_club m USING(stuid) INNER JOIN club c USING(clubid) WHERE c.clubname = 'Bootup Baltimore' AND s.age < 18	club_1
SELECT DISTINCT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.city_code  =  'BAL'	club_1
SELECT clubname FROM club WHERE clubid IN (SELECT clubid FROM member_of_club WHERE stuid IN (SELECT stuid FROM student WHERE city_code = 'BAL'));	club_1
SELECT clubname FROM club WHERE clubid IN (SELECT member_of_club.clubid FROM member_of_club INNER JOIN student ON member_of_club.stuid = student.stuid WHERE student.city_code = 'HOU')	club_1
SELECT clubname FROM club WHERE clubid IN (SELECT clubid FROM member_of_club WHERE stuid IN (SELECT stuid FROM student WHERE city_code = 'HOU'))	club_1
SELECT COUNT(DISTINCT club.clubid) FROM club, member_of_club, student WHERE club.clubid = member_of_club.clubid AND member_of_club.stuid = student.stuid AND student.fname = 'Eric' AND student.lname = 'Tai'	club_1
SELECT COUNT(DISTINCT club.clubid) FROM club JOIN member_of_club ON club.clubid = member_of_club.clubid JOIN student ON member_of_club.stuid = student.stuid WHERE student.fname = 'Eric' AND student.lname = 'Tai'	club_1
SELECT DISTINCT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.fname  =  'Davis' AND t3.lname  =  'Steven'	club_1
SELECT DISTINCT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.fname  =  'Davis' AND t3.lname  =  'Steven'	club_1
SELECT clubname FROM club WHERE EXISTS (SELECT 1 FROM member_of_club INNER JOIN student ON member_of_club.stuid = student.stuid WHERE student.advisor = '1121' AND member_of_club.clubid = club.clubid)	club_1
SELECT DISTINCT t1.clubname FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t3.advisor  =  1121	club_1
SELECT avg(t3.age) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Bootup Baltimore'	club_1
SELECT AVG(age) FROM student WHERE stuid IN (SELECT moc.stuid FROM member_of_club moc JOIN club cb ON moc.clubid = cb.clubid WHERE cb.clubname = 'Bootup Baltimore')	club_1
SELECT AVG(age) FROM student s WHERE s.stuid IN (SELECT m.stuid FROM member_of_club m JOIN club c ON m.clubid = c.clubid WHERE c.clubname = 'Hopkins Student Enterprises')	club_1
SELECT avg(t3.age) FROM club AS t1 JOIN member_of_club AS t2 ON t1.clubid  =  t2.clubid JOIN student AS t3 ON t2.stuid  =  t3.stuid WHERE t1.clubname  =  'Hopkins Student Enterprises'	club_1
SELECT AVG(age) FROM student WHERE stuid IN (SELECT stuid FROM member_of_club JOIN club ON member_of_club.clubid = club.clubid WHERE clubname = 'Tennis Club')	club_1
SELECT AVG(s.age) FROM student s WHERE EXISTS (SELECT 1 FROM member_of_club mc JOIN club c ON mc.clubid = c.clubid WHERE mc.stuid = s.stuid AND c.clubname = 'Tennis Club')	club_1
SELECT DISTINCT grant_amount FROM grants INNER JOIN documents ON grants.grant_id = documents.grant_id WHERE documents.sent_date < '1986-08-26 20:49:27' AND grants.grant_end_date > '1989-03-16 18:27:16'	tracking_grants_for_research
SELECT T1.grant_amount FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id WHERE T2.sent_date  <  '1986-08-26 20:49:27' INTERSECT SELECT grant_amount FROM grants WHERE grant_end_date  >  '1989-03-16 18:27:16'	tracking_grants_for_research
SELECT project_details FROM projects WHERE project_id IN (SELECT project_id FROM project_outcomes WHERE outcome_code = 'Paper' INTERSECT SELECT project_id FROM project_outcomes WHERE outcome_code = 'Patent')	tracking_grants_for_research
SELECT DISTINCT projects.project_details FROM projects JOIN project_outcomes ON projects.project_id = project_outcomes.project_id WHERE project_outcomes.outcome_code IN ('Paper', 'Patent') GROUP BY projects.project_id HAVING COUNT(DISTINCT project_outcomes.outcome_code) = 2	tracking_grants_for_research
SELECT sum(grant_amount) FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id JOIN organisation_Types AS T3 ON T2.organisation_type  =  T3.organisation_type WHERE T3.organisation_type_description  =  'Research'	tracking_grants_for_research
SELECT sum(grant_amount) FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id JOIN organisation_Types AS T3 ON T2.organisation_type  =  T3.organisation_type WHERE T3.organisation_type_description  =  'Research'	tracking_grants_for_research
SELECT date_from, date_to FROM project_staff WHERE project_id = (SELECT project_id FROM project_staff GROUP BY project_id ORDER BY COUNT(staff_id) DESC LIMIT 1)	tracking_grants_for_research
SELECT date_range.start_date, date_range.end_date FROM (SELECT project_id, MIN(date_from) AS start_date, MAX(date_to) AS end_date FROM project_staff WHERE role_code = 'leader' GROUP BY project_id) date_range JOIN (SELECT project_id FROM project_staff GROUP BY project_id HAVING role_code = 'leader' ORDER BY COUNT(*) DESC LIMIT 1) pj_most_staff ON date_range.project_id = pj_most_staff.project_id;	tracking_grants_for_research
SELECT DISTINCT O.organisation_id, O.organisation_details FROM organisations O JOIN projects P ON O.organisation_id = P.organisation_id	tracking_grants_for_research
SELECT organisation_id, organisation_details FROM organisations WHERE organisation_id IN (SELECT organisation_id FROM grants WHERE grant_amount > 6000)	tracking_grants_for_research
SELECT T1.organisation_type ,  T1.organisation_id FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT T1.organisation_type ,  T1.organisation_id FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT T1.organisation_type FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_type ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT T1.organisation_type FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_type ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT T1.sent_date FROM documents AS T1 JOIN Grants AS T2 ON T1.grant_id  =  T2.grant_id JOIN Organisations AS T3 ON T2.organisation_id  =  T3.organisation_id JOIN organisation_Types AS T4 ON T3.organisation_type  =  T4.organisation_type WHERE T2.grant_amount  >  5000 AND T4.organisation_type_description  =  'Research'	tracking_grants_for_research
SELECT T1.sent_date FROM documents AS T1 JOIN Grants AS T2 ON T1.grant_id  =  T2.grant_id JOIN Organisations AS T3 ON T2.organisation_id  =  T3.organisation_id JOIN organisation_Types AS T4 ON T3.organisation_type  =  T4.organisation_type WHERE T2.grant_amount  >  5000 AND T4.organisation_type_description  =  'Research'	tracking_grants_for_research
SELECT T1.response_received_date FROM Documents AS T1 JOIN Document_Types AS T2 ON T1.document_type_code  =  T2.document_type_code JOIN Grants AS T3 ON T1.grant_id  =  T3.grant_id WHERE T2.document_description  =  'Regular' OR T3.grant_amount  >  100	tracking_grants_for_research
SELECT D.response_received_date FROM documents D INNER JOIN document_types DT ON D.document_type_code = DT.document_type_code INNER JOIN grants G ON D.grant_id = G.grant_id WHERE DT.document_description = 'Regular' AND G.grant_amount > 100	tracking_grants_for_research
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_Staff WHERE role_code  =  'researcher' )	tracking_grants_for_research
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_Staff WHERE role_code  =  'researcher' )	tracking_grants_for_research
SELECT t.task_id, t.project_id, t.task_details FROM tasks t JOIN projects p ON t.project_id = p.project_id WHERE p.project_details = 'omnis' OR t.project_id IN (SELECT po.project_id FROM project_outcomes po GROUP BY po.project_id HAVING COUNT(po.outcome_code) > 2)	tracking_grants_for_research
SELECT t.task_id, t.project_id, t.task_details FROM tasks t JOIN projects p ON t.project_id = p.project_id WHERE p.project_details = 'omnis' OR p.project_id IN (SELECT po.project_id FROM project_outcomes po GROUP BY po.project_id HAVING COUNT(po.outcome_code) >= 3)	tracking_grants_for_research
SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'researcher'	tracking_grants_for_research
SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'researcher'	tracking_grants_for_research
SELECT COUNT(DISTINCT role_code) FROM staff_roles	tracking_grants_for_research
SELECT count(DISTINCT role_code) FROM Project_Staff	tracking_grants_for_research
SELECT sum(grant_amount) ,  organisation_id FROM Grants GROUP BY organisation_id	tracking_grants_for_research
SELECT sum(grant_amount) ,  organisation_id FROM Grants GROUP BY organisation_id	tracking_grants_for_research
SELECT project_details FROM projects WHERE project_id IN (SELECT project_id FROM project_outcomes WHERE outcome_code IN (SELECT outcome_code FROM research_outcomes WHERE outcome_description LIKE '%Published%'))	tracking_grants_for_research
SELECT project_details FROM projects WHERE project_id IN (SELECT project_id FROM project_outcomes WHERE outcome_code IN (SELECT outcome_code FROM research_outcomes WHERE outcome_description LIKE 'published'))	tracking_grants_for_research
SELECT p.project_id, COUNT(DISTINCT ps.staff_id) AS staff_count FROM projects p JOIN project_staff ps ON p.project_id = ps.project_id GROUP BY p.project_id ORDER BY p.project_id ASC;	tracking_grants_for_research
SELECT A.project_id, COUNT(B.staff_id) FROM projects A LEFT JOIN project_staff B ON A.project_id = B.project_id GROUP BY A.project_id ORDER BY A.project_id	tracking_grants_for_research
SELECT role_description FROM Staff_Roles WHERE role_code  =  'researcher'	tracking_grants_for_research
SELECT role_description FROM Staff_Roles WHERE role_code  =  'researcher'	tracking_grants_for_research
SELECT date_from FROM Project_Staff ORDER BY date_from ASC LIMIT 1	tracking_grants_for_research
SELECT date_from FROM Project_Staff ORDER BY date_from ASC LIMIT 1	tracking_grants_for_research
SELECT T1.project_details ,  T1.project_id FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT p.project_details, p.project_id FROM projects p INNER JOIN project_outcomes po ON p.project_id = po.project_id GROUP BY p.project_id HAVING COUNT(po.outcome_code) = (SELECT MAX(res.total) FROM (SELECT COUNT(outcome_code) AS total FROM project_outcomes GROUP BY project_id) res)	tracking_grants_for_research
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_outcomes )	tracking_grants_for_research
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_outcomes )	tracking_grants_for_research
SELECT T1.organisation_id ,  T1.organisation_type ,  T1.organisation_details FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT o.organisation_id, o.organisation_type, o.organisation_details FROM organisations o WHERE organisation_id IN (SELECT employer_organisation_id FROM research_staff GROUP BY employer_organisation_id HAVING COUNT(staff_id) = (SELECT MAX(counts) FROM (SELECT COUNT(staff_id) AS counts FROM research_staff GROUP BY employer_organisation_id)))	tracking_grants_for_research
SELECT role_description, staff_id FROM staff_roles JOIN project_staff USING (role_code) WHERE project_id IN (SELECT project_id FROM project_outcomes GROUP BY project_id ORDER BY COUNT(*) DESC LIMIT 1)	tracking_grants_for_research
SELECT firstQuery.staff_id, SR.role_description FROM (SELECT staff_id, role_code, MAX(project_count) FROM (SELECT staff_id, role_code, COUNT(project_id) as project_count FROM project_staff GROUP BY staff_id, role_code) GROUP BY staff_id) firstQuery JOIN staff_roles SR ON firstQuery.role_code = SR.role_code	tracking_grants_for_research
SELECT document_type_code FROM Document_Types WHERE document_description LIKE 'Initial%'	tracking_grants_for_research
SELECT document_type_code FROM Document_Types WHERE document_description LIKE 'Initial%'	tracking_grants_for_research
SELECT DISTINCT grant_start_date FROM grants JOIN documents ON grants.grant_id = documents.grant_id JOIN document_types ON documents.document_type_code = document_types.document_type_code WHERE document_description IN ('Regular', 'Initial Application') GROUP BY grants.grant_id HAVING COUNT(DISTINCT document_description) = 2	tracking_grants_for_research
SELECT g.grant_start_date FROM grants g WHERE g.grant_id IN (SELECT d.grant_id FROM documents d JOIN document_types dt ON d.document_type_code = dt.document_type_code WHERE dt.document_description = 'Regular' OR dt.document_description = 'Initial Application') GROUP BY g.grant_id	tracking_grants_for_research
SELECT grants.grant_id, MAX(doc_no) FROM grants JOIN (SELECT grant_id, COUNT(*) AS doc_no FROM documents GROUP BY grant_id) AS doc_totals ON grants.grant_id = doc_totals.grant_id GROUP BY grants.grant_id	tracking_grants_for_research
SELECT grant_id ,  count(*) FROM Documents GROUP BY grant_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT T1.organisation_type_description FROM organisation_Types AS T1 JOIN Organisations AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_details  =  'quo'	tracking_grants_for_research
SELECT T1.organisation_type_description FROM organisation_Types AS T1 JOIN Organisations AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_details  =  'quo'	tracking_grants_for_research
SELECT organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor' ORDER BY organisation_details	tracking_grants_for_research
SELECT organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor' ORDER BY organisation_details	tracking_grants_for_research
SELECT count(*) FROM Project_outcomes WHERE outcome_code  =  'Patent'	tracking_grants_for_research
SELECT count(*) FROM Project_outcomes WHERE outcome_code  =  'Patent'	tracking_grants_for_research
SELECT count(*) FROM Project_Staff WHERE role_code  =  'leader' OR date_from  <  '1989-04-24 23:51:54'	tracking_grants_for_research
SELECT count(*) FROM Project_Staff WHERE role_code  =  'leader' OR date_from  <  '1989-04-24 23:51:54'	tracking_grants_for_research
SELECT date_to FROM Project_Staff ORDER BY date_to DESC LIMIT 1	tracking_grants_for_research
SELECT date_to FROM Project_Staff ORDER BY date_to DESC LIMIT 1	tracking_grants_for_research
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code JOIN Projects AS T3 ON T2.project_id  =  T3.project_id WHERE T3.project_details  =  'sint'	tracking_grants_for_research
SELECT outcome_description FROM research_outcomes WHERE outcome_code IN (SELECT outcome_code FROM project_outcomes WHERE project_id IN (SELECT project_id FROM projects WHERE project_details = 'sint'))	tracking_grants_for_research
SELECT p1.organisation_id, COUNT(*) as outcome_count FROM projects p1 JOIN project_outcomes po ON p1.project_id = po.project_id GROUP BY p1.organisation_id HAVING outcome_count = (SELECT MAX(counts) FROM (SELECT COUNT(*) as counts FROM project_outcomes JOIN projects ON project_outcomes.project_id = projects.project_id GROUP BY projects.organisation_id))	tracking_grants_for_research
SELECT T1.organisation_id ,  count(*) FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1	tracking_grants_for_research
SELECT project_details FROM Projects WHERE organisation_id IN ( SELECT organisation_id FROM Projects GROUP BY organisation_id ORDER BY count(*) DESC LIMIT 1 )	tracking_grants_for_research
SELECT project_details FROM Projects WHERE organisation_id IN ( SELECT organisation_id FROM Projects GROUP BY organisation_id ORDER BY count(*) DESC LIMIT 1 )	tracking_grants_for_research
SELECT staff_details FROM Research_Staff ORDER BY staff_details ASC	tracking_grants_for_research
SELECT staff_details FROM Research_Staff ORDER BY staff_details ASC	tracking_grants_for_research
SELECT count(*) FROM Tasks	tracking_grants_for_research
SELECT count(*) FROM Tasks	tracking_grants_for_research
SELECT project_details, (SELECT COUNT(*) FROM tasks WHERE tasks.project_id = projects.project_id) AS task_count FROM projects	tracking_grants_for_research
SELECT projects.project_id, (SELECT COUNT(*) FROM tasks WHERE tasks.project_id = projects.project_id) AS task_count FROM projects	tracking_grants_for_research
SELECT role_description FROM staff_roles WHERE role_code IN (SELECT role_code FROM project_staff)	tracking_grants_for_research
SELECT role_description FROM staff_roles JOIN project_staff ON staff_roles.role_code = project_staff.role_code WHERE project_staff.date_from >= '2003-04-19 15:06:20' AND project_staff.date_to <= '2016-03-15 00:33:18' GROUP BY role_description	tracking_grants_for_research
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code	tracking_grants_for_research
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code	tracking_grants_for_research
SELECT role_description FROM staff_roles WHERE role_code = (SELECT role_code FROM project_staff GROUP BY role_code ORDER BY COUNT(*) DESC LIMIT 1)	tracking_grants_for_research
SELECT role_description FROM staff_roles WHERE role_code = (SELECT role_code FROM project_staff GROUP BY role_code ORDER BY COUNT(*) DESC LIMIT 1)	tracking_grants_for_research
SELECT count(T2.friend) FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T1.name  =  'Dan'	network_2
SELECT COUNT(DISTINCT friend) FROM personfriend WHERE name = 'Dan'	network_2
SELECT count(*) FROM Person WHERE gender  =  'female'	network_2
SELECT count(*) FROM Person WHERE gender  =  'female'	network_2
SELECT avg(age) FROM Person	network_2
SELECT avg(age) FROM Person	network_2
SELECT count(DISTINCT city) FROM Person	network_2
SELECT count(DISTINCT city) FROM Person	network_2
SELECT count(DISTINCT job) FROM Person	network_2
SELECT count(DISTINCT job) FROM Person	network_2
SELECT name FROM Person WHERE age  =  (SELECT max(age) FROM person)	network_2
SELECT name FROM Person WHERE age  =  (SELECT max(age) FROM person)	network_2
SELECT name FROM Person WHERE job  =  'student' AND age  =  (SELECT max(age) FROM person WHERE job  =  'student' )	network_2
SELECT name FROM Person WHERE job  =  'student' AND age  =  (SELECT max(age) FROM person WHERE job  =  'student' )	network_2
SELECT name FROM Person WHERE gender  =  'male' AND age  =  (SELECT min(age) FROM person WHERE gender  =  'male' )	network_2
SELECT name FROM Person WHERE gender  =  'male' AND age  =  (SELECT min(age) FROM person WHERE gender  =  'male' )	network_2
SELECT age FROM Person WHERE job  =  'doctor' AND name  =  'Zach'	network_2
SELECT age FROM Person WHERE job  =  'doctor' AND name  =  'Zach'	network_2
SELECT name FROM Person WHERE age  <  30	network_2
SELECT name FROM Person WHERE age  <  30	network_2
SELECT count(*) FROM Person WHERE age  >  30 AND job  =  'engineer'	network_2
SELECT count(*) FROM Person WHERE age  >  30 AND job  =  'engineer'	network_2
SELECT avg(age) ,  gender FROM Person GROUP BY gender	network_2
SELECT avg(age) ,  gender FROM Person GROUP BY gender	network_2
SELECT avg(age) ,  job FROM Person GROUP BY job	network_2
SELECT avg(age) ,  job FROM Person GROUP BY job	network_2
SELECT avg(age) ,  job FROM Person WHERE gender  =  'male' GROUP BY job	network_2
SELECT avg(age) ,  job FROM Person WHERE gender  =  'male' GROUP BY job	network_2
SELECT min(age) ,  job FROM Person GROUP BY job	network_2
SELECT min(age) ,  job FROM Person GROUP BY job	network_2
SELECT count(*) ,  gender FROM Person WHERE age  <  40 GROUP BY gender	network_2
SELECT count(*) ,  gender FROM Person WHERE age  <  40 GROUP BY gender	network_2
SELECT p1.name FROM person p1 WHERE p1.age > (SELECT MAX(p2.age) FROM person p2 WHERE p2.job = 'engineer') ORDER BY p1.age	network_2
SELECT name FROM Person WHERE age  >  (SELECT min(age) FROM person WHERE job  =  'engineer') ORDER BY age	network_2
SELECT count(*) FROM Person WHERE age  >  (SELECT max(age) FROM person WHERE job  =  'engineer')	network_2
SELECT count(*) FROM Person WHERE age  >  (SELECT max(age) FROM person WHERE job  =  'engineer')	network_2
SELECT name ,  job FROM Person ORDER BY name	network_2
SELECT name ,  job FROM Person ORDER BY name	network_2
SELECT name FROM Person ORDER BY age DESC	network_2
SELECT name FROM Person ORDER BY age DESC	network_2
SELECT name, age FROM person WHERE gender = 'male' ORDER BY age	network_2
SELECT name, age FROM person WHERE gender = 'male' ORDER BY age	network_2
SELECT p.name, p.age FROM person p WHERE p.name IN (SELECT pf.friend FROM personfriend pf WHERE pf.name = 'Alice') AND p.name IN (SELECT pf.friend FROM personfriend pf WHERE pf.name = 'Dan')	network_2
SELECT DISTINCT p1.name, p1.age FROM person p1 JOIN personfriend pf1 ON p1.name = pf1.friend JOIN personfriend pf2 ON p1.name = pf2.friend WHERE pf1.name = 'Alice' AND pf2.name = 'Dan'	network_2
SELECT DISTINCT T1.name ,  T1.age FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend  =  'Dan' OR T2.friend  =  'Alice'	network_2
SELECT DISTINCT T1.name ,  T1.age FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend  =  'Dan' OR T2.friend  =  'Alice'	network_2
SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend IN (SELECT name FROM Person WHERE age  >  40) INTERSECT SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend IN (SELECT name FROM Person WHERE age  <  30)	network_2
SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend IN (SELECT name FROM Person WHERE age  >  40) INTERSECT SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend IN (SELECT name FROM Person WHERE age  <  30)	network_2
SELECT DISTINCT person.name FROM person INNER JOIN personfriend ON person.name = personfriend.name WHERE EXISTS (SELECT 1 FROM person WHERE name = personfriend.friend AND age > 40) AND NOT EXISTS (SELECT 1 FROM person WHERE name = personfriend.friend AND age < 30)	network_2
SELECT DISTINCT p.name FROM person p WHERE p.age > 40 AND NOT EXISTS (SELECT 1 FROM personfriend pf JOIN person f ON pf.friend = f.name WHERE pf.name = p.name AND f.age < 30)	network_2
SELECT name FROM person EXCEPT SELECT T2.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T1.job  =  'student'	network_2
SELECT name FROM person EXCEPT SELECT T2.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T1.job  =  'student'	network_2
SELECT p.name FROM person p WHERE p.name IN (SELECT pf.name FROM personfriend pf GROUP BY pf.name HAVING COUNT(DISTINCT pf.friend) = 1)	network_2
SELECT name FROM PersonFriend GROUP BY name HAVING count(*)  =  1	network_2
SELECT T2.friend FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T1.name  =  'Bob'	network_2
SELECT T2.friend FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T1.name  =  'Bob'	network_2
SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend  =  'Bob'	network_2
SELECT pf.friend FROM personfriend pf WHERE pf.name = 'Bob';	network_2
SELECT T1.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend  =  'Zach' AND T1.gender  =  'female'	network_2
SELECT DISTINCT p.name FROM person p JOIN personfriend pf ON p.name = pf.name WHERE pf.friend = 'Zach' AND p.gender = 'female'	network_2
SELECT p.name FROM person p WHERE p.gender = 'female' AND p.name IN (SELECT friend FROM personfriend WHERE name = 'Alice')	network_2
SELECT DISTINCT personfriend.friend FROM personfriend INNER JOIN person ON personfriend.friend = person.name WHERE personfriend.name = 'Alice' AND person.gender = 'female';	network_2
SELECT T2.friend FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T2.name  =  'Alice' AND T1.gender  =  'male' AND T1.job  =  'doctor'	network_2
SELECT T2.friend FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T2.name  =  'Alice' AND T1.gender  =  'male' AND T1.job  =  'doctor'	network_2
SELECT DISTINCT p1.name FROM person AS p1 INNER JOIN personfriend AS pf ON p1.name = pf.name INNER JOIN person AS p2 ON pf.friend = p2.name WHERE p2.city = 'new york city'	network_2
SELECT T2.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T1.city  =  'new york city'	network_2
SELECT DISTINCT T2.name FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T1.age  <  (SELECT avg(age) FROM person)	network_2
SELECT DISTINCT pf.friend FROM personfriend pf JOIN person p ON pf.friend = p.name WHERE p.age < (SELECT AVG(person.age) FROM person JOIN personfriend ON person.name = personfriend.friend)	network_2
SELECT DISTINCT pf.friend, p.age FROM personfriend pf, person p WHERE pf.friend = p.name AND p.age > (SELECT AVG(age) FROM person)	network_2
SELECT person.name, personfriend.friend, person.age FROM person INNER JOIN personfriend ON person.name = personfriend.name WHERE person.age > (SELECT AVG(age) FROM person)	network_2
SELECT friend FROM PersonFriend WHERE name =  'Zach' AND YEAR  =  (SELECT max(YEAR) FROM PersonFriend WHERE name =  'Zach')	network_2
SELECT friend FROM PersonFriend WHERE name =  'Zach' AND YEAR  =  (SELECT max(YEAR) FROM PersonFriend WHERE name =  'Zach')	network_2
SELECT T1.age FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T2.name =  'Zach' AND T2.year  =  (SELECT max(YEAR) FROM PersonFriend WHERE name =  'Zach')	network_2
SELECT T1.age FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend WHERE T2.name =  'Zach' AND T2.year  =  (SELECT max(YEAR) FROM PersonFriend WHERE name =  'Zach')	network_2
SELECT name FROM PersonFriend WHERE friend =  'Alice' AND YEAR  =  (SELECT min(YEAR) FROM PersonFriend WHERE friend =  'Alice')	network_2
SELECT name FROM PersonFriend WHERE friend =  'Alice' AND YEAR  =  (SELECT min(YEAR) FROM PersonFriend WHERE friend =  'Alice')	network_2
SELECT T1.name ,  T1.age ,  T1.job FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend =  'Alice' AND T2.year  =  (SELECT max(YEAR) FROM PersonFriend WHERE friend =  'Alice')	network_2
SELECT T1.name ,  T1.age ,  T1.job FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.name WHERE T2.friend =  'Alice' AND T2.year  =  (SELECT max(YEAR) FROM PersonFriend WHERE friend =  'Alice')	network_2
SELECT name FROM person EXCEPT SELECT name FROM PersonFriend	network_2
SELECT name FROM person EXCEPT SELECT name FROM PersonFriend	network_2
SELECT name FROM (SELECT personfriend.name, AVG(person.age) AS AvgAge FROM personfriend INNER JOIN person ON personfriend.friend = person.name GROUP BY personfriend.name) SUB WHERE SUB.AvgAge = (SELECT MAX(AvgAge) FROM (SELECT personfriend.name, AVG(person.age) AVGage FROM personfriend JOIN person ON personfriend.friend = person.name GROUP BY personfriend.name))	network_2
SELECT T2.name ,  avg(T1.age) FROM Person AS T1 JOIN PersonFriend AS T2 ON T1.name  =  T2.friend GROUP BY T2.name ORDER BY avg(T1.age) DESC LIMIT 1	network_2
SELECT COUNT(DISTINCT p1.name) FROM person p1 WHERE p1.name NOT IN (SELECT p2.name FROM person p2 JOIN personfriend pf ON pf.friend = p2.name WHERE p2.city = 'austin')	network_2
SELECT COUNT(*) FROM person WHERE city = 'austin' AND name NOT IN (SELECT name FROM personfriend)	network_2
SELECT DISTINCT pf2.friend FROM personfriend pf1 JOIN personfriend pf2 ON pf1.friend = pf2.name WHERE pf1.name = 'Alice'	network_2
SELECT DISTINCT pf2.friend FROM personfriend pf1 JOIN personfriend pf2 ON pf1.friend = pf2.name WHERE pf1.name = 'Alice'	network_2
SELECT count(*) FROM member	decoration_competition
SELECT Name FROM member ORDER BY Name ASC	decoration_competition
SELECT Name ,  Country FROM member	decoration_competition
SELECT Name FROM member WHERE Country  =  'United States' OR Country  =  'Canada'	decoration_competition
SELECT Country ,  COUNT(*) FROM member GROUP BY Country	decoration_competition
WITH CountryCounts AS (SELECT country, COUNT(*) AS count FROM member GROUP BY country) SELECT country FROM CountryCounts WHERE count = (SELECT MAX(count) FROM CountryCounts)	decoration_competition
SELECT Country FROM member GROUP BY Country HAVING COUNT(*)  >  2	decoration_competition
SELECT Leader_Name ,  College_Location FROM college	decoration_competition
SELECT T2.Name ,  T1.Name FROM college AS T1 JOIN member AS T2 ON T1.College_ID  =  T2.College_ID	decoration_competition
SELECT T2.Name ,  T1.College_Location FROM college AS T1 JOIN member AS T2 ON T1.College_ID  =  T2.College_ID ORDER BY T2.Name ASC	decoration_competition
SELECT DISTINCT T1.Leader_Name FROM college AS T1 JOIN member AS T2 ON T1.College_ID  =  T2.College_ID WHERE T2.Country  =  'Canada'	decoration_competition
SELECT T1.Name ,  T2.Decoration_Theme FROM member AS T1 JOIN round AS T2 ON T1.Member_ID  =  T2.Member_ID	decoration_competition
SELECT T1.Name FROM member AS T1 JOIN round AS T2 ON T1.Member_ID  =  T2.Member_ID WHERE T2.Rank_in_Round  >  3	decoration_competition
SELECT T1.Name FROM member AS T1 JOIN round AS T2 ON T1.Member_ID  =  T2.Member_ID ORDER BY Rank_in_Round ASC	decoration_competition
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM round)	decoration_competition
SELECT document_name ,  access_count FROM documents ORDER BY document_name	document_management
SELECT document_name ,  access_count FROM documents ORDER BY document_name	document_management
SELECT document_name, access_count FROM documents WHERE access_count = (SELECT MAX(access_count) FROM documents)	document_management
SELECT document_name, access_count FROM documents WHERE access_count = (SELECT MAX(access_count) FROM documents)	document_management
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  4	document_management
SELECT DISTINCT document_type_code FROM documents GROUP BY document_type_code HAVING COUNT(*) >= 4	document_management
SELECT SUM(access_count) FROM documents WHERE document_type_code = (SELECT document_type_code FROM documents GROUP BY document_type_code ORDER BY SUM(access_count) DESC LIMIT 1)	document_management
SELECT SUM(d.access_count) AS TotalAccess FROM documents d WHERE EXISTS (SELECT 1 FROM documents dt WHERE dt.document_type_code = d.document_type_code GROUP BY dt.document_type_code ORDER BY COUNT(*) DESC LIMIT 1)	document_management
SELECT avg(access_count) FROM documents	document_management
SELECT avg(access_count) FROM documents	document_management
SELECT ds.document_structure_description FROM document_structures ds WHERE EXISTS (SELECT 1 FROM documents d WHERE d.document_structure_code = ds.document_structure_code AND d.access_count = (SELECT MIN(access_count) FROM documents))	document_management
SELECT document_structure_description FROM document_structures WHERE document_structure_code IN (SELECT document_structure_code FROM documents WHERE access_count = (SELECT MIN(access_count) FROM documents))	document_management
SELECT document_type_code FROM documents WHERE document_name  =  'David CV'	document_management
SELECT document_type_code FROM documents WHERE document_name  =  'David CV'	document_management
SELECT document_name FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 3 INTERSECT SELECT document_name FROM documents GROUP BY document_structure_code ORDER BY count(*) DESC LIMIT 3	document_management
SELECT document_name FROM documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 3 INTERSECT SELECT document_name FROM documents GROUP BY document_structure_code ORDER BY count(*) DESC LIMIT 3	document_management
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING sum(access_count)  >  10000	document_management
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING SUM(access_count) <= 10000	document_management
SELECT t2.section_title FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code WHERE t1.document_name  =  'David CV'	document_management
SELECT t2.section_title FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code WHERE t1.document_name  =  'David CV'	document_management
SELECT document_name FROM documents WHERE document_code NOT IN (SELECT document_code FROM document_sections)	document_management
SELECT document_name FROM documents WHERE document_code NOT IN (SELECT document_code FROM document_sections)	document_management
SELECT distinct us.user_name, us.password FROM users us INNER JOIN (SELECT ux.role_code FROM users ux GROUP BY ux.role_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM users GROUP BY role_code) c)) r ON us.role_code = r.role_code	document_management
SELECT user_name ,  password FROM users GROUP BY role_code ORDER BY count(*) DESC LIMIT 1	document_management
SELECT AVG(access_count) FROM documents WHERE document_code IN (SELECT document_code FROM document_functional_areas WHERE functional_area_code IN (SELECT functional_area_code FROM functional_areas WHERE functional_area_description = 'Acknowledgement'))	document_management
SELECT AVG(access_count) FROM documents WHERE document_code IN (SELECT document_code FROM document_functional_areas WHERE functional_area_code IN (SELECT functional_area_code FROM functional_areas WHERE functional_area_description = 'Acknowledgement'))	document_management
SELECT document_name FROM documents EXCEPT SELECT t1.document_name FROM documents AS t1 JOIN document_sections AS t2 ON t1.document_code  =  t2.document_code JOIN document_sections_images AS t3 ON t2.section_id  =  t3.section_id	document_management
SELECT d.document_name FROM documents d WHERE NOT EXISTS (SELECT 1 FROM document_sections ds JOIN document_sections_images dsi ON ds.section_id = dsi.section_id WHERE ds.document_code = d.document_code)	document_management
SELECT d.document_name FROM documents d WHERE EXISTS (SELECT NULL FROM document_sections WHERE document_sections.document_code = d.document_code GROUP BY document_code HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM document_sections GROUP BY document_code) tmp))	document_management
SELECT d.document_name FROM documents d, (SELECT document_code FROM document_sections GROUP BY document_code HAVING COUNT(section_id) = (SELECT MAX(sub.cnt) FROM (SELECT COUNT(section_id) as cnt FROM document_sections GROUP BY document_code) sub)) ds WHERE d.document_code = ds.document_code	document_management
SELECT document_name FROM documents WHERE document_name LIKE '%CV%'	document_management
SELECT document_name FROM documents WHERE document_name LIKE '%CV%'	document_management
SELECT COUNT(*) FROM users WHERE user_login LIKE 'Y'	document_management
SELECT count(*) FROM users WHERE user_login  =  1	document_management
SELECT role_description FROM ROLES WHERE role_code  =  (SELECT role_code FROM users WHERE user_login  =  1 GROUP BY role_code ORDER BY count(*) DESC LIMIT 1)	document_management
SELECT role_description FROM ROLES WHERE role_code  =  (SELECT role_code FROM users WHERE user_login  =  1 GROUP BY role_code ORDER BY count(*) DESC LIMIT 1)	document_management
SELECT AVG(d.access_count) FROM documents d INNER JOIN ( SELECT document_structure_code FROM documents GROUP BY document_structure_code HAVING COUNT(document_code) = (SELECT MIN(count) FROM (SELECT COUNT(document_code) AS count FROM documents GROUP BY document_structure_code) min_count)) least_popular ON d.document_structure_code = least_popular.document_structure_code	document_management
SELECT AVG(documents.access_count) FROM documents INNER JOIN (SELECT document_structure_code FROM documents GROUP BY document_structure_code HAVING COUNT(*) = (SELECT MIN(C.cnt) FROM (SELECT COUNT(*) cnt FROM documents GROUP BY document_structure_code) AS C)) AS MinDSC ON documents.document_structure_code = MinDSC.document_structure_code	document_management
SELECT image_name ,  image_url FROM images ORDER BY image_name	document_management
SELECT image_name ,  image_url FROM images ORDER BY image_name	document_management
SELECT count(*) ,  role_code FROM users GROUP BY role_code	document_management
SELECT count(*) ,  role_code FROM users GROUP BY role_code	document_management
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  2	document_management
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING count(*)  >  2	document_management
SELECT count(*) FROM Companies	company_office
SELECT count(*) FROM Companies	company_office
SELECT name FROM Companies ORDER BY Market_Value_billion DESC	company_office
SELECT name FROM Companies ORDER BY Market_Value_billion DESC	company_office
SELECT name FROM Companies WHERE Headquarters != 'USA'	company_office
SELECT name FROM Companies WHERE Headquarters != 'USA'	company_office
SELECT name ,  Assets_billion FROM Companies ORDER BY name ASC	company_office
SELECT name ,  Assets_billion FROM Companies ORDER BY name ASC	company_office
SELECT avg(Profits_billion) FROM Companies	company_office
SELECT avg(Profits_billion) FROM Companies	company_office
SELECT max(Sales_billion) ,  min(Sales_billion) FROM Companies WHERE Industry != 'Banking'	company_office
SELECT max(Sales_billion) ,  min(Sales_billion) FROM Companies WHERE Industry != 'Banking'	company_office
SELECT count(DISTINCT Industry) FROM Companies	company_office
SELECT count(DISTINCT Industry) FROM Companies	company_office
SELECT name FROM buildings ORDER BY Height DESC	company_office
SELECT b.name FROM buildings b ORDER BY b.height DESC, b.name DESC	company_office
SELECT stories FROM buildings WHERE height = (SELECT MAX(height) FROM buildings)	company_office
SELECT stories FROM buildings WHERE height = (SELECT MAX(height) FROM buildings)	company_office
SELECT T3.name ,  T2.name FROM Office_locations AS T1 JOIN buildings AS T2 ON T1.building_id  =  T2.id JOIN Companies AS T3 ON T1.company_id  =  T3.id	company_office
SELECT T3.name ,  T2.name FROM Office_locations AS T1 JOIN buildings AS T2 ON T1.building_id  =  T2.id JOIN Companies AS T3 ON T1.company_id  =  T3.id	company_office
SELECT T2.name FROM Office_locations AS T1 JOIN buildings AS T2 ON T1.building_id  =  T2.id JOIN Companies AS T3 ON T1.company_id  =  T3.id GROUP BY T1.building_id HAVING COUNT(*)  >  1	company_office
SELECT T2.name FROM Office_locations AS T1 JOIN buildings AS T2 ON T1.building_id  =  T2.id JOIN Companies AS T3 ON T1.company_id  =  T3.id GROUP BY T1.building_id HAVING COUNT(*)  >  1	company_office
SELECT T2.name FROM Office_locations AS T1 JOIN buildings AS T2 ON T1.building_id  =  T2.id JOIN Companies AS T3 ON T1.company_id  =  T3.id GROUP BY T1.building_id ORDER BY COUNT(*) DESC LIMIT 1	company_office
SELECT b.name FROM buildings b, office_locations ol WHERE b.id = ol.building_id GROUP BY b.id HAVING COUNT(ol.company_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(company_id) AS Cnt FROM office_locations GROUP BY building_id) T)	company_office
SELECT name FROM buildings WHERE Status  =  'on-hold' ORDER BY Stories ASC	company_office
SELECT name FROM buildings WHERE buildings.status = 'on-hold' GROUP BY id, name ORDER BY stories ASC	company_office
SELECT Industry ,  COUNT(*) FROM Companies GROUP BY Industry	company_office
SELECT Industry ,  COUNT(*) FROM Companies GROUP BY Industry	company_office
SELECT Industry FROM Companies GROUP BY Industry ORDER BY COUNT(*) DESC	company_office
SELECT industry, COUNT(id) AS company_count FROM companies GROUP BY industry ORDER BY company_count DESC	company_office
SELECT industry FROM companies GROUP BY industry HAVING COUNT(*) = (SELECT MAX(c1) FROM (SELECT COUNT(*) AS c1 FROM companies GROUP BY industry))	company_office
WITH CountedIndustries AS (SELECT industry, COUNT(*) AS TotalCompanies FROM companies GROUP BY industry) SELECT industry FROM CountedIndustries WHERE TotalCompanies = (SELECT MAX(TotalCompanies) FROM CountedIndustries)	company_office
SELECT name FROM buildings WHERE id NOT IN (SELECT building_id FROM Office_locations)	company_office
SELECT name FROM buildings WHERE id NOT IN (SELECT building_id FROM Office_locations)	company_office
SELECT Industry FROM Companies WHERE Headquarters  =  'USA' INTERSECT SELECT Industry FROM Companies WHERE Headquarters  =  'China'	company_office
SELECT Industry FROM Companies WHERE Headquarters  =  'USA' INTERSECT SELECT Industry FROM Companies WHERE Headquarters  =  'China'	company_office
SELECT count(*) FROM Companies WHERE Industry  =  'Banking' OR Industry  =  'Conglomerate'	company_office
SELECT count(*) FROM Companies WHERE Industry  =  'Banking' OR Industry  =  'Conglomerate'	company_office
SELECT Headquarters FROM Companies GROUP BY Headquarters HAVING COUNT(*)  >  2	company_office
SELECT Headquarters FROM Companies GROUP BY Headquarters HAVING COUNT(*)  >  2	company_office
SELECT count(*) FROM Products	solvency_ii
SELECT Product_Name FROM Products ORDER BY Product_Price ASC	solvency_ii
SELECT Product_Name ,  Product_Type_Code FROM Products	solvency_ii
SELECT Product_Price FROM Products WHERE Product_Name  =  'Dining' OR Product_Name  =  'Trading Policy'	solvency_ii
SELECT avg(Product_Price) FROM Products	solvency_ii
SELECT product_name FROM products WHERE product_price = (SELECT MAX(product_price) FROM products)	solvency_ii
SELECT Product_Type_Code ,  COUNT(*) FROM Products GROUP BY Product_Type_Code	solvency_ii
SELECT Product_Type_Code FROM Products GROUP BY Product_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	solvency_ii
SELECT Product_Type_Code FROM Products GROUP BY Product_Type_Code HAVING COUNT(*)  >=  2	solvency_ii
SELECT Product_Type_Code FROM Products WHERE Product_Price  >  4500 INTERSECT SELECT Product_Type_Code FROM Products WHERE Product_Price  <  3000	solvency_ii
SELECT tblP.product_name, COALESCE(tblEv.EventCount, 0) AS NumberOfEvents FROM products tblP LEFT JOIN (SELECT product_id, COUNT(event_id) AS EventCount FROM products_in_events GROUP BY product_id) tblEv ON tblP.product_id = tblEv.product_id	solvency_ii
SELECT product_name, (SELECT COUNT(DISTINCT event_id) FROM products_in_events WHERE product_id = products.product_id) AS event_total FROM products ORDER BY event_total DESC	solvency_ii
SELECT T1.Product_Name FROM Products AS T1 JOIN Products_in_Events AS T2 ON T1.Product_ID  =  T2.Product_ID GROUP BY T1.Product_Name HAVING COUNT(*)  >=  2	solvency_ii
SELECT T1.Product_Name FROM Products AS T1 JOIN Products_in_Events AS T2 ON T1.Product_ID  =  T2.Product_ID GROUP BY T1.Product_Name HAVING COUNT(*)  >=  2 ORDER BY T1.Product_Name	solvency_ii
SELECT Product_Name FROM Products WHERE Product_ID NOT IN (SELECT Product_ID FROM Products_in_Events)	solvency_ii
SELECT count(*) FROM artwork	entertainment_awards
SELECT Name FROM artwork ORDER BY Name ASC	entertainment_awards
SELECT Name FROM artwork WHERE TYPE != 'Program Talent Show'	entertainment_awards
SELECT Festival_Name ,  LOCATION FROM festival_detail	entertainment_awards
SELECT Chair_Name FROM festival_detail ORDER BY YEAR ASC	entertainment_awards
SELECT location FROM festival_detail WHERE num_of_audience = (SELECT MAX(num_of_audience) FROM festival_detail);	entertainment_awards
SELECT Festival_Name FROM festival_detail WHERE YEAR  =  2007	entertainment_awards
SELECT avg(Num_of_Audience) FROM festival_detail	entertainment_awards
SELECT Festival_Name FROM festival_detail ORDER BY YEAR DESC LIMIT 3	entertainment_awards
SELECT T2.Name ,  T3.Festival_Name FROM nomination AS T1 JOIN artwork AS T2 ON T1.Artwork_ID  =  T2.Artwork_ID JOIN festival_detail AS T3 ON T1.Festival_ID  =  T3.Festival_ID	entertainment_awards
SELECT DISTINCT T2.Type FROM nomination AS T1 JOIN artwork AS T2 ON T1.Artwork_ID  =  T2.Artwork_ID JOIN festival_detail AS T3 ON T1.Festival_ID  =  T3.Festival_ID WHERE T3.Year  =  2007	entertainment_awards
SELECT T2.Name FROM nomination AS T1 JOIN artwork AS T2 ON T1.Artwork_ID  =  T2.Artwork_ID JOIN festival_detail AS T3 ON T1.Festival_ID  =  T3.Festival_ID ORDER BY T3.Year	entertainment_awards
SELECT festival_name FROM festival_detail WHERE festival_id IN (SELECT festival_id FROM nomination WHERE artwork_id IN (SELECT artwork_id FROM artwork WHERE type = 'Program Talent Show'))	entertainment_awards
SELECT T1.Festival_ID ,  T3.Festival_Name FROM nomination AS T1 JOIN artwork AS T2 ON T1.Artwork_ID  =  T2.Artwork_ID JOIN festival_detail AS T3 ON T1.Festival_ID  =  T3.Festival_ID GROUP BY T1.Festival_ID HAVING COUNT(*)  >=  2	entertainment_awards
SELECT fd.festival_id, fd.festival_name, (SELECT COUNT(*) FROM nomination WHERE nomination.festival_id = fd.festival_id) AS total_nominated FROM festival_detail fd	entertainment_awards
SELECT TYPE ,  COUNT(*) FROM artwork GROUP BY TYPE	entertainment_awards
SELECT type FROM artwork GROUP BY type HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM artwork GROUP BY type))	entertainment_awards
SELECT YEAR FROM festival_detail GROUP BY YEAR HAVING COUNT(*)  >  1	entertainment_awards
SELECT Name FROM Artwork WHERE Artwork_ID NOT IN (SELECT Artwork_ID FROM nomination)	entertainment_awards
SELECT total(num_of_audience) FROM festival_detail WHERE year IN (2008, 2010)	entertainment_awards
SELECT sum(Num_of_Audience) FROM festival_detail	entertainment_awards
SELECT fd.year FROM festival_detail fd WHERE fd.location = 'United Catalysts' AND EXISTS (SELECT 1 FROM festival_detail fd2 WHERE fd2.year = fd.year AND fd2.location != 'United Algorithms')	entertainment_awards
SELECT count(*) FROM premises	customers_campaigns_ecommerce
SELECT DISTINCT premises_type FROM premises	customers_campaigns_ecommerce
SELECT premises_type ,  premise_details FROM premises ORDER BY premises_type	customers_campaigns_ecommerce
SELECT premises_type ,  count(*) FROM premises GROUP BY premises_type	customers_campaigns_ecommerce
SELECT p.product_category, (SELECT COUNT(*) FROM mailshot_campaigns m WHERE m.product_category = p.product_category) AS num_mailshots FROM products p GROUP BY p.product_category	customers_campaigns_ecommerce
SELECT customer_name ,  customer_phone FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM mailshot_customers)	customers_campaigns_ecommerce
SELECT T1.customer_name ,  T1.customer_phone FROM customers AS T1 JOIN mailshot_customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.outcome_code  =  'No Response'	customers_campaigns_ecommerce
SELECT outcome_code ,  count(*) FROM mailshot_customers GROUP BY outcome_code	customers_campaigns_ecommerce
SELECT T2.customer_name FROM mailshot_customers AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE outcome_code  =  'Order' GROUP BY T1.customer_id HAVING count(*)  >=  2	customers_campaigns_ecommerce
WITH MailshotCounts AS (SELECT customer_id, COUNT(mailshot_id) AS NumOfMailshots FROM mailshot_customers GROUP BY customer_id) SELECT c.customer_name FROM customers c JOIN MailshotCounts mc ON c.customer_id = mc.customer_id WHERE mc.NumOfMailshots = (SELECT MAX(NumOfMailshots) FROM MailshotCounts)	customers_campaigns_ecommerce
SELECT customer_name, payment_method FROM customers WHERE customer_id IN (SELECT customer_id FROM mailshot_customers WHERE outcome_code = 'Order') AND customer_id IN (SELECT customer_id FROM mailshot_customers WHERE outcome_code = 'No Response')	customers_campaigns_ecommerce
SELECT T2.premises_type ,  T1.address_type_code FROM customer_addresses AS T1 JOIN premises AS T2 ON T1.premise_id  =  T2.premise_id	customers_campaigns_ecommerce
SELECT DISTINCT address_type_code FROM customer_addresses	customers_campaigns_ecommerce
SELECT order_shipping_charges ,  customer_id FROM customer_orders WHERE order_status_code  =  'Cancelled' OR order_status_code  =  'Paid'	customers_campaigns_ecommerce
SELECT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE shipping_method_code  =  'FedEx' AND order_status_code  =  'Paid'	customers_campaigns_ecommerce
SELECT count(*) FROM COURSE	college_3
SELECT count(*) FROM COURSE	college_3
SELECT count(*) FROM COURSE WHERE Credits  >  2	college_3
SELECT count(*) FROM COURSE WHERE Credits  >  2	college_3
SELECT CName FROM COURSE WHERE Credits  =  1	college_3
SELECT CName FROM COURSE WHERE Credits  =  1	college_3
SELECT CName FROM COURSE WHERE Days  =  'MTW'	college_3
SELECT CName FROM COURSE WHERE Days  =  'MTW'	college_3
SELECT count(*) FROM DEPARTMENT WHERE Division  =  'AS'	college_3
SELECT count(*) FROM DEPARTMENT WHERE Division  =  'AS'	college_3
SELECT DPhone FROM DEPARTMENT WHERE Room  =  268	college_3
SELECT DPhone FROM DEPARTMENT WHERE Room  =  268	college_3
SELECT COUNT(DISTINCT StuID) FROM ENROLLED_IN WHERE Grade  =  'B'	college_3
SELECT COUNT(DISTINCT StuID) FROM ENROLLED_IN WHERE Grade  =  'B'	college_3
SELECT max(gradepoint) ,  min(gradepoint) FROM GRADECONVERSION	college_3
SELECT max(gradepoint) ,  min(gradepoint) FROM GRADECONVERSION	college_3
SELECT fname FROM student WHERE fname LIKE '%a%'	college_3
SELECT fname FROM student WHERE fname LIKE '%a%'	college_3
SELECT Fname ,  Lname FROM FACULTY WHERE sex  =  'M' AND Building  =  'NEB'	college_3
SELECT fname || ' ' || lname FROM faculty WHERE sex = 'M' AND building = 'NEB';	college_3
SELECT Room FROM FACULTY WHERE Rank  =  'Professor' AND Building  =  'NEB'	college_3
SELECT Room FROM FACULTY WHERE Rank  =  'Professor' AND Building  =  'NEB'	college_3
SELECT DName FROM DEPARTMENT WHERE Building  =  'Mergenthaler'	college_3
SELECT DName FROM DEPARTMENT WHERE Building  =  'Mergenthaler'	college_3
SELECT * FROM COURSE ORDER BY Credits	college_3
SELECT * FROM COURSE ORDER BY Credits	college_3
SELECT CName FROM COURSE ORDER BY Credits	college_3
SELECT CName FROM COURSE ORDER BY Credits	college_3
SELECT Fname FROM STUDENT ORDER BY Age DESC	college_3
SELECT Fname FROM STUDENT ORDER BY Age DESC	college_3
SELECT LName FROM STUDENT WHERE Sex  =  'F' ORDER BY Age DESC	college_3
SELECT LName FROM STUDENT WHERE Sex  =  'F' ORDER BY Age DESC	college_3
SELECT Lname FROM FACULTY WHERE Building  =  'Barton' ORDER BY Lname	college_3
SELECT Lname FROM FACULTY WHERE Building  =  'Barton' ORDER BY Lname	college_3
SELECT Fname FROM FACULTY WHERE Rank  =  'Professor' ORDER BY Fname	college_3
SELECT Fname FROM FACULTY WHERE Rank  =  'Professor' ORDER BY Fname	college_3
SELECT d.dname FROM department AS d INNER JOIN minor_in AS m ON d.dno = m.dno GROUP BY d.dname HAVING COUNT(m.stuid) = (SELECT MAX(count) FROM (SELECT COUNT(stuid) AS count FROM minor_in GROUP BY dno))	college_3
SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MINOR_IN AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) DESC LIMIT 1	college_3
SELECT dname FROM department WHERE dno NOT IN (SELECT dno FROM minor_in)	college_3
SELECT dname FROM department WHERE dno NOT IN (SELECT dno FROM minor_in)	college_3
SELECT dname FROM (SELECT d.dname, COUNT(m.facid) AS member_count FROM department d LEFT JOIN member_of m ON d.dno = m.dno GROUP BY d.dno) sub_query ORDER BY sub_query.member_count ASC LIMIT 1	college_3
SELECT T1.DName FROM DEPARTMENT AS T1 JOIN MEMBER_OF AS T2 ON T1.DNO  =  T2.DNO GROUP BY T2.DNO ORDER BY count(*) ASC LIMIT 1	college_3
SELECT Rank FROM FACULTY GROUP BY Rank ORDER BY count(*) ASC LIMIT 1	college_3
SELECT Rank FROM FACULTY GROUP BY Rank ORDER BY count(*) ASC LIMIT 1	college_3
SELECT fname, lname FROM faculty WHERE facid IN (SELECT instructor FROM course GROUP BY instructor ORDER BY COUNT(*) DESC LIMIT 3)	college_3
SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 3	college_3
SELECT T2.Building FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID GROUP BY T1.Instructor ORDER BY count(*) DESC LIMIT 1	college_3
SELECT building FROM faculty WHERE facid IN (SELECT instructor FROM course GROUP BY instructor HAVING COUNT(cid) = (SELECT MAX(counts) FROM (SELECT COUNT(cid) as counts FROM course GROUP BY instructor)))	college_3
SELECT T1.CName FROM COURSE AS T1 JOIN ENROLLED_IN AS T2 ON T1.CID  =  T2.CID GROUP BY T2.CID HAVING COUNT(*)  >=  5	college_3
SELECT T1.CName FROM COURSE AS T1 JOIN ENROLLED_IN AS T2 ON T1.CID  =  T2.CID GROUP BY T2.CID HAVING COUNT(*)  >=  5	college_3
SELECT f.fname, f.lname FROM faculty f JOIN course c ON f.facid = c.instructor	college_3
SELECT T2.Fname ,  T2.Lname FROM COURSE AS T1 JOIN FACULTY AS T2 ON T1.Instructor  =  T2.FacID WHERE T1.CName  =  'COMPUTER LITERACY'	college_3
SELECT T2.Dname ,  T2.Room FROM COURSE AS T1 JOIN DEPARTMENT AS T2 ON T1.DNO  =  T2.DNO WHERE T1.CName  =  'INTRODUCTION TO COMPUTER SCIENCE'	college_3
SELECT T2.Dname ,  T2.Room FROM COURSE AS T1 JOIN DEPARTMENT AS T2 ON T1.DNO  =  T2.DNO WHERE T1.CName  =  'INTRODUCTION TO COMPUTER SCIENCE'	college_3
SELECT T3.Fname ,  T3.LName ,  T2.gradepoint FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID	college_3
SELECT s.fname || ' ' || s.lname AS fullname, gc.gradepoint FROM enrolled_in e JOIN student s ON s.stuid = e.stuid JOIN gradeconversion gc ON gc.lettergrade = e.grade	college_3
SELECT DISTINCT T3.Fname FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T2.gradepoint  >=  3.8	college_3
SELECT DISTINCT T3.Fname FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T2.gradepoint  >=  3.8	college_3
SELECT F.fname || ' ' || F.lname FROM faculty F JOIN member_of M ON F.facid = M.facid WHERE M.dno = 520	college_3
SELECT fname || ' ' || lname FROM faculty WHERE facid IN (SELECT facid FROM member_of WHERE dno = 520)	college_3
SELECT T2.Fname ,  T2.Lname FROM MINOR_IN AS T1 JOIN STUDENT AS T2 ON T1.StuID  =  T2.StuID WHERE T1.DNO  =  140	college_3
SELECT fname || ' ' || lname AS full_name FROM student WHERE stuid IN (SELECT stuid FROM minor_in WHERE dno = 140)	college_3
SELECT T2.Lname FROM DEPARTMENT AS T1 JOIN FACULTY AS T2 ON T1.DNO  =  T3.DNO JOIN MEMBER_OF AS T3 ON T2.FacID  =  T3.FacID WHERE T1.DName  =  'Computer Science'	college_3
SELECT T2.Lname FROM DEPARTMENT AS T1 JOIN FACULTY AS T2 ON T1.DNO  =  T3.DNO JOIN MEMBER_OF AS T3 ON T2.FacID  =  T3.FacID WHERE T1.DName  =  'Computer Science'	college_3
SELECT AVG(gradepoint) FROM gradeconversion WHERE lettergrade IN (SELECT grade FROM enrolled_in WHERE stuid IN (SELECT stuid FROM student WHERE lname = 'Smith'))	college_3
SELECT avg(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.LName  =  'Smith'	college_3
SELECT max(T2.gradepoint) ,  min(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.city_code  =  'NYC'	college_3
SELECT max(T2.gradepoint) ,  min(T2.gradepoint) FROM ENROLLED_IN AS T1 JOIN GRADECONVERSION AS T2 JOIN STUDENT AS T3 ON T1.Grade  =  T2.lettergrade AND T1.StuID  =  T3.StuID WHERE T3.city_code  =  'NYC'	college_3
SELECT CName FROM COURSE WHERE Credits  =  3 UNION SELECT CName FROM COURSE WHERE Credits  =  1 AND Hours  =  4	college_3
SELECT cname FROM course WHERE credits = 3 OR (credits = 1 AND hours = 4)	college_3
SELECT dname FROM department WHERE (division = 'AS' OR division = 'EN') AND building = 'NEB'	college_3
SELECT dname FROM department WHERE division = 'AS' OR (division = 'EN' AND building = 'NEB')	college_3
SELECT Fname FROM STUDENT WHERE StuID NOT IN (SELECT StuID FROM ENROLLED_IN)	college_3
SELECT Fname FROM STUDENT WHERE StuID NOT IN (SELECT StuID FROM ENROLLED_IN)	college_3
SELECT product_id FROM product_suppliers ORDER BY total_amount_purchased DESC LIMIT 3	department_store
SELECT DISTINCT product_id FROM (SELECT product_id FROM product_suppliers ORDER BY total_amount_purchased DESC LIMIT 3)	department_store
SELECT product_id, product_type_code FROM products WHERE product_price = (SELECT MIN(product_price) FROM products);	department_store
SELECT product_id, product_type_code FROM products WHERE product_price = (SELECT MIN(product_price) FROM products)	department_store
SELECT count(DISTINCT product_type_code) FROM products	department_store
SELECT count(DISTINCT product_type_code) FROM products	department_store
SELECT T1.address_details FROM addresses AS T1 JOIN customer_addresses AS T2 ON T1.address_id  =  T2.address_id WHERE T2.customer_id  =  10	department_store
SELECT T1.address_details FROM addresses AS T1 JOIN customer_addresses AS T2 ON T1.address_id  =  T2.address_id WHERE T2.customer_id  =  10	department_store
SELECT staff_id, staff_gender FROM staff WHERE staff_id IN (SELECT staff_id FROM staff_department_assignments WHERE job_title_code = 'Department Manager')	department_store
SELECT DISTINCT s.staff_id, s.staff_gender FROM staff s, staff_department_assignments a WHERE s.staff_id = a.staff_id AND a.job_title_code = 'Department Manager'	department_store
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code	department_store
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code	department_store
SELECT product_id FROM order_items GROUP BY product_id HAVING COUNT(product_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(product_id) as cnt FROM order_items GROUP BY product_id) tmp)	department_store
SELECT product_id FROM order_items GROUP BY product_id ORDER BY count(*) DESC LIMIT 1	department_store
SELECT customer_name, customer_phone, customer_email FROM customers WHERE EXISTS (SELECT customer_id FROM customer_orders WHERE customer_orders.customer_id = customers.customer_id GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1)	department_store
SELECT names.customer_name, names.customer_phone, names.customer_email FROM customers names JOIN customer_orders orders ON names.customer_id = orders.customer_id GROUP BY names.customer_id HAVING COUNT(orders.order_id) = (SELECT MAX(order_count) FROM (SELECT customer_id, COUNT(order_id) AS order_count FROM customer_orders GROUP BY customer_id) temp)	department_store
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code	department_store
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code	department_store
SELECT count(*) FROM department_stores AS T1 JOIN department_store_chain AS T2 ON T1.dept_store_chain_id  =  T2.dept_store_chain_id WHERE T2.dept_store_chain_name  =  'South'	department_store
SELECT count(*) FROM department_stores AS T1 JOIN department_store_chain AS T2 ON T1.dept_store_chain_id  =  T2.dept_store_chain_id WHERE T2.dept_store_chain_name  =  'South'	department_store
SELECT staff.staff_name, staff_department_assignments.job_title_code FROM staff, staff_department_assignments WHERE staff.staff_id = staff_department_assignments.staff_id AND staff_department_assignments.date_assigned_from = (SELECT MAX(date_assigned_from) FROM staff_department_assignments LIMIT 1)	department_store
SELECT staff_name, job_title_code FROM staff JOIN (SELECT staff_id, job_title_code FROM staff_department_assignments WHERE date_assigned_from = (SELECT MAX(date_assigned_from) FROM staff_department_assignments WHERE staff_id = staff_department_assignments.staff_id)) AS latest_assign ON staff.staff_id = latest_assign.staff_id	department_store
SELECT T2.product_type_code ,  T2.product_name ,  T2.product_price FROM product_suppliers AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T1.supplier_id  =  3	department_store
SELECT T2.product_type_code ,  T2.product_name ,  T2.product_price FROM product_suppliers AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T1.supplier_id  =  3	department_store
SELECT DISTINCT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_orders WHERE order_status_code = 'Pending') ORDER BY customer_id	department_store
SELECT DISTINCT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_orders WHERE order_status_code = 'Pending') ORDER BY customer_id	department_store
SELECT c.customer_name, c.customer_address FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id WHERE co.order_status_code IN ('New', 'Pending') GROUP BY c.customer_id HAVING COUNT(DISTINCT co.order_status_code) = 2	department_store
SELECT T1.customer_name ,  T1.customer_address FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.order_status_code  =  'New' INTERSECT SELECT T1.customer_name ,  T1.customer_address FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.order_status_code  =  'Pending'	department_store
SELECT T1.product_id FROM product_suppliers AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T1.supplier_id  =  2 AND T2.product_price  >  (SELECT avg(product_price) FROM products)	department_store
SELECT T1.product_id FROM product_suppliers AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T1.supplier_id  =  2 AND T2.product_price  >  (SELECT avg(product_price) FROM products)	department_store
SELECT T2.dept_store_id ,  T2.store_name FROM departments AS T1 JOIN department_stores AS T2 ON T1.dept_store_id  =  T2.dept_store_id WHERE T1.department_name  =  'marketing' INTERSECT SELECT T2.dept_store_id ,  T2.store_name FROM departments AS T1 JOIN department_stores AS T2 ON T1.dept_store_id  =  T2.dept_store_id WHERE T1.department_name  =  'managing'	department_store
SELECT T2.dept_store_id ,  T2.store_name FROM departments AS T1 JOIN department_stores AS T2 ON T1.dept_store_id  =  T2.dept_store_id WHERE T1.department_name  =  'marketing' INTERSECT SELECT T2.dept_store_id ,  T2.store_name FROM departments AS T1 JOIN department_stores AS T2 ON T1.dept_store_id  =  T2.dept_store_id WHERE T1.department_name  =  'managing'	department_store
SELECT dept_store_chain_id FROM department_stores GROUP BY dept_store_chain_id ORDER BY count(*) DESC LIMIT 2	department_store
WITH StoreCounts AS (SELECT dept_store_chain_id, COUNT(dept_store_id) AS num_stores FROM department_stores GROUP BY dept_store_chain_id) SELECT dept_store_chain_id FROM StoreCounts ORDER BY num_stores DESC LIMIT 2	department_store
SELECT department_id FROM staff_department_assignments GROUP BY department_id ORDER BY count(*) LIMIT 1	department_store
SELECT d.department_id FROM departments d LEFT JOIN staff_department_assignments sda ON d.department_id = sda.department_id GROUP BY d.department_id ORDER BY COUNT(sda.staff_id) ASC LIMIT 1	department_store
SELECT product_type_code ,  max(product_price) ,  min(product_price) FROM products GROUP BY product_type_code	department_store
SELECT product_type_code ,  max(product_price) ,  min(product_price) FROM products GROUP BY product_type_code	department_store
SELECT product_type_code FROM products GROUP BY product_type_code HAVING avg(product_price)  >  (SELECT avg(product_price) FROM products)	department_store
SELECT product_type_code FROM products GROUP BY product_type_code HAVING avg(product_price)  >  (SELECT avg(product_price) FROM products)	department_store
SELECT staff.staff_id, staff.staff_name FROM staff, staff_department_assignments WHERE staff.staff_id = staff_department_assignments.staff_id GROUP BY staff.staff_id, staff.staff_name ORDER BY julianday(MAX(staff_department_assignments.date_assigned_to)) - julianday(MIN(staff_department_assignments.date_assigned_from)) ASC LIMIT 1	department_store
SELECT s.staff_id, s.staff_name FROM staff s JOIN staff_department_assignments sda ON s.staff_id = sda.staff_id GROUP BY s.staff_id, s.staff_name ORDER BY SUM(julianday(sda.date_assigned_to) - julianday(sda.date_assigned_from)) ASC LIMIT 1	department_store
SELECT product_name ,  product_id FROM products WHERE product_price BETWEEN 600 AND 700	department_store
SELECT product_name ,  product_id FROM products WHERE product_price BETWEEN 600 AND 700	department_store
SELECT DISTINCT c1.customer_id FROM customers c1 WHERE EXISTS (SELECT 1 FROM customer_orders co1 WHERE co1.customer_id = c1.customer_id AND co1.order_date > (SELECT MAX(co2.order_date) FROM customer_orders co2 WHERE co2.order_status_code = 'Cancelled'))	department_store
SELECT DISTINCT c.customer_id FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id WHERE co.order_date > (SELECT MAX(order_date) FROM customer_orders WHERE order_status_code = 'Cancelled')	department_store
SELECT staff_id FROM Staff_Department_Assignments WHERE date_assigned_to  <  (SELECT max(date_assigned_to) FROM Staff_Department_Assignments WHERE job_title_code  =  'Clerical Staff')	department_store
SELECT DISTINCT s.staff_id FROM staff s JOIN staff_department_assignments sda ON s.staff_id = sda.staff_id WHERE sda.date_assigned_from < (SELECT MIN(sda2.date_assigned_from) FROM staff_department_assignments sda2 WHERE sda2.job_title_code = 'Clerical Staff')	department_store
SELECT customer_name ,  customer_id FROM customers WHERE customer_address LIKE '%TN%'	department_store
SELECT customer_name ,  customer_id FROM customers WHERE customer_address LIKE '%TN%'	department_store
SELECT T1.staff_name ,  T1.staff_gender FROM staff AS T1 JOIN staff_department_assignments AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.date_assigned_from LIKE '2016%'	department_store
SELECT T1.staff_name ,  T1.staff_gender FROM staff AS T1 JOIN staff_department_assignments AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.date_assigned_from LIKE '2016%'	department_store
SELECT T1.staff_name FROM staff AS T1 JOIN staff_department_assignments AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T2.staff_id HAVING COUNT (*)  >  1	department_store
SELECT T1.staff_name FROM staff AS T1 JOIN staff_department_assignments AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T2.staff_id HAVING COUNT (*)  >  1	department_store
SELECT T1.supplier_name ,  T1.supplier_phone FROM Suppliers AS T1 JOIN supplier_addresses AS T2 ON T1.supplier_id  =  T2.supplier_id JOIN addresses AS T3 ON T2.address_id  =  T3.address_id ORDER BY T3.address_details	department_store
SELECT T1.supplier_name ,  T1.supplier_phone FROM Suppliers AS T1 JOIN supplier_addresses AS T2 ON T1.supplier_id  =  T2.supplier_id JOIN addresses AS T3 ON T2.address_id  =  T3.address_id ORDER BY T3.address_details	department_store
SELECT customer_phone FROM customers UNION ALL SELECT supplier_phone FROM suppliers WHERE supplier_phone NOT IN (SELECT customer_phone FROM customers)	department_store
SELECT customer_phone AS phone FROM customers UNION ALL SELECT supplier_phone AS phone FROM suppliers	department_store
SELECT product_id FROM Order_Items GROUP BY product_id HAVING count(*)  >  3 UNION SELECT product_id FROM Product_Suppliers GROUP BY product_id HAVING sum(total_amount_purchased)  >  80000	department_store
SELECT product_id FROM Order_Items GROUP BY product_id HAVING count(*)  >  3 UNION SELECT product_id FROM Product_Suppliers GROUP BY product_id HAVING sum(total_amount_purchased)  >  80000	department_store
SELECT product_id ,  product_name FROM products WHERE product_price  <  600 OR product_price  >  900	department_store
SELECT product_id ,  product_name FROM products WHERE product_price  <  600 OR product_price  >  900	department_store
SELECT supplier_id FROM product_suppliers GROUP BY supplier_id, product_id HAVING AVG(total_amount_purchased) > 50000 UNION SELECT supplier_id FROM product_suppliers GROUP BY supplier_id, product_id HAVING AVG(total_amount_purchased) < 30000	department_store
SELECT supplier_id FROM Product_Suppliers GROUP BY supplier_id HAVING avg(total_amount_purchased)  >  50000 OR avg(total_amount_purchased)  <  30000	department_store
SELECT avg(total_amount_purchased) ,  avg(total_value_purchased) FROM Product_Suppliers WHERE supplier_id  =  (SELECT supplier_id FROM Product_Suppliers GROUP BY supplier_id ORDER BY count(*) DESC LIMIT 1)	department_store
SELECT avg(total_amount_purchased) ,  avg(total_value_purchased) FROM Product_Suppliers WHERE supplier_id  =  (SELECT supplier_id FROM Product_Suppliers GROUP BY supplier_id ORDER BY count(*) DESC LIMIT 1)	department_store
SELECT max(customer_code) ,  min(customer_code) FROM Customers	department_store
SELECT max(customer_code) ,  min(customer_code) FROM Customers	department_store
SELECT DISTINCT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id WHERE T4.product_name  =  'keyboard'	department_store
SELECT DISTINCT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id WHERE T4.product_name  =  'keyboard'	department_store
SELECT DISTINCT T1.supplier_name ,  T1.supplier_phone FROM suppliers AS T1 JOIN product_suppliers AS T2 ON T1.supplier_id  =  T2.supplier_id JOIN products AS T3 ON T2.product_id  =  T3.product_id WHERE T3.product_name  =  'red jeans'	department_store
SELECT DISTINCT T1.supplier_name ,  T1.supplier_phone FROM suppliers AS T1 JOIN product_suppliers AS T2 ON T1.supplier_id  =  T2.supplier_id JOIN products AS T3 ON T2.product_id  =  T3.product_id WHERE T3.product_name  =  'red jeans'	department_store
SELECT max(product_price) ,  min(product_price) ,  product_type_code FROM products GROUP BY product_type_code ORDER BY product_type_code	department_store
SELECT max(product_price) ,  min(product_price) ,  product_type_code FROM products GROUP BY product_type_code ORDER BY product_type_code	department_store
SELECT order_id ,  customer_id FROM customer_orders WHERE order_status_code  =   'Cancelled' ORDER BY order_date	department_store
SELECT order_id ,  customer_id FROM customer_orders WHERE order_status_code  =   'Cancelled' ORDER BY order_date	department_store
SELECT product_name FROM products WHERE product_id IN (SELECT product_id FROM order_items INNER JOIN customer_orders ON order_items.order_id = customer_orders.order_id GROUP BY product_id HAVING COUNT(DISTINCT customer_id) > 1)	department_store
SELECT DISTINCT T3.product_name FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T3.product_id HAVING COUNT (DISTINCT T1.customer_id)  >=  2	department_store
SELECT c.customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id WHERE co.customer_id = c.customer_id GROUP BY co.customer_id HAVING COUNT(DISTINCT oi.product_id) >= 3)	department_store
SELECT DISTINCT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING COUNT (DISTINCT T3.product_id)  >=  3	department_store
SELECT s.staff_name, s.staff_gender FROM staff s WHERE s.staff_id IN (SELECT sa.staff_id FROM staff_department_assignments sa WHERE sa.job_title_code = 'Sales Person') AND s.staff_id NOT IN (SELECT sa.staff_id FROM staff_department_assignments sa WHERE sa.job_title_code = 'Clerical Staff')	department_store
SELECT s.staff_name, s.staff_gender FROM staff s WHERE EXISTS (SELECT 1 FROM staff_department_assignments WHERE staff_id = s.staff_id AND job_title_code = 'Sales Person') AND NOT EXISTS (SELECT 1 FROM staff_department_assignments WHERE staff_id = s.staff_id AND job_title_code = 'Clerical Staff')	department_store
SELECT customer_id ,  customer_name FROM customers WHERE customer_address LIKE '%WY%' AND payment_method_code != 'Credit Card'	department_store
SELECT customer_id ,  customer_name FROM customers WHERE customer_address LIKE '%WY%' AND payment_method_code != 'Credit Card'	department_store
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'	department_store
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'	department_store
SELECT p.product_name FROM products p WHERE p.product_type_code = 'Hardware' AND p.product_price = (SELECT MAX(product_price) FROM products WHERE product_type_code = 'Hardware')	department_store
SELECT p.product_name FROM products p WHERE p.product_price = (SELECT MAX(product_price) FROM products WHERE product_type_code = 'Hardware') AND p.product_type_code = 'Hardware'	department_store
SELECT count(*) FROM aircraft	aircraft
SELECT count(*) FROM aircraft	aircraft
SELECT Description FROM aircraft	aircraft
SELECT Description FROM aircraft	aircraft
SELECT avg(International_Passengers) FROM airport	aircraft
SELECT avg(International_Passengers) FROM airport	aircraft
SELECT International_Passengers ,  Domestic_Passengers FROM airport WHERE Airport_Name  =  'London Heathrow'	aircraft
SELECT International_Passengers ,  Domestic_Passengers FROM airport WHERE Airport_Name  =  'London Heathrow'	aircraft
SELECT TOTAL(domestic_passengers) FROM airport WHERE airport_name LIKE '%London%'	aircraft
SELECT sum(Domestic_Passengers) FROM airport WHERE Airport_Name LIKE '%London%'	aircraft
SELECT max(Transit_Passengers) ,  min(Transit_Passengers) FROM airport	aircraft
SELECT max(Transit_Passengers) ,  min(Transit_Passengers) FROM airport	aircraft
SELECT Name FROM pilot WHERE Age  >=  25	aircraft
SELECT Name FROM pilot WHERE Age  >=  25	aircraft
SELECT Name FROM pilot ORDER BY Name ASC	aircraft
SELECT Name FROM pilot ORDER BY Name ASC	aircraft
SELECT Name FROM pilot WHERE Age  <=  30 ORDER BY Name DESC	aircraft
SELECT Name FROM pilot WHERE Age  <=  30 ORDER BY Name DESC	aircraft
SELECT T1.Aircraft FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Airport_Name  =  'London Gatwick'	aircraft
SELECT T1.Aircraft FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Airport_Name  =  'London Gatwick'	aircraft
SELECT T1.Aircraft ,  T1.Description FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Total_Passengers  >  10000000	aircraft
SELECT T1.Aircraft ,  T1.Description FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Total_Passengers  >  10000000	aircraft
SELECT AVG(total_passengers) FROM airport WHERE airport_id IN (SELECT airport_id FROM airport_aircraft WHERE aircraft_id IN (SELECT aircraft_id FROM aircraft WHERE aircraft = 'Robinson R-22'))	aircraft
SELECT avg(T3.Total_Passengers) FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T1.Aircraft  =  'Robinson R-22'	aircraft
SELECT T2.Location ,  T1.Aircraft FROM aircraft AS T1 JOIN MATCH AS T2 ON T1.Aircraft_ID  =  T2.Winning_Aircraft	aircraft
SELECT T2.Location ,  T1.Aircraft FROM aircraft AS T1 JOIN MATCH AS T2 ON T1.Aircraft_ID  =  T2.Winning_Aircraft	aircraft
SELECT ac.aircraft FROM aircraft ac INNER JOIN (SELECT winning_aircraft FROM match GROUP BY winning_aircraft HAVING COUNT(winning_aircraft) = (SELECT MAX(win_count) FROM (SELECT winning_aircraft, COUNT(*) AS win_count FROM match GROUP BY winning_aircraft) AS subquery)) AS most_wins ON most_wins.winning_aircraft = ac.aircraft_id	aircraft
SELECT first.aircraft FROM aircraft first WHERE (SELECT COUNT(*) FROM match wm WHERE wm.winning_aircraft = first.aircraft_id) = (SELECT MAX(win_count) FROM (SELECT COUNT(*) AS win_count FROM match GROUP BY winning_aircraft) tot)	aircraft
SELECT T1.Aircraft ,  COUNT(*) FROM aircraft AS T1 JOIN MATCH AS T2 ON T1.Aircraft_ID  =  T2.Winning_Aircraft GROUP BY T2.Winning_Aircraft	aircraft
SELECT T1.Aircraft ,  COUNT(*) FROM aircraft AS T1 JOIN MATCH AS T2 ON T1.Aircraft_ID  =  T2.Winning_Aircraft GROUP BY T2.Winning_Aircraft	aircraft
SELECT Name FROM pilot ORDER BY Age DESC	aircraft
SELECT Name FROM pilot ORDER BY Age DESC	aircraft
SELECT T1.Aircraft FROM aircraft AS T1 JOIN MATCH AS T2 ON T1.Aircraft_ID  =  T2.Winning_Aircraft GROUP BY T2.Winning_Aircraft HAVING COUNT(*)  >=  2	aircraft
SELECT DISTINCT a.aircraft FROM match m INNER JOIN aircraft a ON m.winning_aircraft = a.aircraft_id GROUP BY m.winning_aircraft HAVING COUNT(m.winning_aircraft) >= 2	aircraft
SELECT Aircraft FROM aircraft WHERE Aircraft_ID NOT IN (SELECT Winning_Aircraft FROM MATCH)	aircraft
SELECT Aircraft FROM aircraft WHERE Aircraft_ID NOT IN (SELECT Winning_Aircraft FROM MATCH)	aircraft
SELECT DISTINCT a.aircraft FROM aircraft a WHERE EXISTS (SELECT 1 FROM airport_aircraft aa INNER JOIN airport ap ON aa.airport_id = ap.airport_id WHERE ap.airport_name = 'London Heathrow' AND aa.aircraft_id = a.aircraft_id) AND EXISTS (SELECT 1 FROM airport_aircraft aa INNER JOIN airport ap ON aa.airport_id = ap.airport_id WHERE ap.airport_name = 'London Gatwick' AND aa.aircraft_id = a.aircraft_id)	aircraft
SELECT T1.Aircraft FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Airport_Name  =  'London Heathrow' INTERSECT SELECT T1.Aircraft FROM aircraft AS T1 JOIN airport_aircraft AS T2 ON T1.Aircraft_ID  =  T2.Aircraft_ID JOIN airport AS T3 ON T2.Airport_ID  =  T3.Airport_ID WHERE T3.Airport_Name  =  'London Gatwick'	aircraft
SELECT airport.* FROM airport WHERE international_passengers = (SELECT MAX(international_passengers) FROM airport)	aircraft
SELECT airport.* FROM airport WHERE airport.international_passengers = (SELECT MAX(international_passengers) FROM airport)	aircraft
SELECT p.name, p.age FROM pilot p WHERE p.pilot_id IN (SELECT m.winning_pilot FROM match m WHERE m.winning_pilot IS NOT NULL GROUP BY m.winning_pilot HAVING COUNT(m.winning_pilot) = (SELECT MAX(wins) FROM (SELECT COUNT(*) as wins FROM match WHERE winning_pilot IN (SELECT pilot_id FROM pilot WHERE age < 30) GROUP BY winning_pilot)))	aircraft
SELECT name, age FROM (SELECT p.name, p.age, COUNT(m.winning_pilot) AS victories FROM pilot p JOIN match m ON p.pilot_id = m.winning_pilot WHERE p.age < 30 GROUP BY m.winning_pilot) WHERE victories = (SELECT MAX(victories) FROM (SELECT COUNT(m.winning_pilot) AS victories FROM match m JOIN pilot p ON m.winning_pilot = p.pilot_id WHERE p.age < 30 GROUP BY m.winning_pilot))	aircraft
SELECT first.name, first.age FROM (SELECT p.name, p.age, RANK() OVER (ORDER BY p.age) as rk FROM pilot p JOIN match m ON p.pilot_id = m.winning_pilot) first WHERE first.rk = 1	aircraft
SELECT p.name, MIN(p.age) FROM match m JOIN pilot p ON m.winning_pilot = p.pilot_id GROUP BY p.pilot_id HAVING MIN(p.age) = (SELECT MIN(age) FROM pilot WHERE pilot_id IN (SELECT winning_pilot FROM match))	aircraft
SELECT name FROM pilot WHERE pilot_id NOT IN (SELECT Winning_Pilot  FROM MATCH WHERE country  =  'Australia')	aircraft
SELECT name FROM pilot WHERE pilot_id NOT IN (SELECT Winning_Pilot  FROM MATCH WHERE country  =  'Australia')	aircraft
SELECT T1.property_id ,  count(*) FROM properties AS T1 JOIN residents AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.property_id	local_govt_and_lot
SELECT DISTINCT T1.service_type_code FROM services AS T1 JOIN organizations AS T2 ON T1.organization_id  =  T2.organization_id WHERE T2.organization_details  =  'Denesik and Sons Party'	local_govt_and_lot
SELECT T1.resident_id ,  T1.other_details ,  count(*) FROM Residents AS T1 JOIN Residents_Services AS T2 ON T1.resident_id  =  T2.resident_id GROUP BY T1.resident_id ORDER BY count(*) DESC	local_govt_and_lot
SELECT T1.service_id ,  T1.service_details ,  count(*) FROM Services AS T1 JOIN Residents_Services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T1.service_id ORDER BY count(*) DESC LIMIT 1	local_govt_and_lot
SELECT T1.thing_id ,  T1.type_of_Thing_Code ,  T2.organization_details FROM Things AS T1 JOIN Organizations AS T2 ON T1.organization_id  =  T2.organization_id	local_govt_and_lot
SELECT T1.customer_id ,  T1.customer_details FROM Customers AS T1 JOIN Customer_Events AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  3	local_govt_and_lot
SELECT T2.date_moved_in ,  T1.customer_id ,  T1.customer_details FROM Customers AS T1 JOIN Customer_Events AS T2 ON T1.customer_id  =  T2.customer_id	local_govt_and_lot
SELECT T1.Customer_Event_ID  ,  T1.property_id FROM Customer_Events AS T1 JOIN Customer_Event_Notes AS T2 ON T1.Customer_Event_ID  =  T2.Customer_Event_ID GROUP BY T1.customer_event_id HAVING count(*) BETWEEN 1 AND 3	local_govt_and_lot
SELECT DISTINCT T2.thing_id ,  T2.Type_of_Thing_Code FROM Timed_Status_of_Things AS T1 JOIN Things AS T2 ON T1.thing_id  =  T2.thing_id WHERE T1.Status_of_Thing_Code  =  'Close' OR T1.Date_and_Date  <  '2017-06-19 02:59:21'	local_govt_and_lot
SELECT count(DISTINCT T2.Location_Code) FROM Things AS T1 JOIN Timed_Locations_of_Things AS T2 ON T1.thing_id  =  T2.thing_id WHERE T1.service_details  =  'Unsatisfied'	local_govt_and_lot
SELECT count(DISTINCT Status_of_Thing_Code) FROM Timed_Status_of_Things	local_govt_and_lot
SELECT organization_id FROM organizations EXCEPT SELECT parent_organization_id FROM organizations	local_govt_and_lot
SELECT max(date_moved_in) FROM Residents	local_govt_and_lot
SELECT * FROM residents WHERE other_details LIKE '%Miss%'	local_govt_and_lot
SELECT customer_event_id ,  date_moved_in ,  property_id FROM customer_events	local_govt_and_lot
SELECT count(*) FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM customer_events )	local_govt_and_lot
SELECT DISTINCT date_moved_in FROM residents	local_govt_and_lot
SELECT count(*) FROM school	school_player
SELECT count(*) FROM school	school_player
SELECT LOCATION FROM school ORDER BY Enrollment ASC	school_player
SELECT LOCATION FROM school ORDER BY Enrollment ASC	school_player
SELECT LOCATION FROM school ORDER BY Founded DESC	school_player
SELECT LOCATION FROM school ORDER BY Founded DESC	school_player
SELECT Enrollment FROM school WHERE Denomination != 'Catholic'	school_player
SELECT Enrollment FROM school WHERE Denomination != 'Catholic'	school_player
SELECT avg(Enrollment) FROM school	school_player
SELECT avg(Enrollment) FROM school	school_player
SELECT Team FROM player ORDER BY Team ASC	school_player
SELECT Team FROM player ORDER BY Team ASC	school_player
SELECT count(DISTINCT POSITION) FROM player	school_player
SELECT count(DISTINCT POSITION) FROM player	school_player
SELECT DISTINCT team FROM player p1 WHERE p1.age = (SELECT MAX(p2.age) FROM player p2)	school_player
SELECT Team FROM player ORDER BY Age DESC LIMIT 1	school_player
SELECT Team FROM player ORDER BY Age DESC LIMIT 5	school_player
SELECT team FROM player WHERE age IN (SELECT age FROM player ORDER BY age DESC LIMIT 5)	school_player
SELECT T1.Team ,  T2.Location FROM player AS T1 JOIN school AS T2 ON T1.School_ID  =  T2.School_ID	school_player
SELECT T1.Team ,  T2.Location FROM player AS T1 JOIN school AS T2 ON T1.School_ID  =  T2.School_ID	school_player
SELECT T2.Location FROM player AS T1 JOIN school AS T2 ON T1.School_ID  =  T2.School_ID GROUP BY T1.School_ID HAVING COUNT(*)  >  1	school_player
SELECT T2.Location FROM player AS T1 JOIN school AS T2 ON T1.School_ID  =  T2.School_ID GROUP BY T1.School_ID HAVING COUNT(*)  >  1	school_player
SELECT T2.Denomination FROM player AS T1 JOIN school AS T2 ON T1.School_ID  =  T2.School_ID GROUP BY T1.School_ID ORDER BY COUNT(*) DESC LIMIT 1	school_player
SELECT denomination FROM school WHERE school_id IN (SELECT school_id FROM player GROUP BY school_id HAVING COUNT(player_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(player_id) AS cnt FROM player GROUP BY school_id)))	school_player
SELECT T1.Location ,  T2.Nickname FROM school AS T1 JOIN school_details AS T2 ON T1.School_ID  =  T2.School_ID	school_player
SELECT T1.Location ,  T2.Nickname FROM school AS T1 JOIN school_details AS T2 ON T1.School_ID  =  T2.School_ID	school_player
SELECT Denomination ,  COUNT(*) FROM school GROUP BY Denomination	school_player
SELECT Denomination ,  COUNT(*) FROM school GROUP BY Denomination	school_player
SELECT Denomination ,  COUNT(*) FROM school GROUP BY Denomination ORDER BY COUNT(*) DESC	school_player
SELECT DISTINCT denomination, COUNT(*) OVER (PARTITION BY denomination) AS c FROM school ORDER BY c DESC	school_player
SELECT s.school_colors FROM school s WHERE s.enrollment = (SELECT MAX(enrollment) FROM school)	school_player
SELECT s.school_colors FROM school s WHERE s.enrollment = (SELECT MAX(enrollment) FROM school)	school_player
SELECT LOCATION FROM school WHERE School_ID NOT IN (SELECT School_ID FROM Player)	school_player
SELECT LOCATION FROM school WHERE School_ID NOT IN (SELECT School_ID FROM Player)	school_player
SELECT Denomination FROM school WHERE Founded  <  1890 INTERSECT SELECT Denomination FROM school WHERE Founded  >  1900	school_player
SELECT Denomination FROM school WHERE Founded  <  1890 INTERSECT SELECT Denomination FROM school WHERE Founded  >  1900	school_player
SELECT Nickname FROM school_details WHERE Division != 'Division 1'	school_player
SELECT Nickname FROM school_details WHERE Division != 'Division 1'	school_player
SELECT Denomination FROM school GROUP BY Denomination HAVING COUNT(*)  >  1	school_player
SELECT Denomination FROM school GROUP BY Denomination HAVING COUNT(*)  >  1	school_player
SELECT DISTINCT District_name FROM district ORDER BY city_area DESC	store_product
SELECT DISTINCT District_name FROM district ORDER BY city_area DESC	store_product
SELECT max_page_size FROM product GROUP BY max_page_size HAVING count(*)  >  3	store_product
SELECT MAX(p.max_page_size) FROM product p JOIN store_product sp ON p.product_id = sp.product_id GROUP BY sp.store_id HAVING COUNT(sp.product_id) > 3	store_product
SELECT District_name ,  City_Population FROM district WHERE City_Population BETWEEN 200000 AND 2000000	store_product
SELECT District_name ,  City_Population FROM district WHERE City_Population BETWEEN 200000 AND 2000000	store_product
SELECT district_name FROM district WHERE city_area  >  10 OR City_Population  >  100000	store_product
SELECT district_name FROM district WHERE city_area  >  10 OR City_Population  >  100000	store_product
SELECT d.district_name FROM district d WHERE d.city_population = (SELECT MAX(city_population) FROM district)	store_product
SELECT d.district_name FROM district d WHERE d.city_population = (SELECT MAX(city_population) FROM district)	store_product
SELECT district_name FROM district ORDER BY city_area ASC LIMIT 1	store_product
SELECT D.district_name FROM district D WHERE D.city_area = (SELECT MIN(D2.city_area) FROM district D2)	store_product
SELECT SUM(city_population) FROM (SELECT city_population FROM district ORDER BY city_area DESC LIMIT 3)	store_product
SELECT SUM(district.city_population) FROM district WHERE district_id IN (SELECT district_id FROM district ORDER BY city_area DESC LIMIT 3)	store_product
SELECT TYPE ,  count(*) FROM store GROUP BY TYPE	store_product
SELECT TYPE ,  count(*) FROM store GROUP BY TYPE	store_product
SELECT t1.store_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t3.district_name  =  'Khanewal District'	store_product
SELECT t1.store_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t3.district_name  =  'Khanewal District'	store_product
SELECT DISTINCT store.store_name FROM store JOIN store_district ON store.store_id = store_district.store_id JOIN district ON district.district_id = store_district.district_id WHERE district.city_population = (SELECT MAX(city_population) FROM district)	store_product
SELECT store_name FROM store WHERE store_id IN (SELECT store_id FROM store_district sd INNER JOIN district d ON sd.district_id = d.district_id WHERE city_population = (SELECT MAX(city_population) FROM district))	store_product
SELECT DISTINCT headquartered_city FROM district WHERE exists (SELECT 1 FROM store_district JOIN store ON store_district.store_id = store.store_id WHERE store_district.district_id = district.district_id AND store.store_name = 'Blackville')	store_product
SELECT t3.headquartered_city FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t1.store_name  =  'Blackville'	store_product
SELECT t3.headquartered_city ,  count(*) FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id GROUP BY t3.headquartered_city	store_product
SELECT t3.headquartered_city ,  count(*) FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id GROUP BY t3.headquartered_city	store_product
SELECT t3.headquartered_city FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id GROUP BY t3.headquartered_city ORDER BY count(*) DESC LIMIT 1	store_product
SELECT t3.headquartered_city FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id GROUP BY t3.headquartered_city ORDER BY count(*) DESC LIMIT 1	store_product
SELECT avg(pages_per_minute_color) FROM product	store_product
SELECT avg(pages_per_minute_color) FROM product	store_product
SELECT t1.product FROM product AS t1 JOIN store_product AS t2 ON t1.product_id  =  t2.product_id JOIN store AS t3 ON t2.store_id  =  t3.store_id WHERE t3.store_name  =  'Miramichi'	store_product
SELECT t1.product FROM product AS t1 JOIN store_product AS t2 ON t1.product_id  =  t2.product_id JOIN store AS t3 ON t2.store_id  =  t3.store_id WHERE t3.store_name  =  'Miramichi'	store_product
SELECT product FROM product WHERE max_page_size  =  'A4' AND pages_per_minute_color  <  5	store_product
SELECT product FROM product WHERE max_page_size  =  'A4' AND pages_per_minute_color  <  5	store_product
SELECT product FROM product WHERE max_page_size  =  'A4' OR pages_per_minute_color  <  5	store_product
SELECT product FROM product WHERE max_page_size  =  'A4' OR pages_per_minute_color  <  5	store_product
SELECT product FROM product WHERE product LIKE '%Scanner%'	store_product
SELECT product FROM product WHERE product LIKE '%Scanner%'	store_product
SELECT max_page_size FROM product GROUP BY max_page_size ORDER BY count(*) DESC LIMIT 1	store_product
SELECT max_page_size FROM product GROUP BY max_page_size ORDER BY count(*) DESC LIMIT 1	store_product
SELECT product FROM product WHERE max_page_size != (SELECT max_page_size FROM product GROUP BY max_page_size ORDER BY COUNT(*) DESC LIMIT 1)	store_product
SELECT DISTINCT p.product FROM product p WHERE p.max_page_size NOT IN (SELECT MAX(max_page_size) FROM product)	store_product
SELECT sum(city_population) FROM district WHERE city_area  >  (SELECT avg(city_area) FROM district)	store_product
SELECT sum(city_population) FROM district WHERE city_area  >  (SELECT avg(city_area) FROM district)	store_product
SELECT t3.District_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t1.Type  =  'City Mall' INTERSECT SELECT t3.District_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t1.Type  =  'Village Store'	store_product
SELECT t3.District_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t1.Type  =  'City Mall' INTERSECT SELECT t3.District_name FROM store AS t1 JOIN store_district AS t2 ON t1.store_id  =  t2.store_id JOIN district AS t3 ON t2.district_id  =  t3.district_id WHERE t1.Type  =  'Village Store'	store_product
SELECT SUM(enr) FROM college WHERE cname IN (SELECT cname FROM college)	soccer_2
SELECT sum(enr) FROM College	soccer_2
SELECT avg(enr) FROM College	soccer_2
SELECT avg(enr) FROM College	soccer_2
SELECT count(*) FROM College	soccer_2
SELECT count(*) FROM College	soccer_2
SELECT count(*) FROM Player WHERE HS  >  1000	soccer_2
SELECT count(*) FROM Player WHERE HS  >  1000	soccer_2
SELECT count(*) FROM College WHERE enr  >  15000	soccer_2
SELECT count(*) FROM College WHERE enr  >  15000	soccer_2
SELECT avg(HS) FROM Player	soccer_2
SELECT avg(HS) FROM Player	soccer_2
SELECT pName ,  HS FROM Player WHERE HS  <  1500	soccer_2
SELECT pName ,  HS FROM Player WHERE HS  <  1500	soccer_2
SELECT count(DISTINCT cName) FROM tryout	soccer_2
SELECT count(DISTINCT cName) FROM tryout	soccer_2
SELECT DISTINCT ppos FROM tryout	soccer_2
SELECT DISTINCT ppos FROM tryout;	soccer_2
SELECT count(*) FROM tryout WHERE decision  =  'yes'	soccer_2
SELECT count(*) FROM tryout WHERE decision  =  'yes'	soccer_2
SELECT count(*) FROM tryout WHERE pPos  =  'goalie'	soccer_2
SELECT COUNT(DISTINCT player.pid) FROM player JOIN tryout ON player.pid = tryout.pid WHERE tryout.ppos = 'goalie'	soccer_2
SELECT avg(HS) ,  max(HS) ,  min(HS) FROM Player	soccer_2
SELECT avg(HS) ,  max(HS) ,  min(HS) FROM Player	soccer_2
SELECT avg(enr) FROM College WHERE state  =  'FL'	soccer_2
SELECT avg(enr) FROM College WHERE state  =  'FL'	soccer_2
SELECT pName FROM Player WHERE HS BETWEEN 500 AND 1500	soccer_2
SELECT pName FROM Player WHERE HS BETWEEN 500 AND 1500	soccer_2
SELECT pname FROM player WHERE pname LIKE '%a%'	soccer_2
SELECT pname FROM player WHERE pname LIKE '%a%'	soccer_2
SELECT cName ,  enr FROM College WHERE enr  >  10000 AND state = 'LA'	soccer_2
SELECT cName ,  enr FROM College WHERE enr  >  10000 AND state = 'LA'	soccer_2
SELECT * FROM College ORDER BY enr	soccer_2
SELECT * FROM College ORDER BY enr	soccer_2
SELECT cName FROM College WHERE enr  >  18000 ORDER BY cName	soccer_2
SELECT cName FROM College WHERE enr  >  18000 ORDER BY cName	soccer_2
SELECT pName FROM Player WHERE yCard  =  'yes' ORDER BY HS DESC	soccer_2
SELECT pname FROM player WHERE ycard IS NOT NULL AND ycard <> 0 ORDER BY hs DESC	soccer_2
SELECT DISTINCT cName FROM tryout ORDER BY cName	soccer_2
SELECT DISTINCT cName FROM tryout ORDER BY cName	soccer_2
SELECT ppos FROM tryout GROUP BY ppos HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM tryout GROUP BY ppos) c)	soccer_2
SELECT f.ppos FROM (SELECT ppos, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM tryout GROUP BY ppos) f WHERE f.rank = 1	soccer_2
SELECT count(*) ,  cName FROM tryout GROUP BY cName ORDER BY count(*) DESC	soccer_2
SELECT count(*) ,  cName FROM tryout GROUP BY cName ORDER BY count(*) DESC	soccer_2
SELECT MIN(p.hs) FROM player p JOIN tryout t ON p.pid = t.pid GROUP BY t.ppos	soccer_2
SELECT min(T2.HS) ,   T1.pPos FROM tryout AS T1 JOIN player AS T2 ON T1.pID  =  T2.pID GROUP BY T1.pPos	soccer_2
SELECT cName FROM college ORDER BY enr DESC LIMIT 3	soccer_2
WITH ranked_colleges AS (SELECT cname, enr, RANK() OVER (ORDER BY enr DESC) AS rank FROM college) SELECT cname FROM ranked_colleges WHERE rank <= 3	soccer_2
SELECT cname FROM college WHERE (state, enr) IN (SELECT state, MIN(enr) FROM college GROUP BY state)	soccer_2
SELECT cname FROM college WHERE (state, enr) IN (SELECT state, MIN(enr) FROM college GROUP BY state)	soccer_2
SELECT DISTINCT state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName	soccer_2
SELECT DISTINCT state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName	soccer_2
SELECT DISTINCT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.decision  =  'yes'	soccer_2
SELECT DISTINCT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.decision  =  'yes'	soccer_2
SELECT T1.pName ,  T2.cName FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes'	soccer_2
SELECT T1.pName ,  T2.cName FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes'	soccer_2
SELECT p.pname FROM player p WHERE p.pid IN (SELECT t.pid FROM tryout t) ORDER BY p.pname ASC;	soccer_2
SELECT pname FROM player WHERE pid IN (SELECT pid FROM tryout) ORDER BY pname	soccer_2
SELECT T1.pName ,  T1.HS FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes'	soccer_2
SELECT T1.pName ,  T1.HS FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes'	soccer_2
SELECT state FROM college WHERE cname IN (SELECT cname FROM tryout WHERE ppos = 'striker')	soccer_2
SELECT DISTINCT c.state FROM college c JOIN tryout t ON c.cname = t.cname WHERE t.ppos = 'striker'	soccer_2
SELECT T1.pName FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes' AND T2.pPos  =  'striker'	soccer_2
SELECT T1.pName FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes' AND T2.pPos  =  'striker'	soccer_2
SELECT state FROM college WHERE EXISTS (SELECT * FROM tryout WHERE tryout.cname = college.cname AND tryout.pid IN (SELECT pid FROM player WHERE pname = 'Charles'))	soccer_2
SELECT state FROM college WHERE cname IN (SELECT cname FROM player JOIN tryout ON player.pid = tryout.pid WHERE pname = 'Charles')	soccer_2
SELECT AVG(hs), MAX(hs) FROM player WHERE EXISTS (SELECT 1 FROM tryout WHERE tryout.pid = player.pid AND decision = 'yes')	soccer_2
SELECT avg(T1.HS) ,  max(T1.HS) FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'yes'	soccer_2
SELECT AVG(hs) FROM player WHERE pid IN (SELECT pid FROM tryout WHERE decision = 'no')	soccer_2
SELECT avg(T1.HS) FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T2.decision  =  'no'	soccer_2
SELECT MAX(player.hs) FROM player JOIN tryout ON player.pid = tryout.pid WHERE player.hs > 1000 GROUP BY tryout.ppos;	soccer_2
SELECT max(T1.HS) ,  pPos FROM player AS T1 JOIN tryout AS T2 ON T1.pID  =  T2.pID WHERE T1.HS  >  1000 GROUP BY T2.pPos	soccer_2
SELECT DISTINCT c.cname FROM college c JOIN tryout t ON c.cname = t.cname JOIN player p ON t.pid = p.pid WHERE p.pname LIKE 'D%'	soccer_2
SELECT T1.cName FROM  tryout AS T1 JOIN player AS T2 ON T1.pID  =  T2.pID WHERE T2.pName LIKE 'D%'	soccer_2
SELECT cName FROM  tryout WHERE decision  =  'yes' AND pPos  =  'goalie'	soccer_2
SELECT cName FROM  tryout WHERE decision  =  'yes' AND pPos  =  'goalie'	soccer_2
SELECT pname FROM player WHERE pid IN (SELECT pid FROM tryout WHERE cname IN (SELECT cname FROM college WHERE enr = (SELECT MAX(enr) FROM college)))	soccer_2
SELECT pname FROM player WHERE pid IN (SELECT T.pid FROM tryout T INNER JOIN college C ON T.cname = C.cname WHERE C.enr = (SELECT MAX(enr) FROM college))	soccer_2
SELECT DISTINCT T1.state ,  T1.enr FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.decision  =  'yes'	soccer_2
SELECT DISTINCT T1.state ,  T1.enr FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.decision  =  'yes'	soccer_2
SELECT cName FROM College WHERE enr  <  13000 AND state = 'AZ' UNION SELECT cName FROM College WHERE enr  >  15000 AND state = 'LA'	soccer_2
SELECT cName FROM College WHERE enr  <  13000 AND state = 'AZ' UNION SELECT cName FROM College WHERE enr  >  15000 AND state = 'LA'	soccer_2
SELECT cName FROM  tryout WHERE pPos  =  'goalie' INTERSECT SELECT cName FROM  tryout WHERE pPos  =  'mid'	soccer_2
SELECT DISTINCT c.cname FROM college c JOIN tryout t ON c.cname = t.cname WHERE t.ppos IN ('goal', 'mid')	soccer_2
SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'goalie' INTERSECT SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'mid'	soccer_2
SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'goalie' INTERSECT SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'mid'	soccer_2
SELECT COUNT(*) FROM (SELECT cName FROM  tryout WHERE pPos  =  'goalie' INTERSECT SELECT cName FROM  tryout WHERE pPos  =  'mid')	soccer_2
SELECT COUNT(*) FROM (SELECT cName FROM  tryout WHERE pPos  =  'goalie' INTERSECT SELECT cName FROM  tryout WHERE pPos  =  'mid')	soccer_2
SELECT cName FROM  tryout WHERE pPos  =  'mid' EXCEPT SELECT cName FROM  tryout WHERE pPos  =  'goalie'	soccer_2
SELECT cName FROM  tryout WHERE pPos  =  'mid' EXCEPT SELECT cName FROM  tryout WHERE pPos  =  'goalie'	soccer_2
SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'mid' EXCEPT SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'goalie'	soccer_2
SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'mid' EXCEPT SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'goalie'	soccer_2
SELECT COUNT(*) FROM (SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'mid' EXCEPT SELECT T1.state FROM college AS T1 JOIN tryout AS T2 ON T1.cName  =  T2.cName WHERE T2.pPos  =  'goalie')	soccer_2
SELECT COUNT(DISTINCT state) FROM college WHERE cname IN (SELECT cname FROM tryout WHERE ppos = 'mid' AND cname NOT IN (SELECT cname FROM tryout WHERE ppos = 'goalie'))	soccer_2
SELECT DISTINCT state FROM college WHERE enr  <  (SELECT max(enr) FROM college)	soccer_2
SELECT DISTINCT state FROM college WHERE enr  <  (SELECT max(enr) FROM college)	soccer_2
SELECT DISTINCT cName FROM college WHERE enr  >  (SELECT min(enr) FROM college WHERE state  =  'FL')	soccer_2
SELECT DISTINCT cName FROM college WHERE enr  >  (SELECT min(enr) FROM college WHERE state  =  'FL')	soccer_2
SELECT c1.cname FROM college AS c1 WHERE NOT EXISTS (SELECT 1 FROM college c2 WHERE c2.state = 'GBK' AND c2.enr >= c1.enr)	soccer_2
SELECT cName FROM college WHERE enr  >  (SELECT max(enr) FROM college WHERE state  =  'FL')	soccer_2
SELECT sum(enr) FROM college WHERE cName NOT IN (SELECT cName FROM tryout WHERE pPos  =  'goalie')	soccer_2
SELECT TOTAL(c.enr) FROM college c WHERE NOT EXISTS (SELECT 1 FROM tryout t WHERE t.cname = c.cname AND t.ppos = 'goalie')	soccer_2
SELECT count(DISTINCT state) FROM college WHERE enr  >  (SELECT avg(enr) FROM college)	soccer_2
SELECT count(DISTINCT state) FROM college WHERE enr  >  (SELECT avg(enr) FROM college)	soccer_2
SELECT count(DISTINCT state) FROM college WHERE enr  <  (SELECT avg(enr) FROM college)	soccer_2
SELECT count(DISTINCT state) FROM college WHERE enr  <  (SELECT avg(enr) FROM college)	soccer_2
SELECT count(*) FROM device	device
SELECT count(*) FROM device	device
SELECT Carrier FROM device ORDER BY Carrier ASC	device
SELECT DISTINCT carrier FROM device ORDER BY carrier ASC	device
SELECT Carrier FROM device WHERE Software_Platform != 'Android'	device
SELECT DISTINCT carrier FROM device WHERE software_platform != 'Android'	device
SELECT Shop_Name FROM shop ORDER BY Open_Year ASC	device
SELECT Shop_Name FROM shop ORDER BY Open_Year ASC	device
SELECT avg(Quantity) FROM stock	device
SELECT avg(Quantity) FROM stock	device
SELECT Shop_Name ,  LOCATION FROM shop ORDER BY Shop_Name ASC	device
SELECT Shop_Name ,  LOCATION FROM shop ORDER BY Shop_Name ASC	device
SELECT count(DISTINCT Software_Platform) FROM device	device
SELECT count(DISTINCT Software_Platform) FROM device	device
SELECT Open_Date ,  Open_Year FROM shop WHERE Shop_Name  =  'Apple'	device
SELECT Open_Date ,  Open_Year FROM shop WHERE Shop_Name  =  'Apple'	device
SELECT shop_name FROM shop WHERE open_year = (SELECT MAX(open_year) FROM shop)	device
SELECT Shop_Name FROM shop ORDER BY Open_Year DESC LIMIT 1	device
SELECT T3.Shop_Name ,  T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID JOIN shop AS T3 ON T1.Shop_ID  =  T3.Shop_ID	device
SELECT T3.Shop_Name ,  T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID JOIN shop AS T3 ON T1.Shop_ID  =  T3.Shop_ID	device
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID HAVING COUNT(*)  >  1	device
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID HAVING COUNT(*)  >  1	device
SELECT s.shop_name FROM shop s WHERE (SELECT COUNT(DISTinct device_id) FROM stock WHERE stock.shop_id = s.shop_id) = (SELECT MAX(q.device_count) FROM (SELECT shop_id, COUNT(DISTinct device_id) as device_count FROM stock GROUP BY shop_id) q)	device
WITH RankedShops AS (SELECT shop_id, RANK() OVER (ORDER BY COUNT(DISTINCT device_id) DESC) AS Rank FROM stock GROUP BY shop_id) SELECT sh.shop_name FROM shop sh JOIN RankedShops rs ON sh.shop_id = rs.shop_id WHERE rs.Rank = 1	device
SELECT shop_name FROM shop WHERE shop_id IN (SELECT shop_id FROM stock GROUP BY shop_id HAVING SUM(quantity) = (SELECT MAX(total_quantity) FROM (SELECT SUM(quantity) as total_quantity FROM stock GROUP BY shop_id)))	device
SELECT shop_name FROM shop WHERE shop_id IN (SELECT shop_id FROM stock GROUP BY shop_id HAVING SUM(quantity) = (SELECT MAX(total) FROM (SELECT SUM(quantity) AS total FROM stock GROUP BY shop_id)))	device
SELECT Software_Platform ,  COUNT(*) FROM device GROUP BY Software_Platform	device
SELECT Software_Platform ,  COUNT(*) FROM device GROUP BY Software_Platform	device
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC	device
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC	device
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC LIMIT 1	device
WITH RankedPlatforms AS (SELECT software_platform, RANK() OVER (ORDER BY COUNT(device_id) DESC) as rank FROM device GROUP BY software_platform) SELECT software_platform FROM RankedPlatforms WHERE rank = 1	device
SELECT s.shop_name FROM shop s LEFT OUTER JOIN stock st ON s.shop_id = st.shop_id GROUP BY s.shop_name HAVING SUM(st.quantity) IS NULL OR SUM(st.quantity) = 0	device
SELECT shop_name FROM shop WHERE shop_id NOT IN (SELECT DISTINCT shop_id FROM stock WHERE quantity > 0)	device
SELECT LOCATION FROM shop WHERE Open_Year  >  2012 INTERSECT SELECT LOCATION FROM shop WHERE Open_Year  <  2008	device
SELECT LOCATION FROM shop WHERE Open_Year  >  2012 INTERSECT SELECT LOCATION FROM shop WHERE Open_Year  <  2008	device
SELECT DISTINCT device.carrier FROM device LEFT JOIN stock ON device.device_id = stock.device_id WHERE stock.device_id IS NULL	device
SELECT carrier FROM device d WHERE d.device_id NOT IN (SELECT device_id FROM stock s WHERE s.quantity > 0)	device
SELECT DISTINCT D.carrier FROM device D JOIN stock S ON D.device_id = S.device_id GROUP BY D.device_id HAVING COUNT(DISTINCT S.shop_id) > 1	device
SELECT DISTINCT device.carrier FROM device JOIN stock ON device.device_id = stock.device_id GROUP BY device.device_id HAVING COUNT(DISTINCT stock.shop_id) > 1	device
SELECT count(*) FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT count(*) FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT Order_Date FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT Order_Date FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT Planned_Delivery_Date ,  Actual_Delivery_Date FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT Planned_Delivery_Date ,  Actual_Delivery_Date FROM BOOKINGS	cre_Drama_Workshop_Groups
SELECT count(*) FROM CUSTOMERS	cre_Drama_Workshop_Groups
SELECT count(*) FROM CUSTOMERS	cre_Drama_Workshop_Groups
SELECT Customer_Phone ,  Customer_Email_Address FROM CUSTOMERS WHERE Customer_Name  =  'Harold'	cre_Drama_Workshop_Groups
SELECT Customer_Phone ,  Customer_Email_Address FROM CUSTOMERS WHERE Customer_Name  =  'Harold'	cre_Drama_Workshop_Groups
SELECT Store_Name FROM Drama_Workshop_Groups	cre_Drama_Workshop_Groups
SELECT Store_Name FROM Drama_Workshop_Groups	cre_Drama_Workshop_Groups
SELECT min(Order_Quantity) ,  avg(Order_Quantity) ,  max(Order_Quantity) FROM INVOICES	cre_Drama_Workshop_Groups
SELECT min(Order_Quantity) ,  avg(Order_Quantity) ,  max(Order_Quantity) FROM INVOICES	cre_Drama_Workshop_Groups
SELECT DISTINCT payment_method_code FROM INVOICES	cre_Drama_Workshop_Groups
SELECT DISTINCT payment_method_code FROM INVOICES	cre_Drama_Workshop_Groups
SELECT Marketing_Region_Descriptrion FROM Marketing_Regions WHERE Marketing_Region_Name  =  'China'	cre_Drama_Workshop_Groups
SELECT Marketing_Region_Descriptrion FROM Marketing_Regions WHERE Marketing_Region_Name  =  'China'	cre_Drama_Workshop_Groups
SELECT DISTINCT Product_Name FROM PRODUCTS WHERE Product_Price  >  (SELECT avg(Product_Price) FROM PRODUCTS)	cre_Drama_Workshop_Groups
SELECT DISTINCT Product_Name FROM PRODUCTS WHERE Product_Price  >  (SELECT avg(Product_Price) FROM PRODUCTS)	cre_Drama_Workshop_Groups
SELECT p.product_name FROM products p WHERE p.product_price = (SELECT MAX(product_price) FROM products)	cre_Drama_Workshop_Groups
SELECT product_name FROM products WHERE product_price = (SELECT MAX(product_price) FROM products)	cre_Drama_Workshop_Groups
SELECT Product_Name FROM Products ORDER BY Product_Price ASC	cre_Drama_Workshop_Groups
SELECT Product_Name FROM Products ORDER BY Product_Price ASC	cre_Drama_Workshop_Groups
SELECT Customer_Phone FROM PERFORMERS WHERE Customer_Name  =  'Ashley'	cre_Drama_Workshop_Groups
SELECT Customer_Phone FROM PERFORMERS WHERE Customer_Name  =  'Ashley'	cre_Drama_Workshop_Groups
SELECT invoices.payment_method_code, COUNT(DISTINCT invoices.order_id) AS OrderCount FROM invoices GROUP BY invoices.payment_method_code	cre_Drama_Workshop_Groups
SELECT DISTINCT payment_method_code, COUNT(DISTINCT order_id) FROM invoices GROUP BY payment_method_code	cre_Drama_Workshop_Groups
SELECT payment_method_code FROM INVOICES GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT payment_method_code FROM INVOICES GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT city_town FROM addresses WHERE address_id IN (SELECT address_id FROM stores WHERE store_name = 'FJA Filming');	cre_Drama_Workshop_Groups
SELECT city_town FROM addresses WHERE EXISTS (SELECT 1 FROM stores WHERE stores.store_name = 'FJA Filming' AND stores.address_id = addresses.address_id)	cre_Drama_Workshop_Groups
SELECT DISTINCT a.state_county FROM addresses a JOIN stores s ON a.address_id = s.address_id WHERE s.marketing_region_code = 'CA'	cre_Drama_Workshop_Groups
SELECT DISTINCT a.state_county FROM addresses a JOIN stores s ON a.address_id = s.address_id JOIN marketing_regions mr ON s.marketing_region_code = mr.marketing_region_code WHERE mr.marketing_region_code = 'CA'	cre_Drama_Workshop_Groups
SELECT marketing_region_name FROM marketing_regions WHERE marketing_regions.marketing_region_code IN (SELECT marketing_region_code FROM stores WHERE store_name = 'Rob Dinning')	cre_Drama_Workshop_Groups
SELECT marketing_region_name FROM marketing_regions WHERE marketing_region_code IN (SELECT marketing_region_code FROM stores WHERE store_name = 'Rob Dinning')	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Price  >  100	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Price  >  100	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description ,  T2.Service_Type_Code ,  COUNT(*) FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code GROUP BY T2.Service_Type_Code	cre_Drama_Workshop_Groups
SELECT ref_service_types.service_type_description, ref_service_types.service_type_code, COUNT(services.service_id) AS number_of_services FROM ref_service_types LEFT JOIN services ON ref_service_types.service_type_code = services.service_type_code GROUP BY ref_service_types.service_type_code, ref_service_types.service_type_description	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description , T1.Service_Type_Code FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code GROUP BY T1.Service_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description , T1.Service_Type_Code FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code GROUP BY T1.Service_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT T1.Store_Phone ,  T1.Store_Email_Address FROM Drama_Workshop_Groups AS T1 JOIN Services AS T2 ON T1.Workshop_Group_ID  =  T2.Workshop_Group_ID	cre_Drama_Workshop_Groups
SELECT T1.Store_Phone ,  T1.Store_Email_Address FROM Drama_Workshop_Groups AS T1 JOIN Services AS T2 ON T1.Workshop_Group_ID  =  T2.Workshop_Group_ID	cre_Drama_Workshop_Groups
SELECT d.store_name FROM drama_workshop_groups d INNER JOIN services sv ON d.workshop_group_id = sv.workshop_group_id WHERE sv.product_name = 'film'	cre_Drama_Workshop_Groups
SELECT store_name FROM drama_workshop_groups WHERE workshop_group_id IN (SELECT workshop_group_id FROM services WHERE product_name = 'film')	cre_Drama_Workshop_Groups
SELECT Product_Name ,  avg(Product_Price) FROM PRODUCTS GROUP BY Product_Name	cre_Drama_Workshop_Groups
SELECT Product_Name ,  avg(Product_Price) FROM PRODUCTS GROUP BY Product_Name	cre_Drama_Workshop_Groups
SELECT Product_Name FROM PRODUCTS GROUP BY Product_Name HAVING avg(Product_Price)  <  1000000	cre_Drama_Workshop_Groups
SELECT Product_Name FROM PRODUCTS GROUP BY Product_Name HAVING avg(Product_Price)  <  1000000	cre_Drama_Workshop_Groups
SELECT sum(T1.Order_Quantity) FROM ORDER_ITEMS AS T1 JOIN Products AS T2 ON T1.Product_ID  =  T2.Product_ID WHERE T2.Product_Name  =  'photo'	cre_Drama_Workshop_Groups
SELECT sum(T1.Order_Quantity) FROM ORDER_ITEMS AS T1 JOIN Products AS T2 ON T1.Product_ID  =  T2.Product_ID WHERE T2.Product_Name  =  'photo'	cre_Drama_Workshop_Groups
SELECT * FROM order_items WHERE product_id IN (SELECT product_id FROM products WHERE product_price > 2000)	cre_Drama_Workshop_Groups
SELECT * FROM order_items WHERE product_id IN (SELECT product_id FROM products WHERE product_price > 2000)	cre_Drama_Workshop_Groups
SELECT T1.Actual_Delivery_Date FROM Customer_Orders AS T1 JOIN ORDER_ITEMS AS T2 ON T1.Order_ID  =  T2.Order_ID WHERE T2.Order_Quantity  =  1	cre_Drama_Workshop_Groups
SELECT T1.Actual_Delivery_Date FROM Customer_Orders AS T1 JOIN ORDER_ITEMS AS T2 ON T1.Order_ID  =  T2.Order_ID WHERE T2.Order_Quantity  =  1	cre_Drama_Workshop_Groups
SELECT T1.Order_Date FROM Customer_Orders AS T1 JOIN ORDER_ITEMS AS T2 ON T1.Order_ID  =  T2.Order_ID JOIN Products AS T3 ON T2.Product_ID  =  T3.Product_ID WHERE T3.Product_price  >  1000	cre_Drama_Workshop_Groups
SELECT T1.Order_Date FROM Customer_Orders AS T1 JOIN ORDER_ITEMS AS T2 ON T1.Order_ID  =  T2.Order_ID JOIN Products AS T3 ON T2.Product_ID  =  T3.Product_ID WHERE T3.Product_price  >  1000	cre_Drama_Workshop_Groups
SELECT count(DISTINCT Currency_Code) FROM Drama_Workshop_Groups	cre_Drama_Workshop_Groups
SELECT count(DISTINCT Currency_Code) FROM Drama_Workshop_Groups	cre_Drama_Workshop_Groups
SELECT T2.Store_Name FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID WHERE T1.City_Town  =  'Feliciaberg'	cre_Drama_Workshop_Groups
SELECT T2.Store_Name FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID WHERE T1.City_Town  =  'Feliciaberg'	cre_Drama_Workshop_Groups
SELECT T2.Store_Email_Address FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID WHERE T1.State_County  =  'Alaska'	cre_Drama_Workshop_Groups
SELECT T2.Store_Email_Address FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID WHERE T1.State_County  =  'Alaska'	cre_Drama_Workshop_Groups
SELECT T1.City_Town ,  count(*) FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID GROUP BY T1.City_Town	cre_Drama_Workshop_Groups
SELECT T1.City_Town ,  count(*) FROM Addresses AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Address_ID  =  T2.Address_ID GROUP BY T1.City_Town	cre_Drama_Workshop_Groups
SELECT dwg.marketing_region_code FROM drama_workshop_groups dwg GROUP BY dwg.marketing_region_code HAVING COUNT(dwg.workshop_group_id) = (SELECT MAX(group_count) FROM (SELECT COUNT(workshop_group_id) AS group_count FROM drama_workshop_groups GROUP BY marketing_region_code))	cre_Drama_Workshop_Groups
SELECT marketing_region_code FROM drama_workshop_groups GROUP BY marketing_region_code HAVING COUNT(workshop_group_id) = (SELECT MAX(groups_count) FROM (SELECT COUNT(workshop_group_id) AS groups_count FROM drama_workshop_groups GROUP BY marketing_region_code) t)	cre_Drama_Workshop_Groups
SELECT T1.City_Town FROM Addresses AS T1 JOIN Customers AS T2 ON T1.Address_ID  =  T2.Address_ID EXCEPT SELECT T1.City_Town FROM Addresses AS T1 JOIN Performers AS T2 ON T1.Address_ID  =  T2.Address_ID	cre_Drama_Workshop_Groups
SELECT T1.City_Town FROM Addresses AS T1 JOIN Customers AS T2 ON T1.Address_ID  =  T2.Address_ID EXCEPT SELECT T1.City_Town FROM Addresses AS T1 JOIN Performers AS T2 ON T1.Address_ID  =  T2.Address_ID	cre_Drama_Workshop_Groups
SELECT Status_Code FROM BOOKINGS GROUP BY Status_Code ORDER BY count(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT Status_Code FROM BOOKINGS GROUP BY Status_Code ORDER BY count(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT T2.Store_Name FROM Bookings AS T1 JOIN Drama_Workshop_Groups AS T2 ON T1.Workshop_Group_ID  =  T2.Workshop_Group_ID WHERE T1.Status_Code  =  'stop'	cre_Drama_Workshop_Groups
SELECT DISTINCT d.store_name FROM drama_workshop_groups d JOIN bookings b ON d.workshop_group_id = b.workshop_group_id WHERE b.status_code = 'stop'	cre_Drama_Workshop_Groups
SELECT customer_name FROM clients WHERE client_id NOT IN (SELECT customer_id FROM bookings)	cre_Drama_Workshop_Groups
SELECT customer_name FROM clients WHERE client_id NOT IN (SELECT customer_id FROM bookings)	cre_Drama_Workshop_Groups
SELECT avg(Order_Quantity) FROM Invoices WHERE payment_method_code  =  'MasterCard'	cre_Drama_Workshop_Groups
SELECT avg(Order_Quantity) FROM Invoices WHERE payment_method_code  =  'MasterCard'	cre_Drama_Workshop_Groups
SELECT product_id FROM invoices GROUP BY product_id HAVING COUNT(product_id) = (SELECT MAX(count) FROM (SELECT COUNT(product_id) as count FROM invoices GROUP BY product_id))	cre_Drama_Workshop_Groups
SELECT Product_ID FROM INVOICES GROUP BY Product_ID ORDER BY COUNT(*) DESC LIMIT 1	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Name  =  'photo' INTERSECT SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Name  =  'film'	cre_Drama_Workshop_Groups
SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Name  =  'photo' INTERSECT SELECT T1.Service_Type_Description FROM Ref_Service_Types AS T1 JOIN Services AS T2 ON T1.Service_Type_Code  =  T2.Service_Type_Code WHERE T2.Product_Name  =  'film'	cre_Drama_Workshop_Groups
SELECT count(*) FROM Band	music_2
SELECT count(*) FROM Band	music_2
SELECT DISTINCT label FROM Albums	music_2
SELECT DISTINCT label FROM Albums	music_2
SELECT * FROM Albums WHERE YEAR  =  2012	music_2
SELECT * FROM Albums WHERE YEAR  =  2012	music_2
SELECT DISTINCT T1.stageposition FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE Firstname  =  'Solveig'	music_2
SELECT DISTINCT T1.stageposition FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE Firstname  =  'Solveig'	music_2
SELECT count(*) FROM Songs	music_2
SELECT count(*) FROM Songs	music_2
SELECT DISTINCT s.title FROM songs s JOIN performance p ON s.songid = p.songid JOIN band b ON p.bandmate = b.id WHERE b.lastname = 'Heilo'	music_2
SELECT DISTINCT s.title FROM songs s, instruments i, band b WHERE s.songid = i.songid AND i.bandmateid = b.id AND b.lastname = 'Heilo'	music_2
SELECT COUNT(DISTINCT performance.bandmate) FROM performance JOIN songs ON performance.songid = songs.songid WHERE songs.title = 'Flash'	music_2
SELECT COUNT(DISTINCT band.id) FROM band JOIN performance ON band.id = performance.bandmate JOIN songs ON performance.songid = songs.songid WHERE songs.title = 'Flash'	music_2
SELECT title FROM songs s WHERE songid IN (SELECT songid FROM performance p JOIN band b ON p.bandmate = b.id WHERE b.firstname = 'Marianne')	music_2
SELECT T3.Title FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T2.firstname  =  'Marianne'	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Badlands'	music_2
SELECT firstname, lastname FROM band WHERE id IN (SELECT performance.bandmate FROM performance JOIN songs ON performance.songid = songs.songid WHERE songs.title = 'Badlands')	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Badlands' AND T1.StagePosition  =  'back'	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Badlands' AND T1.StagePosition  =  'back'	music_2
SELECT count(DISTINCT label) FROM albums	music_2
SELECT DISTINCT label FROM albums	music_2
SELECT label FROM albums GROUP BY label HAVING COUNT(aid) = (SELECT MAX(count) FROM (SELECT COUNT(aid) as count FROM albums GROUP BY label))	music_2
SELECT al.label FROM albums al GROUP BY al.label HAVING COUNT(al.aid) = (SELECT MAX(sub.max_count) FROM (SELECT COUNT(a.aid) AS max_count FROM albums a GROUP BY a.label) sub)	music_2
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT lastname FROM band WHERE id = (SELECT bandmate FROM performance WHERE stageposition = 'back' GROUP BY bandmate ORDER BY COUNT(*) DESC LIMIT 1)	music_2
SELECT lastname FROM band WHERE id IN (SELECT bandmate FROM performance WHERE stageposition = 'back' GROUP BY bandmate ORDER BY COUNT(bandmate) DESC LIMIT 1)	music_2
SELECT * FROM songs WHERE title LIKE '%the%' AND title IS NOT NULL	music_2
SELECT title FROM songs WHERE title LIKE '%the%'	music_2
SELECT DISTINCT instrument FROM Instruments	music_2
SELECT DISTINCT instrument FROM Instruments	music_2
SELECT instrument FROM instruments JOIN band ON instruments.bandmateid = band.id JOIN songs ON instruments.songid = songs.songid WHERE band.lastname = 'Heilo' AND songs.title = 'Le Pop'	music_2
SELECT instrument FROM instruments INNER JOIN band ON instruments.bandmateid = band.id INNER JOIN songs ON instruments.songid = songs.songid WHERE band.lastname = 'Heilo' AND songs.title = 'Le Pop'	music_2
SELECT I.instrument FROM instruments I GROUP BY I.instrument HAVING COUNT(I.instrument) = (SELECT MAX(C.count) FROM (SELECT COUNT(*) AS count FROM instruments GROUP BY instrument) C)	music_2
SELECT instrument FROM instruments GROUP BY instrument HAVING COUNT(*) = (SELECT MAX(ct) FROM (SELECT COUNT(*) as ct FROM instruments GROUP BY instrument) temp_tab)	music_2
SELECT COUNT(DISTINCT songs.songid) FROM songs JOIN instruments ON songs.songid = instruments.songid WHERE instruments.instrument = 'drums'	music_2
SELECT COUNT(DISTINCT songid) FROM instruments WHERE instrument = 'drums'	music_2
SELECT instrument FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Le Pop'	music_2
SELECT instrument FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Le Pop'	music_2
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Le Pop'	music_2
SELECT COUNT(DISTINCT instrument) FROM instruments WHERE songid = (SELECT songid FROM songs WHERE title = 'Le Pop')	music_2
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo'	music_2
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo'	music_2
SELECT instrument FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo'	music_2
SELECT instrument FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo'	music_2
SELECT title FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid GROUP BY T1.songid ORDER BY count(*) DESC LIMIT 1	music_2
SELECT title FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid GROUP BY T1.songid ORDER BY count(*) DESC LIMIT 1	music_2
WITH TypeCount AS (SELECT type, COUNT(*) as cnt FROM vocals GROUP BY type) SELECT type FROM TypeCount WHERE cnt = (SELECT MAX(cnt) FROM TypeCount)	music_2
SELECT type FROM vocals GROUP BY type HAVING COUNT(type) = (SELECT MAX(cnt) FROM (SELECT type, COUNT(*) as cnt FROM vocals GROUP BY type) T)	music_2
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE lastname  =  'Heilo' GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	music_2
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE lastname  =  'Heilo' GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Le Pop'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Le Pop'	music_2
SELECT COUNT(DISTINCT v.type) FROM vocals v JOIN songs s ON v.songid = s.songid WHERE s.title = 'Demon Kitty Rag'	music_2
SELECT type FROM vocals WHERE songid IN (SELECT songid FROM songs WHERE title = 'Demon Kitty Rag')	music_2
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  'lead'	music_2
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  'lead'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.firstname  =  'Solveig' AND T2.title  =  'A Bar In Amsterdam'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.firstname  =  'Solveig' AND T2.title  =  'A Bar In Amsterdam'	music_2
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  'lead'	music_2
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  'lead'	music_2
SELECT type FROM (SELECT type FROM vocals) AS UniqueTypes	music_2
SELECT DISTINCT TYPE FROM vocals	music_2
SELECT * FROM Albums WHERE YEAR  =  2010	music_2
SELECT * FROM Albums WHERE YEAR  =  2010	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Le Pop'	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Le Pop'	music_2
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo' AND T3.title  =  'Badlands'	music_2
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  'Heilo' AND T3.title  =  'Badlands'	music_2
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Badlands'	music_2
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Badlands'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Badlands'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  'Badlands'	music_2
SELECT COUNT(DISTINCT type) FROM vocals JOIN songs ON vocals.songid = songs.songid WHERE songs.title = 'Le Pop'	music_2
SELECT COUNT(DISTINCT v.type) FROM vocals v JOIN songs s ON v.songid = s.songid WHERE s.title = 'Le Pop'	music_2
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  'shared'	music_2
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  'shared'	music_2
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  'back'	music_2
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  'back'	music_2
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  'Solveig' GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	music_2
SELECT type FROM (SELECT type, RANK() OVER (ORDER BY COUNT(*) DESC) as rank FROM vocals JOIN band ON vocals.bandmate = band.id WHERE firstname = 'Solveig' GROUP BY type) WHERE rank = 1	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.lastname  =  'Heilo' AND T2.title  =  'Der Kapitan'	music_2
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.lastname  =  'Heilo' AND T2.title  =  'Der Kapitan'	music_2
SELECT t2.firstname FROM Performance AS t1 JOIN Band AS t2 ON t1.bandmate  =  t2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY firstname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT t2.firstname FROM Performance AS t1 JOIN Band AS t2 ON t1.bandmate  =  t2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY firstname ORDER BY count(*) DESC LIMIT 1	music_2
SELECT v.type FROM vocals v, band b WHERE v.bandmate = b.id AND b.firstname = 'Marianne' GROUP BY v.type HAVING COUNT(v.type) = (SELECT MAX(count) FROM (SELECT COUNT(v.type) count FROM vocals v, band b WHERE v.bandmate = b.id AND b.firstname = 'Marianne' GROUP BY v.type) t)	music_2
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  'Marianne' GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Der Kapitan' AND T1.StagePosition  =  'back'	music_2
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  'Der Kapitan' AND T1.StagePosition  =  'back'	music_2
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  'back'	music_2
SELECT songs.title FROM songs WHERE songid NOT IN (SELECT songid FROM vocals WHERE type = 'back')	music_2
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE T1.title  =  'A Kiss Before You Go: Live in Hamburg'	music_2
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE T1.title  =  'A Kiss Before You Go: Live in Hamburg'	music_2
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.label  =  'Universal Music Group'	music_2
SELECT title FROM songs WHERE songid IN (SELECT songid FROM tracklists WHERE albumid IN (SELECT aid FROM albums WHERE label = 'Universal Music Group'))	music_2
SELECT count(DISTINCT T3.title) FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.type  =  'Studio'	music_2
SELECT COUNT(DISTINCT songid) FROM tracklists WHERE albumid IN (SELECT aid FROM albums WHERE type LIKE 'studio')	music_2
SELECT distinct(founder) FROM manufacturers WHERE name = 'Sony'	manufactory_1
SELECT founder FROM manufacturers WHERE name  =  'Sony'	manufactory_1
SELECT headquarter FROM manufacturers WHERE founder  =  'James'	manufactory_1
SELECT headquarter FROM manufacturers WHERE founder  =  'James'	manufactory_1
SELECT name ,  headquarter FROM manufacturers ORDER BY revenue DESC	manufactory_1
SELECT name ,  headquarter FROM manufacturers ORDER BY revenue DESC	manufactory_1
SELECT avg(revenue) ,  max(revenue) ,  sum(revenue) FROM manufacturers	manufactory_1
SELECT avg(revenue) ,  max(revenue) ,  sum(revenue) FROM manufacturers	manufactory_1
SELECT count(*) FROM manufacturers WHERE founder  =  'Andy'	manufactory_1
SELECT count(*) FROM manufacturers WHERE founder  =  'Andy'	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE headquarter  =  'Austin'	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE headquarter  =  'Austin'	manufactory_1
SELECT DISTINCT headquarter FROM manufacturers	manufactory_1
SELECT DISTINCT headquarter FROM manufacturers	manufactory_1
SELECT count(*) FROM manufacturers WHERE headquarter  =  'Tokyo' OR headquarter  =  'Beijing'	manufactory_1
SELECT count(*) FROM manufacturers WHERE headquarter  =  'Tokyo' OR headquarter  =  'Beijing'	manufactory_1
SELECT founder FROM manufacturers WHERE name LIKE 'S%'	manufactory_1
SELECT founder FROM manufacturers WHERE name LIKE 'S%'	manufactory_1
SELECT name FROM manufacturers WHERE revenue BETWEEN 100 AND 150	manufactory_1
SELECT name FROM manufacturers WHERE revenue BETWEEN 100 AND 150	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE Headquarter  =  'Tokyo' OR Headquarter  =  'Taiwan'	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE Headquarter  =  'Tokyo' OR Headquarter  =  'Taiwan'	manufactory_1
SELECT T1.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code WHERE T2.name  =  'Creative Labs' INTERSECT SELECT T1.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code WHERE T2.name  =  'Sony'	manufactory_1
SELECT T1.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code WHERE T2.name  =  'Creative Labs' INTERSECT SELECT T1.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code WHERE T2.name  =  'Sony'	manufactory_1
SELECT m.name, m.headquarter, m.founder FROM manufacturers m WHERE m.revenue = (SELECT MAX(revenue) FROM manufacturers)	manufactory_1
SELECT name, headquarter, founder FROM manufacturers WHERE revenue = (SELECT MAX(revenue) FROM manufacturers)	manufactory_1
SELECT name ,  headquarter ,  revenue FROM manufacturers ORDER BY revenue DESC	manufactory_1
SELECT name ,  headquarter ,  revenue FROM manufacturers ORDER BY revenue DESC	manufactory_1
SELECT name FROM manufacturers WHERE revenue  >  (SELECT avg(revenue) FROM manufacturers)	manufactory_1
SELECT name FROM manufacturers WHERE revenue  >  (SELECT avg(revenue) FROM manufacturers)	manufactory_1
SELECT name FROM manufacturers m1 WHERE m1.revenue < (SELECT MIN(m2.revenue) FROM manufacturers m2 WHERE m2.headquarter = 'Austin') GROUP BY m1.name	manufactory_1
SELECT name FROM manufacturers WHERE revenue  <  (SELECT min(revenue) FROM manufacturers WHERE headquarter  =  'Austin')	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE revenue  >  (SELECT min(revenue) FROM manufacturers WHERE headquarter  =  'Austin')	manufactory_1
SELECT sum(revenue) FROM manufacturers WHERE revenue  >  (SELECT min(revenue) FROM manufacturers WHERE headquarter  =  'Austin')	manufactory_1
SELECT sum(revenue) ,  founder FROM manufacturers GROUP BY founder	manufactory_1
SELECT SUM(m.revenue) FROM manufacturers m WHERE m.founder = founder;	manufactory_1
SELECT m.name, m.revenue FROM manufacturers m WHERE m.revenue = (SELECT MAX(revenue) FROM manufacturers WHERE headquarter = m.headquarter)	manufactory_1
SELECT m.name, m.revenue FROM manufacturers m WHERE m.revenue = (SELECT MAX(revenue) FROM manufacturers WHERE headquarter = m.headquarter)	manufactory_1
SELECT sum(revenue) ,  name FROM manufacturers GROUP BY name	manufactory_1
SELECT sum(revenue) ,  name FROM manufacturers GROUP BY name	manufactory_1
SELECT m.name, (SELECT AVG(price) FROM products WHERE manufacturer = m.code) FROM manufacturers m	manufactory_1
SELECT avg(T1.price) ,  T2.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code GROUP BY T2.name	manufactory_1
SELECT COUNT(*) FROM (SELECT DISTINCT p.name FROM products p JOIN manufacturers m ON m.code = p.manufacturer GROUP BY m.headquarter)	manufactory_1
SELECT count(DISTINCT T1.name) ,  T2.Headquarter FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code GROUP BY T2.Headquarter	manufactory_1
SELECT COUNT(*) FROM products WHERE manufacturer NOT IN (SELECT code FROM manufacturers WHERE name = 'Sony')	manufactory_1
SELECT COUNT(*) FROM products WHERE manufacturer NOT IN (SELECT code FROM manufacturers WHERE name = 'Sony')	manufactory_1
SELECT DISTINCT m.name FROM manufacturers m WHERE m.code NOT IN (SELECT p.manufacturer FROM products p WHERE p.name = 'DVD drive')	manufactory_1
SELECT name FROM manufacturers WHERE code NOT IN (SELECT manufacturer FROM products WHERE name = 'DVD drive')	manufactory_1
SELECT count(*) ,  T2.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code GROUP BY T2.name	manufactory_1
SELECT count(*) ,  T2.name FROM products AS T1 JOIN manufacturers AS T2 ON T1.Manufacturer  =  T2.code GROUP BY T2.name	manufactory_1
SELECT Name FROM Products	manufactory_1
SELECT Name FROM Products	manufactory_1
SELECT name ,  price FROM products	manufactory_1
SELECT name ,  price FROM products	manufactory_1
SELECT name FROM products WHERE price  <=  200	manufactory_1
SELECT name FROM products WHERE price  <=  200	manufactory_1
SELECT * FROM products WHERE price BETWEEN 60 AND 120	manufactory_1
SELECT * FROM products WHERE price BETWEEN 60 AND 120	manufactory_1
SELECT avg(price) FROM products	manufactory_1
SELECT avg(price) FROM products	manufactory_1
SELECT avg(price) FROM products WHERE Manufacturer  =  2	manufactory_1
SELECT avg(price) FROM products WHERE Manufacturer  =  2	manufactory_1
SELECT count(*) FROM products WHERE price >= 180	manufactory_1
SELECT count(*) FROM products WHERE price >= 180	manufactory_1
SELECT name ,  price FROM products WHERE price  >=  180 ORDER BY price DESC ,  name ASC	manufactory_1
SELECT name ,  price FROM products WHERE price  >=  180 ORDER BY price DESC ,  name ASC	manufactory_1
SELECT products.*, manufacturers.name AS manufacturer_name, manufacturers.founder, manufacturers.headquarter, manufacturers.revenue FROM products JOIN manufacturers ON products.manufacturer = manufacturers.code	manufactory_1
SELECT * FROM products AS T1 JOIN Manufacturers AS T2 ON T1.manufacturer  =  T2.code	manufactory_1
SELECT m.code FROM manufacturers m JOIN products p ON m.code = p.manufacturer GROUP BY m.code HAVING AVG(p.price)	manufactory_1
SELECT AVG(Price) ,  Manufacturer FROM Products GROUP BY Manufacturer	manufactory_1
SELECT M.name, AVG(P.price) FROM products P JOIN manufacturers M ON P.manufacturer = M.code GROUP BY P.manufacturer	manufactory_1
SELECT avg(T1.Price) ,  T2.name FROM products AS T1 JOIN Manufacturers AS T2 ON T1.manufacturer  =  T2.code GROUP BY T2.name	manufactory_1
SELECT name FROM manufacturers WHERE code IN (SELECT manufacturer FROM products GROUP BY manufacturer HAVING AVG(price) >= 150)	manufactory_1
SELECT avg(T1.Price) ,  T2.name FROM products AS T1 JOIN Manufacturers AS T2 ON T1.manufacturer  =  T2.code GROUP BY T2.name HAVING avg(T1.price) >= 150	manufactory_1
SELECT name, price FROM products WHERE price = (SELECT MIN(price) FROM products)	manufactory_1
SELECT p.name, p.price FROM products p WHERE p.price = (SELECT MIN(price) FROM products)	manufactory_1
SELECT manufacturers.name, products.name, products.price FROM manufacturers JOIN products ON manufacturers.code = products.manufacturer WHERE (products.manufacturer, products.price) IN (SELECT manufacturer, MAX(price) FROM products GROUP BY manufacturer)	manufactory_1
SELECT T1.Name ,  max(T1.Price) ,  T2.name FROM products AS T1 JOIN Manufacturers AS T2 ON T1.manufacturer  =  T2.code GROUP BY T2.name	manufactory_1
SELECT p1.code FROM products p1 WHERE p1.price = (SELECT MIN(p2.price) FROM products p2 WHERE p2.name = p1.name)	manufactory_1
SELECT p.code, p.name FROM products p WHERE p.price = (SELECT MIN(price) FROM products WHERE manufacturer = p.manufacturer)	manufactory_1
SELECT problem_log_id FROM problem_log pl WHERE pl.log_entry_date = (SELECT MAX(log_entry_date) FROM problem_log)	tracking_software_problems
SELECT p.problem_log_id FROM problem_log AS p WHERE p.log_entry_date = (SELECT MAX(log_entry_date) FROM problem_log)	tracking_software_problems
SELECT problem_log_id ,  problem_id FROM problem_log ORDER BY log_entry_date LIMIT 1	tracking_software_problems
SELECT problem_log_id ,  problem_id FROM problem_log ORDER BY log_entry_date LIMIT 1	tracking_software_problems
SELECT problem_log_id ,  log_entry_date FROM problem_log WHERE problem_id = 10	tracking_software_problems
SELECT problem_log_id ,  log_entry_date FROM problem_log WHERE problem_id = 10	tracking_software_problems
SELECT problem_log_id ,  log_entry_description FROM problem_log	tracking_software_problems
SELECT problem_log_id ,  log_entry_description FROM problem_log	tracking_software_problems
SELECT DISTINCT staff_first_name ,  staff_last_name FROM staff AS T1 JOIN problem_log AS T2 ON T1.staff_id = T2.assigned_to_staff_id WHERE T2.problem_id = 1	tracking_software_problems
SELECT s.staff_first_name, s.staff_last_name FROM staff s JOIN problem_log pl ON s.staff_id = pl.assigned_to_staff_id WHERE pl.problem_id = 1	tracking_software_problems
SELECT DISTINCT T2.problem_id ,  T2.problem_log_id FROM staff AS T1 JOIN problem_log AS T2 ON T1.staff_id = T2.assigned_to_staff_id WHERE T1.staff_first_name = 'Rylan' AND T1.staff_last_name = 'Homenick'	tracking_software_problems
SELECT DISTINCT T2.problem_id ,  T2.problem_log_id FROM staff AS T1 JOIN problem_log AS T2 ON T1.staff_id = T2.assigned_to_staff_id WHERE T1.staff_first_name = 'Rylan' AND T1.staff_last_name = 'Homenick'	tracking_software_problems
SELECT count(*) FROM product AS T1 JOIN problems AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = 'voluptatem'	tracking_software_problems
SELECT count(*) FROM product AS T1 JOIN problems AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = 'voluptatem'	tracking_software_problems
SELECT count(*) ,  T1.product_name FROM product AS T1 JOIN problems AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_name ORDER BY count(*) DESC LIMIT 1	tracking_software_problems
SELECT count(*) ,  T1.product_name FROM product AS T1 JOIN problems AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_name ORDER BY count(*) DESC LIMIT 1	tracking_software_problems
SELECT T1.problem_description FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Christop'	tracking_software_problems
SELECT T1.problem_description FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Christop'	tracking_software_problems
SELECT T1.problem_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_last_name = 'Bosco'	tracking_software_problems
SELECT T1.problem_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_last_name = 'Bosco'	tracking_software_problems
SELECT problem_id FROM problems WHERE date_problem_reported > '1978-06-26'	tracking_software_problems
SELECT problem_id FROM problems WHERE date_problem_reported > '1978-06-26'	tracking_software_problems
SELECT problem_id FROM problems WHERE date_problem_reported < '1978-06-26'	tracking_software_problems
SELECT problem_id FROM problems WHERE substr(date_problem_reported, 1, 10) < '1978-06-26';	tracking_software_problems
SELECT count(*) ,  T2.product_id FROM problems AS T1 JOIN product AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id	tracking_software_problems
SELECT count(*) ,  T2.product_id FROM problems AS T1 JOIN product AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id	tracking_software_problems
SELECT count(*) ,  T2.product_id FROM problems AS T1 JOIN product AS T2 ON T1.product_id = T2.product_id WHERE T1.date_problem_reported > '1986-11-13' GROUP BY T2.product_id	tracking_software_problems
SELECT distinct p.product_id, COUNT(p.problem_id) AS problem_count FROM problems p WHERE strftime('%Y-%m-%d', p.date_problem_reported) > '1986-11-13' GROUP BY p.product_id	tracking_software_problems
SELECT DISTINCT product_name FROM product ORDER BY product_name	tracking_software_problems
SELECT DISTINCT product_name FROM product ORDER BY product_name	tracking_software_problems
SELECT DISTINCT product_name FROM product ORDER BY product_id	tracking_software_problems
SELECT DISTINCT product_name FROM product ORDER BY product_id	tracking_software_problems
SELECT p.problem_id FROM problems AS p JOIN staff AS s ON p.reported_by_staff_id = s.staff_id WHERE s.staff_first_name = 'Dameon' AND s.staff_last_name = 'Frami' OR s.staff_first_name = 'Jolie' AND s.staff_last_name = 'Weber'	tracking_software_problems
SELECT p.problem_id FROM problems p JOIN staff s ON p.reported_by_staff_id = s.staff_id WHERE (s.staff_first_name = 'Dameon' AND s.staff_last_name = 'Frami') OR (s.staff_first_name = 'Jolie' AND s.staff_last_name = 'Weber')	tracking_software_problems
SELECT product_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Christop' AND T2.staff_last_name = 'Berge' INTERSECT SELECT product_id FROM problems AS T1 JOIN staff AS T2 ON T1.closure_authorised_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Ashley' AND T2.staff_last_name = 'Medhurst'	tracking_software_problems
SELECT product_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Christop' AND T2.staff_last_name = 'Berge' INTERSECT SELECT product_id FROM problems AS T1 JOIN staff AS T2 ON T1.closure_authorised_by_staff_id = T2.staff_id WHERE T2.staff_first_name = 'Ashley' AND T2.staff_last_name = 'Medhurst'	tracking_software_problems
SELECT T1.problem_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE date_problem_reported  <  ( SELECT min(date_problem_reported) FROM problems AS T3 JOIN staff AS T4 ON T3.reported_by_staff_id = T4.staff_id WHERE T4.staff_first_name = 'Lysanne' AND T4.staff_last_name = 'Turcotte' )	tracking_software_problems
SELECT T1.problem_id FROM problems AS T1 JOIN staff AS T2 ON T1.reported_by_staff_id = T2.staff_id WHERE date_problem_reported  <  ( SELECT min(date_problem_reported) FROM problems AS T3 JOIN staff AS T4 ON T3.reported_by_staff_id = T4.staff_id WHERE T4.staff_first_name = 'Lysanne' AND T4.staff_last_name = 'Turcotte' )	tracking_software_problems
SELECT p.problem_id FROM problems p WHERE p.date_problem_reported > (SELECT MIN(pr.date_problem_reported) FROM problems pr JOIN staff s ON pr.reported_by_staff_id = s.staff_id WHERE s.staff_first_name = 'Rylan' AND s.staff_last_name = 'Homenick') AND p.reported_by_staff_id != (SELECT staff_id FROM staff WHERE staff_first_name = 'Rylan' AND staff_last_name = 'Homenick')	tracking_software_problems
SELECT p.problem_id FROM problems p WHERE p.date_problem_reported > (SELECT date_problem_reported FROM (SELECT MIN(date_problem_reported) AS earliest_date FROM problems INNER JOIN staff ON reported_by_staff_id = staff.staff_id WHERE staff_first_name = 'Rylan' AND staff_last_name = 'Homenick') AS earliest_report)	tracking_software_problems
SELECT product_name FROM product WHERE product_id IN (SELECT product_id FROM problems GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 3)	tracking_software_problems
SELECT T2.product_name FROM problems AS T1 JOIN product AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_name ORDER BY count(*) DESC LIMIT 3	tracking_software_problems
SELECT pr.problem_id FROM problems pr JOIN product pd ON pr.product_id = pd.product_id WHERE pd.product_name = 'voluptatem' AND pr.date_problem_reported > '1995-01-01'	tracking_software_problems
SELECT p.problem_id FROM problems p INNER JOIN product pr ON p.product_id = pr.product_id WHERE pr.product_name = 'voluptatem' AND strftime('%Y', p.date_problem_reported) > '1995'	tracking_software_problems
SELECT T3.staff_first_name ,  T3.staff_last_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T2.product_name = 'rem' EXCEPT SELECT T3.staff_first_name ,  T3.staff_last_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T2.product_name = 'aut'	tracking_software_problems
SELECT T3.staff_first_name ,  T3.staff_last_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T2.product_name = 'rem' EXCEPT SELECT T3.staff_first_name ,  T3.staff_last_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T2.product_name = 'aut'	tracking_software_problems
SELECT T2.product_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T3.staff_first_name = 'Lacey' AND T3.staff_last_name = 'Bosco' INTERSECT SELECT T2.product_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T3.staff_first_name = 'Kenton' AND T3.staff_last_name = 'Champlin'	tracking_software_problems
SELECT T2.product_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T3.staff_first_name = 'Lacey' AND T3.staff_last_name = 'Bosco' INTERSECT SELECT T2.product_name FROM problems AS T1 JOIN product AS T2 JOIN staff AS T3 ON T1.product_id = T2.product_id AND T1.reported_by_staff_id = T3.staff_id WHERE T3.staff_first_name = 'Kenton' AND T3.staff_last_name = 'Champlin'	tracking_software_problems
SELECT count(*) FROM branch WHERE membership_amount  >  (SELECT avg(membership_amount) FROM branch)	shop_membership
SELECT count(*) FROM branch WHERE membership_amount  >  (SELECT avg(membership_amount) FROM branch)	shop_membership
SELECT name ,  address_road ,  city FROM branch ORDER BY open_year	shop_membership
SELECT name ,  address_road ,  city FROM branch ORDER BY open_year	shop_membership
WITH RankedBranches AS (SELECT branch_id, RANK() OVER (ORDER BY COUNT(member_id) DESC) AS rank FROM membership_register_branch GROUP BY branch_id) SELECT branch.name FROM branch JOIN RankedBranches ON branch.branch_id = RankedBranches.branch_id WHERE RankedBranches.rank <= 3	shop_membership
SELECT b.name FROM branch AS B WHERE EXISTS (SELECT NULL FROM membership_register_branch AS M WHERE M.branch_id = B.branch_id GROUP BY M.branch_id ORDER BY COUNT(M.member_id) DESC LIMIT 3)	shop_membership
SELECT DISTINCT b.city FROM branch b JOIN membership_register_branch m ON b.branch_id = m.branch_id GROUP BY b.city HAVING COUNT(m.member_id) >= 100	shop_membership
SELECT city FROM branch GROUP BY city HAVING SUM(membership_amount) > 100	shop_membership
SELECT open_year FROM branch GROUP BY open_year HAVING count(*)  >=  2	shop_membership
SELECT open_year FROM branch GROUP BY open_year HAVING count(*)  >=  2	shop_membership
SELECT min(membership_amount) ,  max(membership_amount) FROM branch WHERE open_year  =  2011 OR city  =  'London'	shop_membership
SELECT min(membership_amount) ,  max(membership_amount) FROM branch WHERE open_year  =  2011 OR city  =  'London'	shop_membership
SELECT city ,  count(*) FROM branch WHERE open_year  <  2010 GROUP BY city	shop_membership
SELECT city ,  count(*) FROM branch WHERE open_year  <  2010 GROUP BY city	shop_membership
SELECT count(DISTINCT LEVEL) FROM member	shop_membership
SELECT DISTINCT level FROM member	shop_membership
SELECT card_number ,  name ,  hometown FROM member ORDER BY LEVEL DESC	shop_membership
SELECT card_number ,  name ,  hometown FROM member ORDER BY LEVEL DESC	shop_membership
SELECT level FROM member GROUP BY level HAVING COUNT(member_id) = (SELECT MAX(count) FROM (SELECT COUNT(member_id) AS count FROM member GROUP BY level))	shop_membership
SELECT LEVEL FROM member GROUP BY LEVEL ORDER BY count(*) DESC LIMIT 1	shop_membership
SELECT m.name, b.name FROM (SELECT member_id, branch_id, register_year FROM membership_register_branch ORDER BY register_year) AS sorted, member m, branch b WHERE sorted.member_id = m.member_id AND sorted.branch_id = b.branch_id	shop_membership
SELECT T3.name ,  T2.name FROM membership_register_branch AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id JOIN member AS T3 ON T1.member_id  =  T3.member_id ORDER BY T1.register_year	shop_membership
SELECT T2.name ,  count(*) FROM membership_register_branch AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id WHERE T1.register_year  >  2015 GROUP BY T2.branch_id	shop_membership
SELECT DISTINCT branch.name FROM branch, membership_register_branch WHERE branch.branch_id = membership_register_branch.branch_id AND membership_register_branch.register_year > 2015	shop_membership
SELECT name FROM member WHERE member_id NOT IN (SELECT member_id FROM membership_register_branch)	shop_membership
SELECT name FROM member WHERE member_id NOT IN (SELECT member_id FROM membership_register_branch)	shop_membership
SELECT name ,  city FROM branch WHERE branch_id NOT IN (SELECT branch_id FROM membership_register_branch)	shop_membership
SELECT name ,  city FROM branch WHERE branch_id NOT IN (SELECT branch_id FROM membership_register_branch)	shop_membership
SELECT b.name, b.open_year FROM branch b WHERE EXISTS (SELECT 1 FROM membership_register_branch mr WHERE mr.branch_id = b.branch_id AND mr.register_year = 2016 GROUP BY mr.branch_id HAVING COUNT(mr.member_id) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM membership_register_branch WHERE register_year = 2016 GROUP BY branch_id) AS counts))	shop_membership
WITH RankedBranches AS (SELECT branch_id, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM membership_register_branch WHERE register_year = 2016 GROUP BY branch_id) SELECT b.name, b.open_year FROM branch b JOIN RankedBranches rb ON b.branch_id = rb.branch_id WHERE rb.rank = 1	shop_membership
SELECT T2.name ,  T2.hometown FROM membership_register_branch AS T1 JOIN member AS T2 ON T1.member_id  =  T2.member_id WHERE T1.register_year  =  2016	shop_membership
SELECT T2.name ,  T2.hometown FROM membership_register_branch AS T1 JOIN member AS T2 ON T1.member_id  =  T2.member_id WHERE T1.register_year  =  2016	shop_membership
SELECT city FROM branch b WHERE b.open_year = 2001 AND (SELECT SUM(membership_amount) FROM branch b2 WHERE b2.city = b.city) > 100	shop_membership
SELECT DISTINCT B.city FROM branch B WHERE B.open_year = 2001 AND EXISTS (SELECT 1 FROM membership_register_branch MRB WHERE MRB.branch_id = B.branch_id GROUP BY MRB.branch_id HAVING COUNT(MRB.member_id) > 100)	shop_membership
SELECT city FROM branch WHERE branch_id NOT IN (SELECT branch_id FROM membership_register_branch GROUP BY branch_id HAVING COUNT(member_id) > 100)	shop_membership
SELECT DISTINCT b1.city FROM branch b1 LEFT JOIN (SELECT b2.city, COUNT(mrb.member_id) AS members_count FROM branch b2 JOIN membership_register_branch mrb ON b2.branch_id = mrb.branch_id GROUP BY b2.branch_id HAVING members_count > 100) b_limited ON b1.city = b_limited.city WHERE b_limited.city IS NULL	shop_membership
SELECT sum(total_pounds) FROM purchase AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id WHERE T2.city  =  'London' AND T1.year  =  2018	shop_membership
SELECT sum(total_pounds) FROM purchase AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id WHERE T2.city  =  'London' AND T1.year  =  2018	shop_membership
SELECT count(*) FROM purchase AS T1 JOIN member AS T2 ON T1.member_id  =  T2.member_id WHERE T2.level  =  6	shop_membership
SELECT SUM(total_pounds) FROM purchase WHERE member_id IN (SELECT member_id FROM member WHERE level = 6)	shop_membership
SELECT T2.name FROM membership_register_branch AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id JOIN member AS T3 ON T1.member_id  =  T3.member_id WHERE T3.Hometown  =  'Louisville ,  Kentucky' INTERSECT SELECT T2.name FROM membership_register_branch AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id JOIN member AS T3 ON T1.member_id  =  T3.member_id WHERE T3.Hometown  =  'Hiram ,  Georgia'	shop_membership
SELECT b.name FROM branch b WHERE EXISTS (SELECT 1 FROM membership_register_branch mrb JOIN member m ON mrb.member_id = m.member_id WHERE mrb.branch_id = b.branch_id AND m.hometown IN ('Louisville, Kentucky', 'Hiram, Georgia'))	shop_membership
SELECT card_number FROM member WHERE Hometown LIKE '%Kentucky%'	shop_membership
SELECT card_number FROM member WHERE hometown = 'Kentucky'	shop_membership
SELECT count(*) FROM STUDENT	voter_2
SELECT count(*) FROM STUDENT	voter_2
SELECT count(*) FROM VOTING_RECORD	voter_2
SELECT count(*) FROM VOTING_RECORD	voter_2
SELECT count(DISTINCT President_Vote) FROM VOTING_RECORD	voter_2
SELECT count(DISTINCT President_Vote) FROM VOTING_RECORD	voter_2
SELECT max(Age) FROM STUDENT	voter_2
SELECT max(Age) FROM STUDENT	voter_2
SELECT LName FROM STUDENT WHERE Major  =  50	voter_2
SELECT LName FROM STUDENT WHERE Major  =  50	voter_2
SELECT Fname FROM STUDENT WHERE Age  >  22	voter_2
SELECT Fname FROM STUDENT WHERE Age  >  22	voter_2
SELECT Major FROM STUDENT WHERE Sex  =  'M'	voter_2
SELECT Major FROM STUDENT WHERE Sex  =  'M'	voter_2
SELECT avg(Age) FROM STUDENT WHERE Sex  =  'F'	voter_2
SELECT avg(Age) FROM STUDENT WHERE Sex  =  'F'	voter_2
SELECT max(Age) ,  min(Age) FROM STUDENT WHERE Major  =  600	voter_2
SELECT max(Age) ,  min(Age) FROM STUDENT WHERE Major  =  600	voter_2
SELECT Advisor FROM STUDENT WHERE city_code  =  'BAL'	voter_2
SELECT Advisor FROM STUDENT WHERE city_code  =  'BAL'	voter_2
SELECT DISTINCT Secretary_Vote FROM VOTING_RECORD WHERE ELECTION_CYCLE  =  'Fall'	voter_2
SELECT DISTINCT Secretary_Vote FROM VOTING_RECORD WHERE ELECTION_CYCLE  =  'Fall'	voter_2
SELECT DISTINCT PRESIDENT_Vote FROM VOTING_RECORD WHERE Registration_Date  =  '08/30/2015'	voter_2
SELECT DISTINCT PRESIDENT_Vote FROM VOTING_RECORD WHERE Registration_Date  =  '08/30/2015'	voter_2
SELECT DISTINCT Registration_Date ,  Election_Cycle FROM VOTING_RECORD	voter_2
SELECT DISTINCT Registration_Date ,  Election_Cycle FROM VOTING_RECORD	voter_2
SELECT DISTINCT President_Vote ,  VICE_President_Vote FROM VOTING_RECORD	voter_2
SELECT DISTINCT President_Vote ,  VICE_President_Vote FROM VOTING_RECORD	voter_2
SELECT DISTINCT T1.LName FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.CLASS_President_VOTE	voter_2
SELECT DISTINCT T1.LName FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.CLASS_President_VOTE	voter_2
SELECT DISTINCT T1.Fname FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.CLASS_Senator_VOTE	voter_2
SELECT DISTINCT s.fname FROM student s JOIN voting_record vr ON s.stuid = vr.class_president_vote	voter_2
SELECT DISTINCT T1.Age FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Secretary_Vote WHERE T2.Election_Cycle  =  'Fall'	voter_2
SELECT DISTINCT T1.Age FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Secretary_Vote WHERE T2.Election_Cycle  =  'Fall'	voter_2
SELECT DISTINCT T1.Advisor FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Treasurer_Vote WHERE T2.Election_Cycle  =  'Spring'	voter_2
SELECT DISTINCT T1.Advisor FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Treasurer_Vote WHERE T2.Election_Cycle  =  'Spring'	voter_2
SELECT DISTINCT T1.Major FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Treasurer_Vote	voter_2
SELECT DISTINCT T1.Major FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.Treasurer_Vote	voter_2
SELECT fname, lname FROM student WHERE stuid IN (SELECT president_vote FROM voting_record) AND sex = 'F'	voter_2
SELECT DISTINCT T1.Fname ,  T1.LName FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.President_VOTE WHERE T1.sex  =  'F'	voter_2
SELECT fname, lname FROM student WHERE (age = 18) AND (stuid IN (SELECT vice_president_vote FROM voting_record WHERE stuid = vice_president_vote))	voter_2
SELECT fname, lname FROM student WHERE stuid IN (SELECT vice_president_vote FROM voting_record) AND age = 18	voter_2
SELECT COUNT(DISTINCT vr.class_senator_vote) FROM voting_record vr JOIN student s ON vr.class_senator_vote = s.stuid WHERE s.sex = 'M' AND vr.election_cycle = 'Fall'	voter_2
SELECT count(*) FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  Class_Senator_Vote WHERE T1.Sex  =  'M' AND T2.Election_Cycle  =  'Fall'	voter_2
SELECT COUNT(DISTINCT vr.class_senator_vote) FROM voting_record vr JOIN student s ON vr.class_senator_vote = s.stuid WHERE s.city_code = 'NYC' AND vr.election_cycle = 'Spring'	voter_2
SELECT COUNT(DISTINCT s.stuid) FROM student s INNER JOIN voting_record v ON s.stuid = v.class_senator_vote WHERE s.city_code = 'NYC' AND v.election_cycle = 'Spring'	voter_2
SELECT avg(T1.Age) FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  SECRETARY_Vote WHERE T1.city_code  =  'NYC' AND T2.Election_Cycle  =  'Spring'	voter_2
SELECT avg(T1.Age) FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  SECRETARY_Vote WHERE T1.city_code  =  'NYC' AND T2.Election_Cycle  =  'Spring'	voter_2
SELECT AVG(age) FROM student WHERE stuid IN (SELECT secretary_vote FROM voting_record WHERE election_cycle = 'Spring') AND sex = 'F'	voter_2
SELECT avg(T1.Age) FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  SECRETARY_Vote WHERE T1.Sex  =  'F' AND T2.Election_Cycle  =  'Spring'	voter_2
SELECT DISTINCT s.fname FROM student s JOIN voting_record vr ON s.stuid = vr.vice_president_vote WHERE s.city_code != 'PIT'	voter_2
SELECT DISTINCT T1.Fname FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  T2.VICE_PRESIDENT_Vote EXCEPT SELECT DISTINCT Fname FROM STUDENT WHERE city_code  =  'PIT'	voter_2
SELECT DISTINCT T1.LName FROM STUDENT AS T1 JOIN VOTING_RECORD AS T2 ON T1.StuID  =  PRESIDENT_Vote EXCEPT SELECT DISTINCT LName FROM STUDENT WHERE Advisor  =  '2192'	voter_2
SELECT DISTINCT s.lname FROM student s JOIN voting_record v ON s.stuid = v.president_vote WHERE s.advisor != 2192	voter_2
SELECT DISTINCT s.lname FROM student s JOIN voting_record v ON s.stuid = v.president_vote WHERE s.advisor = 8741	voter_2
SELECT DISTINCT s.lname FROM student s JOIN voting_record vr ON s.stuid = vr.president_vote WHERE s.advisor = 8741	voter_2
SELECT Advisor ,  count(*) FROM STUDENT GROUP BY Advisor	voter_2
SELECT Advisor ,  count(*) FROM STUDENT GROUP BY Advisor	voter_2
SELECT Advisor FROM STUDENT GROUP BY Advisor HAVING COUNT(*)  >  2	voter_2
SELECT Advisor FROM STUDENT GROUP BY Advisor HAVING COUNT(*)  >  2	voter_2
SELECT Major FROM STUDENT GROUP BY Major HAVING COUNT(*)  <  3	voter_2
SELECT Major FROM STUDENT GROUP BY Major HAVING COUNT(*)  <  3	voter_2
SELECT Election_Cycle ,  count(*) FROM VOTING_RECORD GROUP BY Election_Cycle	voter_2
SELECT Election_Cycle ,  count(*) FROM VOTING_RECORD GROUP BY Election_Cycle	voter_2
WITH MajorCounts AS (SELECT major, COUNT(stuid) AS count FROM student GROUP BY major) SELECT major FROM MajorCounts WHERE count = (SELECT MAX(count) FROM MajorCounts)	voter_2
SELECT major FROM student GROUP BY major HAVING COUNT(stuid) = (SELECT MAX(count) FROM (SELECT COUNT(stuid) AS count FROM student GROUP BY major))	voter_2
SELECT major FROM student WHERE sex = 'F' GROUP BY major HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM student WHERE sex = 'F' GROUP BY major))	voter_2
SELECT Major FROM STUDENT WHERE Sex  =  'F' GROUP BY major ORDER BY count(*) DESC LIMIT 1	voter_2
SELECT city_code FROM STUDENT GROUP BY city_code ORDER BY count(*) DESC LIMIT 1	voter_2
SELECT S.city_code FROM student S GROUP BY S.city_code HAVING COUNT(S.stuid) = (SELECT MAX(total) FROM (SELECT COUNT(stuid) AS total FROM student GROUP BY city_code) Temp)	voter_2
SELECT Advisor FROM STUDENT GROUP BY Advisor HAVING count(*)  >  2	voter_2
SELECT Advisor FROM STUDENT GROUP BY Advisor HAVING count(*)  >  2	voter_2
SELECT count(*) FROM products	products_gen_characteristics
SELECT count(*) FROM products	products_gen_characteristics
SELECT count(*) FROM ref_colors	products_gen_characteristics
SELECT count(*) FROM ref_colors	products_gen_characteristics
SELECT count(*) FROM CHARACTERISTICS	products_gen_characteristics
SELECT count(*) FROM CHARACTERISTICS	products_gen_characteristics
SELECT product_name ,  typical_buying_price FROM products	products_gen_characteristics
SELECT product_name ,  typical_buying_price FROM products	products_gen_characteristics
SELECT color_description FROM ref_colors	products_gen_characteristics
SELECT color_description FROM ref_colors	products_gen_characteristics
SELECT characteristic_name FROM characteristics WHERE characteristic_id IN (SELECT characteristic_id FROM product_characteristics)	products_gen_characteristics
SELECT DISTINCT characteristic_name FROM characteristics c WHERE EXISTS (SELECT 1 FROM product_characteristics pc WHERE pc.characteristic_id = c.characteristic_id);	products_gen_characteristics
SELECT product_name FROM products WHERE product_category_code  =  'Spices'	products_gen_characteristics
SELECT product_name FROM products WHERE product_category_code  =  'Spices'	products_gen_characteristics
SELECT products.product_name, ref_colors.color_description, products.product_description FROM products JOIN ref_colors ON products.color_code = ref_colors.color_code JOIN ref_product_categories ON products.product_category_code = ref_product_categories.product_category_code WHERE ref_product_categories.product_category_description = 'Herbs'	products_gen_characteristics
SELECT product_name, color_description, product_description FROM products JOIN ref_colors USING (color_code) JOIN ref_product_categories ON products.product_category_code = ref_product_categories.product_category_code WHERE product_category_description = 'Herbs'	products_gen_characteristics
SELECT COUNT(p.product_id) FROM products p JOIN ref_product_categories rpc ON p.product_category_code = rpc.product_category_code WHERE rpc.product_category_description = 'Seeds'	products_gen_characteristics
SELECT COUNT(*) FROM products INNER JOIN ref_product_categories ON products.product_category_code = ref_product_categories.product_category_code WHERE ref_product_categories.product_category_description = 'Seeds'	products_gen_characteristics
SELECT COUNT(*) FROM products WHERE product_category_code = 'Spices' AND typical_selling_price > 1000	products_gen_characteristics
SELECT COUNT(*) FROM products WHERE product_category_code = 'Spices' AND typical_selling_price > 1000	products_gen_characteristics
SELECT products.typical_buying_price, ref_product_categories.product_category_description FROM products INNER JOIN ref_product_categories ON products.product_category_code = ref_product_categories.product_category_code WHERE products.product_name = 'cumin';	products_gen_characteristics
SELECT p.product_category_code, p.typical_selling_price FROM products p WHERE p.product_name = 'cumin'	products_gen_characteristics
SELECT rpc.product_category_description FROM products p JOIN ref_product_categories rpc ON p.product_category_code = rpc.product_category_code WHERE p.product_name = 'flax'	products_gen_characteristics
SELECT product_category_code FROM products WHERE product_name  =  'flax'	products_gen_characteristics
SELECT T1.product_name FROM products AS T1 JOIN ref_colors AS T2 ON T1.color_code  =  T2.color_code WHERE T2.color_description  =  'yellow'	products_gen_characteristics
SELECT T1.product_name FROM products AS T1 JOIN ref_colors AS T2 ON T1.color_code  =  T2.color_code WHERE T2.color_description  =  'yellow'	products_gen_characteristics
SELECT DISTINCT rpc.product_category_description FROM products p JOIN ref_product_categories rpc ON p.product_category_code = rpc.product_category_code WHERE p.product_description LIKE '%t%'	products_gen_characteristics
SELECT DISTINCT rpc.product_category_description FROM products p JOIN ref_product_categories rpc ON p.product_category_code = rpc.product_category_code WHERE p.product_description LIKE '%t%'	products_gen_characteristics
SELECT t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t1.product_name  =  'catnip'	products_gen_characteristics
SELECT color_description FROM ref_colors WHERE color_code IN (SELECT color_code FROM products WHERE product_name = 'catnip')	products_gen_characteristics
SELECT t1.color_code ,  t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t1.product_name  =  'chervil'	products_gen_characteristics
SELECT t1.color_code ,  t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t1.product_name  =  'chervil'	products_gen_characteristics
SELECT t1.product_id ,  t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code JOIN product_characteristics AS t3 ON t1.product_id  =  t3.product_id GROUP BY t1.product_id HAVING count(*)  >=  2	products_gen_characteristics
SELECT t1.product_id ,  t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code JOIN product_characteristics AS t3 ON t1.product_id  =  t3.product_id GROUP BY t1.product_id HAVING count(*)  >=  2	products_gen_characteristics
SELECT t1.product_name FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t2.color_description  =  'white'	products_gen_characteristics
SELECT t1.product_name FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t2.color_description  =  'white'	products_gen_characteristics
SELECT t1.product_name ,  t1.typical_buying_price ,  t1.typical_selling_price FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t2.color_description  =  'yellow'	products_gen_characteristics
SELECT t1.product_name ,  t1.typical_buying_price ,  t1.typical_selling_price FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code WHERE t2.color_description  =  'yellow'	products_gen_characteristics
SELECT COUNT(DISTINCT pc.characteristic_id) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id WHERE p.product_name = 'sesame'	products_gen_characteristics
SELECT COUNT(DISTINCT pc.characteristic_id) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id WHERE p.product_name = 'sesame'	products_gen_characteristics
SELECT COUNT(DISTINCT c.characteristic_name) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id JOIN characteristics c ON pc.characteristic_id = c.characteristic_id WHERE p.product_name = 'cumin'	products_gen_characteristics
SELECT COUNT(DISTINCT characteristics.characteristic_name) FROM characteristics JOIN product_characteristics ON product_characteristics.characteristic_id = characteristics.characteristic_id JOIN products ON products.product_id = product_characteristics.product_id WHERE products.product_name = 'cumin'	products_gen_characteristics
SELECT t3.characteristic_name FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t1.product_name  =  'sesame'	products_gen_characteristics
SELECT t3.characteristic_name FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t1.product_name  =  'sesame'	products_gen_characteristics
SELECT t3.characteristic_name ,  t3.characteristic_data_type FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t1.product_name  =  'cumin'	products_gen_characteristics
SELECT t3.characteristic_name ,  t3.characteristic_data_type FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t1.product_name  =  'cumin'	products_gen_characteristics
SELECT pc.product_characteristic_value FROM product_characteristics pc JOIN products p ON pc.product_id = p.product_id JOIN characteristics c ON pc.characteristic_id = c.characteristic_id JOIN ref_characteristic_types rct ON c.characteristic_type_code = rct.characteristic_type_code WHERE p.product_name = 'sesame' AND rct.characteristic_type_code = 'Grade'	products_gen_characteristics
SELECT c.characteristic_name FROM characteristics c WHERE EXISTS (SELECT * FROM product_characteristics pc JOIN products p ON pc.product_id = p.product_id WHERE p.product_name = 'sesame' AND pc.characteristic_id = c.characteristic_id AND c.characteristic_type_code = 'Grade')	products_gen_characteristics
SELECT count(*) FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t1.product_name  =  'laurel'	products_gen_characteristics
SELECT COUNT(DISTINCT c.characteristic_id) FROM characteristics c, product_characteristics pc, products p WHERE c.characteristic_id = pc.characteristic_id AND pc.product_id = p.product_id AND p.product_name = 'laurel'	products_gen_characteristics
SELECT COUNT(DISTINCT pc.characteristic_id) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id WHERE p.product_name = 'flax'	products_gen_characteristics
SELECT COUNT(DISTINCT pc.characteristic_id) FROM product_characteristics AS pc JOIN products AS p ON pc.product_id = p.product_id WHERE p.product_name = 'flax'	products_gen_characteristics
SELECT product_name FROM products WHERE product_id IN (SELECT product_id FROM product_characteristics WHERE characteristic_id = (SELECT characteristic_id FROM characteristics WHERE characteristic_name = 'fast')) AND color_code IN (SELECT color_code FROM ref_colors WHERE color_description = 'red')	products_gen_characteristics
SELECT p.product_name FROM products p WHERE EXISTS (SELECT 1 FROM ref_colors c WHERE c.color_code = p.color_code AND c.color_description = 'red') AND EXISTS (SELECT 1 FROM product_characteristics pc JOIN characteristics ch ON pc.characteristic_id = ch.characteristic_id WHERE pc.product_id = p.product_id AND ch.characteristic_name = 'fast')	products_gen_characteristics
SELECT COUNT(DISTINCT p.product_id) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id JOIN characteristics c ON pc.characteristic_id = c.characteristic_id WHERE c.characteristic_name = 'hot'	products_gen_characteristics
SELECT COUNT(DISTINCT p.product_id) FROM products p JOIN product_characteristics pc ON p.product_id = pc.product_id JOIN characteristics c ON pc.characteristic_id = c.characteristic_id WHERE c.characteristic_name = 'hot'	products_gen_characteristics
SELECT DISTINCT t1.product_name FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t3.characteristic_name  =  'warm'	products_gen_characteristics
SELECT DISTINCT t1.product_name FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id WHERE t3.characteristic_name  =  'warm'	products_gen_characteristics
SELECT COUNT(DISTINCT p.product_id) FROM products p JOIN ref_colors rc ON p.color_code = rc.color_code JOIN product_characteristics pc ON p.product_id = pc.product_id JOIN characteristics c ON pc.characteristic_id = c.characteristic_id WHERE rc.color_description = 'red' AND c.characteristic_name = 'slow'	products_gen_characteristics
SELECT COUNT(DISTINCT products.product_id) FROM products JOIN ref_colors ON products.color_code = ref_colors.color_code JOIN product_characteristics ON products.product_id = product_characteristics.product_id JOIN characteristics ON product_characteristics.characteristic_id = characteristics.characteristic_id WHERE ref_colors.color_description = 'red' AND characteristics.characteristic_name = 'slow'	products_gen_characteristics
SELECT COUNT(DISTINCT product_id) FROM (SELECT p.product_id FROM products p INNER JOIN ref_colors rc ON p.color_code = rc.color_code WHERE rc.color_description = 'white' UNION SELECT p.product_id FROM products p INNER JOIN product_characteristics pc ON p.product_id = pc.product_id INNER JOIN characteristics c ON pc.characteristic_id = c.characteristic_id WHERE c.characteristic_name = 'hot')	products_gen_characteristics
SELECT COUNT(DISTINCT product_id) FROM products WHERE color_code IN (SELECT color_code FROM ref_colors WHERE color_description = 'white') OR product_id IN (SELECT product_id FROM product_characteristics WHERE characteristic_id IN (SELECT characteristic_id FROM characteristics WHERE characteristic_name = 'hot'))	products_gen_characteristics
SELECT unit_of_measure FROM ref_product_categories WHERE product_category_code  =  'Herbs'	products_gen_characteristics
SELECT unit_of_measure FROM ref_product_categories WHERE product_category_code  =  'Herbs'	products_gen_characteristics
SELECT product_category_description FROM ref_product_categories WHERE product_category_code  =  'Spices'	products_gen_characteristics
SELECT product_category_description FROM ref_product_categories WHERE product_category_code  =  'Spices'	products_gen_characteristics
SELECT product_category_description ,  unit_of_measure FROM ref_product_categories WHERE product_category_code  =  'Herbs'	products_gen_characteristics
SELECT product_category_description ,  unit_of_measure FROM ref_product_categories WHERE product_category_code  =  'Herbs'	products_gen_characteristics
SELECT t2.unit_of_measure FROM products AS t1 JOIN ref_product_categories AS t2 ON t1.product_category_code  =  t2.product_category_code WHERE t1.product_name  =  'cumin'	products_gen_characteristics
SELECT t2.unit_of_measure FROM products AS t1 JOIN ref_product_categories AS t2 ON t1.product_category_code  =  t2.product_category_code WHERE t1.product_name  =  'cumin'	products_gen_characteristics
SELECT t2.unit_of_measure ,  t2.product_category_code FROM products AS t1 JOIN ref_product_categories AS t2 ON t1.product_category_code  =  t2.product_category_code WHERE t1.product_name  =  'chervil'	products_gen_characteristics
SELECT t2.unit_of_measure ,  t2.product_category_code FROM products AS t1 JOIN ref_product_categories AS t2 ON t1.product_category_code  =  t2.product_category_code WHERE t1.product_name  =  'chervil'	products_gen_characteristics
SELECT t1.product_name FROM products AS t1 JOIN ref_product_categories AS t2 ON t1.product_category_code  =  t2.product_category_code JOIN ref_colors AS t3 ON t1.color_code  =  t3.color_code WHERE t3.color_description  =  'white' AND t2.unit_of_measure != 'Handful'	products_gen_characteristics
SELECT product_name FROM products WHERE color_code IN (SELECT color_code FROM ref_colors WHERE color_description <> 'white') AND product_category_code IN (SELECT product_category_code FROM ref_product_categories WHERE unit_of_measure <> 'Handful')	products_gen_characteristics
SELECT t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code GROUP BY t2.color_description ORDER BY count(*) DESC LIMIT 1	products_gen_characteristics
SELECT t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code GROUP BY t2.color_description ORDER BY count(*) DESC LIMIT 1	products_gen_characteristics
SELECT rc.color_description FROM ref_colors AS rc JOIN (SELECT color_code FROM products GROUP BY color_code HAVING COUNT(product_id) = (SELECT MIN(prodcnt) FROM (SELECT color_code, COUNT(product_id) AS prodcnt FROM products GROUP BY color_code) contable)) AS pc ON pc.color_code = rc.color_code	products_gen_characteristics
SELECT t2.color_description FROM products AS t1 JOIN ref_colors AS t2 ON t1.color_code  =  t2.color_code GROUP BY t2.color_description ORDER BY count(*) ASC LIMIT 1	products_gen_characteristics
SELECT ch.characteristic_name FROM characteristics AS ch WHERE ch.characteristic_id IN (SELECT pch.characteristic_id FROM product_characteristics AS pch GROUP BY pch.characteristic_id HAVING COUNT(pch.product_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(product_id) AS cnt FROM product_characteristics GROUP BY characteristic_id)))	products_gen_characteristics
WITH CharCount AS ( SELECT characteristic_id, COUNT(*) as num FROM product_characteristics GROUP BY characteristic_id ) SELECT ch.characteristic_name FROM characteristics as ch JOIN CharCount ON ch.characteristic_id = CharCount.characteristic_id WHERE CharCount.num = (SELECT MAX(num) FROM CharCount)	products_gen_characteristics
SELECT c.characteristic_name, c.other_characteristic_details, c.characteristic_data_type FROM characteristics c LEFT JOIN product_characteristics pc ON c.characteristic_id = pc.characteristic_id WHERE pc.product_id IS NULL	products_gen_characteristics
SELECT ch.characteristic_name, ch.other_characteristic_details, ch.characteristic_data_type FROM characteristics ch WHERE NOT EXISTS (SELECT 1 FROM product_characteristics pc WHERE pc.characteristic_id = ch.characteristic_id)	products_gen_characteristics
SELECT t3.characteristic_name FROM products AS t1 JOIN product_characteristics AS t2 ON t1.product_id  =  t2.product_id JOIN CHARACTERISTICS AS t3 ON t2.characteristic_id  =  t3.characteristic_id GROUP BY t3.characteristic_name HAVING count(*)  >= 2	products_gen_characteristics
SELECT DISTINCT c.characteristic_name FROM characteristics c JOIN (SELECT characteristic_id FROM product_characteristics GROUP BY characteristic_id HAVING COUNT(DISTincT product_id) >= 2) pc ON c.characteristic_id = pc.characteristic_id	products_gen_characteristics
SELECT count(*) FROM Ref_colors WHERE color_code NOT IN ( SELECT color_code FROM products )	products_gen_characteristics
SELECT count(*) FROM Ref_colors WHERE color_code NOT IN ( SELECT color_code FROM products )	products_gen_characteristics
SELECT count(*) FROM event	swimming
SELECT name FROM event ORDER BY YEAR DESC	swimming
SELECT name FROM event WHERE year = (SELECT MAX(year) FROM event)	swimming
SELECT count(*) FROM stadium	swimming
SELECT name FROM stadium WHERE capacity = (SELECT MAX(capacity) FROM stadium)	swimming
SELECT name FROM stadium WHERE capacity  <  (SELECT avg(capacity) FROM stadium)	swimming
SELECT country FROM stadium GROUP BY country HAVING COUNT(id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM stadium GROUP BY country))	swimming
SELECT country FROM stadium GROUP BY country HAVING count(*)  <=  3	swimming
SELECT country FROM stadium WHERE capacity  >  60000 INTERSECT SELECT country FROM stadium WHERE capacity  <  50000	swimming
SELECT count(DISTINCT city) FROM stadium WHERE opening_year  <  2006	swimming
SELECT country ,  count(*) FROM stadium GROUP BY country	swimming
SELECT country FROM stadium GROUP BY country HAVING MAX(opening_year) NOT IN (SELECT MAX(opening_year) FROM stadium WHERE opening_year > 2006)	swimming
SELECT count(*) FROM stadium WHERE country != 'Russia'	swimming
SELECT name FROM swimmer ORDER BY meter_100	swimming
SELECT count(DISTINCT nationality) FROM swimmer	swimming
SELECT nationality FROM swimmer GROUP BY nationality HAVING COUNT(*) > 1	swimming
SELECT meter_200 ,  meter_300 FROM swimmer WHERE nationality  =  'Australia'	swimming
SELECT name FROM swimmer WHERE EXISTS (SELECT 1 FROM record WHERE swimmer_id = swimmer.id AND result = 'Win')	swimming
SELECT s.name FROM stadium s WHERE s.id IN (SELECT e.stadium_id FROM event e GROUP BY e.stadium_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM event GROUP BY stadium_id)))	swimming
SELECT name, capacity FROM stadium WHERE id IN (SELECT stadium_id FROM event WHERE name = 'World Junior')	swimming
SELECT name FROM stadium WHERE id NOT IN (SELECT stadium_id FROM event)	swimming
SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id GROUP BY t2.swimmer_id ORDER BY count(*) DESC LIMIT 1	swimming
SELECT t1.name FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id GROUP BY t2.swimmer_id HAVING count(*)  >=  2	swimming
SELECT t1.name ,  t1.nationality FROM swimmer AS t1 JOIN record AS t2 ON t1.id  =  t2.swimmer_id WHERE RESULT  =  'Win' GROUP BY t2.swimmer_id HAVING count(*)  >  1	swimming
SELECT name FROM swimmer WHERE id NOT IN (SELECT swimmer_id FROM record)	swimming
SELECT s.name FROM swimmer s WHERE EXISTS (SELECT 1 FROM record r1 WHERE r1.swimmer_id = s.id AND r1.result = 'Win') AND EXISTS (SELECT 1 FROM record r2 WHERE r2.swimmer_id = s.id AND r2.result = 'Loss')	swimming
SELECT s.name FROM stadium s WHERE s.id IN (SELECT e.stadium_id FROM event e, record r, swimmer sw WHERE e.id = r.event_id AND r.swimmer_id = sw.id AND sw.nationality = 'Australia' GROUP BY e.stadium_id)	swimming
SELECT t3.name FROM record AS t1 JOIN event AS t2 ON t1.event_id  =  t2.id JOIN stadium AS t3 ON t3.id  =  t2.stadium_id GROUP BY t2.stadium_id ORDER BY count(*) DESC LIMIT 1	swimming
SELECT * FROM swimmer	swimming
SELECT avg(capacity) FROM stadium WHERE opening_year  =  2005	swimming
SELECT count(*) FROM railway	railway
SELECT Builder FROM railway ORDER BY Builder ASC	railway
SELECT Wheels ,  LOCATION FROM railway	railway
SELECT MAX(level) FROM manager WHERE country <> 'Australia'	railway
SELECT avg(Age) FROM manager	railway
SELECT name FROM manager ORDER BY level ASC, name ASC	railway
SELECT Name ,  Arrival FROM train	railway
SELECT m.name FROM manager m WHERE m.age = (SELECT MAX(age) FROM manager)	railway
SELECT T2.Name ,  T1.Location FROM railway AS T1 JOIN train AS T2 ON T1.Railway_ID  =  T2.Railway_ID	railway
SELECT T1.Builder FROM railway AS T1 JOIN train AS T2 ON T1.Railway_ID  =  T2.Railway_ID WHERE T2.Name  =  'Andaman Exp'	railway
SELECT T2.Railway_ID ,  T1.Location FROM railway AS T1 JOIN train AS T2 ON T1.Railway_ID  =  T2.Railway_ID GROUP BY T2.Railway_ID HAVING COUNT(*)  >  1	railway
SELECT T2.Railway_ID ,  T1.Builder FROM railway AS T1 JOIN train AS T2 ON T1.Railway_ID  =  T2.Railway_ID GROUP BY T2.Railway_ID ORDER BY COUNT(*) DESC LIMIT 1	railway
SELECT Builder ,  COUNT(*) FROM railway GROUP BY Builder	railway
SELECT builder FROM railway GROUP BY builder HAVING COUNT(builder) = (SELECT MAX(count) FROM (SELECT builder, COUNT(builder) AS count FROM railway GROUP BY builder))	railway
SELECT LOCATION ,  COUNT(*) FROM railway GROUP BY LOCATION	railway
SELECT LOCATION FROM railway GROUP BY LOCATION HAVING COUNT(*)  >  1	railway
SELECT ObjectNumber FROM railway WHERE Railway_ID NOT IN (SELECT Railway_ID FROM train)	railway
SELECT Country FROM manager WHERE Age  >  50 INTERSECT SELECT Country FROM manager WHERE Age  <  46	railway
SELECT DISTINCT Country FROM manager	railway
SELECT Working_year_starts FROM manager ORDER BY LEVEL DESC	railway
SELECT DISTINCT country FROM manager WHERE age > 50 OR age < 46	railway
SELECT count(*) FROM addresses WHERE country  =  'USA'	customers_and_products_contacts
SELECT DISTINCT city FROM addresses	customers_and_products_contacts
SELECT state_province_county ,  count(*) FROM addresses GROUP BY state_province_county	customers_and_products_contacts
SELECT customer_name ,  customer_phone FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_address_history)	customers_and_products_contacts
SELECT customers.customer_name FROM customers JOIN (SELECT customer_id FROM customer_orders GROUP BY customer_id HAVING COUNT(order_id) = (SELECT MAX(total_orders) FROM (SELECT customer_id, COUNT(order_id) AS total_orders FROM customer_orders GROUP BY customer_id) cnt_orders)) top_orders ON customers.customer_id = top_orders.customer_id	customers_and_products_contacts
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2	customers_and_products_contacts
SELECT c.customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM customer_orders co WHERE co.customer_id = c.customer_id AND co.order_status_code = 'Completed') AND EXISTS (SELECT 1 FROM customer_orders co WHERE co.customer_id = c.customer_id AND co.order_status_code = 'Part')	customers_and_products_contacts
SELECT customer_name ,  customer_phone ,  payment_method_code FROM customers ORDER BY customer_number DESC	customers_and_products_contacts
SELECT T1.product_name ,  sum(T2.order_quantity) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id	customers_and_products_contacts
SELECT min(product_price) ,  max(product_price) ,  avg(product_price) FROM products	customers_and_products_contacts
SELECT count(*) FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)	customers_and_products_contacts
SELECT T2.customer_name ,  T3.city ,  T1.date_from ,  T1.date_to FROM customer_address_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN addresses AS T3 ON T1.address_id  =  T3.address_id	customers_and_products_contacts
SELECT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.payment_method_code  =  'Credit Card' GROUP BY T1.customer_id HAVING count(*)  >  2	customers_and_products_contacts
SELECT  T1.customer_name ,  T1.customer_phone FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T3.order_id  =  T2.order_id GROUP BY T1.customer_id ORDER BY sum(T3.order_quantity) DESC LIMIT 1	customers_and_products_contacts
SELECT product_type_code ,  product_name FROM products WHERE product_price  >  1000 OR product_price  <  500	customers_and_products_contacts
SELECT dorm_name FROM dorm WHERE gender  =  'F'	dorm_1
SELECT dorm_name FROM dorm WHERE gender  =  'F'	dorm_1
SELECT dorm_name FROM dorm WHERE student_capacity  >  300	dorm_1
SELECT dorm_name FROM dorm WHERE student_capacity  >  300	dorm_1
SELECT count(*) FROM student WHERE sex  =  'F' AND age  <  25	dorm_1
SELECT count(*) FROM student WHERE sex  =  'F' AND age  <  25	dorm_1
SELECT fname FROM student WHERE age  >  20	dorm_1
SELECT fname FROM student WHERE age  >  20	dorm_1
SELECT fname FROM student WHERE city_code  =  'PHL' AND age BETWEEN 20 AND 25	dorm_1
SELECT fname FROM student WHERE city_code  =  'PHL' AND age BETWEEN 20 AND 25	dorm_1
SELECT COUNT(DISTINCT dormid) FROM dorm	dorm_1
SELECT count(*) FROM dorm	dorm_1
SELECT COUNT(DISTINCT amenity_name) FROM dorm_amenity	dorm_1
SELECT COUNT(DISTINCT amenity_name) FROM dorm_amenity	dorm_1
SELECT sum(student_capacity) FROM dorm	dorm_1
SELECT sum(student_capacity) FROM dorm	dorm_1
SELECT count(*) FROM student	dorm_1
SELECT count(*) FROM student	dorm_1
SELECT avg(age) ,  city_code FROM student GROUP BY city_code	dorm_1
SELECT avg(age) ,  city_code FROM student GROUP BY city_code	dorm_1
SELECT avg(student_capacity) ,  sum(student_capacity) FROM dorm WHERE gender  =  'X'	dorm_1
SELECT avg(student_capacity) ,  sum(student_capacity) FROM dorm WHERE gender  =  'X'	dorm_1
SELECT count(DISTINCT dormid) FROM has_amenity	dorm_1
SELECT count(DISTINCT dormid) FROM has_amenity	dorm_1
SELECT dorm_name FROM dorm WHERE dormid NOT IN (SELECT dormid FROM has_amenity)	dorm_1
SELECT dorm_name FROM dorm WHERE dormid NOT IN (SELECT dormid FROM has_amenity)	dorm_1
SELECT count(DISTINCT gender) FROM dorm	dorm_1
SELECT count(DISTINCT gender) FROM dorm	dorm_1
SELECT student_capacity ,  gender FROM dorm WHERE dorm_name LIKE '%Donor%'	dorm_1
SELECT student_capacity ,  gender FROM dorm WHERE dorm_name LIKE '%Donor%'	dorm_1
SELECT dorm_name ,  gender FROM dorm WHERE student_capacity  >  300 OR student_capacity  <  100	dorm_1
SELECT dorm_name ,  gender FROM dorm WHERE student_capacity  >  300 OR student_capacity  <  100	dorm_1
SELECT count(DISTINCT major) ,  count(DISTINCT city_code) FROM student	dorm_1
SELECT count(DISTINCT major) ,  count(DISTINCT city_code) FROM student	dorm_1
SELECT DISTINCT dorm_name FROM dorm WHERE dormid IN(SELECT h1.dormid FROM has_amenity h1 JOIN has_amenity h2 ON h1.dormid = h2.dormid AND h1.amenid != h2.amenid WHERE h1.amenid IN (SELECT amenid FROM dorm_amenity WHERE amenity_name = 'TV Lounge') AND h2.amenid IN (SELECT amenid FROM dorm_amenity WHERE amenity_name = 'Study Room'))	dorm_1
SELECT DISTINCT d.dorm_name FROM dorm d WHERE EXISTS (SELECT * FROM has_amenity ha JOIN dorm_amenity da ON ha.amenid = da.amenid WHERE ha.dormid = d.dormid AND da.amenity_name = 'TV Lounge') AND EXISTS (SELECT * FROM has_amenity ha JOIN dorm_amenity da ON ha.amenid = da.amenid WHERE ha.dormid = d.dormid AND da.amenity_name = 'Study Room')	dorm_1
SELECT DISTINCT d.dorm_name FROM dorm d INNER JOIN has_amenity ha ON d.dormid = ha.dormid INNER JOIN dorm_amenity da ON ha.amenid = da.amenid WHERE da.amenity_name = 'TV Lounge' AND NOT EXISTS (SELECT 1 FROM has_amenity ha2 INNER JOIN dorm_amenity da2 ON ha2.amenid = da2.amenid WHERE da2.amenity_name = 'Study Room' AND ha2.dormid = d.dormid)	dorm_1
SELECT D.dorm_name FROM dorm D WHERE EXISTS (SELECT 1 FROM has_amenity HA INNER JOIN dorm_amenity DA ON HA.amenid = DA.amenid WHERE HA.dormid = D.dormid AND DA.amenity_name = 'TV Lounge') AND NOT EXISTS (SELECT 1 FROM has_amenity HA INNER JOIN dorm_amenity DA ON HA.amenid = DA.amenid WHERE HA.dormid = D.dormid AND DA.amenity_name = 'Study Room')	dorm_1
SELECT student.lname FROM student WHERE (student.sex = 'F' AND student.city_code = 'BAL') OR (student.sex = 'M' AND student.age < 20)	dorm_1
SELECT lname FROM student WHERE sex  =  'F' AND city_code  =  'BAL' UNION SELECT lname FROM student WHERE sex  =  'M' AND age  <  20	dorm_1
SELECT d.dorm_name FROM dorm AS d WHERE d.student_capacity = (SELECT MAX(student_capacity) FROM dorm)	dorm_1
SELECT dorm_name FROM dorm WHERE student_capacity = (SELECT MAX(student_capacity) FROM dorm)	dorm_1
SELECT DISTINCT amenity_name FROM dorm_amenity ORDER BY amenity_name	dorm_1
SELECT DISTINCT amenity_name FROM dorm_amenity ORDER BY amenity_name;	dorm_1
SELECT city_code FROM student GROUP BY city_code ORDER BY count(*) DESC LIMIT 1	dorm_1
SELECT city_code FROM student GROUP BY city_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) count FROM student GROUP BY city_code))	dorm_1
SELECT fname ,  lname FROM student WHERE age  <  (SELECT avg(age) FROM student)	dorm_1
SELECT fname ,  lname FROM student WHERE age  <  (SELECT avg(age) FROM student)	dorm_1
SELECT fname ,  lname FROM student WHERE city_code != 'HKG' ORDER BY age	dorm_1
SELECT fname ,  lname FROM student WHERE city_code != 'HKG' ORDER BY age	dorm_1
SELECT T1.amenity_name FROM dorm_amenity AS T1 JOIN has_amenity AS T2 ON T2.amenid  =  T1.amenid JOIN dorm AS T3 ON T2.dormid  =  T3.dormid WHERE T3.dorm_name  =  'Anonymous Donor Hall' ORDER BY T1.amenity_name	dorm_1
SELECT amenity_name FROM dorm_amenity WHERE amenid IN (SELECT amenid FROM has_amenity WHERE dormid IN (SELECT dormid FROM dorm WHERE dorm_name = 'Anonymous Donor Hall')) ORDER BY amenity_name	dorm_1
SELECT count(*) ,  sum(student_capacity) ,  gender FROM dorm GROUP BY gender	dorm_1
SELECT count(*) ,  sum(student_capacity) ,  gender FROM dorm GROUP BY gender	dorm_1
SELECT avg(age) ,  max(age) ,  sex FROM student GROUP BY sex	dorm_1
SELECT avg(age) ,  max(age) ,  sex FROM student GROUP BY sex	dorm_1
SELECT count(*) ,  major FROM student GROUP BY major	dorm_1
SELECT count(*) ,  major FROM student GROUP BY major	dorm_1
SELECT city_code, COUNT(stuid), AVG(age) FROM student WHERE stuid IN (SELECT stuid FROM lives_in) GROUP BY city_code	dorm_1
SELECT count(*) ,  avg(age) ,  city_code FROM student GROUP BY city_code	dorm_1
SELECT count(*) ,  avg(age) ,  city_code FROM student WHERE sex  =  'M' GROUP BY city_code	dorm_1
SELECT count(*) ,  avg(age) ,  city_code FROM student WHERE sex  =  'M' GROUP BY city_code	dorm_1
SELECT count(*) ,  city_code FROM student GROUP BY city_code HAVING count(*)  >  1	dorm_1
SELECT count(*) ,  city_code FROM student GROUP BY city_code HAVING count(*)  >  1	dorm_1
SELECT DISTINCT s.fname, s.lname FROM student s WHERE s.major NOT IN (SELECT major FROM student GROUP BY major HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) c FROM student GROUP BY major)))	dorm_1
SELECT fname ,  lname FROM student WHERE major != (SELECT major FROM student GROUP BY major ORDER BY count(*) DESC LIMIT 1)	dorm_1
SELECT count(*) ,  sex FROM student WHERE age  >  (SELECT avg(age) FROM student) GROUP BY sex	dorm_1
SELECT sex, COUNT(*) FROM student WHERE age > (SELECT AVG(age) FROM student GROUP BY sex HAVING sex = student.sex) GROUP BY sex	dorm_1
SELECT avg(T1.age) ,  T3.dorm_name FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid GROUP BY T3.dorm_name	dorm_1
SELECT AVG(s.age) AS average_age, d.dorm_name FROM student s JOIN lives_in l ON s.stuid = l.stuid JOIN dorm d ON l.dormid = d.dormid GROUP BY d.dormid	dorm_1
SELECT count(*) ,  T1.dormid FROM dorm AS T1 JOIN has_amenity AS T2 ON T1.dormid  =  T2.dormid WHERE T1.student_capacity  >  100 GROUP BY T1.dormid	dorm_1
SELECT count(*) ,  T1.dormid FROM dorm AS T1 JOIN has_amenity AS T2 ON T1.dormid  =  T2.dormid WHERE T1.student_capacity  >  100 GROUP BY T1.dormid	dorm_1
SELECT count(*) ,  T3.dorm_name FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T1.age  >  20 GROUP BY T3.dorm_name	dorm_1
SELECT count(*) ,  T3.dorm_name FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T1.age  >  20 GROUP BY T3.dorm_name	dorm_1
SELECT fname FROM student WHERE stuid IN (SELECT lives_in.stuid FROM lives_in JOIN dorm ON lives_in.dormid = dorm.dormid WHERE dorm.dorm_name = 'Smith Hall')	dorm_1
SELECT T1.fname FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T3.dorm_name  =  'Smith Hall'	dorm_1
SELECT avg(T1.age) FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T3.student_capacity  =  (SELECT max(student_capacity) FROM dorm)	dorm_1
SELECT AVG(age) FROM student WHERE stuid IN ( SELECT lives_in.stuid FROM lives_in JOIN dorm ON lives_in.dormid = dorm.dormid WHERE dorm.student_capacity = (SELECT MAX(student_capacity) FROM dorm))	dorm_1
SELECT COUNT(DISTINCT student.stuid) FROM student, lives_in, dorm WHERE student.stuid = lives_in.stuid AND lives_in.dormid = dorm.dormid AND dorm.gender = 'M'	dorm_1
SELECT count(*) FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T3.gender  =  'M'	dorm_1
SELECT COUNT(DISTINCT s.stuid) FROM student s, lives_in li, dorm d WHERE s.stuid = li.stuid AND li.dormid = d.dormid AND s.sex = 'F' AND d.dorm_name = 'Smith Hall';	dorm_1
SELECT count(*) FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid JOIN dorm AS T3 ON T3.dormid  =  T2.dormid WHERE T3.dorm_name  =  'Smith Hall' AND T1.sex  =  'F'	dorm_1
SELECT da.amenity_name FROM has_amenity ha INNER JOIN dorm_amenity da ON ha.amenid = da.amenid WHERE ha.dormid IN (SELECT dormid FROM dorm WHERE dorm_name = 'Smith Hall')	dorm_1
SELECT T3.amenity_name FROM dorm AS T1 JOIN has_amenity AS T2 ON T1.dormid  =  T2.dormid JOIN dorm_amenity AS T3 ON T2.amenid  =  T3.amenid WHERE T1.dorm_name  =  'Smith Hall'	dorm_1
SELECT amenity_name FROM dorm_amenity JOIN has_amenity ON dorm_amenity.amenid = has_amenity.amenid WHERE has_amenity.dormid IN (SELECT dormid FROM dorm WHERE dorm_name = 'Smith Hall') ORDER BY amenity_name ASC	dorm_1
SELECT amenity_name FROM dorm_amenity WHERE amenid IN (SELECT has_amenity.amenid FROM has_amenity INNER JOIN dorm ON has_amenity.dormid = dorm.dormid AND dorm.dorm_name = 'Smith Hall') ORDER BY amenity_name ASC	dorm_1
SELECT da.amenity_name FROM dorm_amenity AS da JOIN (SELECT amenid FROM has_amenity GROUP BY amenid ORDER BY COUNT(*) DESC LIMIT 1) AS most_common ON da.amenid = most_common.amenid	dorm_1
SELECT amenity_name FROM dorm_amenity WHERE amenid IN (SELECT amenid FROM has_amenity GROUP BY amenid ORDER BY COUNT(amenid) DESC LIMIT 1)	dorm_1
SELECT T1.fname FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid WHERE T2.dormid IN (SELECT T2.dormid FROM dorm AS T3 JOIN has_amenity AS T4 ON T3.dormid  =  T4.dormid JOIN dorm_amenity AS T5 ON T4.amenid  =  T5.amenid GROUP BY T3.dormid ORDER BY count(*) DESC LIMIT 1)	dorm_1
SELECT T1.fname FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid WHERE T2.dormid IN (SELECT T2.dormid FROM dorm AS T3 JOIN has_amenity AS T4 ON T3.dormid  =  T4.dormid JOIN dorm_amenity AS T5 ON T4.amenid  =  T5.amenid GROUP BY T3.dormid ORDER BY count(*) DESC LIMIT 1)	dorm_1
SELECT T1.dorm_name ,  T1.student_capacity FROM dorm AS T1 JOIN has_amenity AS T2 ON T1.dormid  =  T2.dormid JOIN dorm_amenity AS T3 ON T2.amenid  =  T3.amenid GROUP BY T2.dormid ORDER BY count(*) LIMIT 1	dorm_1
SELECT D.dorm_name, D.student_capacity FROM dorm D WHERE EXISTS (SELECT 1 FROM has_amenity H WHERE H.dormid = D.dormid GROUP BY H.dormid HAVING COUNT(H.amenid) = (SELECT MIN(COUNT_T) FROM (SELECT COUNT(amenid) AS COUNT_T FROM has_amenity GROUP BY dormid) AS T1))	dorm_1
SELECT dorm_name FROM dorm WHERE dormid NOT IN (SELECT has_amenity.dormid FROM has_amenity JOIN dorm_amenity ON has_amenity.amenid = dorm_amenity.amenid WHERE dorm_amenity.amenity_name = 'TV Lounge')	dorm_1
SELECT D.dorm_name FROM dorm D WHERE D.dormid NOT IN (SELECT HA.dormid FROM has_amenity HA JOIN dorm_amenity DA ON HA.amenid = DA.amenid WHERE DA.amenity_name = 'TV Lounge')	dorm_1
SELECT T1.fname ,  T1.lname FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid WHERE T2.dormid IN (SELECT T3.dormid FROM has_amenity AS T3 JOIN dorm_amenity AS T4 ON T3.amenid  =  T4.amenid WHERE T4.amenity_name  =  'TV Lounge')	dorm_1
SELECT T1.fname ,  T1.lname FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid WHERE T2.dormid IN (SELECT T3.dormid FROM has_amenity AS T3 JOIN dorm_amenity AS T4 ON T3.amenid  =  T4.amenid WHERE T4.amenity_name  =  'TV Lounge')	dorm_1
SELECT T1.fname ,  T1.age FROM student AS T1 JOIN lives_in AS T2 ON T1.stuid  =  T2.stuid WHERE T2.dormid NOT IN (SELECT T3.dormid FROM has_amenity AS T3 JOIN dorm_amenity AS T4 ON T3.amenid  =  T4.amenid WHERE T4.amenity_name  =  'TV Lounge')	dorm_1
SELECT s.fname, s.age FROM student AS s JOIN lives_in AS l ON s.stuid = l.stuid JOIN dorm AS d ON l.dormid = d.dormid JOIN has_amenity AS h ON d.dormid = h.dormid WHERE h.amenid = 'TV Lounge'	dorm_1
SELECT amenity_name FROM dorm_amenity WHERE amenid IN (SELECT amenid FROM has_amenity WHERE dormid = (SELECT dormid FROM student WHERE lname = 'Smith'))	dorm_1
SELECT amenity_name FROM dorm_amenity JOIN has_amenity ON dorm_amenity.amenid = has_amenity.amenid WHERE has_amenity.dormid IN (SELECT dormid FROM student WHERE lname = 'Smith')	dorm_1
SELECT count(*) FROM customers	customer_complaints
SELECT count(*) FROM customers	customer_complaints
SELECT email_address ,  phone_number FROM customers ORDER BY email_address ,  phone_number	customer_complaints
SELECT email_address ,  phone_number FROM customers ORDER BY email_address ,  phone_number	customer_complaints
SELECT town_city FROM customers WHERE customer_type_code  =  'Good Credit Rating' GROUP BY town_city ORDER BY count(*) LIMIT 1	customer_complaints
WITH city_counts AS (SELECT town_city, COUNT(customer_id) AS total FROM customers WHERE customer_type_code = 'Good Credit Rating' GROUP BY town_city) SELECT town_city FROM city_counts WHERE total = (SELECT MIN(total) FROM city_counts)	customer_complaints
SELECT p.product_name, (SELECT COUNT(*) FROM complaints WHERE product_id = p.product_id) AS number_of_complaints FROM products p	customer_complaints
SELECT products.product_name, COUNT(complaints.complaint_id) AS number_of_complaints FROM products LEFT JOIN complaints ON products.product_id = complaints.product_id GROUP BY products.product_name	customer_complaints
SELECT DISTINCT customers.email_address FROM customers JOIN complaints ON customers.customer_id = complaints.customer_id WHERE complaints.product_id IN (SELECT product_id FROM complaints GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1)	customer_complaints
SELECT DISTINCT customers.email_address FROM customers JOIN complaints ON customers.customer_id = complaints.customer_id WHERE complaints.product_id = (SELECT product_id FROM complaints GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1)	customer_complaints
SELECT product_name FROM products WHERE product_id IN (SELECT product_id FROM complaints WHERE customer_id IN (SELECT customer_id FROM complaints GROUP BY customer_id ORDER BY COUNT(complaint_id) ASC LIMIT 1))	customer_complaints
SELECT product_name FROM products p INNER JOIN (SELECT product_id FROM complaints WHERE customer_id = (SELECT customer_id FROM complaints GROUP BY customer_id ORDER BY COUNT(complaint_id) ASC LIMIT 1)) as cp ON p.product_id = cp.product_id;	customer_complaints
SELECT t1.phone_number FROM customers AS t1 JOIN complaints AS t2 ON t1.customer_id  =  t2.customer_id ORDER BY t2.date_complaint_raised DESC LIMIT 1	customer_complaints
SELECT t1.phone_number FROM customers AS t1 JOIN complaints AS t2 ON t1.customer_id  =  t2.customer_id ORDER BY t2.date_complaint_raised DESC LIMIT 1	customer_complaints
SELECT email_address ,  phone_number FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM complaints)	customer_complaints
SELECT email_address ,  phone_number FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM complaints)	customer_complaints
SELECT phone_number FROM customers UNION SELECT phone_number FROM staff	customer_complaints
SELECT phone_number FROM customers UNION ALL SELECT phone_number FROM staff	customer_complaints
SELECT product_description FROM products WHERE product_name  =  'Chocolate'	customer_complaints
SELECT product_description FROM products WHERE product_name  =  'Chocolate'	customer_complaints
SELECT product_name, product_category_code FROM products WHERE product_price = (SELECT MAX(product_price) FROM products);	customer_complaints
SELECT product_name, product_category_code FROM products WHERE product_price = (SELECT MAX(product_price) FROM products)	customer_complaints
SELECT product_price FROM products WHERE product_id NOT IN (SELECT product_id FROM complaints)	customer_complaints
SELECT product_price FROM products WHERE product_id NOT IN (SELECT product_id FROM complaints)	customer_complaints
SELECT avg(product_price) ,  product_category_code FROM products GROUP BY product_category_code	customer_complaints
SELECT avg(product_price) ,  product_category_code FROM products GROUP BY product_category_code	customer_complaints
SELECT t1.last_name FROM staff AS t1 JOIN complaints AS t2 ON t1.staff_id  =  t2.staff_id JOIN products AS t3 ON t2.product_id  =  t3.product_id ORDER BY t3.product_price LIMIT 1	customer_complaints
SELECT S.last_name FROM staff S WHERE EXISTS (SELECT 1 FROM complaints C JOIN products P ON C.product_id = P.product_id WHERE P.product_price = (SELECT MIN(product_price) FROM products) AND C.staff_id = S.staff_id)	customer_complaints
SELECT complaint_status_code FROM complaints GROUP BY complaint_status_code HAVING count(*)  >  3	customer_complaints
SELECT complaint_status_code FROM complaints GROUP BY complaint_status_code HAVING count(*)  >  3	customer_complaints
SELECT last_name FROM staff WHERE email_address LIKE '%wrau%'	customer_complaints
SELECT last_name FROM staff WHERE email_address LIKE '%wrau%'	customer_complaints
SELECT count(*) FROM customers GROUP BY customer_type_code ORDER BY count(*) DESC LIMIT 1	customer_complaints
SELECT count(*) FROM customers GROUP BY customer_type_code ORDER BY count(*) DESC LIMIT 1	customer_complaints
SELECT s.last_name FROM staff s INNER JOIN complaints c ON s.staff_id = c.staff_id WHERE c.date_complaint_raised = (SELECT MIN(date_complaint_raised) FROM complaints)	customer_complaints
SELECT t1.last_name FROM staff AS t1 JOIN complaints AS t2 ON t1.staff_id  =  t2.staff_id ORDER BY t2.date_complaint_raised LIMIT 1	customer_complaints
SELECT count(DISTINCT complaint_type_code) FROM complaints	customer_complaints
SELECT count(DISTINCT complaint_type_code) FROM complaints	customer_complaints
SELECT address_line_1 ,  address_line_2 FROM customers WHERE email_address  =  'vbogisich@example.org'	customer_complaints
SELECT address_line_1 ,  address_line_2 FROM customers WHERE email_address  =  'vbogisich@example.org'	customer_complaints
SELECT complaint_status_code ,  count(*) FROM complaints WHERE complaint_type_code  =  'Product Failure' GROUP BY complaint_status_code	customer_complaints
SELECT complaint_status_code ,  count(*) FROM complaints WHERE complaint_type_code  =  'Product Failure' GROUP BY complaint_status_code	customer_complaints
SELECT first_name FROM staff WHERE staff_id IN (SELECT staff_id FROM complaints GROUP BY staff_id ORDER BY COUNT(*) DESC LIMIT 5);	customer_complaints
SELECT first_name FROM staff WHERE staff_id IN (SELECT staff_id FROM complaints GROUP BY staff_id ORDER BY COUNT(complaint_id) DESC LIMIT 5)	customer_complaints
SELECT c.state FROM customers c GROUP BY c.state HAVING COUNT(c.customer_id) = (SELECT MAX(total) FROM (SELECT COUNT(customer_id) AS total FROM customers GROUP BY state) c2)	customer_complaints
WITH RankedStates AS (SELECT state, RANK() OVER (ORDER BY COUNT(customer_id) DESC) rank FROM customers GROUP BY state) SELECT state FROM RankedStates WHERE rank = 1	customer_complaints
SELECT count(*) FROM submission	workshop_paper
SELECT count(*) FROM submission	workshop_paper
SELECT Author FROM submission ORDER BY Scores ASC	workshop_paper
SELECT Author FROM submission ORDER BY Scores ASC	workshop_paper
SELECT Author ,  College FROM submission	workshop_paper
SELECT Author ,  College FROM submission	workshop_paper
SELECT Author FROM submission WHERE College  =  'Florida' OR College  =  'Temple'	workshop_paper
SELECT Author FROM submission WHERE College  =  'Florida' OR College  =  'Temple'	workshop_paper
SELECT avg(Scores) FROM submission	workshop_paper
SELECT avg(Scores) FROM submission	workshop_paper
SELECT author FROM submission WHERE scores = (SELECT MAX(scores) FROM submission)	workshop_paper
SELECT author FROM submission WHERE scores = (SELECT MAX(scores) FROM submission)	workshop_paper
SELECT college, COUNT(DISTINCT author) AS authors_count FROM submission GROUP BY college	workshop_paper
SELECT college, COUNT(DISTINCT author) FROM submission GROUP BY college	workshop_paper
SELECT College FROM submission GROUP BY College ORDER BY COUNT(*) DESC LIMIT 1	workshop_paper
SELECT college FROM (SELECT college, COUNT(DISTINCT author) AS unique_authors_count FROM submission GROUP BY college) WHERE unique_authors_count = (SELECT MAX(auth_count) FROM (SELECT COUNT(DISTINCT author) AS auth_count FROM submission GROUP BY college))	workshop_paper
SELECT College FROM submission WHERE Scores  >  90 INTERSECT SELECT College FROM submission WHERE Scores  <  80	workshop_paper
SELECT College FROM submission WHERE Scores  >  90 INTERSECT SELECT College FROM submission WHERE Scores  <  80	workshop_paper
SELECT T2.Author ,  T1.Result FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID	workshop_paper
SELECT T2.Author ,  T1.Result FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID	workshop_paper
SELECT T1.Result FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID ORDER BY T2.Scores DESC LIMIT 1	workshop_paper
SELECT T1.Result FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID ORDER BY T2.Scores DESC LIMIT 1	workshop_paper
SELECT COUNT(DISTINCT a.workshop_id) AS num_of_workshops, s.author FROM submission s LEFT JOIN acceptance a ON s.submission_id = a.submission_id GROUP BY s.author	workshop_paper
SELECT s.author, COUNT(DISTINCT a.workshop_id) FROM submission s LEFT JOIN acceptance a ON s.submission_id = a.submission_id GROUP BY s.author	workshop_paper
SELECT T2.Author FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID GROUP BY T2.Author HAVING COUNT(DISTINCT T1.workshop_id)  >  1	workshop_paper
SELECT T2.Author FROM acceptance AS T1 JOIN submission AS T2 ON T1.Submission_ID  =  T2.Submission_ID GROUP BY T2.Author HAVING COUNT(DISTINCT T1.workshop_id)  >  1	workshop_paper
SELECT Date ,  Venue FROM workshop ORDER BY Venue	workshop_paper
SELECT Date ,  Venue FROM workshop ORDER BY Venue	workshop_paper
SELECT DISTINCT author FROM submission EXCEPT SELECT DISTINCT s.author FROM submission s JOIN acceptance a ON s.submission_id = a.submission_id	workshop_paper
SELECT author FROM submission EXCEPT SELECT s.author FROM submission s JOIN acceptance a ON s.submission_id = a.submission_id	workshop_paper
SELECT count(*) FROM INVESTORS	tracking_share_transactions
SELECT Investor_details FROM INVESTORS	tracking_share_transactions
SELECT DISTINCT lot_details FROM LOTS	tracking_share_transactions
SELECT max(amount_of_transaction) FROM TRANSACTIONS	tracking_share_transactions
SELECT date_of_transaction ,  share_count FROM TRANSACTIONS	tracking_share_transactions
SELECT sum(share_count) FROM TRANSACTIONS	tracking_share_transactions
SELECT transaction_id FROM TRANSACTIONS WHERE transaction_type_code  =  'PUR'	tracking_share_transactions
SELECT date_of_transaction FROM TRANSACTIONS WHERE transaction_type_code  =  'SALE'	tracking_share_transactions
SELECT avg(amount_of_transaction) FROM TRANSACTIONS WHERE transaction_type_code  =  'SALE'	tracking_share_transactions
SELECT transaction_type_description FROM Ref_Transaction_Types WHERE transaction_type_code   =  'PUR'	tracking_share_transactions
SELECT min(amount_of_transaction) FROM TRANSACTIONS WHERE transaction_type_code  =  'PUR' AND share_count  >  50	tracking_share_transactions
SELECT max(share_count) FROM TRANSACTIONS WHERE amount_of_transaction  <  10000	tracking_share_transactions
SELECT DISTINCT date_of_transaction FROM transactions WHERE share_count > 100 OR amount_of_transaction > 1000	tracking_share_transactions
SELECT rtt.transaction_type_description, tt.date_of_transaction FROM transactions tt JOIN ref_transaction_types rtt ON tt.transaction_type_code = rtt.transaction_type_code WHERE tt.share_count < 9 AND tt.share_count >= 0	tracking_share_transactions
SELECT T1.Investor_details FROM  INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id WHERE T2.share_count  >  100	tracking_share_transactions
SELECT COUNT(DISTINCT transaction_type_code) FROM TRANSACTIONS	tracking_share_transactions
SELECT lot_details ,  investor_id FROM LOTS	tracking_share_transactions
SELECT T2.lot_details FROM INVESTORS AS T1 JOIN LOTS AS T2 ON  T1.investor_id  =  T2.investor_id WHERE T1.Investor_details  =  'l'	tracking_share_transactions
SELECT T1.purchase_details FROM PURCHASES AS T1 JOIN TRANSACTIONS AS T2 ON T1.purchase_transaction_id  =  T2.transaction_id WHERE T2.amount_of_transaction  >  10000	tracking_share_transactions
SELECT T1.sales_details ,  T2.date_of_transaction FROM SALES AS T1 JOIN TRANSACTIONS AS T2 ON T1.sales_transaction_id  =  T2.transaction_id WHERE T2.amount_of_transaction  <  3000	tracking_share_transactions
SELECT T1.lot_details FROM LOTS AS T1 JOIN TRANSACTIONS_LOTS AS T2 ON T1.lot_id  =  T2.transaction_id JOIN TRANSACTIONS AS T3 ON T2.transaction_id  =  T3.transaction_id WHERE T3.share_count  <  50	tracking_share_transactions
SELECT l.lot_details FROM lots l JOIN transactions_lots tl ON l.lot_id = tl.lot_id JOIN transactions t ON tl.transaction_id = t.transaction_id WHERE t.share_count > 100 AND t.transaction_type_code = 'PUR';	tracking_share_transactions
SELECT transaction_type_code ,  avg(amount_of_transaction) FROM TRANSACTIONS GROUP BY transaction_type_code	tracking_share_transactions
SELECT transaction_type_code ,  max(share_count) ,  min(share_count) FROM TRANSACTIONS GROUP BY transaction_type_code	tracking_share_transactions
SELECT investor_id ,  avg(share_count) FROM TRANSACTIONS GROUP BY investor_id	tracking_share_transactions
SELECT investor_id ,  avg(share_count) FROM TRANSACTIONS GROUP BY investor_id ORDER BY avg(share_count)	tracking_share_transactions
SELECT investor_id ,  avg(amount_of_transaction) FROM TRANSACTIONS GROUP BY investor_id	tracking_share_transactions
SELECT T2.lot_id ,  avg(amount_of_transaction) FROM TRANSACTIONS AS T1 JOIN Transactions_Lots AS T2 ON T1.transaction_id  =  T2.transaction_id GROUP BY T2.lot_id	tracking_share_transactions
SELECT AVG(t.amount_of_transaction) AS avg_amount FROM transactions t INNER JOIN transactions_lots tl ON t.transaction_id = tl.transaction_id INNER JOIN lots l ON tl.lot_id = l.lot_id GROUP BY l.lot_id ORDER BY avg_amount	tracking_share_transactions
SELECT investor_id ,  COUNT(*) FROM TRANSACTIONS WHERE transaction_type_code  =  'SALE' GROUP BY investor_id	tracking_share_transactions
SELECT actor.investor_id, COUNT(event.transaction_id) as transaction_total FROM investors actor LEFT JOIN transactions event ON actor.investor_id = event.investor_id GROUP BY actor.investor_id	tracking_share_transactions
WITH CountPerType AS (SELECT transaction_type_code, COUNT(*) as Count FROM transactions GROUP BY transaction_type_code) SELECT transaction_type_code FROM CountPerType WHERE Count = (SELECT MIN(Count) FROM CountPerType)	tracking_share_transactions
SELECT transaction_type_code FROM TRANSACTIONS GROUP BY transaction_type_code ORDER BY COUNT(*) DESC LIMIT 1	tracking_share_transactions
SELECT transaction_type_description FROM ref_transaction_types WHERE EXISTS (SELECT 1 FROM transactions t WHERE ref_transaction_types.transaction_type_code = t.transaction_type_code GROUP BY transaction_type_code ORDER BY COUNT(*) DESC LIMIT 1)	tracking_share_transactions
SELECT i.investor_id, i.investor_details FROM investors i WHERE (SELECT COUNT(*) FROM transactions t WHERE t.investor_id = i.investor_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM transactions GROUP BY investor_id) t)	tracking_share_transactions
SELECT inv.investor_id, inv.investor_details FROM investors inv INNER JOIN (SELECT investor_id, COUNT(transaction_id) AS trans_count FROM transactions GROUP BY investor_id) AS agg ON agg.investor_id = inv.investor_id ORDER BY agg.trans_count DESC LIMIT 3	tracking_share_transactions
SELECT T2.investor_id FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id GROUP BY T2.investor_id HAVING COUNT(*)  >=  2	tracking_share_transactions
SELECT T2.investor_id ,  T1.Investor_details FROM INVESTORS AS T1 JOIN TRANSACTIONS AS T2 ON T1.investor_id  =  T2.investor_id WHERE T2.transaction_type_code  =  'SALE' GROUP BY T2.investor_id HAVING COUNT(*)  >=  2	tracking_share_transactions
SELECT t.date_of_transaction FROM transactions t WHERE t.share_count >= 100 OR t.amount_of_transaction > 100	tracking_share_transactions
SELECT sales_details FROM sales UNION SELECT purchase_details FROM purchases	tracking_share_transactions
SELECT lot_details FROM lots WHERE lot_id NOT IN (SELECT lot_id FROM transactions_lots)	tracking_share_transactions
SELECT count(*) FROM HOTELS	cre_Theme_park
SELECT count(*) FROM HOTELS	cre_Theme_park
SELECT price_range FROM HOTELS	cre_Theme_park
SELECT price_range FROM HOTELS	cre_Theme_park
SELECT DISTINCT Location_Name FROM LOCATIONS	cre_Theme_park
SELECT DISTINCT Location_Name FROM LOCATIONS	cre_Theme_park
SELECT Name ,  Other_Details FROM Staff	cre_Theme_park
SELECT Name ,  Other_Details FROM Staff	cre_Theme_park
SELECT * FROM visitors WHERE tourist_details IS NOT NULL;	cre_Theme_park
SELECT Tourist_Details FROM VISITORS	cre_Theme_park
SELECT price_range FROM HOTELS WHERE star_rating_code  =  '5'	cre_Theme_park
SELECT price_range FROM HOTELS WHERE star_rating_code  =  '5'	cre_Theme_park
SELECT avg(price_range) FROM HOTELS WHERE star_rating_code  =  '5' AND pets_allowed_yn  =  1	cre_Theme_park
SELECT avg(price_range) FROM HOTELS WHERE star_rating_code  =  '5' AND pets_allowed_yn  =  1	cre_Theme_park
SELECT Address FROM LOCATIONS WHERE Location_Name  =  'UK Gallery'	cre_Theme_park
SELECT Address FROM LOCATIONS WHERE Location_Name  =  'UK Gallery'	cre_Theme_park
SELECT Other_Details FROM LOCATIONS WHERE Location_Name  =  'UK Gallery'	cre_Theme_park
SELECT * FROM locations WHERE location_name = 'UK Gallery'	cre_Theme_park
SELECT Location_Name FROM LOCATIONS WHERE Location_Name LIKE '%film%'	cre_Theme_park
SELECT Location_Name FROM LOCATIONS WHERE Location_Name LIKE '%film%'	cre_Theme_park
SELECT count(DISTINCT Name) FROM PHOTOS	cre_Theme_park
SELECT count(DISTINCT Name) FROM PHOTOS	cre_Theme_park
SELECT DISTINCT Visit_Date FROM VISITS	cre_Theme_park
SELECT DISTINCT Visit_Date FROM VISITS	cre_Theme_park
SELECT Name FROM TOURIST_ATTRACTIONS WHERE How_to_Get_There  =  'bus'	cre_Theme_park
SELECT Name FROM TOURIST_ATTRACTIONS WHERE How_to_Get_There  =  'bus'	cre_Theme_park
SELECT Name ,  Opening_Hours FROM TOURIST_ATTRACTIONS WHERE How_to_Get_There  =  'bus' OR How_to_Get_There  =  'walk'	cre_Theme_park
SELECT Name ,  Opening_Hours FROM TOURIST_ATTRACTIONS WHERE How_to_Get_There  =  'bus' OR How_to_Get_There  =  'walk'	cre_Theme_park
SELECT T2.star_rating_description FROM HOTELS AS T1 JOIN Ref_Hotel_Star_Ratings AS T2 ON T1.star_rating_code  =  T2.star_rating_code WHERE T1.price_range  >  10000	cre_Theme_park
SELECT T2.star_rating_description FROM HOTELS AS T1 JOIN Ref_Hotel_Star_Ratings AS T2 ON T1.star_rating_code  =  T2.star_rating_code WHERE T1.price_range  >  10000	cre_Theme_park
SELECT T1.Museum_Details ,  T2.Opening_Hours FROM MUSEUMS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Museum_ID  =  T2.Tourist_Attraction_ID	cre_Theme_park
SELECT T1.Museum_Details ,  T2.Opening_Hours FROM MUSEUMS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Museum_ID  =  T2.Tourist_Attraction_ID	cre_Theme_park
SELECT name FROM tourist_attractions WHERE tourist_attraction_id IN (SELECT tourist_attraction_id FROM photos WHERE name = 'game1')	cre_Theme_park
SELECT T2.Name FROM PHOTOS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID WHERE T1.Name  =  'game1'	cre_Theme_park
SELECT T1.Name ,  T1.Description FROM PHOTOS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID WHERE T2.Name  =  'film festival'	cre_Theme_park
SELECT T1.Name ,  T1.Description FROM PHOTOS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID WHERE T2.Name  =  'film festival'	cre_Theme_park
SELECT T1.Royal_Family_Details ,  T2.How_to_Get_There FROM ROYAL_FAMILY AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Royal_Family_ID  =  T2.Tourist_Attraction_ID	cre_Theme_park
SELECT T1.Royal_Family_Details ,  T2.How_to_Get_There FROM ROYAL_FAMILY AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Royal_Family_ID  =  T2.Tourist_Attraction_ID	cre_Theme_park
SELECT T1.Shop_Details FROM SHOPS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Shop_ID  =  T2.Tourist_Attraction_ID WHERE T2.How_to_Get_There  =  'walk'	cre_Theme_park
SELECT T1.Shop_Details FROM SHOPS AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Shop_ID  =  T2.Tourist_Attraction_ID WHERE T2.How_to_Get_There  =  'walk'	cre_Theme_park
SELECT T1.Name FROM STAFF AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID WHERE T2.Name  =  'US museum'	cre_Theme_park
SELECT T1.Name FROM STAFF AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID WHERE T2.Name  =  'US museum'	cre_Theme_park
SELECT T1.Market_Details FROM Street_Markets AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Market_ID  =  T2.Tourist_Attraction_ID WHERE T2.How_to_Get_There  =  'walk' OR  T2.How_to_Get_There  =  'bus'	cre_Theme_park
SELECT T1.Market_Details FROM Street_Markets AS T1 JOIN TOURIST_ATTRACTIONS AS T2 ON T1.Market_ID  =  T2.Tourist_Attraction_ID WHERE T2.How_to_Get_There  =  'walk' OR  T2.How_to_Get_There  =  'bus'	cre_Theme_park
SELECT T2.Visit_Date ,  T2.Visit_Details FROM VISITORS AS T1 JOIN VISITS AS T2 ON T1.Tourist_ID  =  T2.Tourist_ID WHERE T1.Tourist_Details  =  'Vincent'	cre_Theme_park
SELECT T2.Visit_Date ,  T2.Visit_Details FROM VISITORS AS T1 JOIN VISITS AS T2 ON T1.Tourist_ID  =  T2.Tourist_ID WHERE T1.Tourist_Details  =  'Vincent'	cre_Theme_park
SELECT ta.name FROM tourist_attractions ta WHERE EXISTS (SELECT 1 FROM visits v JOIN visitors vi ON vi.tourist_id = v.tourist_id WHERE v.tourist_attraction_id = ta.tourist_attraction_id AND vi.tourist_details = 'Vincent')	cre_Theme_park
SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID JOIN VISITORS AS T3 ON T2.Tourist_ID  =  T3.Tourist_ID WHERE T3.Tourist_Details  =  'Vincent'	cre_Theme_park
SELECT T1.Name ,  T3.Visit_Date FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Vincent' OR T2.Tourist_Details  =  'Vivian'	cre_Theme_park
SELECT T1.Name ,  T3.Visit_Date FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Vincent' OR T2.Tourist_Details  =  'Vivian'	cre_Theme_park
SELECT star_rating_code ,  avg(price_range) FROM HOTELS GROUP BY star_rating_code	cre_Theme_park
SELECT star_rating_code ,  avg(price_range) FROM HOTELS GROUP BY star_rating_code	cre_Theme_park
SELECT pets_allowed_yn ,  avg(price_range) FROM HOTELS GROUP BY pets_allowed_yn	cre_Theme_park
SELECT pets_allowed_yn ,  avg(price_range) FROM HOTELS GROUP BY pets_allowed_yn	cre_Theme_park
SELECT h.hotel_id, r.star_rating_description FROM hotels h JOIN ref_hotel_star_ratings r ON h.star_rating_code = r.star_rating_code ORDER BY h.price_range ASC	cre_Theme_park
SELECT h.hotel_id, r.star_rating_description FROM hotels h JOIN ref_hotel_star_ratings r ON h.star_rating_code = r.star_rating_code ORDER BY h.price_range ASC	cre_Theme_park
SELECT other_hotel_details FROM HOTELS ORDER BY price_range DESC LIMIT 3	cre_Theme_park
SELECT other_hotel_details FROM HOTELS ORDER BY price_range DESC LIMIT 3	cre_Theme_park
SELECT other_hotel_details ,  star_rating_code FROM HOTELS ORDER BY price_range ASC LIMIT 3	cre_Theme_park
SELECT other_hotel_details ,  star_rating_code FROM HOTELS ORDER BY price_range ASC LIMIT 3	cre_Theme_park
SELECT t.how_to_get_there FROM tourist_attractions t JOIN visits v ON t.tourist_attraction_id = v.tourist_attraction_id GROUP BY t.how_to_get_there ORDER BY COUNT(v.visit_id) DESC LIMIT 1	cre_Theme_park
SELECT ta.how_to_get_there FROM tourist_attractions ta GROUP BY ta.how_to_get_there HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) as c FROM tourist_attractions GROUP BY how_to_get_there))	cre_Theme_park
SELECT T1.Attraction_Type_Description ,  T2.Attraction_Type_Code FROM Ref_Attraction_Types AS T1 JOIN Tourist_Attractions AS T2 ON T1.Attraction_Type_Code  =  T2.Attraction_Type_Code GROUP BY T2.Attraction_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Theme_park
SELECT T1.Attraction_Type_Description ,  T2.Attraction_Type_Code FROM Ref_Attraction_Types AS T1 JOIN Tourist_Attractions AS T2 ON T1.Attraction_Type_Code  =  T2.Attraction_Type_Code GROUP BY T2.Attraction_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Theme_park
SELECT How_to_Get_There ,  COUNT(*) FROM Tourist_Attractions GROUP BY How_to_Get_There	cre_Theme_park
SELECT How_to_Get_There ,  COUNT(*) FROM Tourist_Attractions GROUP BY How_to_Get_There	cre_Theme_park
SELECT ta.name, ta.tourist_attraction_id, (SELECT COUNT(*) FROM visits v WHERE v.tourist_attraction_id = ta.tourist_attraction_id) AS visit_count FROM tourist_attractions ta	cre_Theme_park
SELECT TA.name, TA.tourist_attraction_id, COUNT(V.tourist_attraction_id) AS num_visits FROM tourist_attractions TA LEFT JOIN visits V ON TA.tourist_attraction_id = V.tourist_attraction_id GROUP BY TA.tourist_attraction_id	cre_Theme_park
SELECT T1.Name ,  T2.Tourist_Attraction_ID FROM Tourist_Attractions AS T1 JOIN VISITS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID GROUP BY T2.Tourist_Attraction_ID HAVING count(*)  >=  2	cre_Theme_park
SELECT T1.Name ,  T2.Tourist_Attraction_ID FROM Tourist_Attractions AS T1 JOIN VISITS AS T2 ON T1.Tourist_Attraction_ID  =  T2.Tourist_Attraction_ID GROUP BY T2.Tourist_Attraction_ID HAVING count(*)  >=  2	cre_Theme_park
SELECT ta.name, ta.tourist_attraction_id FROM tourist_attractions ta LEFT JOIN visits v ON ta.tourist_attraction_id = v.tourist_attraction_id GROUP BY ta.tourist_attraction_id HAVING COUNT(v.visit_id) <= 1	cre_Theme_park
SELECT ta.name, ta.tourist_attraction_id FROM tourist_attractions AS ta WHERE ta.tourist_attraction_id NOT IN (SELECT v.tourist_attraction_id FROM visits v GROUP BY v.tourist_attraction_id HAVING COUNT(v.visit_id) > 1)	cre_Theme_park
SELECT T2.Name FROM Locations AS T1 JOIN Tourist_Attractions AS T2 ON T1.Location_ID  =  T2.Location_ID WHERE T1.Address  =  '660 Shea Crescent' OR T2.How_to_Get_There  =  'walk'	cre_Theme_park
SELECT T2.Name FROM Locations AS T1 JOIN Tourist_Attractions AS T2 ON T1.Location_ID  =  T2.Location_ID WHERE T1.Address  =  '660 Shea Crescent' OR T2.How_to_Get_There  =  'walk'	cre_Theme_park
SELECT ta.name FROM tourist_attractions ta WHERE EXISTS (SELECT 1 FROM tourist_attraction_features taf INNER JOIN features f ON taf.feature_id = f.feature_id WHERE taf.tourist_attraction_id = ta.tourist_attraction_id AND f.feature_details IN ('parking', 'shopping'))	cre_Theme_park
SELECT name FROM tourist_attractions WHERE tourist_attraction_id IN (SELECT taf.tourist_attraction_id FROM tourist_attraction_features taf JOIN features f ON taf.feature_id = f.feature_id WHERE f.feature_details IN ('parking', 'shopping'))	cre_Theme_park
SELECT T2.Name FROM Locations AS T1 JOIN Tourist_Attractions AS T2 ON T1.Location_ID  =  T2.Location_ID WHERE T1.Address  =  '254 Ottilie Junction' OR T2.How_to_Get_There  =  'bus'	cre_Theme_park
SELECT T2.Name FROM Locations AS T1 JOIN Tourist_Attractions AS T2 ON T1.Location_ID  =  T2.Location_ID WHERE T1.Address  =  '254 Ottilie Junction' OR T2.How_to_Get_There  =  'bus'	cre_Theme_park
SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Vincent' INTERSECT SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Marcelle'	cre_Theme_park
SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Vincent' INTERSECT SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Marcelle'	cre_Theme_park
SELECT ta.name FROM tourist_attractions ta WHERE ta.tourist_attraction_id IN ( SELECT v.tourist_attraction_id FROM visits v JOIN visitors vi ON v.tourist_id = vi.tourist_id WHERE vi.tourist_details LIKE 'Alison%' EXCEPT SELECT v.tourist_attraction_id FROM visits v JOIN visitors vi ON v.tourist_id = vi.tourist_id WHERE vi.tourist_details LIKE 'Rosalind%' )	cre_Theme_park
SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Alison' EXCEPT SELECT T1.Name FROM Tourist_Attractions AS T1 JOIN VISITORS AS T2 JOIN VISITS AS T3 ON T1.Tourist_Attraction_ID  =  T3.Tourist_Attraction_ID AND T2.Tourist_ID  =  T3.Tourist_ID WHERE T2.Tourist_Details  =  'Rosalind'	cre_Theme_park
SELECT count(*) FROM Visitors WHERE Tourist_ID NOT IN ( SELECT Tourist_ID FROM Visits )	cre_Theme_park
SELECT count(*) FROM Visitors WHERE Tourist_ID NOT IN ( SELECT Tourist_ID FROM Visits )	cre_Theme_park
SELECT count(*) FROM Video_games	game_1
SELECT count(*) FROM Video_games	game_1
SELECT count(DISTINCT gtype) FROM Video_games	game_1
SELECT count(DISTINCT gtype) FROM Video_games	game_1
SELECT DISTINCT gtype FROM Video_games	game_1
SELECT DISTINCT gtype FROM Video_games	game_1
SELECT gname ,  gtype FROM Video_games ORDER BY gname	game_1
SELECT gname ,  gtype FROM Video_games ORDER BY gname	game_1
SELECT * FROM video_games WHERE gtype = 'Collectible card game' AND gname IS NOT NULL	game_1
SELECT gname FROM Video_games WHERE gtype  =  'Collectible card game'	game_1
SELECT gtype FROM Video_games WHERE gname  =  'Call of Destiny'	game_1
SELECT gtype FROM Video_games WHERE gname  =  'Call of Destiny'	game_1
SELECT count(*) FROM Video_games WHERE gtype  =  'Massively multiplayer online game'	game_1
SELECT count(*) FROM Video_games WHERE gtype  =  'Massively multiplayer online game'	game_1
SELECT gtype ,  count(*) FROM Video_games GROUP BY gtype	game_1
SELECT gtype ,  count(*) FROM Video_games GROUP BY gtype	game_1
SELECT gtype FROM video_games GROUP BY gtype HAVING COUNT(gameid) = (SELECT MAX(cnt) FROM (SELECT COUNT(gameid) AS cnt FROM video_games GROUP BY gtype))	game_1
SELECT vg.gtype FROM video_games vg GROUP BY vg.gtype HAVING COUNT(vg.gameid) = (SELECT MAX(total) FROM (SELECT COUNT(gameid) AS total FROM video_games GROUP BY gtype))	game_1
WITH GameCounts AS (SELECT gtype, COUNT(gameid) AS ct FROM video_games GROUP BY gtype) SELECT gtype FROM GameCounts WHERE ct = (SELECT MIN(ct) FROM GameCounts)	game_1
SELECT gtype FROM (SELECT gtype, COUNT(gameid) AS num_games FROM video_games GROUP BY gtype) WHERE num_games = (SELECT MIN(num_games) FROM (SELECT COUNT(gameid) AS num_games FROM video_games GROUP BY gtype))	game_1
SELECT StuID FROM Student WHERE city_code  =  'CHI'	game_1
SELECT StuID FROM Student WHERE city_code  =  'CHI'	game_1
SELECT StuID FROM Student WHERE Advisor  =  1121	game_1
SELECT StuID FROM Student WHERE Advisor  =  1121	game_1
SELECT Fname FROM Student WHERE Major  =  600	game_1
SELECT Fname FROM Student WHERE Major  =  600	game_1
SELECT major ,  avg(age) ,  min(age) ,  max(age) FROM Student GROUP BY major	game_1
SELECT major ,  avg(age) ,  min(age) ,  max(age) FROM Student GROUP BY major	game_1
SELECT advisor FROM Student GROUP BY advisor HAVING count(*)  >=  2	game_1
SELECT DISTINCT advisor FROM student	game_1
SELECT count(DISTINCT sportname) FROM Sportsinfo	game_1
SELECT count(DISTINCT sportname) FROM Sportsinfo	game_1
SELECT count(DISTINCT StuID) FROM Sportsinfo	game_1
SELECT count(DISTINCT StuID) FROM Sportsinfo	game_1
SELECT StuID FROM Sportsinfo WHERE onscholarship  =  'Y'	game_1
SELECT sinfo.stuid FROM sportsinfo sinfo WHERE sinfo.onscholarship IS TRUE	game_1
SELECT lname FROM student WHERE stuid IN (SELECT stuid FROM sportsinfo WHERE onscholarship)	game_1
SELECT T2.Lname FROM Sportsinfo AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID WHERE T1.onscholarship  =  'Y'	game_1
SELECT COUNT(DISTINCT gameid) FROM plays_games	game_1
SELECT sum(gamesplayed) FROM Sportsinfo	game_1
SELECT sum(gamesplayed) FROM Sportsinfo WHERE sportname  =  'Football' AND onscholarship  =  'Y'	game_1
SELECT sum(gamesplayed) FROM Sportsinfo WHERE sportname  =  'Football' AND onscholarship  =  'Y'	game_1
SELECT sportname, COUNT(DISTINCT stuid) FROM sportsinfo GROUP BY sportname	game_1
SELECT sportname, COUNT(DISTINCT stuid) AS NumberOfStudents FROM sportsinfo GROUP BY sportname	game_1
SELECT StuID ,  count(*) ,  sum(gamesplayed) FROM Sportsinfo GROUP BY StuID	game_1
SELECT student.stuid, COUNT(DISTINCT sportsinfo.sportname) AS num_sports, COUNT(DISTINCT plays_games.gameid) AS num_games FROM student LEFT JOIN sportsinfo ON student.stuid = sportsinfo.stuid LEFT JOIN plays_games ON student.stuid = plays_games.stuid GROUP BY student.stuid	game_1
SELECT StuID FROM Sportsinfo GROUP BY StuID HAVING sum(hoursperweek)  >  10	game_1
SELECT S.stuid FROM sportsinfo S WHERE S.hoursperweek > 10	game_1
SELECT fname, lname FROM student WHERE stuid IN (SELECT stuid FROM sportsinfo GROUP BY stuid HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM sportsinfo GROUP BY stuid)))	game_1
SELECT T2.Fname ,  T2.Lname FROM Sportsinfo AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID GROUP BY T1.StuID ORDER BY count(*) DESC LIMIT 1	game_1
SELECT sportname FROM Sportsinfo WHERE onscholarship  =  'Y' GROUP BY sportname ORDER BY count(*) DESC LIMIT 1	game_1
SELECT S.sportname FROM sportsinfo S WHERE S.onscholarship > 0 GROUP BY S.sportname ORDER BY SUM(CASE WHEN S.onscholarship = 1 THEN 1 ELSE 0 END) DESC LIMIT 1	game_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Sportsinfo	game_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Sportsinfo	game_1
SELECT StuID FROM Student WHERE major  =  600 INTERSECT SELECT StuID FROM Sportsinfo WHERE onscholarship  =  'Y'	game_1
SELECT StuID FROM Student WHERE major  =  600 INTERSECT SELECT StuID FROM Sportsinfo WHERE onscholarship  =  'Y'	game_1
SELECT StuID FROM Student WHERE sex  =  'F' INTERSECT SELECT StuID FROM Sportsinfo WHERE sportname  =  'Football'	game_1
SELECT StuID FROM Student WHERE sex  =  'F' INTERSECT SELECT StuID FROM Sportsinfo WHERE sportname  =  'Football'	game_1
SELECT StuID FROM Student WHERE sex  =  'M' EXCEPT SELECT StuID FROM Sportsinfo WHERE sportname  =  'Football'	game_1
SELECT StuID FROM Student WHERE sex  =  'M' EXCEPT SELECT StuID FROM Sportsinfo WHERE sportname  =  'Football'	game_1
SELECT SUM(hoursperweek) Total_Hours_Per_Week, SUM(gamesplayed) Total_Games_Played FROM sportsinfo INNER JOIN student ON sportsinfo.stuid = student.stuid WHERE fname = 'David' AND lname = 'Shieber' GROUP BY student.stuid	game_1
SELECT sum(hoursperweek) ,  sum(gamesplayed) FROM Sportsinfo AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID WHERE T2.Fname  =  'David' AND T2.Lname  =  'Shieber'	game_1
SELECT sum(hoursperweek) ,  sum(gamesplayed) FROM Sportsinfo AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID WHERE T2.age  <  20	game_1
SELECT sum(hoursperweek) ,  sum(gamesplayed) FROM Sportsinfo AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID WHERE T2.age  <  20	game_1
SELECT count(DISTINCT StuID) FROM Plays_games	game_1
SELECT count(DISTINCT StuID) FROM Plays_games	game_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Plays_games	game_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Plays_games	game_1
SELECT StuID FROM Sportsinfo INTERSECT SELECT StuID FROM Plays_games	game_1
SELECT StuID FROM Sportsinfo INTERSECT SELECT StuID FROM Plays_games	game_1
SELECT gameid, hours_played FROM plays_games;	game_1
SELECT gameid ,  sum(hours_played) FROM Plays_games GROUP BY gameid	game_1
SELECT Stuid ,  sum(hours_played) FROM Plays_games GROUP BY Stuid	game_1
SELECT Stuid ,  sum(hours_played) FROM Plays_games GROUP BY Stuid	game_1
SELECT gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid GROUP BY T1.gameid ORDER BY sum(hours_played) DESC LIMIT 1	game_1
SELECT gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid GROUP BY T1.gameid ORDER BY sum(hours_played) DESC LIMIT 1	game_1
SELECT gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid GROUP BY T1.gameid HAVING sum(hours_played)  >=  1000	game_1
SELECT gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid GROUP BY T1.gameid HAVING sum(hours_played)  >=  1000	game_1
SELECT Gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid JOIN Student AS T3 ON T3.Stuid  =  T1.Stuid WHERE T3.Lname  =  'Smith' AND T3.Fname  =  'Linda'	game_1
SELECT Gname FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.gameid  =  T2.gameid JOIN Student AS T3 ON T3.Stuid  =  T1.Stuid WHERE T3.Lname  =  'Smith' AND T3.Fname  =  'Linda'	game_1
SELECT fname, lname FROM student WHERE stuid IN (SELECT stuid FROM sportsinfo WHERE sportname IN ('Football', 'Lacrosse'))	game_1
SELECT fname, lname FROM student WHERE stuid IN (SELECT stuid FROM sportsinfo WHERE sportname IN ('Football', 'Lacrosse'))	game_1
SELECT fname ,  age FROM Student WHERE StuID IN (SELECT StuID FROM Sportsinfo WHERE SportName  =  'Football' INTERSECT SELECT StuID FROM Sportsinfo WHERE SportName  =  'Lacrosse')	game_1
SELECT fname ,  age FROM Student WHERE StuID IN (SELECT StuID FROM Sportsinfo WHERE SportName  =  'Football' INTERSECT SELECT StuID FROM Sportsinfo WHERE SportName  =  'Lacrosse')	game_1
SELECT lname ,  sex FROM Student WHERE StuID IN (SELECT T1.StuID FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.GameID  =  T2.GameID WHERE T2.Gname  =  'Call of Destiny' INTERSECT SELECT T1.StuID FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.GameID  =  T2.GameID WHERE T2.Gname  =  'Works of Widenius')	game_1
SELECT lname ,  sex FROM Student WHERE StuID IN (SELECT T1.StuID FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.GameID  =  T2.GameID WHERE T2.Gname  =  'Call of Destiny' INTERSECT SELECT T1.StuID FROM Plays_games AS T1 JOIN Video_games AS T2 ON T1.GameID  =  T2.GameID WHERE T2.Gname  =  'Works of Widenius')	game_1
SELECT customer_name FROM customers	customers_and_addresses
SELECT customer_name FROM customers	customers_and_addresses
SELECT count(*) FROM customers	customers_and_addresses
SELECT count(*) FROM customers	customers_and_addresses
SELECT AVG(sum_qty) FROM (SELECT order_id, SUM(order_quantity) as sum_qty FROM order_items GROUP BY order_id)	customers_and_addresses
SELECT avg(order_quantity) FROM order_items	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method  =  'Cash'	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method  =  'Cash'	customers_and_addresses
SELECT date_became_customer FROM customers WHERE customer_id BETWEEN 10 AND 20	customers_and_addresses
SELECT date_became_customer FROM customers WHERE customer_id BETWEEN 10 AND 20	customers_and_addresses
WITH PopularPayment AS (SELECT payment_method, COUNT(customer_id) as Popularity FROM customers GROUP BY payment_method) SELECT payment_method FROM PopularPayment WHERE Popularity = (SELECT MAX(Popularity) FROM PopularPayment)	customers_and_addresses
SELECT payment_method FROM customers GROUP BY payment_method HAVING COUNT(payment_method) = (SELECT MAX(c) FROM (SELECT COUNT(payment_method) AS c FROM customers GROUP BY payment_method) AS Maximums)	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method  =  (SELECT payment_method FROM customers GROUP BY payment_method ORDER BY count(*) DESC LIMIT 1)	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method  =  (SELECT payment_method FROM customers GROUP BY payment_method ORDER BY count(*) DESC LIMIT 1)	customers_and_addresses
SELECT DISTINCT payment_method FROM customers	customers_and_addresses
SELECT DISTINCT payment_method FROM customers	customers_and_addresses
SELECT product_details FROM products;	customers_and_addresses
SELECT product_details FROM products;	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_name LIKE '%Alex%'	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_name LIKE '%Alex%'	customers_and_addresses
SELECT product_details FROM products WHERE product_details LIKE '%Latte%' OR product_details LIKE '%Americano%'	customers_and_addresses
SELECT product_details FROM products WHERE product_details LIKE '%Latte%' OR product_details LIKE '%Americano%'	customers_and_addresses
SELECT address_content FROM addresses WHERE address_id IN (SELECT address_id FROM customer_addresses WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'Maudie Kertzmann'))	customers_and_addresses
SELECT a.address_content FROM addresses a WHERE EXISTS (SELECT 1 FROM customer_addresses ca JOIN customers c ON ca.customer_id = c.customer_id WHERE ca.address_id = a.address_id AND c.customer_name = 'Maudie Kertzmann')	customers_and_addresses
SELECT COUNT(DISTINCT customer_addresses.customer_id) FROM customer_addresses JOIN addresses ON customer_addresses.address_id = addresses.address_id WHERE addresses.city = 'Lake Geovannyton';	customers_and_addresses
SELECT COUNT(DISTINCT customers.customer_id) FROM customers JOIN customer_addresses ON customers.customer_id = customer_addresses.customer_id JOIN addresses ON customer_addresses.address_id = addresses.address_id WHERE addresses.city = 'Lake Geovannyton'	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_addresses WHERE address_id IN (SELECT address_id FROM addresses WHERE state_province_county = 'Colorado'))	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_addresses WHERE address_id IN (SELECT address_id FROM addresses WHERE state_province_county = 'Colorado'))	customers_and_addresses
SELECT city FROM addresses WHERE city NOT IN ( SELECT DISTINCT t3.city FROM customers AS t1 JOIN customer_addresses AS t2 ON t1.customer_id  =  t2.customer_id JOIN addresses AS t3 ON t2.address_id  =  t3.address_id)	customers_and_addresses
SELECT city FROM addresses EXCEPT SELECT city FROM addresses INNER JOIN customer_addresses ON addresses.address_id = customer_addresses.address_id	customers_and_addresses
SELECT addresses.city FROM addresses INNER JOIN (SELECT address_id FROM customer_addresses GROUP BY address_id HAVING COUNT(customer_id) = (SELECT MAX(CustCount) FROM (SELECT COUNT(customer_id) as CustCount FROM customer_addresses GROUP BY address_id) Temp)) AS MostCustomers ON addresses.address_id = MostCustomers.address_id	customers_and_addresses
SELECT t3.city FROM customers AS t1 JOIN customer_addresses AS t2 ON t1.customer_id  =  t2.customer_id JOIN addresses AS t3 ON t2.address_id  =  t3.address_id GROUP BY t3.city ORDER BY count(*) DESC LIMIT 1	customers_and_addresses
SELECT DISTINCT city FROM addresses	customers_and_addresses
SELECT DISTINCT city FROM addresses	customers_and_addresses
SELECT city FROM addresses WHERE zip_postcode  =  255	customers_and_addresses
SELECT city FROM addresses WHERE zip_postcode  =  255	customers_and_addresses
SELECT state_province_county ,  country FROM addresses WHERE zip_postcode LIKE '4%'	customers_and_addresses
SELECT state_province_county ,  country FROM addresses WHERE zip_postcode LIKE '4%'	customers_and_addresses
SELECT country FROM addresses GROUP BY country HAVING count(address_id)  >  4	customers_and_addresses
SELECT country FROM addresses GROUP BY country HAVING count(address_id)  >  4	customers_and_addresses
SELECT channel_code FROM customer_contact_channels GROUP BY channel_code HAVING count(customer_id)  <  5	customers_and_addresses
SELECT channel_code FROM customer_contact_channels GROUP BY channel_code HAVING count(customer_id)  <  5	customers_and_addresses
SELECT ccc.channel_code FROM customers cus JOIN customer_contact_channels ccc ON cus.customer_id = ccc.customer_id WHERE cus.customer_name = 'Tillman Ernser'	customers_and_addresses
SELECT cc.channel_code FROM customers c JOIN customer_contact_channels cc ON c.customer_id = cc.customer_id WHERE c.customer_name = 'Tillman Ernser'	customers_and_addresses
SELECT max(t2.active_to_date) FROM customers AS t1 JOIN customer_contact_channels AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.customer_name  =  'Tillman Ernser'	customers_and_addresses
SELECT ccc.active_to_date FROM customer_contact_channels ccc JOIN customers c ON ccc.customer_id = c.customer_id WHERE c.customer_name = 'Tillman Ernser' ORDER BY ccc.active_to_date DESC LIMIT 1	customers_and_addresses
SELECT avg(active_to_date - active_from_date) FROM customer_contact_channels	customers_and_addresses
SELECT avg(active_to_date - active_from_date) FROM customer_contact_channels	customers_and_addresses
SELECT channel_code ,  contact_number FROM customer_contact_channels WHERE active_to_date - active_from_date  =  (SELECT active_to_date - active_from_date FROM customer_contact_channels ORDER BY (active_to_date - active_from_date) DESC LIMIT 1)	customers_and_addresses
SELECT c.channel_code, c.contact_number FROM customer_contact_channels AS c WHERE (julianday(c.active_to_date) - julianday(c.active_from_date)) = (SELECT MAX(julianday(active_to_date) - julianday(active_from_date)) FROM customer_contact_channels)	customers_and_addresses
SELECT t1.customer_name ,  t2.active_from_date FROM customers AS t1 JOIN customer_contact_channels AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.channel_code  =  'Email'	customers_and_addresses
SELECT t1.customer_name ,  t2.active_from_date FROM customers AS t1 JOIN customer_contact_channels AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.channel_code  =  'Email'	customers_and_addresses
SELECT c.customer_name FROM customers c INNER JOIN customer_orders co ON c.customer_id = co.customer_id INNER JOIN order_items oi ON co.order_id = oi.order_id GROUP BY co.order_id ORDER BY SUM(oi.order_quantity) DESC LIMIT 1	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id = (SELECT customer_id FROM customer_orders WHERE order_id = (SELECT order_id FROM order_items GROUP BY order_id ORDER BY SUM(order_quantity) DESC LIMIT 1))	customers_and_addresses
SELECT customers.customer_name FROM customers JOIN (SELECT customer_id, SUM(order_quantity) as total_items FROM customer_orders JOIN order_items ON customer_orders.order_id = order_items.order_id GROUP BY customer_id ORDER BY total_items DESC LIMIT 1) q ON q.customer_id = customers.customer_id	customers_and_addresses
SELECT c.customer_name FROM customers c INNER JOIN customer_orders co ON c.customer_id = co.customer_id INNER JOIN order_items oi ON co.order_id = oi.order_id GROUP BY c.customer_id ORDER BY SUM(oi.order_quantity) DESC LIMIT 1	customers_and_addresses
SELECT t1.payment_method FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id GROUP BY t1.customer_name ORDER BY sum(t3.order_quantity) LIMIT 1	customers_and_addresses
SELECT c.payment_method FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id JOIN order_items oi ON co.order_id = oi.order_id GROUP BY c.customer_id ORDER BY SUM(oi.order_quantity) ASC LIMIT 1	customers_and_addresses
SELECT count(DISTINCT t3.product_id) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id WHERE t1.customer_name  =  'Rodrick Heaney'	customers_and_addresses
SELECT count(DISTINCT t3.product_id) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id WHERE t1.customer_name  =  'Rodrick Heaney'	customers_and_addresses
SELECT sum(t3.order_quantity) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id WHERE t1.customer_name  =  'Rodrick Heaney'	customers_and_addresses
SELECT sum(t3.order_quantity) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id WHERE t1.customer_name  =  'Rodrick Heaney'	customers_and_addresses
SELECT count(DISTINCT customer_id) FROM customer_orders WHERE order_status  =  'Cancelled'	customers_and_addresses
SELECT count(DISTINCT customer_id) FROM customer_orders WHERE order_status  =  'Cancelled'	customers_and_addresses
SELECT count(*) FROM customer_orders WHERE order_details  =  'Second time'	customers_and_addresses
SELECT count(*) FROM customer_orders WHERE order_details  =  'Second time'	customers_and_addresses
SELECT t1.customer_name ,  t2.order_date FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id WHERE order_status  =  'Delivered'	customers_and_addresses
SELECT t1.customer_name ,  t2.order_date FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id WHERE order_status  =  'Delivered'	customers_and_addresses
SELECT COUNT(DISTINCT oi.product_id) FROM order_items oi, customer_orders co WHERE oi.order_id = co.order_id AND co.order_status = 'Cancelled'	customers_and_addresses
SELECT sum(t2.order_quantity) FROM customer_orders AS t1 JOIN order_items AS t2 ON t1.order_id  =  t2.order_id WHERE t1.order_status  =  'Cancelled'	customers_and_addresses
SELECT sum(t2.order_quantity) FROM customer_orders AS t1 JOIN order_items AS t2 ON t1.order_id  =  t2.order_id WHERE t1.order_date  <  '2018-03-17 07:13:53'	customers_and_addresses
SELECT TOTAL(oi.order_quantity) AS total_purchased FROM order_items oi, customer_orders co WHERE oi.order_id = co.order_id AND co.order_date < '2018-03-17 07:13:53'	customers_and_addresses
SELECT c.customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM customer_orders co WHERE co.customer_id = c.customer_id AND co.order_date = (SELECT MAX(order_date) FROM customer_orders))	customers_and_addresses
SELECT t1.customer_name FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id ORDER BY t2.order_date DESC LIMIT 1	customers_and_addresses
SELECT p.product_details FROM products p WHERE p.product_id IN (SELECT oi.product_id FROM order_items oi GROUP BY oi.product_id HAVING SUM(oi.order_quantity) = (SELECT MAX(quantity_sum) FROM (SELECT SUM(order_quantity) as quantity_sum FROM order_items GROUP BY product_id)))	customers_and_addresses
SELECT product_details FROM products WHERE product_id = (SELECT product_id FROM order_items GROUP BY product_id ORDER BY SUM(order_quantity) DESC LIMIT 1)	customers_and_addresses
SELECT P.product_id, P.product_details FROM products P, order_items O WHERE P.product_id = O.product_id GROUP BY P.product_id HAVING SUM(O.order_quantity) = (SELECT MAX(total_quantity) FROM (SELECT SUM(order_quantity) AS total_quantity FROM order_items GROUP BY product_id))	customers_and_addresses
SELECT t2.product_details ,  t2.product_id FROM order_items AS t1 JOIN products AS t2 ON t1.product_id  =  t2.product_id GROUP BY t1.product_id ORDER BY sum(t1.order_quantity) LIMIT 1	customers_and_addresses
SELECT address_content FROM addresses WHERE city  =  'East Julianaside' AND state_province_county  =  'Texas' UNION SELECT address_content FROM addresses WHERE city  =  'Gleasonmouth' AND state_province_county  =  'Arizona'	customers_and_addresses
SELECT address_content FROM addresses WHERE city  =  'East Julianaside' AND state_province_county  =  'Texas' UNION SELECT address_content FROM addresses WHERE city  =  'Gleasonmouth' AND state_province_county  =  'Arizona'	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method != 'Cash'	customers_and_addresses
SELECT customer_name FROM customers WHERE payment_method != 'Cash'	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders JOIN order_items ON customer_orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id WHERE product_details = 'Latte')	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT customers.customer_id FROM customers JOIN customer_orders ON customers.customer_id = customer_orders.customer_id JOIN order_items ON customer_orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id WHERE product_details = 'Latte')	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)	customers_and_addresses
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)	customers_and_addresses
SELECT DISTINCT c.customer_name FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id JOIN order_items oi ON co.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id WHERE p.product_details IN ('Americano', 'Latte') GROUP BY c.customer_id HAVING COUNT(DISTINCT p.product_details) = 2	customers_and_addresses
SELECT DISTINCT customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id WHERE co.customer_id = c.customer_id AND p.product_details = 'Americano') AND EXISTS (SELECT 1 FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id WHERE co.customer_id = c.customer_id AND p.product_details = 'Latte')	customers_and_addresses
SELECT count(*) FROM artist	music_4
SELECT count(*) FROM artist	music_4
SELECT Age FROM artist	music_4
SELECT Age FROM artist	music_4
SELECT avg(Age) FROM artist	music_4
SELECT avg(Age) FROM artist	music_4
SELECT Famous_Title FROM artist WHERE Artist  =  'Triumfall'	music_4
SELECT Famous_Title FROM artist WHERE Artist  =  'Triumfall'	music_4
SELECT distinct(Famous_Release_date) FROM artist	music_4
SELECT distinct(Famous_Release_date) FROM artist	music_4
SELECT Date_of_ceremony ,  RESULT FROM music_festival	music_4
SELECT Date_of_ceremony ,  RESULT FROM music_festival	music_4
SELECT Category FROM music_festival WHERE RESULT  =  'Awarded'	music_4
SELECT Category FROM music_festival WHERE RESULT  =  'Awarded'	music_4
SELECT max(Weeks_on_Top) ,  min(Weeks_on_Top) FROM volume	music_4
SELECT max(Weeks_on_Top) ,  min(Weeks_on_Top) FROM volume	music_4
SELECT Song FROM volume WHERE Weeks_on_Top  >  1	music_4
SELECT Song FROM volume WHERE Weeks_on_Top  >  1	music_4
SELECT Song FROM volume ORDER BY Song	music_4
SELECT Song FROM volume ORDER BY Song	music_4
SELECT COUNT(DISTINCT Artist_ID) FROM volume	music_4
SELECT COUNT(DISTINCT Artist_ID) FROM volume	music_4
SELECT DISTINCT m.date_of_ceremony FROM music_festival m JOIN volume v ON m.volume = v.volume_id WHERE v.weeks_on_top > 2	music_4
SELECT T1.Date_of_ceremony FROM music_festival AS T1 JOIN volume AS T2 ON T1.Volume  =  T2.Volume_ID WHERE T2.Weeks_on_Top  >  2	music_4
SELECT song FROM volume WHERE volume_id IN (SELECT volume FROM music_festival WHERE result = 'Nominated')	music_4
SELECT T2.Song FROM music_festival AS T1 JOIN volume AS T2 ON T1.Volume  =  T2.Volume_ID WHERE T1.Result  =  'Nominated'	music_4
SELECT T2.Issue_Date FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.Artist  =  'Gorgoroth'	music_4
SELECT T2.Issue_Date FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.Artist  =  'Gorgoroth'	music_4
SELECT T2.Song FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  >=  32	music_4
SELECT T2.Song FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  >=  32	music_4
SELECT avg(T2.Weeks_on_Top) FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  <=  25	music_4
SELECT avg(T2.Weeks_on_Top) FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  <=  25	music_4
SELECT T1.Famous_Title FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T2.Weeks_on_Top  >  2	music_4
SELECT famous_title FROM artist WHERE artist_id IN (SELECT artist_id FROM volume WHERE weeks_on_top > 2)	music_4
SELECT Famous_Title ,  Age FROM artist ORDER BY Age DESC	music_4
SELECT Famous_Title ,  Age FROM artist ORDER BY Age DESC	music_4
SELECT famous_release_date FROM artist WHERE age = (SELECT MAX(age) FROM artist)	music_4
SELECT Famous_Release_date FROM artist ORDER BY Age DESC LIMIT 1	music_4
SELECT Category ,  COUNT(*) FROM music_festival GROUP BY Category	music_4
SELECT Category ,  COUNT(*) FROM music_festival GROUP BY Category	music_4
SELECT result FROM music_festival GROUP BY result HAVING COUNT(result) = (SELECT MAX(Cnt) FROM (SELECT COUNT(result) AS Cnt FROM music_festival GROUP BY result))	music_4
SELECT RESULT FROM music_festival GROUP BY RESULT ORDER BY COUNT(*) DESC LIMIT 1	music_4
SELECT Category FROM music_festival GROUP BY Category HAVING COUNT(*)  >  1	music_4
SELECT Category FROM music_festival GROUP BY Category HAVING COUNT(*)  >  1	music_4
SELECT Song FROM volume ORDER BY Weeks_on_Top DESC LIMIT 1	music_4
SELECT Song FROM volume ORDER BY Weeks_on_Top DESC LIMIT 1	music_4
SELECT Famous_Title FROM artist WHERE Artist_ID NOT IN(SELECT Artist_ID FROM volume)	music_4
SELECT Famous_Title FROM artist WHERE Artist_ID NOT IN(SELECT Artist_ID FROM volume)	music_4
SELECT DISTINCT ar.famous_title FROM artist ar JOIN volume vo ON ar.artist_id = vo.artist_id WHERE vo.weeks_on_top > 2 AND ar.artist_id IN (SELECT artist_id FROM volume WHERE weeks_on_top < 2)	music_4
SELECT famous_title FROM artist WHERE artist_id IN (SELECT artist_id FROM volume WHERE weeks_on_top > 2) AND artist_id IN (SELECT artist_id FROM volume WHERE weeks_on_top < 2)	music_4
SELECT Date_of_ceremony FROM music_festival WHERE Category  =  'Best Song' AND RESULT  =  'Awarded'	music_4
SELECT Date_of_ceremony FROM music_festival WHERE Category  =  'Best Song' AND RESULT  =  'Awarded'	music_4
SELECT issue_date FROM volume WHERE weeks_on_top = (SELECT MIN(weeks_on_top) FROM volume)	music_4
SELECT v.issue_date FROM volume v WHERE v.weeks_on_top = (SELECT MIN(weeks_on_top) FROM volume)	music_4
SELECT COUNT(DISTINCT Artist_ID) FROM volume	music_4
SELECT COUNT(DISTINCT Artist_ID) FROM volume	music_4
SELECT RESULT ,  COUNT(*) FROM music_festival GROUP BY RESULT ORDER BY COUNT(*) DESC	music_4
SELECT RESULT ,  COUNT(*) FROM music_festival GROUP BY RESULT ORDER BY COUNT(*) DESC	music_4
SELECT Issue_Date FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  <=  23	music_4
SELECT Issue_Date FROM artist AS T1 JOIN volume AS T2 ON T1.Artist_ID  =  T2.Artist_ID WHERE T1.age  <=  23	music_4
SELECT count(*) FROM roller_coaster	roller_coaster
SELECT Name FROM roller_coaster ORDER BY LENGTH ASC	roller_coaster
SELECT LENGTH ,  Height FROM roller_coaster	roller_coaster
SELECT Name FROM country WHERE Languages != 'German'	roller_coaster
SELECT Status FROM roller_coaster WHERE LENGTH  >  3300 OR Height  >  100	roller_coaster
SELECT speed FROM roller_coaster WHERE length = (SELECT MAX(length) FROM roller_coaster)	roller_coaster
SELECT avg(Speed) FROM roller_coaster	roller_coaster
SELECT Status ,  COUNT(*) FROM roller_coaster GROUP BY Status	roller_coaster
SELECT r.status FROM roller_coaster r GROUP BY r.status HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM roller_coaster GROUP BY status))	roller_coaster
SELECT Status FROM roller_coaster GROUP BY Status HAVING COUNT(*)  >  2	roller_coaster
SELECT park FROM roller_coaster WHERE speed = (SELECT MAX(speed) FROM roller_coaster)	roller_coaster
SELECT T2.Name ,  T1.Name FROM country AS T1 JOIN roller_coaster AS T2 ON T1.Country_ID  =  T2.Country_ID	roller_coaster
SELECT C.name FROM country C WHERE (SELECT COUNT(*) FROM roller_coaster R WHERE R.country_id = C.country_id) > 1	roller_coaster
SELECT country.name, country.population FROM country INNER JOIN (SELECT MAX(height) AS MaxHeight, country_id FROM roller_coaster GROUP BY country_id) AS MaxCoasters ON country.country_id = MaxCoasters.country_id WHERE MaxCoasters.MaxHeight = (SELECT MAX(height) FROM roller_coaster)	roller_coaster
SELECT (SELECT name FROM country WHERE country_id = rc.country_id), AVG(speed) FROM roller_coaster rc GROUP BY rc.country_id	roller_coaster
SELECT count(*) FROM country WHERE country_id NOT IN ( SELECT country_id FROM roller_coaster WHERE LENGTH  >  3000 )	roller_coaster
SELECT country.name, country.area, country.population FROM country WHERE country_id IN (SELECT country_id FROM roller_coaster WHERE speed > 100)	roller_coaster
SELECT count(DISTINCT rank) FROM captain	ship_1
SELECT count(DISTINCT rank) FROM captain	ship_1
SELECT count(*) ,  rank FROM captain GROUP BY rank	ship_1
SELECT count(*) ,  rank FROM captain GROUP BY rank	ship_1
SELECT count(*) ,  rank FROM captain WHERE age  <  50 GROUP BY rank	ship_1
SELECT count(*) ,  rank FROM captain WHERE age  <  50 GROUP BY rank	ship_1
SELECT name FROM captain ORDER BY age DESC	ship_1
SELECT name FROM captain ORDER BY age DESC	ship_1
SELECT name ,  CLASS ,  rank FROM captain	ship_1
SELECT name ,  CLASS ,  rank FROM captain	ship_1
SELECT rank FROM captain GROUP BY rank HAVING COUNT(rank) = (SELECT MAX(cnt) FROM (SELECT rank, COUNT(*) AS cnt FROM captain GROUP BY rank) tmp)	ship_1
SELECT rank FROM captain GROUP BY rank HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM captain GROUP BY rank))	ship_1
SELECT CLASS FROM captain GROUP BY CLASS HAVING count(*)  >  2	ship_1
SELECT CLASS FROM captain GROUP BY CLASS HAVING count(*)  >  2	ship_1
SELECT name FROM captain WHERE rank  =  'Midshipman' OR rank  =  'Lieutenant'	ship_1
SELECT name FROM captain WHERE rank  =  'Midshipman' OR rank  =  'Lieutenant'	ship_1
SELECT avg(age) ,  min(age) ,  CLASS FROM captain GROUP BY CLASS	ship_1
SELECT avg(age) ,  min(age) ,  CLASS FROM captain GROUP BY CLASS	ship_1
SELECT rank FROM captain WHERE CLASS  =  'Cutter' INTERSECT SELECT rank FROM captain WHERE CLASS  =  'Armed schooner'	ship_1
SELECT DISTINCT c1.rank FROM captain c1 JOIN ship s1 ON c1.ship_id = s1.ship_id WHERE s1.class = 'Cutter' AND c1.captain_id IN (SELECT c2.captain_id FROM captain c2 JOIN ship s2 ON c2.ship_id = s2.ship_id WHERE s2.class = 'Armed schooner')	ship_1
SELECT rank FROM captain EXCEPT SELECT rank FROM captain WHERE CLASS  =  'Third-rate ship of the line'	ship_1
SELECT DISTINCT c.rank FROM captain c WHERE NOT EXISTS (SELECT 1 FROM captain c2 WHERE c2.class = 'Third-rate ship of the line' AND c.ship_id = c2.ship_id AND c.captain_id != c2.captain_id)	ship_1
SELECT name FROM captain WHERE age = (SELECT MIN(age) FROM captain)	ship_1
SELECT c.name FROM captain c WHERE c.age = (SELECT MIN(age) FROM captain)	ship_1
SELECT count(*) FROM ship	ship_1
SELECT count(*) FROM ship	ship_1
SELECT name, type, flag FROM ship WHERE built_year = (SELECT MAX(built_year) FROM ship)	ship_1
SELECT s.name, s.type, s.flag FROM ship s WHERE s.built_year = (SELECT MAX(built_year) FROM ship)	ship_1
SELECT count(*) ,  flag FROM ship GROUP BY flag	ship_1
SELECT count(*) ,  flag FROM ship GROUP BY flag	ship_1
SELECT flag FROM (SELECT flag, COUNT(*) as num FROM ship GROUP BY flag) WHERE num = (SELECT MAX(num) FROM (SELECT flag, COUNT(*) as num FROM ship GROUP BY flag))	ship_1
SELECT s.flag FROM ship s GROUP BY s.flag HAVING COUNT(s.flag) = (SELECT MAX(COUNTed) FROM (SELECT COUNT(flag) AS COUNTed FROM ship GROUP BY flag))	ship_1
SELECT name FROM ship ORDER BY built_year ,  CLASS	ship_1
SELECT name FROM ship ORDER BY built_year ,  CLASS	ship_1
SELECT TYPE FROM ship WHERE flag  =  'Panama' INTERSECT SELECT TYPE FROM ship WHERE flag  =  'Malta'	ship_1
SELECT TYPE FROM ship WHERE flag  =  'Panama' INTERSECT SELECT TYPE FROM ship WHERE flag  =  'Malta'	ship_1
SELECT built_year FROM ship GROUP BY built_year ORDER BY count(*) DESC LIMIT 1	ship_1
SELECT built_year AS Year FROM ship GROUP BY Year HAVING COUNT(ship_id) = (SELECT MAX(Count) FROM (SELECT COUNT(ship_id) AS Count FROM ship GROUP BY built_year))	ship_1
SELECT t1.name FROM ship AS t1 JOIN captain AS t2 ON t1.ship_id  =  t2.ship_id GROUP BY t2.ship_id HAVING count(*)  >  1	ship_1
SELECT t1.name FROM ship AS t1 JOIN captain AS t2 ON t1.ship_id  =  t2.ship_id GROUP BY t2.ship_id HAVING count(*)  >  1	ship_1
SELECT name ,  CLASS FROM ship WHERE ship_id NOT IN (SELECT ship_id FROM captain)	ship_1
SELECT name ,  CLASS FROM ship WHERE ship_id NOT IN (SELECT ship_id FROM captain)	ship_1
SELECT t1.name FROM ship AS t1 JOIN captain AS t2 ON t1.ship_id  =  t2.ship_id ORDER BY t2.age LIMIT 1	ship_1
SELECT s.name FROM ship s JOIN captain c ON s.ship_id = c.ship_id WHERE c.age = (SELECT MIN(age) FROM captain)	ship_1
SELECT name ,  flag FROM ship WHERE ship_id NOT IN (SELECT ship_id FROM captain WHERE rank  =  'Midshipman')	ship_1
SELECT name ,  flag FROM ship WHERE ship_id NOT IN (SELECT ship_id FROM captain WHERE rank  =  'Midshipman')	ship_1
SELECT DISTINCT s.name FROM ship s JOIN captain c1 ON s.ship_id = c1.ship_id JOIN captain c2 ON s.ship_id = c2.ship_id WHERE c1.rank = 'Midshipman' AND c2.rank = 'Lieutenant'	ship_1
SELECT name FROM ship WHERE ship_id IN (SELECT ship_id FROM captain WHERE rank = 'Lieutenant') AND ship_id IN (SELECT ship_id FROM captain WHERE rank = 'Midshipman')	ship_1
SELECT host_city FROM hosting_city ORDER BY YEAR DESC LIMIT 1	city_record
SELECT c.city_id FROM hosting_city AS hc JOIN city AS c ON hc.host_city = c.city_id WHERE hc.year = (SELECT MAX(year) FROM hosting_city) LIMIT 1	city_record
SELECT DISTINCT hc.match_id FROM hosting_city hc, match m WHERE hc.match_id = m.match_id AND m.competition = '1994 FIFA World Cup qualification'	city_record
SELECT match_id FROM MATCH WHERE competition = '1994 FIFA World Cup qualification'	city_record
SELECT city FROM city WHERE city_id IN (SELECT host_city FROM hosting_city WHERE year > 2010 GROUP BY host_city)	city_record
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id = T2.host_city WHERE T2.year  >  2010	city_record
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY T2.host_city ORDER BY count(*) DESC LIMIT 1	city_record
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY T2.host_city ORDER BY count(*) DESC LIMIT 1	city_record
SELECT venue FROM match WHERE match_id IN (SELECT match_id FROM hosting_city WHERE host_city IN (SELECT city_id FROM city WHERE city = 'Nanjing ( Jiangsu )')) AND competition = '1994 FIFA World Cup qualification'	city_record
SELECT venue FROM match WHERE match_id IN (SELECT match_id FROM hosting_city WHERE host_city IN (SELECT city_id FROM city WHERE city = 'Nanjing ( Jiangsu )')) AND competition = '1994 FIFA World Cup qualification'	city_record
SELECT T2.Jan FROM city AS T1 JOIN temperature AS T2 ON T1.city_id = T2.city_id WHERE T1.city = 'Shanghai'	city_record
SELECT T2.Jan FROM city AS T1 JOIN temperature AS T2 ON T1.city_id = T2.city_id WHERE T1.city = 'Shanghai'	city_record
SELECT T2.year FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city WHERE T1.city  =  'Taizhou ( Zhejiang )'	city_record
SELECT T2.year FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city WHERE T1.city  =  'Taizhou ( Zhejiang )'	city_record
SELECT city FROM city ORDER BY regional_population DESC LIMIT 3	city_record
SELECT city FROM city ORDER BY regional_population DESC LIMIT 3	city_record
SELECT city, gdp FROM city WHERE gdp = (SELECT MIN(gdp) FROM city)	city_record
SELECT city, gdp FROM city WHERE gdp = (SELECT MIN(gdp) FROM city)	city_record
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id ORDER BY T2.Feb DESC LIMIT 1	city_record
SELECT city.city FROM city, temperature WHERE city.city_id = temperature.city_id AND temperature.feb = (SELECT MAX(feb) FROM temperature)	city_record
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul OR T2.Mar  >  T2.Oct	city_record
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul OR T2.Mar  >  T2.Oct	city_record
SELECT city FROM city WHERE city_id IN (SELECT city_id FROM temperature WHERE mar < jul) AND city_id IN (SELECT host_city FROM hosting_city);	city_record
SELECT city FROM city WHERE city_id IN (SELECT city_id FROM temperature WHERE mar < jul) AND city_id IN (SELECT host_city FROM hosting_city);	city_record
SELECT c.city FROM city c JOIN temperature t ON c.city_id = t.city_id LEFT JOIN hosting_city hc ON c.city_id = hc.host_city WHERE t.mar < t.dec AND hc.host_city IS NULL	city_record
SELECT city FROM city WHERE city_id IN (SELECT city_id FROM temperature WHERE mar < dec) AND city_id NOT IN (SELECT host_city FROM hosting_city)	city_record
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Feb  >  T2.Jun UNION SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city	city_record
SELECT city FROM city WHERE city_id IN (SELECT city_id FROM temperature WHERE feb > jun) OR city_id IN (SELECT host_city FROM hosting_city)	city_record
SELECT city FROM city WHERE regional_population  >  10000000	city_record
SELECT city FROM city WHERE regional_population  >  10000000	city_record
SELECT city FROM city WHERE regional_population > 8000000 OR regional_population < 5000000;	city_record
SELECT city FROM city WHERE regional_population > 8000000 OR regional_population < 5000000	city_record
SELECT count(*) ,  Competition FROM MATCH GROUP BY Competition	city_record
SELECT count(*) ,  Competition FROM MATCH GROUP BY Competition	city_record
SELECT venue FROM MATCH ORDER BY date DESC	city_record
SELECT venue FROM MATCH ORDER BY date DESC	city_record
SELECT GDP FROM city WHERE regional_population = (SELECT MAX(regional_population) FROM city);	city_record
SELECT gdp FROM city ORDER BY Regional_Population DESC LIMIT 1	city_record
SELECT t1.gdp ,  t1.Regional_Population FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY t2.Host_City HAVING count(*)  >  1	city_record
SELECT t1.gdp ,  t1.Regional_Population FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY t2.Host_City HAVING count(*)  >  1	city_record
SELECT individual_first_name ,  individual_middle_name ,  individual_last_name FROM individuals ORDER BY individual_last_name	e_government
SELECT individual_first_name ,  individual_middle_name ,  individual_last_name FROM individuals ORDER BY individual_last_name	e_government
SELECT DISTINCT form_type_code FROM forms	e_government
SELECT DISTINCT form_type_code FROM forms	e_government
SELECT t1.form_name FROM forms AS t1 JOIN party_forms AS t2 ON t1.form_id  =  t2.form_id GROUP BY t2.form_id ORDER BY count(*) DESC LIMIT 1	e_government
SELECT t1.form_name FROM forms AS t1 JOIN party_forms AS t2 ON t1.form_id  =  t2.form_id GROUP BY t2.form_id ORDER BY count(*) DESC LIMIT 1	e_government
SELECT payment_method_code ,  party_phone FROM parties WHERE party_email  =  'enrico09@example.com'	e_government
SELECT payment_method_code ,  party_phone FROM parties WHERE party_email  =  'enrico09@example.com'	e_government
SELECT DISTINCT p.party_email FROM parties p JOIN party_forms pf ON p.party_id = pf.party_id WHERE pf.form_id = (SELECT form_id FROM party_forms GROUP BY form_id ORDER BY COUNT(*) DESC LIMIT 1)	e_government
SELECT t1.party_email FROM parties AS t1 JOIN party_forms AS t2 ON t1.party_id  =  t2.party_id WHERE t2.form_id  =  (SELECT form_id FROM party_forms GROUP BY form_id ORDER BY count(*) DESC LIMIT 1)	e_government
SELECT organization_name FROM organizations ORDER BY date_formed ASC	e_government
SELECT organization_name FROM organizations ORDER BY date_formed ASC	e_government
SELECT org.organization_name FROM organizations org WHERE org.date_formed = (SELECT MAX(date_formed) FROM organizations)	e_government
SELECT organization_name FROM organizations ORDER BY date_formed DESC LIMIT 1	e_government
SELECT t3.individual_last_name FROM organizations AS t1 JOIN organization_contact_individuals AS t2 ON t1.organization_id  =  t2.organization_id JOIN individuals AS t3 ON t2.individual_id  =  t3.individual_id WHERE t1.organization_name  =  'Labour Party' ORDER BY t2.date_contact_to DESC LIMIT 1	e_government
SELECT t3.individual_last_name FROM organizations AS t1 JOIN organization_contact_individuals AS t2 ON t1.organization_id  =  t2.organization_id JOIN individuals AS t3 ON t2.individual_id  =  t3.individual_id WHERE t1.organization_name  =  'Labour Party' ORDER BY t2.date_contact_to DESC LIMIT 1	e_government
SELECT individual_last_name FROM individuals WHERE individual_id = (SELECT oci.individual_id FROM organization_contact_individuals oci JOIN organizations o ON oci.organization_id = o.organization_id WHERE o.uk_vat_number = (SELECT MAX(uk_vat_number) FROM organizations) ORDER BY oci.date_contact_from ASC LIMIT 1)	e_government
SELECT individuals.individual_last_name FROM individuals JOIN organization_contact_individuals ON individuals.individual_id = organization_contact_individuals.individual_id JOIN organizations ON organization_contact_individuals.organization_id = organizations.organization_id WHERE organizations.uk_vat_number = (SELECT MAX(uk_vat_number) FROM organizations) ORDER BY organization_contact_individuals.date_contact_from ASC LIMIT 1	e_government
SELECT count(*) FROM services	e_government
SELECT count(*) FROM services	e_government
SELECT service_name FROM services WHERE service_id NOT IN (SELECT service_id FROM party_services)	e_government
SELECT service_name FROM services WHERE service_id NOT IN (SELECT service_id FROM party_services)	e_government
SELECT DISTINCT town_city, state_province_county FROM addresses	e_government
SELECT DISTINCT town_city, state_province_county FROM addresses;	e_government
SELECT COUNT(DISTINCT town_city) FROM addresses WHERE state_province_county = 'Colorado'	e_government
SELECT COUNT(DISTINCT town_city) FROM addresses WHERE state_province_county = 'Colorado'	e_government
SELECT payment_method_code FROM parties GROUP BY payment_method_code HAVING count(*)  >  3	e_government
SELECT payment_method_code FROM parties GROUP BY payment_method_code HAVING count(*)  >  3	e_government
SELECT organization_name FROM organizations WHERE organization_name LIKE '%Party%'	e_government
SELECT organization_name FROM organizations WHERE organization_name LIKE '%Party%'	e_government
SELECT count(DISTINCT payment_method_code) FROM parties	e_government
SELECT count(DISTINCT payment_method_code) FROM parties	e_government
SELECT t1.party_email FROM parties AS t1 JOIN party_services AS t2 ON t1.party_id  =  t2.customer_id GROUP BY t1.party_email ORDER BY count(*) DESC LIMIT 1	e_government
SELECT party_email FROM parties WHERE party_id IN (SELECT customer_id FROM party_services GROUP BY customer_id HAVING COUNT(customer_id) = (SELECT MAX(count) FROM (SELECT COUNT(customer_id) as count FROM party_services GROUP BY customer_id)))	e_government
SELECT state_province_county FROM addresses WHERE line_1_number_building LIKE '%6862 Kaitlyn Knolls%'	e_government
SELECT state_province_county FROM addresses WHERE line_1_number_building LIKE '%6862 Kaitlyn Knolls%'	e_government
SELECT O.organization_name FROM organizations O WHERE O.organization_id IN (SELECT organization_id FROM organization_contact_individuals GROUP BY organization_id HAVING COUNT(individual_id) = (SELECT MAX(C.ind_count) FROM (SELECT COUNT(individual_id) AS ind_count FROM organization_contact_individuals GROUP BY organization_id) C))	e_government
SELECT t1.organization_name FROM organizations AS t1 JOIN organization_contact_individuals AS t2 ON t1.organization_id  =  t2.organization_id GROUP BY t1.organization_name ORDER BY count(*) DESC LIMIT 1	e_government
SELECT individual_last_name FROM individuals WHERE individual_id IN (SELECT individual_id FROM organization_contact_individuals)	e_government
SELECT individual_last_name FROM individuals WHERE individual_id IN (SELECT individual_id FROM organization_contact_individuals)	e_government
SELECT count(*) FROM driver	school_bus
SELECT name ,  home_city ,  age FROM driver	school_bus
SELECT party ,  count(*) FROM driver GROUP BY party	school_bus
SELECT name FROM driver ORDER BY age DESC	school_bus
SELECT DISTINCT home_city FROM driver	school_bus
SELECT home_city FROM driver GROUP BY home_city HAVING COUNT(driver_id) = (SELECT MAX(driver_count) FROM (SELECT COUNT(driver_id) AS driver_count FROM driver GROUP BY home_city))	school_bus
SELECT DISTINCT D.party FROM driver D WHERE D.home_city = 'Hartford' AND D.age > 40	school_bus
SELECT home_city FROM driver WHERE age  >  40 GROUP BY home_city HAVING count(*)  >=  2	school_bus
SELECT home_city FROM driver EXCEPT SELECT home_city FROM driver WHERE age  >  40	school_bus
SELECT name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM school_bus)	school_bus
SELECT TYPE FROM school GROUP BY TYPE HAVING count(*)  =  2	school_bus
SELECT T2.school ,  T3.name FROM school_bus AS T1 JOIN school AS T2 ON T1.school_id  =  T2.school_id JOIN driver AS T3 ON T1.driver_id  =  T3.driver_id	school_bus
SELECT max(years_working) ,  min(years_working) ,  avg(years_working) FROM school_bus	school_bus
SELECT school ,  TYPE FROM school WHERE school_id NOT IN (SELECT school_id FROM school_bus)	school_bus
SELECT school.type, COUNT(school_bus.school_id) AS num_buses FROM school LEFT JOIN school_bus ON school.school_id = school_bus.school_id GROUP BY school.type	school_bus
SELECT count(*) FROM driver WHERE home_city  =  'Hartford' OR age  <  40	school_bus
SELECT name FROM driver WHERE home_city  =  'Hartford' AND age  <  40	school_bus
SELECT t1.name FROM driver AS t1 JOIN school_bus AS t2 ON t1.driver_id  =  t2.driver_id ORDER BY years_working DESC LIMIT 1	school_bus
SELECT count(*) FROM flight WHERE velocity  >  200	flight_company
SELECT vehicle_flight_number ,  date ,  pilot FROM flight ORDER BY altitude ASC	flight_company
SELECT id ,  country ,  city ,  name FROM airport ORDER BY name	flight_company
SELECT max(group_equity_shareholding) FROM operate_company	flight_company
SELECT velocity FROM flight WHERE pilot = 'Thompson'	flight_company
SELECT oc.name, oc.type FROM operate_company oc WHERE EXISTS (SELECT 1 FROM flight f WHERE f.company_id = oc.id)	flight_company
SELECT name FROM airport WHERE country != 'Iceland'	flight_company
SELECT DISTINCT T1.type FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T2.velocity  <  200	flight_company
SELECT T1.id ,  T1.name FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id GROUP BY T1.id HAVING count(*)  >  1	flight_company
SELECT a.id, a.name, a.iata FROM airport as a, flight as f WHERE a.id = f.airport_id GROUP BY a.id HAVING COUNT(f.id) = (SELECT MAX(Count) FROM (SELECT COUNT(*) as Count FROM flight GROUP BY airport_id))	flight_company
SELECT DISTINCT T2.pilot FROM airport AS T1 JOIN flight AS T2 ON T1.id  =  T2.airport_id WHERE T1.country  =  'United States' OR T1.name  =  'Billund Airport'	flight_company
SELECT type, COUNT(*) AS num FROM operate_company GROUP BY type HAVING num = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM operate_company GROUP BY type))	flight_company
SELECT count(*) FROM airport WHERE id NOT IN ( SELECT airport_id FROM flight WHERE pilot  =  'Thompson' );	flight_company
SELECT T2.pilot FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T1.principal_activities  =  'Cargo' INTERSECT SELECT T2.pilot FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id WHERE T1.principal_activities  =  'Catering services'	flight_company
SELECT name FROM airport WHERE name LIKE '%international%'	flight_company
SELECT T3.id ,  count(*) FROM operate_company AS T1 JOIN flight AS t2 ON T1.id  =  T2.company_id JOIN airport AS T3 ON T2.airport_id  =  T3.id GROUP BY T3.id	flight_company
SELECT count(*) ,  country FROM airport GROUP BY country	flight_company
SELECT country FROM airport GROUP BY country HAVING count(*)  >  2	flight_company
SELECT pilot FROM flight GROUP BY pilot HAVING COUNT(*) = (SELECT MAX(CountFlights) FROM (SELECT COUNT(*) AS CountFlights FROM flight GROUP BY pilot))	flight_company
SELECT count(*) FROM Accounts	cre_Docs_and_Epenses
SELECT count(*) FROM Accounts	cre_Docs_and_Epenses
SELECT account_id ,  account_details FROM Accounts	cre_Docs_and_Epenses
SELECT account_id ,  account_details FROM Accounts	cre_Docs_and_Epenses
SELECT count(*) FROM Statements	cre_Docs_and_Epenses
SELECT count(*) FROM Statements	cre_Docs_and_Epenses
SELECT STATEMENT_ID ,  statement_details FROM Statements	cre_Docs_and_Epenses
SELECT STATEMENT_ID ,  statement_details FROM Statements	cre_Docs_and_Epenses
SELECT T1.statement_id ,  T2.statement_details ,  T1.account_details FROM Accounts AS T1 JOIN Statements AS T2 ON T1.statement_id  =  T2.statement_id	cre_Docs_and_Epenses
SELECT T1.statement_id ,  T2.statement_details ,  T1.account_details FROM Accounts AS T1 JOIN Statements AS T2 ON T1.statement_id  =  T2.statement_id	cre_Docs_and_Epenses
SELECT s.statement_id, COUNT(distinct a.account_id) FROM statements s LEFT JOIN accounts a ON s.statement_id = a.statement_id GROUP BY s.statement_id	cre_Docs_and_Epenses
SELECT STATEMENT_ID ,  count(*) FROM Accounts GROUP BY STATEMENT_ID	cre_Docs_and_Epenses
SELECT statements.statement_id, statement_details FROM statements JOIN accounts ON statements.statement_id = accounts.statement_id GROUP BY statements.statement_id HAVING COUNT(accounts.account_id) = (SELECT MAX(cnt.count) FROM (SELECT COUNT(account_id) AS count FROM accounts GROUP BY statement_id) cnt)	cre_Docs_and_Epenses
SELECT s.statement_id, s.statement_details FROM statements s, accounts a WHERE s.statement_id = a.statement_id GROUP BY s.statement_id HAVING COUNT(a.account_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(account_id) AS cnt FROM accounts GROUP BY statement_id) AS temp)	cre_Docs_and_Epenses
SELECT count(*) FROM Documents	cre_Docs_and_Epenses
SELECT count(*) FROM Documents	cre_Docs_and_Epenses
SELECT document_type_code ,  document_name ,  document_description FROM Documents WHERE document_name  =  'Noel CV' OR document_name  =  'King Book'	cre_Docs_and_Epenses
SELECT document_type_code ,  document_name ,  document_description FROM Documents WHERE document_name  =  'Noel CV' OR document_name  =  'King Book'	cre_Docs_and_Epenses
SELECT document_id ,  document_name FROM Documents	cre_Docs_and_Epenses
SELECT document_id ,  document_name FROM Documents	cre_Docs_and_Epenses
SELECT document_name ,  document_id FROM Documents WHERE document_type_code  =  'BK'	cre_Docs_and_Epenses
SELECT document_name ,  document_id FROM Documents WHERE document_type_code  =  'BK'	cre_Docs_and_Epenses
SELECT count(*) ,  project_id FROM Documents WHERE document_type_code  =  'BK' GROUP BY project_id	cre_Docs_and_Epenses
SELECT count(*) ,  project_id FROM Documents WHERE document_type_code  =  'BK' GROUP BY project_id	cre_Docs_and_Epenses
SELECT document_name ,  document_date FROM Documents AS T1 JOIN projects AS T2 ON T1.project_id  =  T2.project_id WHERE T2.project_details  =  'Graph Database project'	cre_Docs_and_Epenses
SELECT document_name ,  document_date FROM Documents AS T1 JOIN projects AS T2 ON T1.project_id  =  T2.project_id WHERE T2.project_details  =  'Graph Database project'	cre_Docs_and_Epenses
SELECT p.project_id, COUNT(d.document_id) FROM projects p LEFT JOIN documents d ON p.project_id = d.project_id GROUP BY p.project_id	cre_Docs_and_Epenses
SELECT projects.project_id, COUNT(documents.document_id) FROM projects LEFT JOIN documents ON projects.project_id = documents.project_id GROUP BY projects.project_id	cre_Docs_and_Epenses
SELECT p.project_id FROM projects p LEFT JOIN documents d ON p.project_id = d.project_id GROUP BY p.project_id ORDER BY COUNT(d.document_id) ASC LIMIT 1	cre_Docs_and_Epenses
SELECT project_id FROM projects ORDER BY (SELECT COUNT(*) FROM documents WHERE documents.project_id = projects.project_id) ASC LIMIT 1	cre_Docs_and_Epenses
SELECT project_id FROM Documents GROUP BY project_id HAVING count(*)  >=  2	cre_Docs_and_Epenses
SELECT project_id FROM Documents GROUP BY project_id HAVING count(*)  >=  2	cre_Docs_and_Epenses
SELECT document_type_code ,  count(*) FROM Documents GROUP BY document_type_code	cre_Docs_and_Epenses
SELECT document_type_code ,  count(*) FROM Documents GROUP BY document_type_code	cre_Docs_and_Epenses
SELECT document_type_code FROM documents GROUP BY document_type_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM documents GROUP BY document_type_code) AS counts)	cre_Docs_and_Epenses
SELECT document_type_code FROM Documents GROUP BY document_type_code ORDER BY count(*) DESC LIMIT 1	cre_Docs_and_Epenses
SELECT document_type_code FROM Documents GROUP BY document_type_code HAVING count(*)  <  3	cre_Docs_and_Epenses
SELECT rt.document_type_code FROM ref_document_types rt LEFT JOIN documents d ON rt.document_type_code = d.document_type_code GROUP BY rt.document_type_code HAVING COUNT(d.document_id) < 3	cre_Docs_and_Epenses
SELECT T1.statement_details ,  T2.document_name FROM Statements AS T1 JOIN Documents AS T2 ON T1.statement_id  =  T2.document_id WHERE T1.statement_details  =  'Private Project'	cre_Docs_and_Epenses
SELECT T1.statement_details ,  T2.document_name FROM Statements AS T1 JOIN Documents AS T2 ON T1.statement_id  =  T2.document_id WHERE T1.statement_details  =  'Private Project'	cre_Docs_and_Epenses
SELECT document_type_code ,  document_type_name ,  document_type_description FROM Ref_document_types	cre_Docs_and_Epenses
SELECT document_type_code ,  document_type_name ,  document_type_description FROM Ref_document_types	cre_Docs_and_Epenses
SELECT document_type_description FROM Ref_document_types WHERE document_type_name  =  'Film'	cre_Docs_and_Epenses
SELECT document_type_description FROM Ref_document_types WHERE document_type_name  =  'Film'	cre_Docs_and_Epenses
SELECT T1.document_type_name ,  T1.document_type_description ,  T2.Document_date FROM Ref_document_types AS T1 JOIN Documents AS T2 ON T1.document_type_code  =  T2.document_type_code	cre_Docs_and_Epenses
SELECT T1.document_type_name ,  T1.document_type_description ,  T2.Document_date FROM Ref_document_types AS T1 JOIN Documents AS T2 ON T1.document_type_code  =  T2.document_type_code	cre_Docs_and_Epenses
SELECT count(*) FROM Projects	cre_Docs_and_Epenses
SELECT count(*) FROM Projects	cre_Docs_and_Epenses
SELECT project_id ,  project_details FROM Projects	cre_Docs_and_Epenses
SELECT project_id ,  project_details FROM Projects	cre_Docs_and_Epenses
SELECT p.project_id, p.project_details FROM projects p WHERE EXISTS (SELECT 1 FROM documents d WHERE d.project_id = p.project_id GROUP BY d.project_id HAVING COUNT(*) >= 2)	cre_Docs_and_Epenses
SELECT T1.project_id ,  T1.project_details FROM Projects AS T1 JOIN Documents AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id HAVING count(*)  >  2	cre_Docs_and_Epenses
SELECT project_details FROM projects WHERE EXISTS (SELECT 1 FROM documents WHERE documents.project_id = projects.project_id AND document_name = 'King Book')	cre_Docs_and_Epenses
SELECT T1.project_details FROM Projects AS T1 JOIN Documents AS T2 ON T1.project_id  =  T2.project_id WHERE T2.document_name  =  'King Book'	cre_Docs_and_Epenses
SELECT count(*) FROM Ref_budget_codes	cre_Docs_and_Epenses
SELECT count(*) FROM Ref_budget_codes	cre_Docs_and_Epenses
SELECT budget_type_code ,  budget_type_description FROM Ref_budget_codes	cre_Docs_and_Epenses
SELECT budget_type_code ,  budget_type_description FROM Ref_budget_codes	cre_Docs_and_Epenses
SELECT budget_type_description FROM Ref_budget_codes WHERE budget_type_code  =  'ORG'	cre_Docs_and_Epenses
SELECT budget_type_description FROM Ref_budget_codes WHERE budget_type_code  =  'ORG'	cre_Docs_and_Epenses
SELECT count(*) FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT count(*) FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT document_id FROM Documents_with_expenses WHERE budget_type_code  =  'SF'	cre_Docs_and_Epenses
SELECT document_id FROM Documents_with_expenses WHERE budget_type_code  =  'SF'	cre_Docs_and_Epenses
SELECT T2.budget_type_code ,  T2.budget_type_description ,  T1.document_id FROM Documents_with_expenses AS T1 JOIN Ref_budget_codes AS T2 ON T1.budget_type_code  =  T2.budget_type_code	cre_Docs_and_Epenses
SELECT T2.budget_type_code ,  T2.budget_type_description ,  T1.document_id FROM Documents_with_expenses AS T1 JOIN Ref_budget_codes AS T2 ON T1.budget_type_code  =  T2.budget_type_code	cre_Docs_and_Epenses
SELECT T1.document_id FROM Documents_with_expenses AS T1 JOIN Ref_Budget_Codes AS T2 ON T1.Budget_Type_code  =  T2.Budget_Type_code WHERE T2.budget_type_Description  =  'Government'	cre_Docs_and_Epenses
SELECT T1.document_id FROM Documents_with_expenses AS T1 JOIN Ref_Budget_Codes AS T2 ON T1.Budget_Type_code  =  T2.Budget_Type_code WHERE T2.budget_type_Description  =  'Government'	cre_Docs_and_Epenses
SELECT b.budget_type_code, COUNT(d.document_id) AS num_docs FROM ref_budget_codes b LEFT JOIN documents_with_expenses d ON b.budget_type_code = d.budget_type_code GROUP BY b.budget_type_code	cre_Docs_and_Epenses
SELECT ref_budget_codes.budget_type_code, COUNT(DISTINCT documents.document_id) AS total_documents FROM ref_budget_codes LEFT JOIN documents_with_expenses ON ref_budget_codes.budget_type_code = documents_with_expenses.budget_type_code LEFT JOIN documents ON documents_with_expenses.document_id = documents.document_id GROUP BY ref_budget_codes.budget_type_code	cre_Docs_and_Epenses
SELECT budget_type_code FROM documents_with_expenses GROUP BY budget_type_code HAVING COUNT(document_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(document_id) AS Cnt FROM documents_with_expenses GROUP BY budget_type_code))	cre_Docs_and_Epenses
SELECT budget_type_code FROM documents_with_expenses GROUP BY budget_type_code HAVING COUNT(budget_type_code) = (SELECT MAX(count) FROM (SELECT COUNT(budget_type_code) AS count FROM documents_with_expenses GROUP BY budget_type_code) t)	cre_Docs_and_Epenses
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT document_id FROM Documents WHERE document_type_code  =  'CV' EXCEPT SELECT document_id FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT document_id FROM Documents WHERE document_type_code  =  'CV' EXCEPT SELECT document_id FROM Documents_with_expenses	cre_Docs_and_Epenses
SELECT T1.document_id FROM Documents AS T1 JOIN Documents_with_expenses AS T2 ON T1.document_id  =  T2.document_id WHERE T1.document_name LIKE '%s%'	cre_Docs_and_Epenses
SELECT T1.document_id FROM Documents AS T1 JOIN Documents_with_expenses AS T2 ON T1.document_id  =  T2.document_id WHERE T1.document_name LIKE '%s%'	cre_Docs_and_Epenses
SELECT count(*) FROM Documents WHERE document_id NOT IN ( SELECT document_id FROM Documents_with_expenses )	cre_Docs_and_Epenses
SELECT count(*) FROM Documents WHERE document_id NOT IN ( SELECT document_id FROM Documents_with_expenses )	cre_Docs_and_Epenses
SELECT DISTINCT d.document_date FROM documents d INNER JOIN documents_with_expenses de ON d.document_id = de.document_id WHERE de.budget_type_code IN ('GV', 'SF') GROUP BY d.document_id HAVING COUNT(DISTINCT de.budget_type_code) = 2	cre_Docs_and_Epenses
SELECT document_date FROM documents WHERE document_id IN (SELECT document_id FROM documents_with_expenses WHERE budget_type_code = 'GV') AND document_id IN (SELECT document_id FROM documents_with_expenses WHERE budget_type_code = 'SF')	cre_Docs_and_Epenses
SELECT account_details FROM accounts WHERE account_details LIKE '%5%' OR account_details = (SELECT MAX(account_details) FROM accounts)	cre_Docs_and_Epenses
SELECT AD.account_details FROM accounts AD WHERE AD.account_id = (SELECT account_id FROM accounts WHERE CAST(account_details AS INTEGER) = (SELECT MAX(CAST(account_details AS INTEGER)) FROM accounts)) AND AD.account_details LIKE '%5%'	cre_Docs_and_Epenses
SELECT count(*) FROM scientists	scientist_1
SELECT count(*) FROM scientists	scientist_1
SELECT sum(hours) FROM projects	scientist_1
SELECT sum(hours) FROM projects	scientist_1
SELECT count(DISTINCT scientist) FROM assignedto	scientist_1
SELECT count(DISTINCT scientist) FROM assignedto	scientist_1
SELECT COUNT(DISTINCT code) FROM projects	scientist_1
SELECT COUNT(DISTINCT code) FROM projects	scientist_1
SELECT avg(hours) FROM projects	scientist_1
SELECT avg(hours) FROM projects	scientist_1
SELECT name FROM projects WHERE hours = (SELECT MAX(hours) FROM projects)	scientist_1
SELECT name FROM projects WHERE hours = (SELECT MAX(hours) FROM projects)	scientist_1
SELECT name FROM projects WHERE hours  >  (SELECT avg(hours) FROM projects)	scientist_1
SELECT name FROM projects WHERE hours  >  (SELECT avg(hours) FROM projects)	scientist_1
SELECT name, hours FROM projects WHERE code IN (SELECT project FROM assignedto GROUP BY project HAVING COUNT(scientist) = (SELECT MAX(cnt) FROM (SELECT COUNT(scientist) AS cnt FROM assignedto GROUP BY project)))	scientist_1
SELECT T1.name ,  T1.hours FROM projects AS T1 JOIN assignedto AS T2 ON T1.code  =  T2.project GROUP BY T2.project ORDER BY count(*) DESC LIMIT 1	scientist_1
SELECT T2.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name LIKE '%Smith%'	scientist_1
SELECT T2.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T3.name LIKE '%Smith%'	scientist_1
SELECT SUM(hours) FROM projects WHERE code IN (SELECT project FROM assignedto WHERE scientist IN (SELECT ssn FROM scientists WHERE name = 'Michael Rogers' OR name = 'Carol Smith'))	scientist_1
SELECT SUM(hours) FROM projects WHERE code IN (SELECT project FROM assignedto WHERE scientist IN (SELECT ssn FROM scientists WHERE name = 'Michael Rogers' OR name = 'Carol Smith'))	scientist_1
SELECT name FROM projects WHERE hours BETWEEN 100 AND 300	scientist_1
SELECT name FROM projects WHERE hours BETWEEN 100 AND 300	scientist_1
SELECT sc.name FROM scientists sc WHERE sc.ssn IN (SELECT at1.scientist FROM assignedto at1 JOIN assignedto at2 ON at1.scientist = at2.scientist WHERE at1.project IN (SELECT pr.code FROM projects pr WHERE pr.name = 'Matter of Time') AND at2.project IN (SELECT pr.code FROM projects pr WHERE pr.name = 'A Puzzling Parallax'))	scientist_1
SELECT s.name FROM scientists s JOIN assignedto a ON s.ssn = a.scientist JOIN projects p ON a.project = p.code WHERE p.name IN ('Matter of Time', 'A Puzzling Pattern') GROUP BY s.name HAVING COUNT(DISTINCT p.name) = 2	scientist_1
SELECT name FROM scientists ORDER BY name	scientist_1
SELECT name FROM scientists ORDER BY name	scientist_1
SELECT projects.name, (SELECT COUNT(DISTINCT scientist) FROM assignedto WHERE project = projects.code) FROM projects GROUP BY projects.name	scientist_1
SELECT p.name, (SELECT COUNT(scientist) FROM assignedto WHERE project = p.code) as number_of_scientists FROM projects p	scientist_1
SELECT COUNT(DISTINCT at.scientist) FROM assignedto at JOIN projects p ON at.project = p.code WHERE p.hours > 300	scientist_1
SELECT prj.name, (SELECT COUNT(*) FROM assignedto WHERE project = prj.code) AS ScientistCount FROM projects prj WHERE prj.hours > 300;	scientist_1
SELECT scientists.name, COUNT(project) FROM assignedto JOIN scientists ON scientist = ssn GROUP BY scientist HAVING COUNT(project)	scientist_1
SELECT S.name, (SELECT COUNT(*) FROM assignedto AS A WHERE A.scientist = S.ssn) AS project_count FROM scientists S	scientist_1
SELECT DISTINCT sc.ssn, sc.name FROM scientists sc JOIN assignedto ass ON sc.ssn = ass.scientist JOIN projects pr ON ass.project = pr.code WHERE pr.hours = (SELECT MAX(hours) FROM projects)	scientist_1
SELECT DISTINCT s.ssn, s.name FROM scientists s WHERE EXISTS (SELECT 1 FROM assignedto at JOIN projects p ON at.project = p.code WHERE at.scientist = s.ssn AND p.hours = (SELECT MAX(hours) FROM projects))	scientist_1
SELECT name FROM scientists WHERE ssn IN (SELECT scientist FROM assignedto)	scientist_1
SELECT name FROM scientists WHERE EXISTS (SELECT 1 FROM assignedto WHERE scientist = scientists.ssn);	scientist_1
SELECT Name FROM Projects WHERE Code NOT IN (SELECT Project FROM AssignedTo)	scientist_1
SELECT Name FROM Projects WHERE Code NOT IN (SELECT Project FROM AssignedTo)	scientist_1
SELECT Name FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
SELECT Name FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
SELECT count(*) FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
SELECT count(*) FROM scientists WHERE ssn NOT IN (SELECT scientist FROM AssignedTo)	scientist_1
SELECT name FROM scientists WHERE ssn NOT IN (SELECT scientist FROM assignedto WHERE project IN (SELECT code FROM projects WHERE hours = (SELECT MAX(hours) FROM projects)))	scientist_1
SELECT s.name FROM scientists s WHERE s.ssn NOT IN (SELECT a.scientist FROM assignedto a JOIN projects p ON a.project = p.code WHERE p.hours = (SELECT MAX(hours) FROM projects))	scientist_1
SELECT T1.Name ,  T3.Name ,  T3.Hours FROM Scientists AS T1 JOIN AssignedTo AS T2 ON T1.SSN = T2.Scientist JOIN Projects AS T3 ON T2.Project = T3.Code ORDER BY T3.Name ,  T1.Name	scientist_1
SELECT s.name, p.name, p.hours FROM scientists s, projects p WHERE s.ssn IN (SELECT scientist FROM assignedto WHERE project = p.code) ORDER BY p.name, s.name	scientist_1
SELECT T2.name ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT min(hours) FROM projects)	scientist_1
SELECT T2.name ,  T3.name FROM assignedto AS T1 JOIN projects AS T2 ON T1.project  =  T2.code JOIN scientists AS T3 ON T1.scientist  =  T3.SSN WHERE T2.hours  =  (SELECT min(hours) FROM projects)	scientist_1
SELECT w.name FROM wine w WHERE w.score = (SELECT MAX(score) FROM wine)	wine_1
SELECT name FROM wine WHERE score = (SELECT MAX(score) FROM wine)	wine_1
SELECT winery FROM wine ORDER BY score DESC LIMIT 1	wine_1
SELECT winery FROM wine WHERE score = (SELECT MAX(score) FROM wine)	wine_1
SELECT Name FROM WINE WHERE YEAR  =  '2008'	wine_1
SELECT Name FROM WINE WHERE YEAR  =  '2008'	wine_1
SELECT Grape ,  Appelation FROM WINE	wine_1
SELECT Grape ,  Appelation FROM WINE	wine_1
SELECT Name ,  Score FROM WINE	wine_1
SELECT Name ,  Score FROM WINE	wine_1
SELECT Area ,  County FROM APPELLATIONS	wine_1
SELECT Area ,  County FROM APPELLATIONS	wine_1
SELECT Price FROM WINE WHERE YEAR  <  2010	wine_1
SELECT Price FROM WINE WHERE YEAR  <  2010	wine_1
SELECT DISTINCT name FROM wine WHERE score > 90	wine_1
SELECT Name FROM WINE WHERE score  >  90	wine_1
SELECT DISTINCT T2.Name FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'Red'	wine_1
SELECT wine.name FROM wine JOIN grapes ON wine.grape = grapes.grape WHERE grapes.color = 'Red'	wine_1
SELECT DISTINCT T2.Name FROM APPELLATIONs AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.Area  =  'North Coast'	wine_1
SELECT DISTINCT T2.Name FROM APPELLATIONs AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.Area  =  'North Coast'	wine_1
SELECT count(*) FROM WINE WHERE Winery  =  'Robert Biale'	wine_1
SELECT count(*) FROM WINE WHERE Winery  =  'Robert Biale'	wine_1
SELECT count(*) FROM APPELLATIONS WHERE County  =  'Napa'	wine_1
SELECT count(*) FROM APPELLATIONS WHERE County  =  'Napa'	wine_1
SELECT AVG(T2.Price) FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Sonoma'	wine_1
SELECT AVG(T2.Price) FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Sonoma'	wine_1
SELECT T2.Name ,   T2.Score FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'White'	wine_1
SELECT T2.Name ,   T2.Score FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'White'	wine_1
SELECT max(T2.Price) FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.Area  =  'Central Coast' AND T2.year  <  2005	wine_1
SELECT max(T2.Price) FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.Area  =  'Central Coast' AND T2.year  <  2005	wine_1
SELECT DISTINCT T1.Grape FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'White' AND T2.score  >  90	wine_1
SELECT DISTINCT T1.Grape FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'White' AND T2.score  >  90	wine_1
SELECT T2.Name FROM Grapes AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'Red' AND T2.price  >  50	wine_1
SELECT T2.Name FROM Grapes AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape WHERE T1.Color  =  'Red' AND T2.price  >  50	wine_1
SELECT T2.Name FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Monterey' AND T2.price  <  50	wine_1
SELECT T2.Name FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Monterey' AND T2.price  <  50	wine_1
SELECT count(*) ,  Grape FROM WINE GROUP BY Grape	wine_1
SELECT count(*) ,  Grape FROM WINE GROUP BY Grape	wine_1
SELECT avg(Price) ,  YEAR FROM WINE GROUP BY YEAR	wine_1
SELECT avg(Price) ,  YEAR FROM WINE GROUP BY YEAR	wine_1
SELECT DISTINCT name FROM wine WHERE price > (SELECT AVG(price) FROM wine WHERE winery = 'John Anthony')	wine_1
SELECT DISTINCT name FROM wine WHERE price > (SELECT MAX(price) FROM wine WHERE winery = 'John Anthony')	wine_1
SELECT DISTINCT Name FROM WINE ORDER BY Name	wine_1
SELECT name FROM wine ORDER BY name ASC	wine_1
SELECT DISTINCT Name FROM WINE ORDER BY price	wine_1
SELECT name FROM wine ORDER BY price ASC	wine_1
SELECT a.area FROM appellations a JOIN wine w ON a.appelation = w.appelation WHERE w.year < 2010 GROUP BY a.area ORDER BY SUM(w.cases) DESC LIMIT 1	wine_1
SELECT T1.Area FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation GROUP BY T2.Appelation HAVING T2.year  <  2010 ORDER BY count(*) DESC LIMIT 1	wine_1
SELECT T1.Color FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape GROUP BY T2.Grape ORDER BY AVG(Price) DESC LIMIT 1	wine_1
SELECT T1.Color FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.Grape  =  T2.Grape GROUP BY T2.Grape ORDER BY AVG(Price) DESC LIMIT 1	wine_1
SELECT DISTINCT Name FROM WINE WHERE YEAR  <  2000 OR YEAR  >  2010	wine_1
SELECT DISTINCT Name FROM WINE WHERE YEAR  <  2000 OR YEAR  >  2010	wine_1
SELECT DISTINCT Winery FROM WINE WHERE Price BETWEEN 50 AND 100	wine_1
SELECT DISTINCT Winery FROM WINE WHERE Price BETWEEN 50 AND 100	wine_1
SELECT AVG(Price) ,  AVG(Cases) FROM WINE WHERE YEAR  =  2009 AND Grape  =  'Zinfandel'	wine_1
SELECT AVG(Price) ,  AVG(Cases) FROM WINE WHERE YEAR  =  2009 AND Grape  =  'Zinfandel'	wine_1
SELECT max(Price) ,  max(Score) FROM WINE WHERE Appelation  =  'St. Helena'	wine_1
SELECT max(Price) ,  max(Score) FROM WINE WHERE Appelation  =  'St. Helena'	wine_1
SELECT max(Price) ,  max(Score) ,  YEAR FROM WINE GROUP BY YEAR	wine_1
SELECT max(Price) ,  max(Score) ,  YEAR FROM WINE GROUP BY YEAR	wine_1
SELECT avg(Price) ,  avg(Score) ,  Appelation FROM WINE GROUP BY Appelation	wine_1
SELECT avg(Price) ,  avg(Score) ,  Appelation FROM WINE GROUP BY Appelation	wine_1
SELECT Winery FROM WINE GROUP BY Winery HAVING count(*)  >=  4	wine_1
SELECT Winery FROM WINE GROUP BY Winery HAVING count(*)  >=  4	wine_1
SELECT T1.County FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation GROUP BY T2.Appelation HAVING count(*)  <=  3	wine_1
SELECT DISTINCT a.state FROM appellations a LEFT JOIN wine w ON a.appelation = w.appelation GROUP BY a.appelation HAVING COUNT(w.no) <= 3	wine_1
SELECT DISTINCT name FROM wine w WHERE w.year < (SELECT MIN(year) FROM wine WHERE winery = 'Brander')	wine_1
SELECT Name FROM WINE WHERE YEAR  <  (SELECT min(YEAR) FROM WINE WHERE Winery  =  'Brander')	wine_1
SELECT Name FROM WINE WHERE Price  >  (SELECT max(Price) FROM WINE WHERE YEAR  =  2006)	wine_1
SELECT Name FROM WINE WHERE Price  >  (SELECT max(Price) FROM WINE WHERE YEAR  =  2006)	wine_1
SELECT T2.Winery FROM GRAPES AS T1 JOIN WINE AS T2 ON T1.GRAPE  =  T2.GRAPE WHERE T1.Color  =  'White' GROUP BY T2.Winery ORDER BY count(*) DESC LIMIT 3	wine_1
SELECT w.winery FROM wine AS w INNER JOIN grapes g ON w.grape = g.grape AND g.color = 'White' GROUP BY w.winery ORDER BY COUNT(w.winery) DESC, w.winery LIMIT 3	wine_1
SELECT Grape ,  Winery ,  YEAR FROM WINE WHERE Price  >   100 ORDER BY YEAR	wine_1
SELECT Grape ,  Winery ,  YEAR FROM WINE WHERE Price  >   100 ORDER BY YEAR	wine_1
SELECT Grape ,  Appelation ,  Name FROM WINE WHERE Score  >  93 ORDER BY Name	wine_1
SELECT Grape ,  Appelation ,  Name FROM WINE WHERE Score  >  93 ORDER BY Name	wine_1
SELECT Appelation FROM WINE WHERE YEAR  >  2008 EXCEPT SELECT Appelation FROM APPELLATIONS WHERE Area  =  'Central Coast'	wine_1
SELECT Appelation FROM WINE WHERE YEAR  >  2008 EXCEPT SELECT Appelation FROM APPELLATIONS WHERE Area  =  'Central Coast'	wine_1
SELECT avg(price) FROM wine WHERE Appelation NOT IN (SELECT T1.Appelation FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Sonoma')	wine_1
SELECT avg(price) FROM wine WHERE Appelation NOT IN (SELECT T1.Appelation FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T1.County  =  'Sonoma')	wine_1
SELECT r1.county FROM (SELECT appellations.county, COUNT(*) AS count_number FROM appellations JOIN wine ON appellations.appelation = wine.appelation WHERE wine.score > 90 GROUP BY appellations.county) AS r1 ORDER BY r1.count_number DESC LIMIT 1	wine_1
SELECT T1.County FROM APPELLATIONS AS T1 JOIN WINE AS T2 ON T1.Appelation  =  T2.Appelation WHERE T2.Score  >  90 GROUP BY T1.County ORDER BY count(*) DESC LIMIT 1	wine_1
SELECT COUNT(DISTINCT station_id) FROM train_station	train_station
SELECT name ,  LOCATION ,  number_of_platforms FROM station	train_station
SELECT location FROM station WHERE location IS NOT NULL;	train_station
SELECT name ,  total_passengers FROM station WHERE LOCATION != 'London'	train_station
SELECT DISTINCT s.name, s.main_services FROM station s WHERE s.station_id IN (SELECT ts.station_id FROM train_station ts) ORDER BY s.total_passengers DESC LIMIT 3	train_station
SELECT avg(total_passengers) ,  max(total_passengers) FROM station WHERE LOCATION  =  'London' OR LOCATION  =  'Glasgow'	train_station
SELECT LOCATION ,  sum(number_of_platforms) ,  sum(total_passengers) FROM station GROUP BY LOCATION	train_station
SELECT DISTINCT s.location FROM station s JOIN train_station ts ON s.station_id = ts.station_id WHERE s.number_of_platforms >= 15 AND s.total_passengers > 25	train_station
SELECT LOCATION FROM station EXCEPT SELECT LOCATION FROM station WHERE number_of_platforms  >=  15	train_station
SELECT a.location FROM (SELECT station.location, COUNT(train_station.station_id) as station_count FROM station JOIN train_station ON station.station_id = train_station.station_id GROUP BY station.location) a ORDER BY a.station_count DESC LIMIT 1	train_station
SELECT name ,  TIME ,  service FROM train	train_station
SELECT count(*) FROM train	train_station
SELECT name ,  service FROM train ORDER BY TIME	train_station
SELECT station.name, (SELECT COUNT(*) FROM train_station WHERE train_station.station_id = station.station_id) AS number_of_trains FROM station	train_station
SELECT T2.name ,  T3.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id	train_station
SELECT name, time FROM train WHERE train_id IN (SELECT train_id FROM train_station WHERE station_id IN (SELECT station_id FROM station WHERE location = 'London')) ORDER BY time DESC	train_station
SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id GROUP BY T1.station_id ORDER BY count(*) DESC LIMIT 1	train_station
SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id GROUP BY T1.station_id HAVING count(*)  >=  2	train_station
SELECT LOCATION FROM station GROUP BY LOCATION HAVING count(*)  =  1	train_station
SELECT name FROM station WHERE station_id NOT IN (SELECT station_id FROM train_station)	train_station
SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id WHERE T3.Name  =  'Ananthapuri Express' INTERSECT SELECT T2.name FROM train_station AS T1 JOIN station AS T2 ON T1.station_id  =  T2.station_id JOIN train AS T3 ON T3.train_id  =  T1.train_id WHERE T3.Name  =  'Guruvayur Express'	train_station
SELECT DISTINCT train.name FROM train WHERE train_id NOT IN (SELECT train_station.train_id FROM train_station JOIN station ON train_station.station_id = station.station_id WHERE station.location = 'London')	train_station
SELECT name ,  LOCATION FROM station ORDER BY Annual_entry_exit ,  Annual_interchanges	train_station
SELECT vehicle_id FROM Vehicles;	driving_school
SELECT vehicle_id FROM Vehicles;	driving_school
SELECT count(*) FROM Vehicles;	driving_school
SELECT count(*) FROM Vehicles;	driving_school
SELECT vehicle_details FROM Vehicles WHERE vehicle_id = 1;	driving_school
SELECT vehicle_details FROM Vehicles WHERE vehicle_id = 1;	driving_school
SELECT first_name ,  middle_name ,  last_name FROM Staff;	driving_school
SELECT first_name ,  middle_name ,  last_name FROM Staff;	driving_school
SELECT date_of_birth FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT date_of_birth FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT date_joined_staff FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT date_joined_staff FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT date_left_staff FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT date_left_staff FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT count(*) FROM Staff WHERE first_name = 'Ludie';	driving_school
SELECT count(*) FROM Staff WHERE first_name = 'Ludie';	driving_school
SELECT nickname FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT nickname FROM Staff WHERE first_name = 'Janessa' AND last_name = 'Sawayn';	driving_school
SELECT count(*) FROM Staff;	driving_school
SELECT count(*) FROM Staff;	driving_school
SELECT T1.city FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT T1.city FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT T1.country ,  T1.state_province_county FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT T1.country ,  T1.state_province_county FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT sum(T1.lesson_time) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Rylan' AND T2.last_name = 'Goodwin';	driving_school
SELECT sum(T1.lesson_time) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Rylan' AND T2.last_name = 'Goodwin';	driving_school
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT COUNT(staff.staff_id) FROM staff, addresses WHERE staff.staff_address_id = addresses.address_id AND addresses.state_province_county = 'Georgia'	driving_school
SELECT COUNT(*) FROM staff s JOIN addresses a ON s.staff_address_id = a.address_id WHERE a.state_province_county = 'Georgia'	driving_school
SELECT T2.first_name ,  T2.last_name FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T1.city = 'Damianfort';	driving_school
SELECT T2.first_name ,  T2.last_name FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id WHERE T1.city = 'Damianfort';	driving_school
SELECT T1.city ,  count(*) FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id GROUP BY T1.city ORDER BY count(*) DESC LIMIT 1;	driving_school
SELECT T1.city ,  count(*) FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id GROUP BY T1.city ORDER BY count(*) DESC LIMIT 1;	driving_school
SELECT T1.state_province_county FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id GROUP BY T1.state_province_county HAVING count(*) BETWEEN 2 AND 4;	driving_school
SELECT T1.state_province_county FROM Addresses AS T1 JOIN Staff AS T2 ON T1.address_id = T2.staff_address_id GROUP BY T1.state_province_county HAVING count(*) BETWEEN 2 AND 4;	driving_school
SELECT first_name ,  last_name FROM Customers;	driving_school
SELECT first_name ,  last_name FROM Customers;	driving_school
SELECT email_address ,  date_of_birth FROM Customers WHERE first_name = 'Carole'	driving_school
SELECT email_address ,  date_of_birth FROM Customers WHERE first_name = 'Carole'	driving_school
SELECT phone_number ,  email_address FROM Customers WHERE amount_outstanding  >  2000;	driving_school
SELECT phone_number ,  email_address FROM Customers WHERE amount_outstanding  >  2000;	driving_school
SELECT customer_status_code ,  cell_mobile_phone_number ,  email_address FROM Customers WHERE first_name = 'Marina' OR last_name  =  'Kohler'	driving_school
SELECT customer_status_code, phone_number, email_address FROM customers WHERE last_name = 'Kohler' OR first_name = 'Marina'	driving_school
SELECT date_of_birth FROM Customers WHERE customer_status_code  =  'Good Customer'	driving_school
SELECT date_of_birth FROM Customers WHERE customer_status_code  =  'Good Customer'	driving_school
SELECT date_became_customer FROM Customers WHERE first_name = 'Carole' AND last_name = 'Bernhard';	driving_school
SELECT date_became_customer FROM Customers WHERE first_name = 'Carole' AND last_name = 'Bernhard';	driving_school
SELECT count(*) FROM Customers;	driving_school
SELECT count(*) FROM Customers;	driving_school
SELECT customer_status_code , count(*) FROM Customers GROUP BY customer_status_code;	driving_school
SELECT customer_status_code , count(*) FROM Customers GROUP BY customer_status_code;	driving_school
SELECT c.customer_status_code FROM customers c GROUP BY c.customer_status_code HAVING COUNT(c.customer_id) = (SELECT MIN(count) FROM (SELECT COUNT(customer_id) AS count FROM customers GROUP BY customer_status_code))	driving_school
SELECT customer_status_code FROM Customers GROUP BY customer_status_code ORDER BY count(*) ASC LIMIT 1;	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Rylan' AND T2.last_name = 'Goodwin' AND T1.lesson_status_code = 'Completed';	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Rylan' AND T2.last_name = 'Goodwin' AND T1.lesson_status_code = 'Completed';	driving_school
SELECT max(amount_outstanding) ,  min(amount_outstanding) ,  avg(amount_outstanding) FROM Customers;	driving_school
SELECT max(amount_outstanding) ,  min(amount_outstanding) ,  avg(amount_outstanding) FROM Customers;	driving_school
SELECT first_name ,  last_name FROM Customers WHERE amount_outstanding BETWEEN 1000 AND 3000;	driving_school
SELECT first_name ,  last_name FROM Customers WHERE amount_outstanding BETWEEN 1000 AND 3000;	driving_school
SELECT T1.first_name ,  T1.last_name FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T2.city = 'Lockmanfurt';	driving_school
SELECT T1.first_name ,  T1.last_name FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T2.city = 'Lockmanfurt';	driving_school
SELECT T2.country FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T1.first_name = 'Carole' AND T1.last_name = 'Bernhard'	driving_school
SELECT T2.country FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T1.first_name = 'Carole' AND T1.last_name = 'Bernhard'	driving_school
SELECT T2.zip_postcode FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T1.first_name = 'Carole' AND T1.last_name = 'Bernhard'	driving_school
SELECT T2.zip_postcode FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id WHERE T1.first_name = 'Carole' AND T1.last_name = 'Bernhard'	driving_school
SELECT T2.city FROM Customers AS T1 JOIN Addresses AS T2 ON T1.customer_address_id = T2.address_id GROUP BY T2.city ORDER BY count(*) DESC LIMIT 1;	driving_school
SELECT city FROM addresses, customers WHERE addresses.address_id = customers.customer_address_id GROUP BY city HAVING COUNT(customers.customer_id) = (SELECT MAX(customer_count) FROM (SELECT COUNT(customer_id) AS customer_count FROM customers GROUP BY customer_address_id))	driving_school
SELECT sum(T1.amount_payment) FROM Customer_Payments AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.first_name = 'Carole' AND T2.last_name = 'Bernhard'	driving_school
SELECT sum(T1.amount_payment) FROM Customer_Payments AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.first_name = 'Carole' AND T2.last_name = 'Bernhard'	driving_school
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payments );	driving_school
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payments );	driving_school
SELECT T2.first_name ,  T2.last_name FROM Customer_Payments AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2;	driving_school
SELECT T2.first_name ,  T2.last_name FROM Customer_Payments AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2;	driving_school
SELECT payment_method_code ,  count(*) FROM Customer_Payments GROUP BY payment_method_code;	driving_school
SELECT payment_method_code ,  count(*) FROM Customer_Payments GROUP BY payment_method_code;	driving_school
SELECT count(*) FROM Lessons WHERE lesson_status_code = 'Cancelled';	driving_school
SELECT count(*) FROM Lessons WHERE lesson_status_code = 'Cancelled';	driving_school
SELECT T1.lesson_id FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn' AND nickname LIKE '%s%';	driving_school
SELECT T1.lesson_id FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn' AND nickname LIKE '%s%';	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name LIKE '%a%'	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name LIKE '%a%'	driving_school
SELECT sum(lesson_time) FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT TOTAL(lessons.lesson_time) FROM lessons INNER JOIN staff ON lessons.staff_id = staff.staff_id WHERE staff.first_name = 'Janessa' AND staff.last_name = 'Sawayn';	driving_school
SELECT avg(price) FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT avg(price) FROM Lessons AS T1 JOIN Staff AS T2 ON T1.staff_id = T2.staff_id WHERE T2.first_name = 'Janessa' AND T2.last_name = 'Sawayn';	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Ray'	driving_school
SELECT count(*) FROM Lessons AS T1 JOIN Customers AS T2 ON T1.customer_id  = T2.customer_id WHERE T2.first_name = 'Ray'	driving_school
SELECT last_name FROM Customers INTERSECT SELECT last_name FROM Staff	driving_school
SELECT last_name FROM Customers INTERSECT SELECT last_name FROM Staff	driving_school
SELECT first_name FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM lessons)	driving_school
SELECT first_name FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM lessons)	driving_school
SELECT vehicle_id, vehicle_details FROM vehicles WHERE vehicle_id IN (SELECT vehicle_id FROM (SELECT vehicle_id, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM lessons GROUP BY vehicle_id) WHERE rank = 1)	driving_school
SELECT count(*) FROM Faculty	activity_1
SELECT count(*) FROM Faculty	activity_1
SELECT DISTINCT rank FROM Faculty	activity_1
SELECT DISTINCT rank FROM Faculty	activity_1
SELECT DISTINCT building FROM Faculty	activity_1
SELECT building FROM (SELECT building FROM faculty) AS unique_buildings	activity_1
SELECT rank ,  Fname ,  Lname FROM Faculty	activity_1
SELECT rank ,  Fname ,  Lname FROM Faculty	activity_1
SELECT Fname ,  Lname ,  phone FROM Faculty WHERE Sex  =  'F'	activity_1
SELECT Fname ,  Lname ,  phone FROM Faculty WHERE Sex  =  'F'	activity_1
SELECT DISTINCT facid FROM faculty WHERE sex LIKE 'M'	activity_1
SELECT facid FROM faculty WHERE sex LIKE 'M'	activity_1
SELECT count(*) FROM Faculty WHERE Sex  =  'F' AND Rank  =  'Professor'	activity_1
SELECT count(*) FROM Faculty WHERE Sex  =  'F' AND Rank  =  'Professor'	activity_1
SELECT phone ,  room ,  building FROM Faculty WHERE Fname  =  'Jerry' AND Lname  =  'Prince'	activity_1
SELECT phone ,  room ,  building FROM Faculty WHERE Fname  =  'Jerry' AND Lname  =  'Prince'	activity_1
SELECT count(*) FROM Faculty WHERE Rank  =  'Professor' AND building  =  'NEB'	activity_1
SELECT count(*) FROM Faculty WHERE Rank  =  'Professor' AND building  =  'NEB'	activity_1
SELECT fname ,  lname FROM Faculty WHERE Rank  =  'Instructor'	activity_1
SELECT fname ,  lname FROM Faculty WHERE Rank  =  'Instructor'	activity_1
SELECT building ,  count(*) FROM Faculty GROUP BY building	activity_1
SELECT building ,  count(*) FROM Faculty GROUP BY building	activity_1
SELECT building FROM Faculty GROUP BY building ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT building FROM Faculty GROUP BY building ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT building FROM Faculty WHERE rank  =  'Professor' GROUP BY building HAVING count(*)  >=  10	activity_1
SELECT building FROM Faculty WHERE rank  =  'Professor' GROUP BY building HAVING count(*)  >=  10	activity_1
SELECT rank ,  count(*) FROM Faculty GROUP BY rank	activity_1
SELECT rank ,  count(*) FROM Faculty GROUP BY rank	activity_1
SELECT rank ,  sex ,  count(*) FROM Faculty GROUP BY rank ,  sex	activity_1
SELECT rank ,  sex ,  count(*) FROM Faculty GROUP BY rank ,  sex	activity_1
WITH RankCounts AS (SELECT rank, COUNT(facid) AS fac_count FROM faculty GROUP BY rank) SELECT rank FROM RankCounts WHERE fac_count = (SELECT MIN(fac_count) FROM RankCounts)	activity_1
SELECT rank FROM Faculty GROUP BY rank ORDER BY count(*) ASC LIMIT 1	activity_1
SELECT sex ,  count(*) FROM Faculty WHERE rank  =  'AsstProf' GROUP BY sex	activity_1
SELECT sex ,  count(*) FROM Faculty WHERE rank  =  'AsstProf' GROUP BY sex	activity_1
SELECT T1.fname ,  T1.lname FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T2.fname  =  'Linda' AND T2.lname  =  'Smith'	activity_1
SELECT T1.fname ,  T1.lname FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T2.fname  =  'Linda' AND T2.lname  =  'Smith'	activity_1
SELECT T2.StuID FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T1.rank  =  'Professor'	activity_1
SELECT T2.StuID FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T1.rank  =  'Professor'	activity_1
SELECT T2.fname ,  T2.lname FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T1.fname  =  'Michael' AND T1.lname  =  'Goodrich'	activity_1
SELECT T2.fname ,  T2.lname FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor WHERE T1.fname  =  'Michael' AND T1.lname  =  'Goodrich'	activity_1
SELECT faculty.facid AS FACID, (SELECT COUNT(*) FROM student WHERE advisor = faculty.facid) AS StudentsAdvised FROM faculty	activity_1
SELECT f.facid AS faculty_id, COUNT(DISTINCT s.stuid) AS students FROM faculty f JOIN faculty_participates_in fp ON f.facid = fp.facid LEFT JOIN participates_in p ON fp.actid = p.actid LEFT JOIN student s ON p.stuid = s.stuid GROUP BY f.facid	activity_1
SELECT f.rank, COUNT(s.stuid) AS num_students FROM faculty f LEFT JOIN student s ON f.facid = s.advisor GROUP BY f.rank	activity_1
SELECT T1.rank ,  count(*) FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor GROUP BY T1.rank	activity_1
SELECT L.fname, L.lname FROM faculty L JOIN (SELECT facid FROM faculty_participates_in LEFT JOIN participates_in ON faculty_participates_in.actid = participates_in.actid GROUP BY facid HAVING COUNT(DISTINCT stuid) = (SELECT MAX(student_count) FROM (SELECT facid, COUNT(DISTINCT stuid) AS student_count FROM faculty_participates_in JOIN participates_in ON faculty_participates_in.actid = participates_in.actid GROUP BY facid) AS Counts)) RF ON L.facid = RF.facid	activity_1
SELECT T1.fname ,  T1.lname FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor GROUP BY T1.FacID ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT T1.FacID FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor GROUP BY T1.FacID HAVING count(*)  >=  2	activity_1
SELECT T1.FacID FROM Faculty AS T1 JOIN Student AS T2 ON T1.FacID  =  T2.advisor GROUP BY T1.FacID HAVING count(*)  >=  2	activity_1
SELECT FacID FROM Faculty EXCEPT SELECT advisor FROM Student	activity_1
SELECT FacID FROM Faculty EXCEPT SELECT advisor FROM Student	activity_1
SELECT activity_name FROM Activity	activity_1
SELECT activity_name FROM Activity	activity_1
SELECT count(*) FROM Activity	activity_1
SELECT count(*) FROM Activity	activity_1
SELECT count(DISTINCT FacID) FROM Faculty_participates_in	activity_1
SELECT count(DISTINCT FacID) FROM Faculty_participates_in	activity_1
SELECT FacID FROM Faculty EXCEPT SELECT FacID FROM Faculty_participates_in	activity_1
SELECT FacID FROM Faculty EXCEPT SELECT FacID FROM Faculty_participates_in	activity_1
SELECT FacID FROM Faculty_participates_in INTERSECT SELECT advisor FROM Student	activity_1
SELECT FacID FROM Faculty_participates_in INTERSECT SELECT advisor FROM Student	activity_1
SELECT count(*) FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID WHERE T1.fname  =  'Mark' AND T1.lname  =  'Giuliano'	activity_1
SELECT count(*) FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID WHERE T1.fname  =  'Mark' AND T1.lname  =  'Giuliano'	activity_1
SELECT T3.activity_name FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID JOIN Activity AS T3 ON T3.actid  =  T2.actid WHERE T1.fname  =  'Mark' AND T1.lname  =  'Giuliano'	activity_1
SELECT T3.activity_name FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID JOIN Activity AS T3 ON T3.actid  =  T2.actid WHERE T1.fname  =  'Mark' AND T1.lname  =  'Giuliano'	activity_1
SELECT f.fname, f.lname, COUNT(fp.actid) AS num_activities FROM faculty f JOIN faculty_participates_in fp ON f.facid = fp.facid GROUP BY f.facid	activity_1
SELECT f.fname, f.lname, COUNT(fp.actid) AS num_activities FROM faculty f JOIN faculty_participates_in fp ON f.facid = fp.facid GROUP BY f.facid	activity_1
SELECT (SELECT activity_name FROM activity WHERE actid = subsidiary.actid), COUNT(DISTINCT subsidiary.facid) FROM faculty_participates_in subsidiary GROUP BY subsidiary.actid	activity_1
SELECT A.activity_name, (SELECT COUNT(F.facid) FROM faculty F INNER JOIN faculty_participates_in FP ON F.facid = FP.facid WHERE FP.actid = A.actid) AS participant_count FROM activity A	activity_1
WITH ActivityCount AS (SELECT facid, COUNT(actid) AS num_activities FROM faculty_participates_in GROUP BY facid) SELECT F.fname, F.lname FROM faculty F JOIN ActivityCount AC ON F.facid = AC.facid WHERE num_activities = (SELECT MAX(num_activities) FROM ActivityCount)	activity_1
SELECT F.fname, F.lname FROM faculty F, faculty_participates_in FPI WHERE F.facid = FPI.facid GROUP BY F.facid HAVING COUNT(FPI.actid) = (SELECT MAX(CNT) FROM (SELECT COUNT(actid) AS CNT FROM faculty_participates_in GROUP BY facid))	activity_1
WITH FacultyCount AS (SELECT activity.actid, COUNT(DISTINCT faculty_participates_in.facid) AS num_faculty FROM faculty_participates_in JOIN activity ON faculty_participates_in.actid = activity.actid GROUP BY activity.actid) SELECT activity.activity_name FROM activity JOIN FacultyCount ON activity.actid = FacultyCount.actid WHERE FacultyCount.num_faculty = (SELECT MAX(num_faculty) FROM FacultyCount)	activity_1
SELECT T1.activity_name FROM Activity AS T1 JOIN Faculty_participates_in AS T2 ON T1.actID  =  T2.actID GROUP BY T1.actID ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Participates_in	activity_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Participates_in	activity_1
SELECT StuID FROM Participates_in INTERSECT SELECT StuID FROM Student WHERE age  <  20	activity_1
SELECT StuID FROM Participates_in INTERSECT SELECT StuID FROM Student WHERE age  <  20	activity_1
SELECT T1.fname ,  T1.lname FROM Student AS T1 JOIN Participates_in AS T2 ON T1.StuID  =  T2.StuID GROUP BY T1.StuID ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT s.fname, s.lname FROM student s, (SELECT stuid FROM participates_in GROUP BY stuid HAVING COUNT(actid) = (SELECT MAX(activity_count) FROM (SELECT COUNT(actid) AS activity_count FROM participates_in GROUP BY stuid))) p WHERE s.stuid = p.stuid	activity_1
SELECT T1.activity_name FROM Activity AS T1 JOIN Participates_in AS T2 ON T1.actID  =  T2.actID GROUP BY T1.actID ORDER BY count(*) DESC LIMIT 1	activity_1
SELECT activity_name FROM activity WHERE actid IN (SELECT actid FROM participates_in GROUP BY actid HAVING COUNT(stuid) = (SELECT MAX(cnt) FROM (SELECT COUNT(stuid) AS cnt FROM participates_in GROUP BY actid)))	activity_1
SELECT F.fname FROM faculty F, faculty_participates_in FPI, activity A WHERE F.facid = FPI.facid AND FPI.actid = A.actid AND A.activity_name IN ('Canoeing', 'Kayaking')	activity_1
SELECT f.fname FROM faculty f JOIN faculty_participates_in fp ON f.facid = fp.facid JOIN activity a ON fp.actid = a.actid WHERE a.activity_name IN ('Canoeing', 'Kayaking')	activity_1
SELECT lname FROM faculty WHERE rank  =  'Professor' EXCEPT SELECT DISTINCT T1.lname FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID JOIN activity AS T3 ON T2.actid  =  T2.actid WHERE T3.activity_name  =  'Canoeing' OR T3.activity_name  =  'Kayaking'	activity_1
SELECT DISTINCT fname FROM faculty WHERE facid NOT IN (SELECT facid FROM faculty_participates_in WHERE actid IN (SELECT actid FROM activity WHERE activity_name IN ('Canoeing', 'Kayaking')))	activity_1
SELECT T1.lname FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID JOIN activity AS T3 ON T2.actid  =  T2.actid WHERE T3.activity_name  =  'Canoeing' INTERSECT SELECT T1.lname FROM Faculty AS T1 JOIN Faculty_participates_in AS T2 ON T1.facID  =  T2.facID JOIN activity AS T3 ON T2.actid  =  T2.actid WHERE T3.activity_name  =  'Kayaking'	activity_1
SELECT DISTINCT fname FROM faculty WHERE facid IN (SELECT fp1.facid FROM faculty_participates_in fp1 INNER JOIN activity a1 ON fp1.actid = a1.actid WHERE a1.activity_name = 'Canoeing' INTERSECT SELECT fp2.facid FROM faculty_participates_in fp2 INNER JOIN activity a2 ON fp2.actid = a2.actid WHERE a2.activity_name = 'Kayaking')	activity_1
SELECT DISTINCT pi1.stuid FROM participates_in pi1 JOIN activity a1 ON pi1.actid = a1.actid WHERE a1.activity_name = 'Canoeing' INTERSECT SELECT DISTINCT pi2.stuid FROM participates_in pi2 JOIN activity a2 ON pi2.actid = a2.actid WHERE a2.activity_name = 'Kayaking'	activity_1
SELECT DISTINCT p1.stuid FROM participates_in p1 JOIN activity a1 ON p1.actid = a1.actid JOIN participates_in p2 ON p1.stuid = p2.stuid JOIN activity a2 ON p2.actid = a2.actid WHERE a1.activity_name = 'Canoeing' AND a2.activity_name = 'Kayaking'	activity_1
SELECT name FROM airports WHERE city  =  'Goroka'	flight_4
SELECT name FROM airports WHERE city  =  'Goroka'	flight_4
SELECT name ,  city ,  country ,  elevation FROM airports WHERE city  =  'New York'	flight_4
SELECT name ,  city ,  country ,  elevation FROM airports WHERE city  =  'New York'	flight_4
SELECT count(*) FROM airlines	flight_4
SELECT count(*) FROM airlines	flight_4
SELECT count(*) FROM airlines WHERE country  =  'Russia'	flight_4
SELECT count(*) FROM airlines WHERE country  =  'Russia'	flight_4
SELECT max(elevation) FROM airports WHERE country  =  'Iceland'	flight_4
SELECT max(elevation) FROM airports WHERE country  =  'Iceland'	flight_4
SELECT name FROM airports WHERE country  =  'Cuba' OR country  =  'Argentina'	flight_4
SELECT name FROM airports WHERE country  =  'Cuba' OR country  =  'Argentina'	flight_4
SELECT country FROM airlines WHERE name LIKE 'Orbit%'	flight_4
SELECT country FROM airlines WHERE name LIKE 'Orbit%'	flight_4
SELECT name FROM airports WHERE elevation BETWEEN -50 AND 50	flight_4
SELECT name FROM airports WHERE elevation BETWEEN -50 AND 50	flight_4
SELECT country FROM airports ORDER BY elevation DESC LIMIT 1	flight_4
SELECT country FROM airports ORDER BY elevation DESC LIMIT 1	flight_4
SELECT count(*) FROM airports WHERE name LIKE '%International%'	flight_4
SELECT COUNT(*) FROM airports WHERE name LIKE '%Interanation%'	flight_4
SELECT count(DISTINCT city) FROM airports WHERE country  =  'Greenland'	flight_4
SELECT count(DISTINCT city) FROM airports WHERE country  =  'Greenland'	flight_4
SELECT count(*) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid WHERE T1.name  =  'American Airlines'	flight_4
SELECT count(*) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid WHERE T1.name  =  'American Airlines'	flight_4
SELECT count(*) FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.dst_apid WHERE country  =  'Canada'	flight_4
SELECT count(*) FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.dst_apid WHERE country  =  'Canada'	flight_4
SELECT a.name, a.city, a.country FROM airports a WHERE a.elevation = (SELECT MIN(elevation) FROM airports)	flight_4
SELECT name, city, country FROM airports WHERE elevation = (SELECT MIN(elevation) FROM airports);	flight_4
SELECT name, city, country FROM airports WHERE x = (SELECT MAX(x) FROM airports B WHERE airports.apid = B.apid)	flight_4
SELECT name, city, country FROM airports WHERE elevation = (SELECT MAX(elevation) FROM airports)	flight_4
SELECT airports.name, airports.city FROM airports JOIN routes ON airports.apid = routes.dst_apid GROUP BY routes.dst_apid ORDER BY COUNT(*) DESC LIMIT 1	flight_4
SELECT a.name, a.city FROM airports a INNER JOIN (SELECT dst_apid FROM routes GROUP BY dst_apid HAVING COUNT(dst_apid) = (SELECT MAX(count) FROM (SELECT COUNT(dst_apid) as count FROM routes GROUP BY dst_apid))) r ON a.apid = r.dst_apid	flight_4
SELECT T1.name ,  T2.alid FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid GROUP BY T2.alid ORDER BY count(*) DESC LIMIT 10	flight_4
SELECT T1.name ,  T2.alid FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid GROUP BY T2.alid ORDER BY count(*) DESC LIMIT 10	flight_4
SELECT airports.name, airports.city FROM airports JOIN routes ON airports.apid = routes.src_apid GROUP BY airports.apid ORDER BY COUNT(*) DESC LIMIT 1	flight_4
SELECT a.name, a.city FROM airports a, (SELECT src_apid FROM routes GROUP BY src_apid HAVING COUNT(src_apid) = (SELECT MAX(c) FROM (SELECT COUNT(src_apid) AS c FROM routes GROUP BY src_apid))) b WHERE a.apid = b.src_apid	flight_4
SELECT count(DISTINCT dst_apid) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid WHERE T1.name  =  'American Airlines'	flight_4
SELECT count(DISTINCT dst_apid) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid WHERE T1.name  =  'American Airlines'	flight_4
SELECT country FROM airlines GROUP BY country HAVING COUNT(alid) = (SELECT MAX(total) FROM (SELECT COUNT(alid) AS total FROM airlines GROUP BY country))	flight_4
SELECT country FROM airlines GROUP BY country HAVING COUNT(alid) = (SELECT MAX(cnt) FROM (SELECT COUNT(alid) AS cnt FROM airlines GROUP BY country))	flight_4
SELECT country FROM airlines WHERE active = 'Y' GROUP BY country HAVING COUNT(alid) = (SELECT MAX(count_country) FROM (SELECT COUNT(alid) AS count_country FROM airlines WHERE active = 'Y' GROUP BY country))	flight_4
SELECT country FROM airlines WHERE active = 'Y' GROUP BY country HAVING COUNT(alid) = (SELECT MAX(c) FROM (SELECT COUNT(alid) c FROM airlines WHERE active = 'Y' GROUP BY country))	flight_4
SELECT country ,  count(*) FROM airlines GROUP BY country ORDER BY count(*) DESC	flight_4
SELECT country ,  count(*) FROM airlines GROUP BY country ORDER BY count(*) DESC	flight_4
SELECT count(*) ,  country FROM airports GROUP BY country ORDER BY count(*) DESC	flight_4
SELECT count(*) ,  country FROM airports GROUP BY country ORDER BY count(*) DESC	flight_4
SELECT count(*) ,  city FROM airports WHERE country  =  'United States' GROUP BY city ORDER BY count(*) DESC	flight_4
SELECT count(*) ,  city FROM airports WHERE country  =  'United States' GROUP BY city ORDER BY count(*) DESC	flight_4
SELECT city FROM airports WHERE country  =  'United States' GROUP BY city HAVING count(*)  >  3	flight_4
SELECT COUNT(*) FROM (SELECT city FROM airports WHERE country = 'United States' GROUP BY city HAVING COUNT(apid) > 3)	flight_4
SELECT count(*) FROM (SELECT city FROM airports GROUP BY city HAVING count(*)  >  3)	flight_4
SELECT count(*) FROM (SELECT city FROM airports GROUP BY city HAVING count(*)  >  3)	flight_4
SELECT city ,  count(*) FROM airports GROUP BY city HAVING count(*)  >  1	flight_4
SELECT city ,  count(*) FROM airports GROUP BY city HAVING count(*)  >  1	flight_4
SELECT city FROM (SELECT city, COUNT(*) as num_airports FROM airports GROUP BY city) WHERE num_airports > 2 ORDER BY num_airports DESC;	flight_4
SELECT a.city FROM (SELECT city, COUNT(*) AS cnt FROM airports GROUP BY city) a WHERE a.cnt > 2 ORDER BY a.cnt DESC;	flight_4
SELECT a.name, COUNT(r.src_apid) AS num_routes FROM airports a JOIN routes r ON a.apid = r.src_apid GROUP BY a.apid, a.name	flight_4
SELECT count(*) ,  T1.name FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.src_apid GROUP BY T1.name	flight_4
SELECT airports.name, COUNT(routes.src_apid) AS num_routes FROM airports JOIN routes ON airports.apid = routes.src_apid GROUP BY airports.apid ORDER BY num_routes DESC	flight_4
SELECT count(*) ,  T1.name FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.src_apid GROUP BY T1.name ORDER BY count(*) DESC	flight_4
SELECT avg(elevation) ,  country FROM airports GROUP BY country	flight_4
SELECT avg(elevation) ,  country FROM airports GROUP BY country	flight_4
SELECT city FROM airports GROUP BY city HAVING count(*)  =  2	flight_4
SELECT city FROM airports GROUP BY city HAVING count(*)  =  2	flight_4
SELECT T1.country ,  T1.name ,  count(*) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid GROUP BY T1.country ,  T1.name	flight_4
SELECT T1.country ,  T1.name ,  count(*) FROM airlines AS T1 JOIN routes AS T2 ON T1.alid  =  T2.alid GROUP BY T1.country ,  T1.name	flight_4
SELECT count(*) FROM routes AS T1 JOIN airports AS T2 ON T1.dst_apid  =  T2.apid WHERE T2.country  =  'Italy'	flight_4
SELECT count(*) FROM routes AS T1 JOIN airports AS T2 ON T1.dst_apid  =  T2.apid WHERE T2.country  =  'Italy'	flight_4
SELECT COUNT(DISTINCT r.dst_apid) FROM routes r INNER JOIN airlines a ON r.alid = a.alid INNER JOIN airports ap ON r.dst_apid = ap.apid WHERE a.name = 'American Airlines' AND ap.country = 'Italy'	flight_4
SELECT count(*) FROM routes AS T1 JOIN airports AS T2 ON T1.dst_apid  =  T2.apid JOIN airlines AS T3 ON T1.alid  =  T3.alid WHERE T2.country  =  'Italy' AND T3.name  =  'American Airlines'	flight_4
SELECT count(*) FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.dst_apid WHERE T1.name  =  'John F Kennedy International Airport'	flight_4
SELECT count(*) FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.dst_apid WHERE T1.name  =  'John F Kennedy International Airport'	flight_4
SELECT count(*) FROM routes WHERE dst_apid IN (SELECT apid FROM airports WHERE country  =  'Canada') AND src_apid IN (SELECT apid FROM airports WHERE country  =  'United States')	flight_4
SELECT count(*) FROM routes WHERE dst_apid IN (SELECT apid FROM airports WHERE country  =  'Canada') AND src_apid IN (SELECT apid FROM airports WHERE country  =  'United States')	flight_4
SELECT rid FROM routes WHERE dst_apid IN (SELECT apid FROM airports WHERE country  =  'United States') AND src_apid IN (SELECT apid FROM airports WHERE country  =  'United States')	flight_4
SELECT rid FROM routes WHERE dst_apid IN (SELECT apid FROM airports WHERE country  =  'United States') AND src_apid IN (SELECT apid FROM airports WHERE country  =  'United States')	flight_4
SELECT a.name FROM airlines a JOIN routes r ON a.alid = r.alid GROUP BY a.alid ORDER BY COUNT(*) DESC LIMIT 1	flight_4
SELECT airlines.name FROM airlines JOIN routes ON airlines.alid = routes.alid GROUP BY airlines.alid ORDER BY COUNT(routes.rid) DESC LIMIT 1	flight_4
SELECT T1.name FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.src_apid WHERE T1.country  =  'China' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1	flight_4
SELECT T1.name FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.src_apid WHERE T1.country  =  'China' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1	flight_4
SELECT T1.name FROM airports AS T1 JOIN routes AS T2 ON T1.apid  =  T2.dst_apid WHERE T1.country  =  'China' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1	flight_4
SELECT airports.name FROM airports JOIN routes ON airports.apid = routes.dst_apid WHERE routes.src_apid IN (SELECT apid FROM airports WHERE country = 'China') GROUP BY airports.name ORDER BY COUNT(*) DESC LIMIT 1	flight_4
SELECT MAX(order_id) FROM orders WHERE date_order_placed = (SELECT MAX(date_order_placed) FROM orders)	tracking_orders
SELECT order_id FROM (SELECT order_id, RANK() OVER (ORDER BY date_order_placed DESC) AS rank FROM orders) WHERE rank = 1	tracking_orders
SELECT o.order_id, o.customer_id FROM orders AS o WHERE o.date_order_placed = (SELECT MIN(date_order_placed) FROM orders)	tracking_orders
SELECT order_id, customer_id FROM orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM orders)	tracking_orders
SELECT order_id FROM orders WHERE order_id IN (SELECT order_id FROM shipments WHERE shipment_tracking_number = '3452')	tracking_orders
SELECT order_id FROM shipments WHERE shipment_tracking_number = '3452'	tracking_orders
SELECT order_item_id FROM order_items WHERE product_id = 11	tracking_orders
SELECT order_item_id FROM order_items WHERE product_id = 11	tracking_orders
SELECT DISTINCT T1.customer_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'Packing'	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE order_status = 'Packing')	tracking_orders
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'On Road'	tracking_orders
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'On Road'	tracking_orders
SELECT C.customer_name FROM customers C WHERE C.customer_id IN (SELECT O.customer_id FROM orders O GROUP BY O.customer_id HAVING COUNT(O.order_id) = (SELECT MAX(counts) FROM (SELECT COUNT(order_id) AS counts FROM orders GROUP BY customer_id)))	tracking_orders
SELECT T1.customer_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1	tracking_orders
SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) = (SELECT MAX(count_order) FROM (SELECT customer_id, COUNT(order_id) as count_order FROM orders GROUP BY customer_id) counts)	tracking_orders
SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) = (SELECT MAX(Count) FROM (SELECT customer_id, COUNT(order_id) AS Count FROM orders GROUP BY customer_id))	tracking_orders
SELECT T2.order_id ,  T2.order_status FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.customer_name = 'Jeramie'	tracking_orders
SELECT T2.order_id ,  T2.order_status FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.customer_name = 'Jeramie'	tracking_orders
SELECT T2.date_order_placed FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.customer_name = 'Jeramie'	tracking_orders
SELECT T2.date_order_placed FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T1.customer_name = 'Jeramie'	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE date_order_placed BETWEEN '2009-01-01' AND '2010-01-01')	tracking_orders
SELECT c.customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id AND o.date_order_placed >= '2009-01-01' AND o.date_order_placed <= '2010-01-01')	tracking_orders
SELECT DISTINCT T2.product_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed >= '1975-01-01' AND T1.date_order_placed <= '1976-01-01'	tracking_orders
SELECT DISTINCT T2.product_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id WHERE T1.date_order_placed >= '1975-01-01' AND T1.date_order_placed <= '1976-01-01'	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE order_status = 'On Road' INTERSECT SELECT customer_id FROM orders WHERE order_status = 'Shipped')	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(CASE WHEN order_status = 'On Road' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN order_status = 'Shipped' THEN 1 ELSE 0 END) > 0)	tracking_orders
SELECT T1.customer_id FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'On Road' INTERSECT SELECT T1.customer_id FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'Shipped'	tracking_orders
SELECT T1.customer_id FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'On Road' INTERSECT SELECT T1.customer_id FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id WHERE T2.order_status = 'Shipped'	tracking_orders
SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM shipments WHERE shipment_tracking_number = 3452)	tracking_orders
SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM shipments WHERE shipment_tracking_number = 3452)	tracking_orders
SELECT T1.date_order_placed FROM orders AS T1 JOIN shipments AS T2 ON T1.order_id = T2.order_id WHERE T2.invoice_number = 10	tracking_orders
SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM shipments WHERE invoice_number = 10)	tracking_orders
SELECT count(*) ,  T3.product_id FROM orders AS T1 JOIN order_items AS T2 JOIN products AS T3 ON T1.order_id = T2.order_id AND T2.product_id = T3.product_id GROUP BY T3.product_id	tracking_orders
SELECT p.product_id, (SELECT COUNT(*) FROM order_items oi WHERE oi.product_id = p.product_id) AS total_orders FROM products p	tracking_orders
SELECT T3.product_name ,  count(*) FROM orders AS T1 JOIN order_items AS T2 JOIN products AS T3 ON T1.order_id = T2.order_id AND T2.product_id = T3.product_id GROUP BY T3.product_id	tracking_orders
SELECT product_name, (SELECT COUNT(order_id) FROM order_items WHERE products.product_id = order_items.product_id) AS orders_count FROM products;	tracking_orders
SELECT order_id FROM shipments WHERE shipment_date > '2000-01-01'	tracking_orders
SELECT DISTINCT o.order_id FROM orders o JOIN shipments s ON o.order_id = s.order_id WHERE s.shipment_date > '2000-01-01'	tracking_orders
SELECT order_id FROM shipments WHERE shipment_date  =  (SELECT max(shipment_date) FROM shipments)	tracking_orders
SELECT order_id FROM shipments WHERE shipment_date  =  (SELECT max(shipment_date) FROM shipments)	tracking_orders
SELECT DISTINCT product_name FROM products ORDER BY product_name	tracking_orders
SELECT DISTINCT product_name FROM products ORDER BY product_name	tracking_orders
SELECT DISTINCT order_id FROM orders ORDER BY date_order_placed	tracking_orders
SELECT DISTINCT order_id FROM orders ORDER BY date_order_placed	tracking_orders
SELECT T1.order_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY count(*) DESC LIMIT 1	tracking_orders
SELECT T1.order_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY count(*) DESC LIMIT 1	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) = (SELECT MAX(Counted) FROM (SELECT customer_id, COUNT(order_buffer.order_id) AS Counted FROM orders order_buffer GROUP BY order_buffer.customer_id) AS OrderCounts))	tracking_orders
SELECT customer_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM orders GROUP BY customer_id)))	tracking_orders
SELECT invoice_number FROM invoices WHERE invoice_date < '1989-09-03' OR invoice_date > '2007-12-25'	tracking_orders
SELECT invoice_number FROM invoices WHERE invoice_date < '1989-09-03' OR invoice_date > '2007-12-25'	tracking_orders
SELECT DISTINCT invoice_details FROM invoices WHERE strftime('%Y-%m-%d', invoice_date) < '1989-09-03' OR strftime('%Y-%m-%d', invoice_date) > '2007-12-25'	tracking_orders
SELECT DISTINCT invoice_details FROM invoices WHERE invoice_date < '1989-09-03' OR invoice_date > '2007-12-25'	tracking_orders
SELECT T2.customer_name ,  count(*) FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.customer_id HAVING count(*)  >=  2	tracking_orders
SELECT T2.customer_name ,  count(*) FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.customer_id HAVING count(*)  >=  2	tracking_orders
SELECT customer_name FROM customers WHERE customer_id NOT IN (SELECT o.customer_id FROM orders AS o GROUP BY o.customer_id HAVING COUNT(o.order_id) > 2)	tracking_orders
SELECT c.customer_name FROM customers c WHERE (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) <= 2	tracking_orders
SELECT T1.customer_name FROM customers AS T1 JOIN orders AS T2 JOIN order_items AS T3 JOIN products AS T4 ON T1.customer_id = T2.customer_id AND T2.order_id = T3.order_id AND T3.product_id = T4.product_id WHERE T4.product_name = 'food' GROUP BY T1.customer_id HAVING count(*)  >=  1	tracking_orders
SELECT DISTINCT c.customer_name FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id WHERE p.product_name = 'food'	tracking_orders
SELECT T1.customer_name FROM customers AS T1 JOIN orders AS T2 JOIN order_items AS T3 JOIN products AS T4 ON T1.customer_id = T2.customer_id AND T2.order_id = T3.order_id AND T3.product_id = T4.product_id WHERE T3.order_item_status = 'Cancel' AND T4.product_name = 'food' GROUP BY T1.customer_id HAVING count(*)  >=  1	tracking_orders
SELECT T1.customer_name FROM customers AS T1 JOIN orders AS T2 JOIN order_items AS T3 JOIN products AS T4 ON T1.customer_id = T2.customer_id AND T2.order_id = T3.order_id AND T3.product_id = T4.product_id WHERE T3.order_item_status = 'Cancel' AND T4.product_name = 'food' GROUP BY T1.customer_id HAVING count(*)  >=  1	tracking_orders
SELECT count(*) FROM architect WHERE gender  =  'female'	architecture
SELECT name ,  nationality ,  id FROM architect WHERE gender  =  'male' ORDER BY name	architecture
SELECT max(T1.length_meters) ,  T2.name FROM bridge AS T1 JOIN architect AS T2 ON T1.architect_id  =  T2.id	architecture
SELECT avg(length_feet) FROM bridge	architecture
SELECT name ,  built_year FROM mill WHERE TYPE  =  'Grondzeiler'	architecture
SELECT DISTINCT T1.name ,  T1.nationality FROM architect AS T1 JOIN mill AS t2 ON T1.id  =  T2.architect_id	architecture
SELECT name FROM mill WHERE LOCATION != 'Donceel'	architecture
SELECT DISTINCT T1.type FROM mill AS T1 JOIN architect AS t2 ON T1.architect_id  =  T2.id WHERE T2.nationality  =  'American' OR T2.nationality  =  'Canadian'	architecture
SELECT T1.id ,  T1.name FROM architect AS T1 JOIN bridge AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  >=  3	architecture
SELECT T1.id ,  T1.name ,  T1.nationality FROM architect AS T1 JOIN mill AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1	architecture
SELECT T1.id ,  T1.name ,  T1.gender FROM architect AS T1 JOIN bridge AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  =  2 UNION SELECT T1.id ,  T1.name ,  T1.gender FROM architect AS T1 JOIN mill AS T2 ON T1.id  =  T2.architect_id GROUP BY T1.id HAVING count(*)  =  1	architecture
SELECT LOCATION FROM bridge WHERE name  =  'Kolob Arch' OR name  =  'Rainbow Bridge'	architecture
SELECT name FROM mill WHERE name LIKE '%Moulin%'	architecture
SELECT DISTINCT T1.name FROM mill AS T1 JOIN architect AS t2 ON T1.architect_id  =  T2.id JOIN bridge AS T3 ON T3.architect_id  =  T2.id WHERE T3.length_meters  >  80	architecture
SELECT type, COUNT(type) AS freq FROM mill GROUP BY type HAVING freq = (SELECT MAX(freq) FROM (SELECT COUNT(type) AS freq FROM mill GROUP BY type))	architecture
SELECT count(*) FROM architect WHERE id NOT IN ( SELECT architect_id FROM mill WHERE built_year  <  1850 );	architecture
SELECT name FROM bridge WHERE architect_id IN (SELECT id FROM architect WHERE nationality = 'American') ORDER BY length_feet	architecture
SELECT count(*) FROM book_club	culture_company
SELECT count(*) FROM book_club	culture_company
SELECT book_title ,  author_or_editor FROM book_club WHERE YEAR  >  1989	culture_company
SELECT book_title ,  author_or_editor FROM book_club WHERE YEAR  >  1989	culture_company
SELECT DISTINCT publisher FROM book_club	culture_company
SELECT DISTINCT publisher FROM book_club	culture_company
SELECT YEAR ,  book_title ,  publisher FROM book_club ORDER BY YEAR DESC	culture_company
SELECT YEAR ,  book_title ,  publisher FROM book_club ORDER BY YEAR DESC	culture_company
SELECT publisher ,  count(*) FROM book_club GROUP BY publisher	culture_company
SELECT publisher ,  count(*) FROM book_club GROUP BY publisher	culture_company
SELECT publisher FROM book_club GROUP BY publisher HAVING COUNT(book_title) = (SELECT MAX(cnt) FROM (SELECT COUNT(book_title) AS cnt FROM book_club GROUP BY publisher))	culture_company
WITH RankedPublishers AS (SELECT publisher, RANK() OVER (ORDER BY COUNT(book_title) DESC) AS rank FROM book_club GROUP BY publisher) SELECT publisher FROM RankedPublishers WHERE rank = 1	culture_company
SELECT category ,  count(*) FROM book_club GROUP BY category	culture_company
SELECT category ,  count(*) FROM book_club GROUP BY category	culture_company
SELECT category FROM book_club WHERE YEAR  >  1989 GROUP BY category HAVING count(*)  >=  2	culture_company
SELECT category FROM book_club WHERE YEAR  >  1989 GROUP BY category HAVING count(*)  >=  2	culture_company
SELECT publisher FROM book_club WHERE YEAR  =  1989 INTERSECT SELECT publisher FROM book_club WHERE YEAR  =  1990	culture_company
SELECT publisher FROM book_club WHERE YEAR  =  1989 INTERSECT SELECT publisher FROM book_club WHERE YEAR  =  1990	culture_company
SELECT publisher FROM book_club EXCEPT SELECT publisher FROM book_club WHERE YEAR  =  1989	culture_company
SELECT publisher FROM book_club EXCEPT SELECT publisher FROM book_club WHERE YEAR  =  1989	culture_company
SELECT title ,  YEAR ,  director FROM movie ORDER BY budget_million	culture_company
SELECT title ,  YEAR ,  director FROM movie ORDER BY budget_million	culture_company
SELECT COUNT (DISTINCT director) FROM movie	culture_company
SELECT COUNT (DISTINCT director) FROM movie	culture_company
SELECT title, director FROM movie WHERE year <= 2000 AND gross_worldwide = (SELECT MAX(gross_worldwide) FROM movie WHERE year <= 2000)	culture_company
SELECT title, director FROM movie WHERE year <= 2000 AND gross_worldwide = (SELECT MAX(gross_worldwide) FROM movie WHERE year <= 2000)	culture_company
SELECT director FROM movie WHERE YEAR  =  2000 INTERSECT SELECT director FROM movie WHERE YEAR  =  1999	culture_company
SELECT director FROM movie WHERE YEAR  =  2000 INTERSECT SELECT director FROM movie WHERE YEAR  =  1999	culture_company
SELECT DISTINCT director FROM movie WHERE year = 1999 UNION ALL SELECT DISTINCT director FROM movie WHERE year = 2000	culture_company
SELECT DISTINCT director FROM movie WHERE year IN (1999, 2000)	culture_company
SELECT avg(budget_million) ,  max(budget_million) ,  min(budget_million) FROM movie WHERE YEAR  <  2000	culture_company
SELECT avg(budget_million) ,  max(budget_million) ,  min(budget_million) FROM movie WHERE YEAR  <  2000	culture_company
SELECT T1.company_name FROM culture_company AS T1 JOIN book_club AS T2 ON T1.book_club_id  =  T2.book_club_id WHERE T2.publisher  =  'Alyson'	culture_company
SELECT T1.company_name FROM culture_company AS T1 JOIN book_club AS T2 ON T1.book_club_id  =  T2.book_club_id WHERE T2.publisher  =  'Alyson'	culture_company
SELECT T1.title ,  T3.book_title FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id JOIN book_club AS T3 ON T3.book_club_id  =  T2.book_club_id WHERE T2.incorporated_in  =  'China'	culture_company
SELECT T1.title ,  T3.book_title FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id JOIN book_club AS T3 ON T3.book_club_id  =  T2.book_club_id WHERE T2.incorporated_in  =  'China'	culture_company
SELECT T2.company_name FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id WHERE T1.year  =  1999	culture_company
SELECT T2.company_name FROM movie AS T1 JOIN culture_company AS T2 ON T1.movie_id  =  T2.movie_id WHERE T1.year  =  1999	culture_company
