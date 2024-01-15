--데이터의 일시적 형변환

-- 기본타입
--문자 VARCHAR2
--숫자 NUMBER
--날짜 DATE

-- 자동 형변환

SELECT
    *
FROM
    employees
WHERE
    salary >= '10000';
--숫자와 문자를 비교할때 문자형 숫자일때만 자동형변환이 일어납니다.
SELECT
    hire_date
FROM
    employees
WHERE
    hire_date >= '05/01/01';
--포멧형식이 날짜나 숫자와 같다면 문자가 자동형변환이 일어납니다.

--강제 형변환 함수
--TO_CHAR(date,[])/ TO CHAR(NUMBER[])

SELECT
    to_char(sysdate, 'YYYY-MM-DD-HH-MI-SS')
FROM
    dual;

SELECT
    to_char(systimestamp, 'YYYY-MM-DD-HH')
FROM
    dual;

SELECT
    to_char(systimestamp, 'AM')
FROM
    dual;

SELECT
    to_char(sysdate, 'YY"년"-MM"월"-DD"일"-HH"시"-MI"분" AM')
FROM
    dual;

SELECT
    to_char(hire_date, 'YYYY/MM/DD')
FROM
    employees;

SELECT
    to_char(salary, '$999,999')
FROM
    employees;
--9의 갯수만큼 몇자리수 까지 나타내고
--앞에 $기호를 붙여주겟다.
SELECT
    to_char(salary, '$09,999,999.99')
FROM
    employees;

SELECT
    to_char(salary, 'L999,999,999')
FROM
    employees;

SELECT
    to_char(salary, '$0999999999999')
FROM
    employees;

SELECT
    concat(concat(first_name, ' '),
           last_name)                            AS name,
    to_char(salary * 1302.69, 'L999,999,999.99') AS "환율(1302.69/$)"
FROM
    employees
ORDER BY
    salary DESC;

--TO_NUMBER(char,[])
SELECT
    TO_NUMBER(salary, '99999')
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    '2000' + 2000
FROM
    dual;

SELECT
    TO_NUMBER('2000' + 2000)
FROM
    dual;--명시적 형 변환
SELECT
    TO_NUMBER('$5000', '$9999')
FROM
    dual;
--TO_DATE(char,[])
SELECT
    '2023 12 04'
FROM
    dual;

SELECT
    TO_DATE('20231204')
FROM
    dual;

SELECT
    sysdate - '2023-12-03'
FROM
    dual;
--[]는 적용될 포멧(기준값, 형태, 프레임 등등)
SELECT
    sysdate - TO_DATE('2023-12-03')
FROM
    dual;

SELECT
    TO_DATE('2023/12/04', 'YYYY/MM/DD')
FROM
    dual;

SELECT
    TO_DATE('2023년12월04일', 'YYYY"년"MM"월"DD"일"')
FROM
    dual;

SELECT
    TO_DATE(sysdate, 'YY-MM-DD')
FROM
    dual;--날짜 포멧문자가 아닌 문자는 쌍따옴표로 감싸주어야 합니다.


SELECT
    to_char(TO_DATE('20050102', 'YYYYMMDD'), 'YYYY"년"MM"월"DD"일"')
FROM
    dual;

SELECT
    substr('20050102', 1, 4)
    || '년'
    || substr('20050102', 5, 2)
    || '월'
    || substr('20050102', 7, 2)
    || '일'
FROM
    dual;

--숫자를 날짜로 형변환시
SELECT
    TO_DATE(to_char(120423),
            'MM/DD/YY')
FROM
    dual;
--to_date(to char(number,[]),[])

--날짜를 숫자로 형변환시
--to_number(to char(date,[]),[])