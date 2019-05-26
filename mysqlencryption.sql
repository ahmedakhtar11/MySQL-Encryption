DROP DATABASE IF EXISTS logins_db;
CREATE DATABASE logins_db;
USE logins_db;

create table userlogins (
userId int(11) unsigned not null auto_increment,
username varchar(20) default null,
password varchar(100) default null,
salt varchar(20) default null,
primary key (userId)
) engine = innodb default charset = latin1;

INSERT INTO userlogins (username, password) values ('Ahmed', 'password1');
    
Insert into userlogins (username, password)
	values ('Ahmed2', aes_encrypt('password1', 'key1'));
    
select userId, username, cast(aes_decrypt(password, 'key1') as char(100)) from userlogins;

insert into userlogins (username, password, salt) 
	values ('Ahmed2', aes_encrypt(concat('password1', 'salt1'), 'key1'), 'salt1');
    
select userid, username, replace(cast(aes_decrypt(password, 'key1') as char(100)), salt, ''), salt from userlogins