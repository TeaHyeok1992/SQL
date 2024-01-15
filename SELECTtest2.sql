--q1

SELECT
    concat(first_name, last_name) AS name,
    replace(hire_date, '/', '')
FROM
    employees
ORDER BY
    name ASC;

SELECT
    first_name
    || ' '
    || last_name AS name,
    concat('(02)',
           substr(phone_number, 5, 8))
FROM
    employees;

SELECT
    rpad(substr(first_name, 1, 3),
         length(first_name),
         '*')             AS name,
    lpad(salary, 10, '*') AS salary
FROM
    employees
WHERE
    lower(job_id) = 'it_prog';