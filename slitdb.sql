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

drop table userAccount;

/* update userAccount set lastLogin = now() where id = 1; Dette er for å teste om lærer/student fungerer som d skal.*/

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

create table handIn(
	fileName varchar(80),
	fileBlob longblob,
	deliveryDate dateTime,
   	feedback varchar(250),
	notes varchar(250),
	points tinyInt,
	m_id int,
	u_id int,
    
	constraint module_fk foreign key (m_id) references module (id),
	constraint user_fk foreign key (u_id) references userAccount (id)
);

drop table handIn;

create table news(
	post_id int auto_increment,
    userID int,
    message text,
    timePosted datetime,
    
    constraint pk_post_id PRIMARY KEY(post_id),
    constraint fk_user_id foreign key (userID) references userAccount (id)
);
