-- The following line terminates any active connections to the database so that it can be dropped
SELECT pg_terminate_backend(pid) 
FROM pg_stat_activity 
WHERE datname = 'card_collection';

DROP DATABASE IF EXISTS card_collection;

DROP USER IF EXISTS card_collection_owner;
DROP USER IF EXISTS card_collection_appuser;

-- then create the database
CREATE DATABASE card_collection;
