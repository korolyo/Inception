CREATE DATABASE wordpressdb;
CREATE USER 'acollin'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'acollin'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123123';