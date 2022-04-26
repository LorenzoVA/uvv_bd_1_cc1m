-- Database: uvv

-- DROP DATABASE IF EXISTS uvv;

CREATE DATABASE uvv
    WITH 
    OWNER = lorenzo
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE uvv
    IS 'Banco de Dados UVV';
