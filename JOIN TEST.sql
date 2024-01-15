--Q1
SELECT
    e.employee_id,
    d.department_id
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id;

SELECT
    e.employee_id,
    d.department_id
FROM
    employees   e
    LEFT OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT
    e.employee_id,
    d.department_id
FROM
    employees   e
    RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT
    e.employee_id,
    d.department_id
FROM
    employees   e
    FULL OUTER JOIN departments d ON e.department_id = d.department_id;

--q2
SELECT
    concat(concat(e.first_name, ' '),
           e.last_name) AS name,
    d.department_id
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id
WHERE
    e.employee_id = 200;
--q3
SELECT
    concat(concat(e.first_name, ' '),
           e.last_name) AS name,
    j.job_id,
    j.job_title
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
ORDER BY
    name ASC;

--q4
SELECT
    *
FROM
    jobs        j1
    RIGHT OUTER JOIN job_history j2 ON j1.job_id = j2.job_id;

--q5
SELECT
    concat(concat(e.first_name, ' '),
           e.last_name) AS name,
    d.department_name
FROM
    employees   e
    LEFT JOIN departments d ON e.department_id = d.department_id
WHERE
    e.first_name LIKE 'Steven%'
    AND e.last_name LIKE '%King%';

--q6
SELECT
    salary
FROM
         employees
    CROSS JOIN departments;

--q7
SELECT
    e.employee_id,
    concat(concat(e.first_name, ' '),
           e.last_name) AS name,
    e.salary,
    d.department_name,
    l.street_address
FROM
    employees   e
    LEFT OUTER JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN locations   l ON d.location_id = l.location_id
WHERE
    job_id = 'SA_MAN';

--q8
SELECT
    *
FROM
    employees e
    LEFT OUTER JOIN jobs      j ON e.job_id = j.job_id
WHERE
    j.job_title IN ( 'Stock Manager', 'Stock Clerk' );

--q9
SELECT
    d.department_name
FROM
    departments d
    LEFT OUTER JOIN employees   e ON d.department_id = e.department_id
WHERE
    e.manager_id IS NULL;





--q10
SELECT
    concat(concat(e2.first_name, ' '),
           e2.last_name) AS name,
    concat(concat(e1.first_name, ' '),
           e1.last_name) AS manager_name
FROM
         employees e1
    JOIN employees e2 ON e1.employee_id = e2.manager_id;

--q11
SELECT
    concat(concat(e2.first_name, ' '),
           e2.last_name) AS employee_name,
    concat(concat(e1.first_name, ' '),
           e1.last_name) AS manager_name,
    e1.salary            AS manager_salary,
    e2.salary            AS employee_salary
FROM
    employees e1
    LEFT OUTER JOIN employees e2 ON e1.employee_id = e2.manager_id
WHERE
    e2.manager_id IS NOT NULL
ORDER BY
    e1.salary DESC;

--q12
SELECT
    concat(e1.first_name, ' ')
    || '>'
    || concat(e2.first_name, ' ')
    || '>'
    || concat(e3.first_name, ' ') AS grade
FROM
    employees e1
    LEFT JOIN employees e2 ON e1.employee_id = e2.manager_id
    LEFT JOIN employees e3 ON e2.employee_id = e3.manager_id
WHERE
    e2.manager_id IS NOT NULL
    AND e3.first_name = 'William'
    AND e3.last_name = 'Smith';