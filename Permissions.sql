
-- Create roles
CREATE ROLE admin LOGIN PASSWORD 'admin' SUPERUSER;
CREATE ROLE readonlyGuest;

-- create users and grant them a role
CREATE USER Jonas LOGIN PASSWORD 'Test123456' SUPERUSER;
CREATE USER Christoffer LOGIN PASSWORD '654321test' SUPERUSER;

---- Grant priviledges to roles
-- readonlyGuest
GRANT CONNECT ON DATABASE MiniProject1_library TO readonlyGuest; -- permission to connect
GRANT USAGE ON SCHEMA MiniProject1_library TO readonlyGuest; -- permission to use
GRANT SELECT ON TABLE book TO readonlyGuest; -- permission to read
GRANT SELECT ON TABLE borrowed TO readonlyGuest; -- permission to read
GRANT SELECT ON TABLE loaner TO readonlyGuest; -- permission to read
GRANT SELECT ON TABLE orders TO readonlyGuest; -- permission to read
GRANT SELECT ON TABLE status TO readonlyGuest; -- permission to read
-- SUPERUSER
GRANT CONNECT ON DATABASE MiniProject1_library TO SUPERUSER; -- permission to connect
GRANT USAGE ON SCHEMA MiniProject1_library TO SUPERUSER; -- permission to use
GRANT CONNECT ON DATABASE MyDB TO SUPERUSER;
GRANT USAGE, CREATE ON TABLE book TO SUPERUSER;
GRANT USAGE, CREATE ON TABLE borrowed TO SUPERUSER;
GRANT USAGE, CREATE ON TABLE loaner TO SUPERUSER;
GRANT USAGE, CREATE ON TABLE orders TO SUPERUSER;
GRANT USAGE, CREATE ON TABLE status TO SUPERUSER;

-- overview of roles 
SELECT user FROM pg_roles;