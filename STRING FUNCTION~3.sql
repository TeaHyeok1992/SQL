--Function
--�Լ��� SQL�� ���� ������ Ư¡�Դϴ�.
--������ ��� ����
--�������� ������ �׸� ����
--���� �׷쿡 ���� �������
--������ Ÿ���� ������ �� �ֽ��ϴ�.
--SELECT funtion_name()
--initcap('contrabase')ù ���ڸ� �빮�ڷ�
--concat() �� ���ڿ��� �����մϴ�.
--lpad(a,b,c)bũ���� ���ڿ� a�� ������ c�� �Է����ְٴ�.
--rpad(a,b,c)lpad�� �ݴ� 
SELECT LAst_name, lower(last_name), initcap(First_name)from employees ;
SELECT concat(First_name ,Last_name)from employees;
SELECT 'aBcDEF'from dual;--dual�� ������ ���̺��Դϴ�.
SELECT lower('aBcDEf'),upper('aBcDEf'),initcap('aBcDEf')from dual;
SELECT FIRST_NAME, lower(FirST_Name), initcap(FirST_Name),upper(FirST_Name)from employees;
SELECT FIRST_NAME, instr(First_name, 'a') from employees;
SELECT FIrst_name, Length(First_name), concat(first_name , Last_name)AS FullNAMe from employees;
SELECT FIRST_NAME, Substr(FIRST_NAme, 3,3)from employees;
-- FIRst_name���� 3���� ���ں��� 3�� �ڸ��ڴٴ� ���Դϴ�.
SELECT FIRST_NAME, substr(first_name,3)from employees;
SELECT FIRST_NAME, lpad(FIRST_NAME , 15, '@')from employees;
SELECT LAST_NAME, lpad(LAST_NAME, 11,'//')from employees;
SELECT FIRST_NAME , rpad(First_name, 15,'*')from employees;
SELECT LAST_NAME , rpad(LAST_NAME, 11,'��')from employees;
SELECT FIRST_NAME, trim(FIrst_name)from employees;
SELECT LAST_NAME, ltrim(LAST_NAME)from employees;
SELECT ltrim(' hello wolrd  '),trim(' hello wolrd  '),rtrim(' hello wolrd  ')from dual;
SELECT LTRIM('geworld ','ge')from dual;
SELECT REPLACE(FIRST_NAME,'A','b')from employees;
SELECT length(replace(replace('my dream is hello world','hello','���'),' ',''))from dual;
