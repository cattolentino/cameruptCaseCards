-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER card_collection_owner
WITH PASSWORD 'card_collection_pass';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO card_collection_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO card_collection_owner;

CREATE USER card_collection_appuser
WITH PASSWORD 'card_collection_pass';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO card_collection_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO card_collection_appuser;
