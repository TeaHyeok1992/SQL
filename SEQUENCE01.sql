--SEQUENCE(���������� �����ϴ� ��)

CREATE SEQUENCE DEPTS_SEQ
        INCREMENT by 1
        start with 1
        MAXVALUE 100
        NOCACHE
        NOCYCLE;
Drop SEQUENCE depts_SEQ;--������ ����        
SELECT*FROM user_sequences;--���� �������� ������ Ȯ��      

SELECT DEPts_SEQ.NeXTVAL FROM DUAL;--������
SELECT DEPTS_SEQ.CURRVAL FROM DUAL;--���簪


--SEQUENCE�� ����
ALTER SEQUENCE DEPTS_SEQ MAXVALUE 1000;
ALTER SEQUENCE DEPTS_SEQ 
    MAXVALUE 1500
    INCREMENT by 11
    MINVALUE 1;
--���� �������� ���� ��� DROP���� �����ϸ� ���������.
--�ֱ������� �������� �ʱ�ȭ �Ϸ��� ��� �ؾ��ϴ� ���ΰ�

--������ �������� ������ �ٲٰ� �ѹ� NEXTVAL��Ű�� �ٽ� ��������� �ٲߴϴ�.
ALTER SEQUENCE DEPTS_SEQ
    INCREMENT BY -121--CURRVAL : -122
    MINVALUE 0;
SELECT DEPts_SEQ.NeXTVAL FROM DUAL; --CURRVAL : 1

ALTER SEQUENCE DEPTS_SEQ
        INCREMENT BY 1;
        
--������ ����
--PK�� ������ ���ڿ��� ����
--PK�� �����ϴ� ��¥�� ����
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
        
        


