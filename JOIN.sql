--JOIN
--관계형 데이터베이스를 다루는 이유
--ORACLE JOIN(오라클 DB에서만 사용함) // ANSI JOIN(공통된 모든 DB에서 사용함)
--ANSI JOIN 형태를 배우게 될 것이다.
--ANSI JOIN- 모든 데이터 베이스의 조인문법 표준
-- INNER JOIN
-- SELECT * FROM 붙일 테이블 1 INNER JOIN 붙일 테이블 2 ON 붙여줄테이블1.해당행이름 = 붙여줄테이블2.해당행이름
SELECT * FROM Course;
SELECT * FROM Member;
SELECT Course.NUM, Course.subject, Course.ID, Member.name FROM COURSE Inner Join Member on Course.id=member.id;
--붙을수 없는 데이터는 즉 null값은 출력되지 않음 
--table name. column name으로 조회할 범위 지정해주어야 함
SELECT c.num,c.subject,c.id,m.name FROM COURSE C INNER JOIN MEMBER M ON c.id=m.id; 
--USING 절 양측 테이블에 동일한 키 이름으로 연결할때 사용합니다.
SELECT * FROM COURSE C INNER JOIN MEMBER M using (id);

-- OUTER JOIN
-- SELECT * FROM 붙일 테이블 1 Left Outer JOIN 붙일 테이블 2 ON 붙여줄테이블1.해당행이름 = 붙여줄테이블2.해당행이름
--(outer)나 (Inner)은 생략이 가능합니다.
--Left outer 기준으로 왼쪽의 테이블은 전부다 나오고 연결할 값이 연결되어나온다. 붙을값이 없다면 NULL로 나오게된다.
SELECT * FROM COURSE C LEFT OUTER JOIN MEMBER M ON c.id = m.id;--주로 사용되는 join
SELECT c.num,c.subject,c.id,m.name from COurse c LEft outer join Member m ON c.id=m.id;
--RIGHT outer 기준으로 오른쪽 테이블은 전부다 나오고 왼쪽으로 붙일때 붙을값이 없으면 NULL로 나오게된다.
SELECT c.num,c.subject,c.id,m.name from COurse c RIGHT outer join Member m ON c.id=m.id;
--FULL OUTER 양쪽 모두다 붙여서 나오고 붙을값이 없으면 NULL로 나옴
SELECT c.num,c.subject,c.id,m.name from COurse c FULL outer join Member m ON c.id=m.id;
--CROSS JOIN
--SELECT *FROM COURSE C CROSS JOIN MEMBER M;
----------------------------------------------------------------------------------------------------------------------
SELECT * FROM employees;
SELECT * FROM DEPARTMENTS;

SELECT * FROM employees e left join departments d on e.department_id=d.department_id; -- null포함 출력
SELECT * FROM employees e  join departments d on e.department_id=d.department_id;-- null포함 안함
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
--전재조건- 상,하위를 나타내주는 키가 필요합니다.
--메뉴,직급,답글댓글 등등 상위하위 구조인 테이블에서 사용 가능하다.
SELECT CONCAT(CONCAT(e1.FIRST_NAME,' '),e1.LAST_NAME) AS NAME, e1.manager_id, e1.job_id

FROM EMPLOYEES E1 LEFT JOIN employees e2 on e1.manager_id=e2.employee_id

where e1.manager_id is not null
order by e1.manager_id;
--Oracle JOIN
SELECT * From Course c, Member M;-- CROSS JOIN [잘못된 조건식]

SELECT * FROM Course C, Member M
Where C.Id = m.id; -- ORACLE JOIN 구문- INNER JOIN

SELECT *
FROM course c , member m 
--where c.id=m.id(+); -- (+)붙은 것을 붙인다는 개념으로 Left outer jOin 이 일어났다.
where c.id(+)=m.id; -- RIGHT OUTER JOIN 이 일어 났다.
--ORACLE엔 FULL OUTER JOIN이 존재하지 않습니다.




-- CLOSE JOIN

