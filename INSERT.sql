--DML

--�������� ����, �߰�, ����ÿ� ����ϴ� ����

--A. INSERT �������� �߰�

--���̺� ���� Ȯ�� DESC [���̺� ��]

-- Insert INTO [���̺�(������ column)] values (column�� �߰��� ����,....) ;


-- INSERT������ SUBQUARY�� ����� �����մϴ�.


CREATE table empa as (select * FROM employees where 1=2);

SELECT* FROM EMPA;

Insert INto empa (select * FROM employees where job_ID like '%Man');

rollback;

rollback;

INSERT INTO emps (LAST_NAME,EMAIL,HIRE_DATE,Job_ID)
values((SELECT Last_NAME from employees where Manager_ID is null),
'ASKSKS',
SYSDATE,
null
);
rollback;
