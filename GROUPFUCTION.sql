--그룹 함수
-- 집계, 통계를 계산할때 사용함
-- AVG - average 평균
--MAX-최댓값 MIN-최솟값 COUNT-행의수 SUM-합계 --NULL값은 제외합니다.
SELECT
    MAX(salary),
    MIN(salary),
    round(AVG(salary)),
    round(SUM(salary))
FROM
    employees;
--COUNT (*) -모든 행의 수
--count(example) --example행의 값의 숫자(NULL제외)
SELECT
    COUNT(*)              AS 사원수,
    COUNT(commission_pct) AS 상여수,
    MIN(hire_date)        AS oldman
FROM
    employees;
--문자열 날짜에도 적용이 가능함

SELECT
    MIN(commission_pct),
    MAX(commission_pct),
    AVG(commission_pct)
FROM
    employees
WHERE
    department_id = 80;
-- 그룹함수는 일반 column과 사용이 불가능합니다.

SELECT
    concat(concat(first_name, ' '),
           last_name),
    AVG(salary)
    OVER(),
    COUNT(*)
    OVER()
FROM
    employees;
--그룹함수 뒤에 over()를 붙이면 전체행 출력이되지만 속도가 느려지므로 사용하지 않는것이 좋다.


-- GROUP BY
--GROUP BY [그룹화 시킬 column명] >>>>> SELECT뒤에 해당 그룹화 시킨 column과 그룹함수를 같이 사용 할 수 있다.
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;
--상위그룹 안에 다른 하위그룹으로 묶고 싶으면 group by 뒤에 나열해주면됩니다.
SELECT
    department_id,
    job_id,
    trunc(AVG(salary)),
    COUNT(*)
    OVER()
FROM
    employees
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id DESC;

SELECT
    department_id,
    job_id,
    SUM(salary),
    COUNT(*)
FROM
    employees
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;

SELECT
    job_id,
    department_id,
    trunc(AVG(salary))
FROM
    employees
GROUP BY
    job_id,
    department_id;

SELECT
    department_id,
    SUM(salary),
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;-- 그룹함수와 같이 사용이 가능합니다.
--주의할 점
--GROUP BY에 지정되지않은 일반 column은 select절에서 사용이 불가능합니다.
SELECT
    department_id,
    job_id,
    SUM(salary),
    COUNT(*)
FROM
    employees 
--WHERE -- 그룹함수의 조건을 쓰는 구문은 HAVING으로 따로있다.
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;




--HAVING
--그룹함수의 조건을 적는 구문 HAVING

SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
    AVG(salary) > 8000
ORDER BY
    AVG(salary);

SELECT
    department_id,
    SUM(salary),
    COUNT(*)
FROM
    employees
WHERE
    department_id >= 50
GROUP BY
    department_id
HAVING
    SUM(salary) >= power(10, 5);

SELECT
    department_id,
    job_id,
    trunc(AVG(salary)),
    COUNT(*)
FROM
    employees
WHERE
    department_id NOT LIKE 70
GROUP BY
    department_id,
    job_id
HAVING
    AVG(salary) >= 5000;

SELECT
    department_id,
    trunc(AVG(salary)) AS 평균급여,
    SUM(salary)        AS 급여총합,
    COUNT(*)           AS 해당인원
FROM
    employees
WHERE
    department_id IS NOT NULL
    AND hire_date LIKE '05%'
GROUP BY
    department_id
HAVING
    AVG(salary) >= 10000
ORDER BY
    AVG(salary) DESC;

--ROLLUP/ CUBE / GROUPING
--ROLL UP 은 group by 로 그룹화 된 결과에 대하여 상세정보를 반환합니다. 
--주로 합계,평균을 반환해 줍니다. 
SELECT
    department_id,
    job_id,
    trunc(AVG(salary)),
    SUM(salary),
    COUNT(*)
FROM
    employees
GROUP BY
    ROLLUP(department_id,
           job_id)
ORDER BY
    department_id,
    job_id;


--CUBE
--서브 그룹에 대한 summary를 추출하는데 사용됩니다.
SELECT
    department_id,
    job_id,
    trunc(AVG(salary)),
    SUM(salary),
    COUNT(*)
FROM
    employees
GROUP BY
    CUBE(department_id,
         job_id)
ORDER BY
    department_id,
    job_id;


--GROUPING 함수
--rollup 과 cube사용시 같이 사용될수있는 함수
-- GROUP BY로 값이 나온경우 0을 출력하고
-- ROLLUP/CUBE로 값이 나온경우 1을 출력합니다.

SELECT
    department_id,
    job_id,
    decode(GROUPING(job_id),
           1,
           '소계',
           job_id),
    trunc(AVG(salary)),
    SUM(salary),
    COUNT(*),
    decode(GROUPING(department_id),
           1,
           '합계',
           department_id)
FROM
    employees
GROUP BY
    CUBE(department_id,
         job_id)
ORDER BY
    department_id,
    job_id ASC;