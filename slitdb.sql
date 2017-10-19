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

create table module(
	id int primary key,
    title varchar(75),
    description varchar(250),
    goals varchar(250),
    resources varchar(250),
    task varchar(250),
    deadline date
);

drop table module;