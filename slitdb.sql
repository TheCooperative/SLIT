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


/*TEST DATA*/
INSERT INTO userAccount (id, firstName, lastName, email, pass, role, lastLogin, resetVerification) 
VALUES (id, 'Marius', 'Vika', 'mariuv16@uia.no', 'hei123', '0', null, null);

INSERT INTO userAccount(id, firstName, lastName, email, pass, role, lastLogin, resetVerification) 
VALUES (id, 'Hallgeir', 'Nilsen', 'halgeir@nilsen.no', 'halnils', '1', null, null);

INSERT INTO userAccount(id, firstName, lastName, email, pass, role, lastLogin, resetVerification)
VALUES (id, 'Even', 'Larsen', 'even@larsen.no', 'evlar', '1', null, null);

INSERT INTO userAccount(id, firstName, lastName, email, pass, role, lastLogin, resetVerification)
VALUES (id, 'Anders', 'Ekse', 'anders.xe@gmail.com', 'testpassword', '0', null, null);


INSERT INTO module (id, title, description, goals, resources, task, deadline) 
VALUES ('1', 'Modul 1', 'Lag en brusautomat i blueJ.', 'lære basic kode i java', 'Object oriented coding - lærerbok', 'Lag en brusautomat med bruk av en klasse, skriv også ned en logg etter fullført.', '2017-11-10');

INSERT INTO module (id, title, description, goals, resources, task, deadline) 
VALUES ('2', 'Modul 2', 'Lag en sykkelbutikk i java.', 'lære mer avansert kode i java', 'Object oriented coding - lærerbok', 'Lag en sykkelbutikk ved bruk av minst tre klasser. Skriv også en læringslogg.', '2017-12-10');


INSERT INTO handIn (fileName, fileBlob, deliveryDate, feedback, notes, points, m_id, u_id) 
VALUES ('MariusSinModul1', null, deliveryDate, 'Veldig bra jobbet!!', 'Dette er min modul 1, håper den er bra!', '10', '1', '1');

INSERT INTO handIn (fileName, fileBlob, deliveryDate, feedback, notes, points, m_id, u_id) 
VALUES ('Modul2Anders', null, deliveryDate, 'Helt OK, dette må du jobbe litt mer med', 'Min modul 2, håper dere liker.', '5', '2', '4');

