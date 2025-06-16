create database "ETL Load";

create user etl with password 'etlpass';

grant connect on database "ETL Load" to etl;

grant connect on database "DemoDB" to etl;

grant select,insert,update,delete on all tables in schema public to etl;