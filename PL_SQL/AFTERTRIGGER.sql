SET SERVEROUTPUT on;
--TRIGGER
--���̺� ���������·� after�� before�� �����մϴ�
--DML ���� ���Ŀ� �����ϴ°��� after���ϰ� ������ �����ϸ� before�Դϴ�.
CREATE TABLE TBL_TEST(--������ ���̺� ����
    TBL_ID VARCHAR2(30),
    TBL_TEXT VARCHAR2(30)
);

--Ʈ���� ����
CREATE OR REPLACE TRIGGER TBL_TEST_TRG
    AFTER UPDATE OR DELETE --Ʈ���� ����, ����� afterƮ����: update�� delete�� �Ͼ ���Ŀ� �����ϴ� Ʈ���Ÿ�
    on TBL_TEST-- TBL_TEST�� �����մϴ�.
    FOR EACH ROW --���࿡ ����
BEGIN
    dbms_output.put_line('Good Works');
END;

UPDATE TBL_TEST SET TBL_TEXT='TESTED' where TBL_ID='1';--������Ʈ ���Ŀ� ������
---------------------------------------------------------------------------------------------

--**Ʈ���ſ��� ����� �� �ִ� Ű����**

-- :OLD = ���� �� ���� �� (INSERT : �Է� �� �ڷ�, UPDATE : ���� �� �ڷ�, DELETE : ������ �ڷ�)
-- :NEW = ���� �� ���� �� (INSERT : �Է� �� �ڷ�, UPDATE : ���� �� �ڷ�)

CREATE TABLE TBL_USER(
    TU_ID VARCHAR2(30) primary key,
    TU_NAME VARCHAR2(30),
    TU_ADDRESS VARCHAR2(30)
);

CREATE TABLE TBL_USER_BACKUP(--TBL_USER�� ���� ������̺�
    BA_ID VARCHAR2(30),
    BA_NAME VARCHAR2(30),
    BA_ADDRESS VARCHAR2(30),
    BA_UPDATE DATE DEFAULT SYSDATE,--������ ��¥ ���
    M_TYPE VARCHAR2(30),--������ ���� ���
    M_USER VARCHAR2 (30)-- ������ ���� ���
);


CREATE OR REPLACE TRIGGER TBL_USER_TRG
    AFTER UPDATE OR DELETE
    on TBL_USER
    FOR EACH ROW
DECLARE
    V_TYPE VARCHAR2(30);
BEGIN
    IF UPDATING THEN --������Ʈ�� �Ͼ�� TRUE�� ��ȯ
        V_TYPE:='UPDATED';
    ELSIF DELETING THEN -- ������ �Ͼ�� TRUE�� ��ȯ
        V_TYPE:='DELETED';
    END IF;
    
    INSERT INTO TBL_USER_BACKUP VALUES(:OLD.TU_ID,:OLD.TU_NAME,:OLD.TU_ADDRESS,SYSDATE,V_TYPE,User());
    --�ٲ�� �� �����͸� �־���� ������̺��̶�� �Ҽ� �������̴�
    --������̺� ���� ���̵�,�̸�,�ּҸ� �ְ� ��������,��������,������ ������ �Է��մϴ�.
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

