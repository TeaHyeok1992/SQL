-- ��������

-- NOTNULL
--column�� null���� �������� �ʴ´ٴ� ���Դϴ�.


--DROP TABLE FATHER;
--CREATE TABLE FATHER (
--    ALPHCIINO NUMBER(10) NOT NULL ENABLE, -- NULL���� �������� �ʴ� ��������
--    JONNY NUMBER(10) CONSTRAINT FATHER_JONNY_pk Primary Key,-- PK�� ����- ���̺��� ������ Ű
--    TODAY DATE DEFAULT SYSDATE,--�⺻�� ����
--    KAPONE NUMBER(10) CONSTRAINT FATHER_KAPONE_FK -- FK�� ����- �����ϴ� ���̺��� PK�� �־���� Ű
--                     References Departments(Department_ID),
--    BOTAN4 NUMBER(4) CONSTRAINT FATHER_BOTAN4_ck check(BOTAN4>550),--CHECK���� ����- ������ ��������
--    BOTAN5 NUMBER(10) CONSTRAINT FATHER_BOTAN5 Unique --����ũŰ ����
--    
--)

-- UNIQUE Key�� NULL ���� ������ PK ���� NOT NULL ENABLE �Ǿ���մϴ�.

--PK�� FK�� �˰������Ƿ� ������

--CHECK
-- TRUE���Ǵ� ������ �����մϴ�.

--CONSTRAINT ������ ������ �����մϴ�.
--NOT NULL�� �ٸ� �������ǰ� ������ �����մϴ�.
--CREATE TABLE FATHER (
--    ALPHCIINO NUMBER(10) NOT NULL, -- NULL���� �������� �ʴ� ��������
--    JONNY NUMBER(10)   Primary Key,-- PK�� ����- ���̺��� ������ Ű
--    TODAY DATE DEFAULT SYSDATE,--�⺻�� ����
--    KAPONE NUMBER(10)  -- FK�� ����- �����ϴ� ���̺��� PK�� �־���� Ű
--                     References Departments(Department_ID),
--    BOTAN4 NUMBER(4)  NOT NULL check(BOTAN4>550),--CHECK���� ����- ������ ��������
--    BOTAN5 NUMBER(10) NOT NULL Unique --����ũŰ ����
--    
--);
--
--INSERT INTO FATHER(ALPHCIINO,JONNY,KAPONE,BOTAN4,BOTAN5)
--values (1,14,1,2,3);--check constraint (HR.SYS_C007049) violated
--
--INSERT INTO FATHER(ALPHCIINO,JONNY,KAPONE,BOTAN4,BOTAN5)
--values (1,14,1000,800,3);--ORA-02291: integrity constraint (HR.SYS_C007052) violated - parent key not found FK���� ����



--CREATE Table DEPTS(
--    DEPT_NO NUMBER (2) NOT NULL,
--    DEPT_NAME VARCHAR2 (30) NOT NULL,
--    DEPT_DATE DATE DEFAULT SYSDATE,
--    DEPT_PHONE VARCHAR2 (30)NOT NULL,
--    DEPT_GENDER CHAR (1),
--    LOCA_ID NUMBER (4),
--    CONSTRAINT DEPT_NO_PK PRIMARY KEY(DEPT_NO/*, DEPT_NAME*/),--Super Key ����
--    CONSTRAINT DEPT_PHONE_UK UNIQUE (DEPT_PHONE),
--    CONSTRAINT DEPT_GENDER_CK CHECK (DEPT_GENDER IN ('F','M')),
--    CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY (LOCA_ID) REFERENCES LOCATIONS (LOCATION_ID)
--);
--
--DESC depts;

--�������� �߰� ����
--���������� ������ �Ұ����մϴ�.

CREATE Table DEPTS(
    DEPT_NO NUMBER (2) NOT NULL,
    DEPT_NAME VARCHAR2 (30) NOT NULL,
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2 (30),
    DEPT_GENDER CHAR (1),
    LOCA_ID NUMBER (4)    
);


ALTER TABLE DEPTS ADD CONSTRAINT --�������� �߰�
    DEFT_NO_PK
    PRIMARY KEY (DEPT_NO);


    
ALTER TABLE DEPTS ADD CONSTRAINT
    DEPT_LOCA_ID_FK
    FOREIGN KEY (LOCA_ID)
    REFERENCES LOCATIONS (LOCATION_ID); 
    
ALTER TABLE DEPTS
    MODIFY DEPT_PHONE VARCHAR2(30) NOT NULL;
    
-- �������� ����
ALTER TABLE DEPTS DROP CONSTRAINT 
    DEPT_PHONE_UK;
    