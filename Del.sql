--DELETE ���� �����Ѵ�.
--���� ���Ἲ �������ǿ� ����Ǹ� �������� �ʴ´�.

-- ���̺� ���� ���踦 ������ ������ �ߺ��Ǵ� ���� ���������ʴ´�.
-- �������� �ݵ�� SELECT�� Ȯ���ϴ� ������ �鿩���մϴ�.
-- WHERE���� �ݵ�� ������ �߰����־�� �մϴ�.
-- WHERE���� ���ٸ� ��� ���� �� �������ϴ�.
-- WHERE������ Primary Key ���� ���� ���� �����մϴ�.

DELETE FROM emps
where employee_id=104;

select *FROM emps;

DELETE FROM EMPS
where Department_ID=
(select DEPARTMENT_ID FROM departments where DepartMent_NAME='Shipping');


DELETE FROM EMPS
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM employees where FIRST_NAME='John' AND LAST_NAME='Russell');
rollback;

--DELETE���� �������踦 ������ �ִٸ� ���� ���Ἲ ���࿡ ����Ǵ°�� �������� �ʽ��ϴ�.
SELECT * FROM departments;
SELECT * FROM employees where DEpartment_ID=10;
DELETE FROM departments
where DEPARTMENT_ID =20;--integrity constraint (HR.EMP_DEPT_FK) violated - child record found