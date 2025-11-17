create database election;

CREATE TABLE Bihar_results (
    LIKE governance.public.party_results INCLUDING ALL
);--ERROR:  cross-database references are not implemented

CREATE EXTENSION dblink;

CREATE TABLE Bihar_results AS
SELECT *
FROM dblink(
        'dbname=governance user=postgres password=Pqsql',
        'SELECT * FROM public.party_results'
     ) AS t(party varchar,
	 		won varchar,
			 leadings varchar,
			 total varchar);
			 
select * from bihar_results;