--UPDATE
--�ݵ�� WHERE�� �ٿ�����մϴ�.
-- update table set column=value, ..... where ����
--WHERE�� ���������� ��簪�� �� �ٲߴϴ�.

SELECT * FROM emps;

INSERT INTO emps(SELECT*FROM employees where job_ID='IT_PROG');
commit;--�ش� �����͸� �ݿ��ϰڴٴ� �Ҹ��Դϴ�. �ѹ� �̷�� ���� �ʽ��ϴ�.

UPDATE emps
set salary=SALARY *1.1 where employee_id=104;--104�� ������ �޿��� 10% �λ�
--WHERE�� ���� ������ �����ϸ� ��ü���̺� �� ���� �˴ϴ�.
--�ݵ�� SELECT�� Ȯ�κ��� �ϴ� ������ ���̵��� ����
select* FROM emps;
rollback;

--���� �� ������Ʈ

SELEct * FROM emps;

update emps set salary=1.3*salary , Commission_PCT=0.35, Manager_ID=110
where employee_id=104;
select*FROM emps;


--UPDATE + SUBQUARY

UPDATE EMPS
set (SALARY,FIRST_NAME,LAST_NAME)= (SELECT SALARY, FIRST_NAME,LAST_NAME from employees where EMPLOYEE_ID=114) where COMMISSION_PCT is null;

SELECT * FROM EMPS;
rollback;


UPDATE EMPS
set MANAGER_ID=(select MANAGER_ID from employees where employee_id=201) where Employee_ID =104;
select * FROM emps;
INSERT INTO EMPS
(select * FROM employees where JOB_ID='SA_MAN');

select * FROM EMPS;
UPDATE EMPS
set commission_pct=0.15 where JOB_ID='IT_PROG';

select* FROM EMPS;

UPDATE EMPS
SET salary=salary*1.05 where JOB_ID='IT_PROG';


SELECT * FROM EMPS;

Insert INTO EMPS
(select * FROM employees where JOB_ID='SA_MAN');

SELECT * FROM emps;

UPDATE EMPS
set commission_pct=0.15 where job_ID='IT_PROG';

select * FROM emps;

update emps
set salary = salary+salary*commission_pct;

select * FROM emps;

update emps

set commission_pct=0.2 where first_name='Diana';

rollback;

