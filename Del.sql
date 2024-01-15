--DELETE 행을 제거한다.
--참조 무결성 제약조건에 위배되면 지워지지 않는다.

-- 테이블 끼리 관계를 가지고 있을때 중복되는 행은 지워지지않는다.
-- 삭제전에 반드시 SELECT로 확인하는 습관을 들여야합니다.
-- WHERE절로 반드시 범위를 추가해주어야 합니다.
-- WHERE절이 없다면 모든 값이 다 지워집니다.
-- WHERE절에는 Primary Key 값을 쓰는 것을 권장합니다.

DELETE FROM emps
where employee_id=104;

select *FROM emps;

DELETE FROM EMPS
where Department_ID=
(select DEPARTMENT_ID FROM departments where DepartMent_NAME='Shipping');


DELETE FROM EMPS
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM employees where FIRST_NAME='John' AND LAST_NAME='Russell');
rollback;

--DELETE절은 연관관계를 가지고 있다면 참조 무결성 제약에 위배되는경우 지워지지 않습니다.
SELECT * FROM departments;
SELECT * FROM employees where DEpartment_ID=10;
DELETE FROM departments
where DEPARTMENT_ID =20;--integrity constraint (HR.EMP_DEPT_FK) violated - child record found