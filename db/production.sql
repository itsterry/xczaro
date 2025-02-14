CREATE USER 'xczaro'@'%' IDENTIFIED BY 'poiuyqwert';
CREATE DATABASE xczaro_production;
GRANT ALL PRIVILEGES ON xczaro_production.* TO 'xczaro'@'%';
CREATE DATABASE xczaro_production_cache;
GRANT ALL PRIVILEGES ON xczaro_production_cache.* TO 'xczaro'@'%';
CREATE DATABASE xczaro_production_queue;
GRANT ALL PRIVILEGES ON xczaro_production_queue.* TO 'xczaro'@'%';
CREATE DATABASE xczaro_production_cable;
GRANT ALL PRIVILEGES ON xczaro_production_cable.* TO 'xczaro'@'%';
