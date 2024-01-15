--INDEX
--오라클 데이터베이스 테이블내의 원하는 Column을 바로 찾아갈 수 있도록 만들어진 데이터구조입니다.
--조회를 빠르게 합니다.
-- 자동 인덱스는 Primary Key나 Unique Constraint에 의해 자동적으로 생성되는 인덱스입니다.-- 고유 인덱스 라고 합니다.--UNIQUE컬럼에서 사용
    
-- 수동 인덱스는 Create Index 구문으로 만드는 인덱스입니다.- 비고유 인덱스
CREATE INDEX EMPS_IT_FN_IDX
    ON EMPS_IT(FIRST_NAME);
-- 데이터값의 변경이 유동적인경우, 갱신이 잦은경우 인덱스 사용하지 않습니다.
-- 테이블이 작을경우 인덱스 사용하지 않습니다.

CREATE TABLE EMPS_IT AS (SELECT * FROM employees);

SELECT * FROM emps_it where first_NAME ='Nancy';-- INDEX사용하여 RANGE스캔이 들어가서 보다 더 빠르게 찾을 수 있다.

desc emps_IT;

--인덱스의 삭제
DROP INDEX EMPS_IT_FN_IDX;


--인덱스는 여러 컬럼을 묶어서 생성할 수도 있습니다.
CREATE INDEX EMPS_IT_FN_LN_IDX
    on EMPS_IT(FIRST_NAME,LAST_NAME);
    
SELECT * FROM EMPS_IT where FIRST_NAME='Nancy' AND LAST_NAME='Greenberg'; 
SELECT * FROM EMPS_IT WHERE LAST_NAME like '%berg%';


-- 오라클의 힌트절

SELECT /*+ INDEX_DESC(E EMPS_IT_ID_PK)*/ -- 힌트 구문
       --인덱스 기준으로 조회를 시작하라고 힌트를 넣어줌
       ROWNUM AS RN,
       E.*
FROM EMPS_IT E
ORDER BY EMPLOYEE_ID desc;-- SUBQUARY구문

    





