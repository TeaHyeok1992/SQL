--SEQUENCE(순차적으로 증가하는 값)

CREATE SEQUENCE DEPTS_SEQ
        INCREMENT by 1
        start with 1
        MAXVALUE 100
        NOCACHE
        NOCYCLE;
Drop SEQUENCE depts_SEQ;--시퀀스 삭제        
SELECT*FROM user_sequences;--현재 가동중인 시퀀스 확인      

SELECT DEPts_SEQ.NeXTVAL FROM DUAL;--다음값
SELECT DEPTS_SEQ.CURRVAL FROM DUAL;--현재값


--SEQUENCE의 수정
ALTER SEQUENCE DEPTS_SEQ MAXVALUE 1000;
ALTER SEQUENCE DEPTS_SEQ 
    MAXVALUE 1500
    INCREMENT by 11
    MINVALUE 1;
--만약 시퀀스가 사용될 경우 DROP으로 삭제하면 곤란해진다.
--주기적으로 시퀀스를 초기화 하려면 어떻게 해야하는 것인가

--시퀀스 증가값을 음수로 바꾸고 한번 NEXTVAL시키고 다시 양수값으로 바꿉니다.
ALTER SEQUENCE DEPTS_SEQ
    INCREMENT BY -121--CURRVAL : -122
    MINVALUE 0;
SELECT DEPts_SEQ.NeXTVAL FROM DUAL; --CURRVAL : 1

ALTER SEQUENCE DEPTS_SEQ
        INCREMENT BY 1;
        
--시퀀스 응용
--PK의 지정을 문자열로 지정
--PK를 증가하는 날짜로 응용
CREATE TABLE DAFF (
        DAFF_NO VARCHAR2(30)
        ,DAFF_NAME VARCHAR2(30)
        ,CONSTRAINT DAFF_NO_PK Primary Key (DAFF_NO)
        
);

desc daff;

CREATE SEQUENCE dafseq NOCACHE;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-'),
        LPAD('x',5,'0'),
        TO_CHAR(SYSDATE,'YYYY-MM-')||LPAD(dafseq.nextval,5,'0') AS NO
FROM DUAL;
        
        


