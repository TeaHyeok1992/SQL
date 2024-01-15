--q1
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employees
        WHERE
            job_id = 'IT_PROG'
    );

--q2

SELECT
    *
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id
WHERE
    d.manager_id = 100;


--q3
SELECT
    *
FROM
    employees
WHERE
    manager_id > (
        SELECT
            manager_id
        FROM
            employees
        WHERE
            first_name = 'Pat'
    );

SELECT
    *
FROM
    employees
WHERE
    manager_id IN (
        SELECT
            manager_id
        FROM
            employees
        WHERE
            first_name = 'James'
    );


--q4

SELECT
    first_name,
    rr
FROM
    (
        SELECT
            first_name,
            ROWNUM AS rr
        FROM
            (
                SELECT
                    first_name
                FROM
                    employees
                ORDER BY
                    first_name DESC
            )
    )
WHERE
    rr BETWEEN 41 AND 50;


--q5
SELECT
    employee_id,
    first_name,
    phone_number,
    rrd
FROM
    (
        SELECT
            employee_id,
            first_name,
            phone_number,
            ROWNUM AS rrd
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    phone_number
                FROM
                    employees
                ORDER BY
                    hire_date ASC
            )
    )
WHERE
    rrd BETWEEN 31 AND 40;


--q6
SELECT
    e.employee_id,
    concat(e.first_name, e.last_name),
    d.department_id,
    d.department_name
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id
ORDER BY
    e.employee_id ASC;


--q7
SELECT
    e.employee_id,
    concat(e.first_name, e.last_name),
    e.department_id,
    (
        SELECT
            department_name
        FROM
            departments d
        WHERE
            e.department_id = d.department_id
    )
FROM
    employees e
ORDER BY
    e.employee_id ASC;


--q8
SELECT
    d.department_name,
    d.department_id,
    d.manager_id,
    d.location_id,
    l.street_address,
    l.postal_code,
    l.city
FROM
    departments d
    LEFT JOIN locations   l ON d.location_id = l.location_id
ORDER BY
    d.department_id ASC;


--q9
SELECT
    d.department_id,
    d.department_name,
    d.location_id,
    (
        SELECT
            street_address
        FROM
            locations l
        WHERE
            d.location_id = l.location_id
    ),
    (
        SELECT
            city
        FROM
            locations l
        WHERE
            d.location_id = l.location_id
    ),
    (
        SELECT
            postal_code
        FROM
            locations l
        WHERE
            d.location_id = l.location_id
    )
FROM
    departments d
ORDER BY
    d.department_id ASC;

--q10
SELECT
    l.location_id,
    l.street_address,
    l.city,
    l.country_id,
    c.country_name
FROM
    locations l
    LEFT JOIN countries c ON l.country_id = c.country_id
ORDER BY
    c.country_name ASC;

--q11
SELECT
    l.location_id,
    l.street_address,
    l.city,
    l.country_id,
    (
        SELECT
            country_name
        FROM
            countries c
        WHERE
            l.country_id = c.country_id
    ) cn
FROM
    locations l
ORDER BY
    cn ASC;


--q12
SELECT
    edd,
    name,
    pn,
    hd,
    di,
    dn,
    rn
FROM
    (
        SELECT
            edd,
            name,
            pn,
            hd,
            di,
            dn,
            ROWNUM AS rn
        FROM
            (
                SELECT
                    employee_id       AS edd,
                    concat(concat(first_name, ' '),
                           last_name) AS name,
                    phone_number      AS pn,
                    hire_date         AS hd,
                    d.department_id   AS di,
                    d.department_name AS dn
                FROM
                    employees   e
                    LEFT JOIN departments d ON e.department_id = d.department_id
                ORDER BY
                    e.hire_date ASC
            )
    )
WHERE
    rn BETWEEN 1 AND 10;

--q13
SELECT
    e.last_name,
    e.job_id,
    d.department_id,
    d.department_name
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    job_id = 'SA_MAN';

--q14
SELECT
    e.department_id,
    d.department_name,
    d.manager_id,
    COUNT(*) AS ct
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY
    e.department_id,
    d.department_name,
    d.manager_id
ORDER BY
    ct DESC;



--q15
SELECT
    d.*,
    l.street_address,
    l.postal_code,
    TRUNC(AVG(nvl(salary, 0)))
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN locations   l ON d.location_id = l.location_id
GROUP BY
    d.department_id,
    d.location_id,
    d.manager_id,
    d.department_name,
    l.postal_code,
    l.street_address;

--q16
SELECT
    d1  AS 부서번호,
    d2  AS 부서명,
    d3  AS 지역번호,
    d4  AS 매니저번호,
    l1  AS 주소,
    l2  AS 우편번호,
    at  AS 평균급여,
    rnn AS 순번
FROM
    (
        SELECT
            d1,
            d2,
            d3,
            d4,
            l1,
            l2,
            at,
            ROWNUM AS rnn
        FROM
            (
                SELECT
                    d.department_id            AS d1,
                    d.department_name          AS d2,
                    d.location_id              AS d3,
                    d.manager_id               AS d4,
                    l.street_address           AS l1,
                    l.postal_code              AS l2,
                    trunc(AVG(nvl(salary, 0))) AS at
                FROM
                    employees   e
                    LEFT JOIN departments d ON e.department_id = d.department_id
                    LEFT JOIN locations   l ON d.location_id = l.location_id
                GROUP BY
                    d.department_id,
                    d.location_id,
                    d.manager_id,
                    d.department_name,
                    l.postal_code,
                    l.street_address
                ORDER BY
                    d.department_id DESC
            )
    )
WHERE
    rnn BETWEEN 1 AND 20;