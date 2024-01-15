--집합 연산자

--UNION 합집합(중복 없음)/ UnionALL 중복있는 합집합
SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
UNION--행의 개수가 정확히 일치해야 합니다.-- 행의 타입도 위아래가 정확히 일치해야합니다.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
UNION ALL--행의 개수가 정확히 일치해야 합니다.-- 행의 타입도 위아래가 정확히 일치해야합니다.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

--a. unionALL은 가상 테이블 생성시 사용이 가능합니다.

SELECT 200, 'HONGMAN' FROM DUAL
UNION ALL
SELECT 400, 'DONGMAN' FROM DUAL
UNION ALL
SELECT 300, 'TONGMAN' FROM DUAL ;


--분석함수
--RANK() 등수를 구해주는 함수 - 중복을 고려합니다 ex) 1,2,2,2,5,6,7...
--DENSE_RANK() 등수를 구해주는 함수 - 중복을 고려하지 않습니다. ex)1,2,2,2,3,4,5,6,7.....
--ROW_NUMBER() 행의 번호를 구하는 함수
-- 함수 OVER (순서 조건[정렬조건 order by]) Alias;

SELECT EMPLOYEE_ID , DEPARTMENT_ID, SALARY,
        RANK()Over (order by SALARY desc) AS Sal_rn,--중복을 고려하기 때문에 1,2,2,4,5,6,7,7,9....
        DENSE_RANK() over(order by salary desc) AS sal_dr,--중복을 고려하지 않음 1,2,2,3,4,5,6,6.....
        ROW_Number() over(order by salary desc) AS sal_rnn -- 행번호
        FROM employees order by sal_rn;
 
SELECT rownum,CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME)AS NAME , NVL(DEPARTMENT_ID,0)AS DEPM, SALARY*NVL2(COMMISSION_PCT,1.5,1) AS SALARY,
            RANK() OVER (order by SALARY desc) AS sal_r,
            DENSE_RANK()over(Order by salary desc) as sal_dr,
            ROW_number()OVer(order by salary desc) as sal_rn-- rownum에 order by 붙여진거라 보면됩니다.
            FROM employees order by sal_r;














-- INTERSECT - 교집합 // MINUS - 차집합
SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
INTERSECT--행의 개수가 정확히 일치해야 합니다.-- 행의 타입도 위아래가 정확히 일치해야합니다.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;

SELECT First_name, Hire_date FROM employees where Hire_date like '04%' 
MINUS--행의 개수가 정확히 일치해야 합니다.-- 행의 타입도 위아래가 정확히 일치해야합니다.
SELECT FIRST_NAME, Hire_DATE FROM EMPLOYEES where salary>=9000;
