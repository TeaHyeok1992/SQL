create table Scripts (
    Letter_SEND_ID Varchar2(30),
    Letter_Detail LONG,
    Letter_Date date default sysdate,
    USER_ID Varchar2(30)
    
);

drop table category;


Create table attention(
    USER_ID Varchar2(30),
    POST_NUM NUMBER

);

Create table category (
    CAtegory_name varchar2(30)

);
drop table category;
alter table category add constraint Category_NAme_PK Primary Key(Category_NAME);

INsert INTO category(CATEGORY_NAME)
values('etc');




