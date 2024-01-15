SET SERVEROUTPUT on;
--TRIGGER
--테이블에 부착된형태로 after나 before가 존재합니다
--DML 실행 이후에 동작하는것을 after라하고 이전에 동작하면 before입니다.
CREATE TABLE TBL_TEST(--연습용 테이블 생성
    TBL_ID VARCHAR2(30),
    TBL_TEXT VARCHAR2(30)
);

--트리거 선언
CREATE OR REPLACE TRIGGER TBL_TEST_TRG
    AFTER UPDATE OR DELETE --트리거 유형, 현재는 after트리거: update나 delete가 일어난 이후에 동작하는 트리거를
    on TBL_TEST-- TBL_TEST에 부착합니다.
    FOR EACH ROW --각행에 적용
BEGIN
    dbms_output.put_line('Good Works');
END;

UPDATE TBL_TEST SET TBL_TEXT='TESTED' where TBL_ID='1';--업데이트 이후에 동작함
---------------------------------------------------------------------------------------------

--**트리거에서 사용할 수 있는 키워드**

-- :OLD = 참조 전 열의 값 (INSERT : 입력 전 자료, UPDATE : 수정 전 자료, DELETE : 삭제할 자료)
-- :NEW = 참조 후 열의 값 (INSERT : 입력 할 자료, UPDATE : 수정 된 자료)

CREATE TABLE TBL_USER(
    TU_ID VARCHAR2(30) primary key,
    TU_NAME VARCHAR2(30),
    TU_ADDRESS VARCHAR2(30)
);

CREATE TABLE TBL_USER_BACKUP(--TBL_USER에 대한 백업테이블
    BA_ID VARCHAR2(30),
    BA_NAME VARCHAR2(30),
    BA_ADDRESS VARCHAR2(30),
    BA_UPDATE DATE DEFAULT SYSDATE,--수정된 날짜 기록
    M_TYPE VARCHAR2(30),--수정된 형태 기록
    M_USER VARCHAR2 (30)-- 수정한 유저 기록
);


CREATE OR REPLACE TRIGGER TBL_USER_TRG
    AFTER UPDATE OR DELETE
    on TBL_USER
    FOR EACH ROW
DECLARE
    V_TYPE VARCHAR2(30);
BEGIN
    IF UPDATING THEN --업데이트가 일어나면 TRUE값 반환
        V_TYPE:='UPDATED';
    ELSIF DELETING THEN -- 삭제가 일어나면 TRUE값 반환
        V_TYPE:='DELETED';
    END IF;
    
    INSERT INTO TBL_USER_BACKUP VALUES(:OLD.TU_ID,:OLD.TU_NAME,:OLD.TU_ADDRESS,SYSDATE,V_TYPE,User());
    --바뀌기 전 데이터를 넣어줘야 백업테이블이라고 할수 있을것이다
    --백업테이블에 이전 아이디,이름,주소를 넣고 수정일자,수정형태,수정한 유저를 입력합니다.
END;

--
INSERT INTO TBL_USER VALUES('A1','T1','S1');
INSERT INTO TBL_USER VALUES('A2','T2','S2');
INSERT INTO TBL_USER VALUES('A3','T3','S3');
INSERT INTO TBL_USER VALUES('A4','T4','S4');
INSERT INTO TBL_USER VALUES('A5','T5','S5');
--
UPDATE TBL_USER SET TU_NAME='ssss' where TU_ID='A3';
UPDATE TBL_USER SET TU_NAME='rwew' where TU_ID='A2';


select*FROM tbl_user_backup;

