-- SCHEMA: elmasri

-- DROP SCHEMA IF EXISTS elmasri ;

CREATE SCHEMA IF NOT EXISTS elmasri
    AUTHORIZATION lorenzo;

COMMENT ON SCHEMA elmasri
    IS 'Esquema Elmasri';

GRANT ALL ON SCHEMA elmasri TO lorenzo;

ALTER USER lorenzo
SET SEARCH_PATH TO elmasri, "$user", public;
