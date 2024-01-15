Create table Users(
    ID Varchar2(30),
    PW Varchar2(30),
    NAME Varchar2(30),
    EMAIL VARCHAR2(50),
    ADDRESS VARCHAR2 (200),
    Gender Char(1) Default 'M',
    REGDATE DATE DEFAULT SYSDATE
);

Alter table users add constraint users_PK primary key(ID);
