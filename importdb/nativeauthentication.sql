-- please define the corresponding user/password here...
-- CREATE USER 'espo' IDENTIFIED  WITH mysql_native_password BY 'secret2';
ALTER USER 'espo' IDENTIFIED WITH mysql_native_password BY 'secret2';
-- ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'secret';
GRANT ALL PRIVILEGES ON espocrm . * TO 'espo';
FLUSH PRIVILEGES;