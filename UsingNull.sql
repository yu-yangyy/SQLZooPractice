/*
https://zh.sqlzoo.net/wiki/Using_Null
teacher:id, dept, name, phone, mobile
dept:id, name
*/

/*1. List the teachers who have NULL for their department. */
SELECT name FROM teacher
WHERE dept IS NULL

/*2. Use a different JOIN so that all teachers are listed. */
SELECT teacher.name, dept.name FROM teacher 
LEFT JOIN dept ON teacher.dept=dept.id

/*3. Use a different JOIN so that all departments are listed. */
SELECT teacher.name, dept.name FROM teacher
RIGHT JOIN dept ON teacher.dept=dept.id

/*4. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'*/
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher

/*5. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. */
SELECT teacher.name, COALESCE(dept.name, 'None') 
FROM teacher
LEFT JOIN dept ON teacher.dept=dept.id

/*6. Use COUNT to show the number of teachers and the number of mobile phones. */
SELECT COUNT(id), COUNT(mobile)
FROM teacher

/*7. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. */
SELECT dept.name, COUNT(teacher.id) FROM teacher 
RIGHT JOIN dept ON dept.id=teacher.dept
GROUP BY dept.id

/*8. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. */
SELECT teacher.name,(CASE 
                        WHEN dept IN (1, 2) THEN 'Sci'
                        ELSE 'Art'
                        END)
FROM teacher LEFT JOIN dept ON teacher.dept=dept.name

/*9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. */
SELECT teacher.name,(CASE 
                        WHEN dept IN (1, 2) THEN 'Sci'
                        WHEN dept =3 THEN 'ART'
                        ELSE 'None'
                        END)
FROM teacher LEFT JOIN dept ON teacher.dept=dept.name