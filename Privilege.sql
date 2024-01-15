--권한이란
--SQL문장을 실행하기 위한 권리입니다.

--사용자 생성은 DBA 계정만 가능합니다.

--사용자 계정 조회
select * FROM all_users;

--사용자 계정 권한 조회
SELECT * FROM user_sys_privs;

--새로운 계정 생성
Create USER User01 IDENTIFIED by q1w2e3r4t5;--권한이 없으면 로그인도 불가능합니다.
--해당 계정에 권한을 부여
Grant Create Session, Create View, Create table, CREATE Sequence, Create PROCEDURE to User01;
--create Session : 접속권한부여
--create table 부여해서 생성하면 no privileges on tablespace라고 뜨는데 tablespace도 지정을 해주어야 합니다.

--Table Space 연결
Alter user User01
    Default TABLESPACE--기본테이블 스페이스를 Users로 지정
    USERS
    QUOTA UNLIMITED--Users 에 대한 무제한 할당 권한을 부여한다.
    On USERS;
    
--계정 삭제
--DROP user [유저명];


--ROLE을 이용한 권한 부여

--Oracle 의 기본 ROLE에는 Connect , Resource, DBA가 있습니다.

--connect : 접속 권한부여

--Resouce: 작성 권한 부여

--DBA : 오라클 시스템 관리자 권한 부여
Create User User01 Identified by q1w2e3r4t5;

GRANT CONNECT, RESOURCE to User01;

ALter User User01
    Default tablespace users
    QUOTA UNLIMITED on users;
    
DROP USER User01;

