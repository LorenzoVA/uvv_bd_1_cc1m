CREATE USER lorenzo;

CREATE DATABASE `uvv` /*!40100 DEFAULT CHARACTER SET latin1 */;

GRANT ALL PRIVILEGES ON uvv.* TO lorenzo;

mysql -u lorenzo -p
use uvv;
