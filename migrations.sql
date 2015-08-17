create database restfulcats;

\c restfulcats

create table cats (id serial primary key, name varchar(255), breed varchar(255));
