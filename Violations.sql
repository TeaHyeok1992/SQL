-- 제약조건

-- NOTNULL
--column에 null값을 포함하지 않는다는 뜻입니다.


--DROP TABLE FATHER;
--CREATE TABLE FATHER (
--    ALPHCIINO NUMBER(10) NOT NULL ENABLE, -- NULL값을 포함하지 않는 제약조건
--    JONNY NUMBER(10) CONSTRAINT FATHER_JONNY_pk Primary Key,-- PK로 선언- 테이블의 고유한 키
--    TODAY DATE DEFAULT SYSDATE,--기본값 지정
--    KAPONE NUMBER(10) CONSTRAINT FATHER_KAPONE_FK -- FK로 선언- 참조하는 테이블의 PK를 넣어놓은 키
--                     References Departments(Department_ID),
--    BOTAN4 NUMBER(4) CONSTRAINT FATHER_BOTAN4_ck check(BOTAN4>550),--CHECK조건 선언- 데이터 제한조건
--    BOTAN5 NUMBER(10) CONSTRAINT FATHER_BOTAN5 Unique --유니크키 선언
--    
--)

-- UNIQUE Key는 NULL 값이 들어가지만 PK 에는 NOT NULL ENABLE 되어야합니다.

--PK와 FK는 알고있으므로 생략함

--CHECK
-- TRUE가되는 조건을 지정합니다.

--CONSTRAINT 구문은 생략이 가능합니다.
--NOT NULL은 다른 제약조건과 병행이 가능합니다.
--CREATE TABLE FATHER (
--    ALPHCIINO NUMBER(10) NOT NULL, -- NULL값을 포함하지 않는 제약조건
--    JONNY NUMBER(10)   Primary Key,-- PK로 선언- 테이블의 고유한 키
--    TODAY DATE DEFAULT SYSDATE,--기본값 지정
--    KAPONE NUMBER(10)  -- FK로 선언- 참조하는 테이블의 PK를 넣어놓은 키
--                     References Departments(Department_ID),
--    BOTAN4 NUMBER(4)  NOT NULL check(BOTAN4>550),--CHECK조건 선언- 데이터 제한조건
--    BOTAN5 NUMBER(10) NOT NULL Unique --유니크키 선언
--    
--);
--
--INSERT INTO FATHER(ALPHCIINO,JONNY,KAPONE,BOTAN4,BOTAN5)
--values (1,14,1,2,3);--check constraint (HR.SYS_C007049) violated
--
--INSERT INTO FATHER(ALPHCIINO,JONNY,KAPONE,BOTAN4,BOTAN5)
--values (1,14,1000,800,3);--ORA-02291: integrity constraint (HR.SYS_C007052) violated - parent key not found FK조건 위배



--CREATE Table DEPTS(
--    DEPT_NO NUMBER (2) NOT NULL,
--    DEPT_NAME VARCHAR2 (30) NOT NULL,
--    DEPT_DATE DATE DEFAULT SYSDATE,
--    DEPT_PHONE VARCHAR2 (30)NOT NULL,
--    DEPT_GENDER CHAR (1),
--    LOCA_ID NUMBER (4),
--    CONSTRAINT DEPT_NO_PK PRIMARY KEY(DEPT_NO/*, DEPT_NAME*/),--Super Key 지정
--    CONSTRAINT DEPT_PHONE_UK UNIQUE (DEPT_PHONE),
--    CONSTRAINT DEPT_GENDER_CK CHECK (DEPT_GENDER IN ('F','M')),
--    CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY (LOCA_ID) REFERENCES LOCATIONS (LOCATION_ID)
--);
--
--DESC depts;

--제약조건 추가 삭제
--제약조건의 변경은 불가능합니다.

CREATE Table DEPTS(
    DEPT_NO NUMBER (2) NOT NULL,
    DEPT_NAME VARCHAR2 (30) NOT NULL,
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2 (30),
    DEPT_GENDER CHAR (1),
    LOCA_ID NUMBER (4)    
);


ALTER TABLE DEPTS ADD CONSTRAINT --제약조건 추가
    DEFT_NO_PK
    PRIMARY KEY (DEPT_NO);


    
ALTER TABLE DEPTS ADD CONSTRAINT
    DEPT_LOCA_ID_FK
    FOREIGN KEY (LOCA_ID)
    REFERENCES LOCATIONS (LOCATION_ID); 
    
ALTER TABLE DEPTS
    MODIFY DEPT_PHONE VARCHAR2(30) NOT NULL;
    
-- 제약조건 삭제
ALTER TABLE DEPTS DROP CONSTRAINT 
    DEPT_PHONE_UK;
    