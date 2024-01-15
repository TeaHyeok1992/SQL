--BEFORE TRIGGER
--주로 회원정보 입력에 사용한다.
--*로 마스킹 처리할때 사용많이함
SELECT*FROM TBL_USER;

CREATE OR REPLACE TRIGGER TBL_USER_MASKING_TRG
    BEFORE INSERT --INSERT이전에 동작
    on TBL_USER
    FOR EACH ROW

DECLARE
BEGIN
    --INSERT되기전 자료를 얻어서 맨앞에 첫번째글자를 자르고 나머지를 마스킹처리하고 다시 저장
    :NEW.TU_NAME:= SUBSTR(:NEW.TU_NAME,1,1)||'****';
END;

INSERT INTO TBL_USER VALUES('aa1','dawdawdaw','dwww');
select*FROM TBL_USER;