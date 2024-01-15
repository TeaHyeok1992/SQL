--�׷� �Լ�
-- ����, ��踦 ����Ҷ� �����
-- AVG - average ���
--MAX-�ִ� MIN-�ּڰ� COUNT-���Ǽ� SUM-�հ� --NULL���� �����մϴ�.
SELECT
    MAX(salary),
    MIN(salary),
    round(AVG(salary)),
    round(SUM(salary))
FROM
    employees;
--COUNT (*) -��� ���� ��
--count(example) --example���� ���� ����(NULL����)
SELECT
    COUNT(*)              AS �����,
    COUNT(commission_pct) AS �󿩼�,
    MIN(hire_date)        AS oldman
FROM
    employees;
--���ڿ� ��¥���� ������ ������

SELECT
    MIN(commission_pct),
    MAX(commission_pct),
    AVG(commission_pct)
FROM
    employees
WHERE
    department_id = 80;
-- �׷��Լ��� �Ϲ� column�� ����� �Ұ����մϴ�.

SELECT
    concat(concat(first_name, ' '),
           last_name),
    AVG(salary)
    OVER(),
    COUNT(*)
    OVER()
FROM
    employees;
--�׷��Լ� �ڿ� over()�� ���̸� ��ü�� ����̵����� �ӵ��� �������Ƿ� ������� �ʴ°��� ����.


-- GROUP BY
--GROUP BY [�׷�ȭ ��ų column��] >>>>> SELECT�ڿ� �ش� �׷�ȭ ��Ų column�� �׷��Լ��� ���� ��� �� �� �ִ�.
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;
--�����׷� �ȿ� �ٸ� �����׷����� ���� ������ group by �ڿ� �������ָ�˴ϴ�.
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
    department_id;-- �׷��Լ��� ���� ����� �����մϴ�.
--������ ��
--GROUP BY�� ������������ �Ϲ� column�� select������ ����� �Ұ����մϴ�.
SELECT
    department_id,
    job_id,
    SUM(salary),
    COUNT(*)
FROM
    employees 
--WHERE -- �׷��Լ��� ������ ���� ������ HAVING���� �����ִ�.
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;




--HAVING
--�׷��Լ��� ������ ���� ���� HAVING

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
    trunc(AVG(salary)) AS ��ձ޿�,
    SUM(salary)        AS �޿�����,
    COUNT(*)           AS �ش��ο�
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
--ROLL UP �� group by �� �׷�ȭ �� ����� ���Ͽ� �������� ��ȯ�մϴ�. 
--�ַ� �հ�,����� ��ȯ�� �ݴϴ�. 
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
--���� �׷쿡 ���� summary�� �����ϴµ� ���˴ϴ�.
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


--GROUPING �Լ�
--rollup �� cube���� ���� ���ɼ��ִ� �Լ�
-- GROUP BY�� ���� ���°�� 0�� ����ϰ�
-- ROLLUP/CUBE�� ���� ���°�� 1�� ����մϴ�.

SELECT
    department_id,
    job_id,
    decode(GROUPING(job_id),
           1,
           '�Ұ�',
           job_id),
    trunc(AVG(salary)),
    SUM(salary),
    COUNT(*),
    decode(GROUPING(department_id),
           1,
           '�հ�',
           department_id)
FROM
    employees
GROUP BY
    CUBE(department_id,
         job_id)
ORDER BY
    department_id,
    job_id ASC;