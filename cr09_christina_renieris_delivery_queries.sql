-- Queries

--1
SELECT customer_id
FROM customer WHERE first_name = 'Bobby';

--2
SELECT description_id, category
FROM package_description
WHERE weight < 50;

--3
SELECT first_name , last_name
FROM employee
WHERE birth_date 
BETWEEN '1995-1-1' AND '2010-1-1';

--4
SELECT post_office.address , employee.first_name , department.name
FROM post_office
INNER JOIN employee ON post_office.fk_employee_id = employee.employee_id
INNER JOIN department ON employee.fk_department_id = department.department_id

--5
SELECT post_office.address , employee.first_name , department.name
FROM post_office
INNER JOIN employee ON post_office.fk_employee_id = employee.employee_id
INNER JOIN department ON employee.fk_department_id = department.department_id
WHERE employee.hire_date < '2016-1-1';

--6
SELECT package.package_id , package.date_received , sender_receiver.package_status , sender_receiver.sender_name , sender_receiver.receiver_name , package_description.category , package_description.weight
FROM package
INNER JOIN sender_receiver ON package.fk_sen_rec_id = sender_receiver.sen_rec_id
INNER JOIN package_description ON package.fk_description_id = package_description.description_id