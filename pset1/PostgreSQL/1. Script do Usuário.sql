-- Role: lorenzo
-- DROP ROLE IF EXISTS lorenzo;

CREATE ROLE lorenzo WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION;

ALTER ROLE lorenzo SET search_path TO elmasri, "\$user", public;

COMMENT ON ROLE lorenzo IS 'Usuário do banco de dados';