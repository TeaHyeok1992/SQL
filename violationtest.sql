CREATE TABLE members (
    m_name   VARCHAR2(30) NOT NULL,
    m_num    NUMBER(10),
    reg_date DATE NOT NULL,
    gender   VARCHAR2(10),
    loca     NUMBER(10),
    CONSTRAINT mem_memnum_pk PRIMARY KEY ( m_num ),
    CONSTRAINT mem_regdate_uk UNIQUE ( reg_date ),
    CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY ( loca )
        REFERENCES locations ( location_id )
);

INSERT INTO members VALUES (
    'AAA',
    1,
    '2018-07-01',
    'M',
    1800
);

INSERT INTO members VALUES (
    'BBB',
    2,
    '2018-07-02',
    'F',
    1900
);

INSERT INTO members VALUES (
    'CCC',
    3,
    '2018-07-03',
    'M',
    2000
);

INSERT INTO members VALUES (
    'DDD',
    4,
    sysdate,
    'M',
    2000
);

COMMIT;

SELECT
    m.m_name,
    m.m_num,
    l.street_address,
    l.location_id
FROM
         members m
    JOIN locations l ON m.loca = l.location_id
ORDER BY
    m.m_num ASC;