create schema slitdb;
use slitdb;

create table userAccount(
	id int auto_increment primary key,
    firstName varchar(35),
    lastName varchar(35),
    email varchar(75) unique,
    pass varchar(80),
    role tinyint(1) default 0,
    lastLogin datetime
    
);

/* update userAccount set lastLogin = now() where id = 1; Dette er for å teste om lærer/student fungerer som d skal.*/

drop table userAccount;