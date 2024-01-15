--Function
--함수는 SQL의 아주 유용한 특징입니다.
--데이터 계산 수행
--개별적인 데이터 항목 수정
--행의 그룹에 대해 결과조작
--데이터 타입이 수정될 수 있습니다.
--SELECT funtion_name()
--initcap('contrabase')첫 글자를 대문자로
--concat() 두 문자열을 연결합니다.
--lpad(a,b,c)b크기의 글자에 a의 좌측에 c로 입력해주겟다.
--rpad(a,b,c)lpad의 반대 
SELECT LAst_name, lower(last_name), initcap(First_name)from employees ;
SELECT concat(First_name ,Last_name)from employees;
SELECT 'aBcDEF'from dual;--dual은 가상의 테이블입니다.
SELECT lower('aBcDEf'),upper('aBcDEf'),initcap('aBcDEf')from dual;
SELECT FIRST_NAME, lower(FirST_Name), initcap(FirST_Name),upper(FirST_Name)from employees;
SELECT FIRST_NAME, instr(First_name, 'a') from employees;
SELECT FIrst_name, Length(First_name), concat(first_name , Last_name)AS FullNAMe from employees;
SELECT FIRST_NAME, Substr(FIRST_NAme, 3,3)from employees;
-- FIRst_name에서 3번쨰 문자부터 3개 자르겠다는 뜻입니다.
SELECT FIRST_NAME, substr(first_name,3)from employees;
SELECT FIRST_NAME, lpad(FIRST_NAME , 15, '@')from employees;
SELECT LAST_NAME, lpad(LAST_NAME, 11,'//')from employees;
SELECT FIRST_NAME , rpad(First_name, 15,'*')from employees;
SELECT LAST_NAME , rpad(LAST_NAME, 11,'★')from employees;
SELECT FIRST_NAME, trim(FIrst_name)from employees;
SELECT LAST_NAME, ltrim(LAST_NAME)from employees;
SELECT ltrim(' hello wolrd  '),trim(' hello wolrd  '),rtrim(' hello wolrd  ')from dual;
SELECT LTRIM('geworld ','ge')from dual;
SELECT REPLACE(FIRST_NAME,'A','b')from employees;
SELECT length(replace(replace('my dream is hello world','hello','헬로'),' ',''))from dual;
