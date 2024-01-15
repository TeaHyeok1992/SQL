--�������� �Ͻ��� ����ȯ

-- �⺻Ÿ��
--���� VARCHAR2
--���� NUMBER
--��¥ DATE

-- �ڵ� ����ȯ

SELECT
    *
FROM
    employees
WHERE
    salary >= '10000';
--���ڿ� ���ڸ� ���Ҷ� ������ �����϶��� �ڵ�����ȯ�� �Ͼ�ϴ�.
SELECT
    hire_date
FROM
    employees
WHERE
    hire_date >= '05/01/01';
--���������� ��¥�� ���ڿ� ���ٸ� ���ڰ� �ڵ�����ȯ�� �Ͼ�ϴ�.

--���� ����ȯ �Լ�
--TO_CHAR(date,[])/ TO CHAR(NUMBER[])

SELECT
    to_char(sysdate, 'YYYY-MM-DD-HH-MI-SS')
FROM
    dual;

SELECT
    to_char(systimestamp, 'YYYY-MM-DD-HH')
FROM
    dual;

SELECT
    to_char(systimestamp, 'AM')
FROM
    dual;

SELECT
    to_char(sysdate, 'YY"��"-MM"��"-DD"��"-HH"��"-MI"��" AM')
FROM
    dual;

SELECT
    to_char(hire_date, 'YYYY/MM/DD')
FROM
    employees;

SELECT
    to_char(salary, '$999,999')
FROM
    employees;
--9�� ������ŭ ���ڸ��� ���� ��Ÿ����
--�տ� $��ȣ�� �ٿ��ְٴ�.
SELECT
    to_char(salary, '$09,999,999.99')
FROM
    employees;

SELECT
    to_char(salary, 'L999,999,999')
FROM
    employees;

SELECT
    to_char(salary, '$0999999999999')
FROM
    employees;

SELECT
    concat(concat(first_name, ' '),
           last_name)                            AS name,
    to_char(salary * 1302.69, 'L999,999,999.99') AS "ȯ��(1302.69/$)"
FROM
    employees
ORDER BY
    salary DESC;

--TO_NUMBER(char,[])
SELECT
    TO_NUMBER(salary, '99999')
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    '2000' + 2000
FROM
    dual;

SELECT
    TO_NUMBER('2000' + 2000)
FROM
    dual;--����� �� ��ȯ
SELECT
    TO_NUMBER('$5000', '$9999')
FROM
    dual;
--TO_DATE(char,[])
SELECT
    '2023 12 04'
FROM
    dual;

SELECT
    TO_DATE('20231204')
FROM
    dual;

SELECT
    sysdate - '2023-12-03'
FROM
    dual;
--[]�� ����� ����(���ذ�, ����, ������ ���)
SELECT
    sysdate - TO_DATE('2023-12-03')
FROM
    dual;

SELECT
    TO_DATE('2023/12/04', 'YYYY/MM/DD')
FROM
    dual;

SELECT
    TO_DATE('2023��12��04��', 'YYYY"��"MM"��"DD"��"')
FROM
    dual;

SELECT
    TO_DATE(sysdate, 'YY-MM-DD')
FROM
    dual;--��¥ ���乮�ڰ� �ƴ� ���ڴ� �ֵ���ǥ�� �����־�� �մϴ�.


SELECT
    to_char(TO_DATE('20050102', 'YYYYMMDD'), 'YYYY"��"MM"��"DD"��"')
FROM
    dual;

SELECT
    substr('20050102', 1, 4)
    || '��'
    || substr('20050102', 5, 2)
    || '��'
    || substr('20050102', 7, 2)
    || '��'
FROM
    dual;

--���ڸ� ��¥�� ����ȯ��
SELECT
    TO_DATE(to_char(120423),
            'MM/DD/YY')
FROM
    dual;
--to_date(to char(number,[]),[])

--��¥�� ���ڷ� ����ȯ��
--to_number(to char(date,[]),[])