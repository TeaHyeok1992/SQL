CREATE TABLE depts
    AS
        SELECT
            *
        FROM
            departments;

SELECT
    *
FROM
    depts;

INSERT INTO depts VALUES (
    280,
    'Development',
    NULL,
    1800
);

INSERT INTO depts VALUES (
    290,
    'Financial_Management',
    NULL,
    1800
);

INSERT INTO depts VALUES (
    300,
    'Finance',
    301,
    1800
);

INSERT INTO depts VALUES (
    310,
    'Infiltrated',
    302,
    1800
);

INSERT INTO depts VALUES (
    320,
    'Prostcured',
    303,
    1700
);

SELECT
    *
FROM
    depts;

UPDATE depts
SET
    department_name = 'IT_BANK'
WHERE
    department_name = 'IT Support';

UPDATE depts
SET
    manager_id = 301
WHERE
    department_id = 290;

UPDATE depts
SET
    department_name = 'IT_HELP',
    manager_id = 303,
    location_id = 1800
WHERE
    department_name = 'IT Helpdesk';

DELETE FROM depts
WHERE
    department_name = 'Prostcured';

DELETE FROM depts
WHERE
    depts.department_name = 'NOC';

SELECT
    *
FROM
    depts;

UPDATE depts
SET
    manager_id = 301
WHERE
    depts.department_id >= 290;

DELETE FROM depts
WHERE
    department_id >= 200;

SELECT
    *
FROM
    depts;

UPDATE depts
SET
    manager_id = 100
WHERE
    manager_id IS NOT NULL;

SELECT
    *
FROM
    depts;

MERGE INTO depts d1
USING (
    SELECT
        *
    FROM
        departments
    WHERE
        department_id <= 200
) d2 ON ( d1.department_id = d2.department_id )
WHEN MATCHED THEN UPDATE
SET d1.department_name = d2.department_name,
    d1.manager_id = d2.manager_id,
    d1.location_id = d2.location_id
WHEN NOT MATCHED THEN
INSERT (
    department_ID,
    department_name,
    manager_id,
    location_id )
VALUES
    (   d2.department_ID,
        d2.department_name,
      d2.manager_id,
      d2.location_id );

SELECT
    *
FROM
    depts;

DROP TABLE depts;

CREATE TABLE jobs_it
    AS
        (
            SELECT
                *
            FROM
                jobs
            WHERE
                min_salary >= 6000
        );

INSERT INTO jobs_it VALUES (
    'IT_DEV',
    '아이티개발팀',
    6000,
    20000
);

INSERT INTO jobs_it VALUES (
    'NET_DEV',
    '네트워크개발팀',
    5000,
    20000
);

INSERT INTO jobs_it VALUES (
    'DEC_DEV',
    '보안개발팀',
    6000,
    19000
);

SELECT
    *
FROM
    jobs_it;

MERGE INTO jobs_it j1
USING (
    SELECT
        *
    FROM
        jobs
    WHERE
        min_salary > 0
) j2 ON ( j1.job_id = j2.job_id )
WHEN MATCHED THEN UPDATE
SET j1.min_salary = j2.min_salary,
    j1.max_salary = j2.max_salary
WHEN NOT MATCHED THEN
INSERT (
    job_title,
    job_id,
    min_salary,
    max_salary )
VALUES
    ( j2.job_title,
      j2.job_id,
      j2.min_salary,
      j2.max_salary );

SELECT
    *
FROM
    jobs_it;

DROP TABLE jobs_it;