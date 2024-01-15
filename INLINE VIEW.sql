--Inline View--FROM ���� ������ ��������
-- FROM������ Table�̳� View(�������̺�) ������ �ü� �ִ�.

-- ���� ���̺��� ������ �ٽ� �������̺��� ���� ��ȸ�ؼ� ������ִ� ��� ����մϴ�.

-- �����ű�� �ҋ� �ַ� ����մϴ�.

-- ROWNUM�� ������ ù���� ����� ��ȸ�� �����մϴ�. (Between 11 and 20 �̷��� �ȵ�)

-- ROWNUM�� columnȭ ��Ű�� �߰������� ��ȸ�� �����մϴ�.

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
--�ζ��κ信�� ���� �����÷��� ��ȸ �ҋ� ����մϴ�.
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
            to_char(hire_date, 'YYYY"��"MM"��"DD"��"') AS hire_date,
            trunc((sysdate - hire_date) / 365)      AS �ټӳ��
        FROM
            employees
        ORDER BY
            �ټӳ��
    ) a
WHERE
    mod(�ټӳ��, 5) = 0;