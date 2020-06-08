-- 생성자 Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   위치:        2020-05-29 17:21:33 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLE account (
    account_no    VARCHAR2(20) NOT NULL,
    user_id       VARCHAR2(20) NOT NULL,
    account_bal   NUMBER(11),
    bank_name     VARCHAR2(20)
);

ALTER TABLE account ADD CONSTRAINT account_pk PRIMARY KEY ( account_no );

CREATE TABLE categories (
    category_id     NUMBER(5) NOT NULL,
    category_name   VARCHAR2(20)
);

ALTER TABLE categories ADD CONSTRAINT categories_pk PRIMARY KEY ( category_id );

CREATE TABLE transaction (
    account_no     VARCHAR2(20) NOT NULL,
    in_out         CHAR(1) NOT NULL,
    use_date       DATE,
    category_id    NUMBER(5) NOT NULL,
    use_amount     NUMBER(11),
    use_contents   VARCHAR2(50)
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( account_no );

CREATE TABLE user_info (
    user_id   VARCHAR2(20) NOT NULL,
    user_pw   VARCHAR2(20) NOT NULL
);

CREATE INDEX user_info_user_id_un ON
    user_info (
        user_id
    ASC );

CREATE INDEX user_info_user_pw_un ON
    user_info (
        user_pw
    ASC );

ALTER TABLE user_info ADD CONSTRAINT user_info_user_id_pk PRIMARY KEY ( user_id );

ALTER TABLE account
    ADD CONSTRAINT account_user_id_fk FOREIGN KEY ( user_id )
        REFERENCES user_info ( user_id );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_no_fk FOREIGN KEY ( account_no )
        REFERENCES account ( account_no );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_categories_fk FOREIGN KEY ( category_id )
        REFERENCES categories ( category_id );

create sequence transaction_no_seq
    start with 1
    increment by 1
    nocache
    nocycle;

INSERT INTO CATEGORIES VALUES (1, '식비', 1);
INSERT INTO CATEGORIES VALUES (2, '교통/차량', 1);
INSERT INTO CATEGORIES VALUES (3, '문화생활', 1);
INSERT INTO CATEGORIES VALUES (4, '마트/편의점', 1);
INSERT INTO CATEGORIES VALUES (5, '패션/미용', 1);
INSERT INTO CATEGORIES VALUES (6, '생활용품', 1);
INSERT INTO CATEGORIES VALUES (7, '주거/통신', 1);
INSERT INTO CATEGORIES VALUES (8, '건강', 1);
INSERT INTO CATEGORIES VALUES (9, '교육', 1);
INSERT INTO CATEGORIES VALUES (10, '경조사/회비', 1);
INSERT INTO CATEGORIES VALUES (11, '부모님', 1);
INSERT INTO CATEGORIES VALUES (12, '기타', 1);
INSERT INTO CATEGORIES VALUES (13, '월급', 0);
INSERT INTO CATEGORIES VALUES (14, '부수입', 0);
INSERT INTO CATEGORIES VALUES (15, '용돈', 0);
INSERT INTO CATEGORIES VALUES (16, '상여', 0);
INSERT INTO CATEGORIES VALUES (17, '금융수익', 0);
INSERT INTO CATEGORIES VALUES (18, '기타', 0);