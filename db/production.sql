CREATE DATABASE xczaro_production;
CREATE USER 'xczaro'@'%' IDENTIFIED BY 'poiuyqwert';
GRANT ALL PRIVILEGES ON xczaro_production.* TO 'xczaro'@'%';
