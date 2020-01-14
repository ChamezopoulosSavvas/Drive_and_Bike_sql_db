#ADMIN PERMISSIONS
CREATE USER 'ADMIN'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON drive_and_bike . * TO 'ADMIN'@'localhost';

#SALESMAN PERMISSIONS
CREATE USER 'SALESMAN'@'localhost' IDENTIFIED BY 'salesman';
GRANT ALL PRIVILEGES ON drive_and_bike . sale TO 'SALESMAN'@'localhost';
GRANT SELECT ON drive_and_bike . car TO 'SALESMAN'@'localhost';
GRANT SELECT ON drive_and_bike . moto TO 'SALESMAN'@'localhost';
GRANT SELECT, INSERT, UPDATE ON drive_and_bike . client TO 'SALESMAN'@'localhost';


#ENGINEER PERIMISSIONS
CREATE USER 'ENGINEER'@'localhost' IDENTIFIED BY 'engineer';
GRANT ALL PRIVILEGES ON drive_and_bike . carservice TO 'ENGINEER'@'localhost';
GRANT ALL PRIVILEGES ON drive_and_bike . motoservice TO 'ENGINEER'@'localhost';
GRANT ALL PRIVILEGES ON drive_and_bike . carpart TO 'ENGINEER'@'localhost';
GRANT ALL PRIVILEGES ON drive_and_bike . motopart TO 'ENGINEER'@'localhost';
GRANT ALL PRIVILEGES ON drive_and_bike . car_has_carpart TO 'ENGINEER'@'localhost';
GRANT ALL PRIVILEGES ON drive_and_bike . moto_has_motopart TO 'ENGINEER'@'localhost';


#ACCOUNTANT PERMISSIONS
CREATE USER 'ACCOUNTANT'@'localhost' IDENTIFIED BY 'accountant';
GRANT SELECT ON drive_and_bike . * TO 'ACCOUNTANT'@'localhost';


#CLIENT PERMISSIONS
CREATE USER 'CLIENT'@'localhost' IDENTIFIED BY 'client';
GRANT SELECT ON drive_and_bike . car TO 'CLIENT'@'localhost';
GRANT SELECT ON drive_and_bike . carpart TO 'CLIENT'@'localhost';
GRANT SELECT ON drive_and_bike . car_has_carpart TO 'CLIENT'@'localhost';
GRANT SELECT ON drive_and_bike . moto TO 'CLIENT'@'localhost';
GRANT SELECT ON drive_and_bike . motopart TO 'CLIENT'@'localhost';
GRANT SELECT ON drive_and_bike . moto_has_motopart TO 'CLIENT'@'localhost';

