--INDEX
--����Ŭ �����ͺ��̽� ���̺��� ���ϴ� Column�� �ٷ� ã�ư� �� �ֵ��� ������� �����ͱ����Դϴ�.
--��ȸ�� ������ �մϴ�.
-- �ڵ� �ε����� Primary Key�� Unique Constraint�� ���� �ڵ������� �����Ǵ� �ε����Դϴ�.-- ���� �ε��� ��� �մϴ�.--UNIQUE�÷����� ���
    
-- ���� �ε����� Create Index �������� ����� �ε����Դϴ�.- ����� �ε���
CREATE INDEX EMPS_IT_FN_IDX
    ON EMPS_IT(FIRST_NAME);
-- �����Ͱ��� ������ �������ΰ��, ������ ������� �ε��� ������� �ʽ��ϴ�.
-- ���̺��� ������� �ε��� ������� �ʽ��ϴ�.

CREATE TABLE EMPS_IT AS (SELECT * FROM employees);

SELECT * FROM emps_it where first_NAME ='Nancy';-- INDEX����Ͽ� RANGE��ĵ�� ���� ���� �� ������ ã�� �� �ִ�.

desc emps_IT;

--�ε����� ����
DROP INDEX EMPS_IT_FN_IDX;


--�ε����� ���� �÷��� ��� ������ ���� �ֽ��ϴ�.
CREATE INDEX EMPS_IT_FN_LN_IDX
    on EMPS_IT(FIRST_NAME,LAST_NAME);
    
SELECT * FROM EMPS_IT where FIRST_NAME='Nancy' AND LAST_NAME='Greenberg'; 
SELECT * FROM EMPS_IT WHERE LAST_NAME like '%berg%';


-- ����Ŭ�� ��Ʈ��

SELECT /*+ INDEX_DESC(E EMPS_IT_ID_PK)*/ -- ��Ʈ ����
       --�ε��� �������� ��ȸ�� �����϶�� ��Ʈ�� �־���
       ROWNUM AS RN,
       E.*
FROM EMPS_IT E
ORDER BY EMPLOYEE_ID desc;-- SUBQUARY����

    





