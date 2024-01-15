--�����̶�
--SQL������ �����ϱ� ���� �Ǹ��Դϴ�.

--����� ������ DBA ������ �����մϴ�.

--����� ���� ��ȸ
select * FROM all_users;

--����� ���� ���� ��ȸ
SELECT * FROM user_sys_privs;

--���ο� ���� ����
Create USER User01 IDENTIFIED by q1w2e3r4t5;--������ ������ �α��ε� �Ұ����մϴ�.
--�ش� ������ ������ �ο�
Grant Create Session, Create View, Create table, CREATE Sequence, Create PROCEDURE to User01;
--create Session : ���ӱ��Ѻο�
--create table �ο��ؼ� �����ϸ� no privileges on tablespace��� �ߴµ� tablespace�� ������ ���־�� �մϴ�.

--Table Space ����
Alter user User01
    Default TABLESPACE--�⺻���̺� �����̽��� Users�� ����
    USERS
    QUOTA UNLIMITED--Users �� ���� ������ �Ҵ� ������ �ο��Ѵ�.
    On USERS;
    
--���� ����
--DROP user [������];


--ROLE�� �̿��� ���� �ο�

--Oracle �� �⺻ ROLE���� Connect , Resource, DBA�� �ֽ��ϴ�.

--connect : ���� ���Ѻο�

--Resouce: �ۼ� ���� �ο�

--DBA : ����Ŭ �ý��� ������ ���� �ο�
Create User User01 Identified by q1w2e3r4t5;

GRANT CONNECT, RESOURCE to User01;

ALter User User01
    Default tablespace users
    QUOTA UNLIMITED on users;
    
DROP USER User01;

