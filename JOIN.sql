--JOIN
--������ �����ͺ��̽��� �ٷ�� ����
--ORACLE JOIN(����Ŭ DB������ �����) // ANSI JOIN(����� ��� DB���� �����)
--ANSI JOIN ���¸� ���� �� ���̴�.
--ANSI JOIN- ��� ������ ���̽��� ���ι��� ǥ��
-- INNER JOIN
-- SELECT * FROM ���� ���̺� 1 INNER JOIN ���� ���̺� 2 ON �ٿ������̺�1.�ش����̸� = �ٿ������̺�2.�ش����̸�
SELECT * FROM Course;
SELECT * FROM Member;
SELECT Course.NUM, Course.subject, Course.ID, Member.name FROM COURSE Inner Join Member on Course.id=member.id;
--������ ���� �����ʹ� �� null���� ��µ��� ���� 
--table name. column name���� ��ȸ�� ���� �������־�� ��
SELECT c.num,c.subject,c.id,m.name FROM COURSE C INNER JOIN MEMBER M ON c.id=m.id; 
--USING �� ���� ���̺� ������ Ű �̸����� �����Ҷ� ����մϴ�.
SELECT * FROM COURSE C INNER JOIN MEMBER M using (id);

-- OUTER JOIN
-- SELECT * FROM ���� ���̺� 1 Left Outer JOIN ���� ���̺� 2 ON �ٿ������̺�1.�ش����̸� = �ٿ������̺�2.�ش����̸�
--(outer)�� (Inner)�� ������ �����մϴ�.
--Left outer �������� ������ ���̺��� ���δ� ������ ������ ���� ����Ǿ�´�. �������� ���ٸ� NULL�� �����Եȴ�.
SELECT * FROM COURSE C LEFT OUTER JOIN MEMBER M ON c.id = m.id;--�ַ� ���Ǵ� join
SELECT c.num,c.subject,c.id,m.name from COurse c LEft outer join Member m ON c.id=m.id;
--RIGHT outer �������� ������ ���̺��� ���δ� ������ �������� ���϶� �������� ������ NULL�� �����Եȴ�.
SELECT c.num,c.subject,c.id,m.name from COurse c RIGHT outer join Member m ON c.id=m.id;
--FULL OUTER ���� ��δ� �ٿ��� ������ �������� ������ NULL�� ����
SELECT c.num,c.subject,c.id,m.name from COurse c FULL outer join Member m ON c.id=m.id;
--CROSS JOIN
--SELECT *FROM COURSE C CROSS JOIN MEMBER M;
----------------------------------------------------------------------------------------------------------------------
SELECT * FROM employees;
SELECT * FROM DEPARTMENTS;

SELECT * FROM employees e left join departments d on e.department_id=d.department_id; -- null���� ���
SELECT * FROM employees e  join departments d on e.department_id=d.department_id;-- null���� ����
SELECT e.employee_id,e.first_name, d.department_id , d.department_name
FROM employees e left join departments d on e.department_id=d.department_id;

SELECT CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME)AS name,
e.department_id,e.employee_id,d.department_name,r.region_name,l.street_address,c.country_name
FROM employees e 
left join departments d on e.department_id=d.department_id
left join locations l on d.location_id=l.location_id
left join Countries c on c.country_id=l.country_id
left join Regions r on r.region_ID=c.Region_ID
where e.employee_id>=200;
-- SELF JOIN
--��������- ��,������ ��Ÿ���ִ� Ű�� �ʿ��մϴ�.
--�޴�,����,��۴�� ��� �������� ������ ���̺��� ��� �����ϴ�.
SELECT CONCAT(CONCAT(e1.FIRST_NAME,' '),e1.LAST_NAME) AS NAME, e1.manager_id, e1.job_id

FROM EMPLOYEES E1 LEFT JOIN employees e2 on e1.manager_id=e2.employee_id

where e1.manager_id is not null
order by e1.manager_id;
--Oracle JOIN
SELECT * From Course c, Member M;-- CROSS JOIN [�߸��� ���ǽ�]

SELECT * FROM Course C, Member M
Where C.Id = m.id; -- ORACLE JOIN ����- INNER JOIN

SELECT *
FROM course c , member m 
--where c.id=m.id(+); -- (+)���� ���� ���δٴ� �������� Left outer jOin �� �Ͼ��.
where c.id(+)=m.id; -- RIGHT OUTER JOIN �� �Ͼ� ����.
--ORACLE�� FULL OUTER JOIN�� �������� �ʽ��ϴ�.




-- CLOSE JOIN

