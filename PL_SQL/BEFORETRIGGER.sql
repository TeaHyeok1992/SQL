--BEFORE TRIGGER
--�ַ� ȸ������ �Է¿� ����Ѵ�.
--*�� ����ŷ ó���Ҷ� ��븹����
SELECT*FROM TBL_USER;

CREATE OR REPLACE TRIGGER TBL_USER_MASKING_TRG
    BEFORE INSERT --INSERT������ ����
    on TBL_USER
    FOR EACH ROW

DECLARE
BEGIN
    --INSERT�Ǳ��� �ڷḦ �� �Ǿտ� ù��°���ڸ� �ڸ��� �������� ����ŷó���ϰ� �ٽ� ����
    :NEW.TU_NAME:= SUBSTR(:NEW.TU_NAME,1,1)||'****';
END;

INSERT INTO TBL_USER VALUES('aa1','dawdawdaw','dwww');
select*FROM TBL_USER;