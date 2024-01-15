--Inline View--FROM 절에 들어오는 서브쿼리
-- FROM절에는 Table이나 View(가상테이블) 형식이 올수 있다.

-- 가상 테이블을 생성후 다시 가상테이블을 통해 조회해서 출력해주는 경우 사용합니다.

-- 순위매기기 할떄 주로 사용합니다.

-- ROWNUM은 무조건 첫번쨰 행부터 조회가 가능합니다. (Between 11 and 20 이런거 안됨)

-- ROWNUM을 column화 시키면 중간값부터 조회가 가능합니다.

SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            (
                SELECT
                    *
                FROM
                    employees
            )
    );
--인라인뷰에서 만든 가상컬럼을 조회 할떄 사용합니다.
SELECT
    first_name,
    salary,
    rb
FROM
    (
        SELECT
            first_name,
            salary,
            ROWNUM AS rb
        FROM
            (
                SELECT
                    first_name,
                    salary
                FROM
                    employees
                ORDER BY
                    salary DESC
            )
    )
WHERE
    rb BETWEEN 11 AND 20;

SELECT
    first_name,
    salary,
    bb
FROM
    (
        SELECT
            first_name,
            salary,
            ROWNUM AS bb
        FROM
            (
                SELECT
                    first_name,
                    salary
                FROM
                    employees
                ORDER BY
                    salary ASC
            )
    )
WHERE
    bb BETWEEN 13 AND 27;

SELECT
    a.*
FROM
    (
        SELECT
            first_name || last_name                 AS name,
            to_char(salary + salary * nvl(commission_pct, 0),
                    'L999,999,999')                 AS salary,
            nvl(commission_pct, 0)                  AS commission_pct,
            to_char(hire_date, 'YYYY"년"MM"월"DD"일"') AS hire_date,
            trunc((sysdate - hire_date) / 365)      AS 근속년수
        FROM
            employees
        ORDER BY
            근속년수
    ) a
WHERE
    mod(근속년수, 5) = 0;