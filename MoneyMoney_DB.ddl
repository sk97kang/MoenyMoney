-- ������ Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   ��ġ:        2020-05-29 17:21:33 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



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

INSERT INTO CATEGORIES VALUES (1, '�ĺ�', 1);
INSERT INTO CATEGORIES VALUES (2, '����/����', 1);
INSERT INTO CATEGORIES VALUES (3, '��ȭ��Ȱ', 1);
INSERT INTO CATEGORIES VALUES (4, '��Ʈ/������', 1);
INSERT INTO CATEGORIES VALUES (5, '�м�/�̿�', 1);
INSERT INTO CATEGORIES VALUES (6, '��Ȱ��ǰ', 1);
INSERT INTO CATEGORIES VALUES (7, '�ְ�/���', 1);
INSERT INTO CATEGORIES VALUES (8, '�ǰ�', 1);
INSERT INTO CATEGORIES VALUES (9, '����', 1);
INSERT INTO CATEGORIES VALUES (10, '������/ȸ��', 1);
INSERT INTO CATEGORIES VALUES (11, '�θ��', 1);
INSERT INTO CATEGORIES VALUES (12, '��Ÿ', 1);
INSERT INTO CATEGORIES VALUES (13, '����', 0);
INSERT INTO CATEGORIES VALUES (14, '�μ���', 0);
INSERT INTO CATEGORIES VALUES (15, '�뵷', 0);
INSERT INTO CATEGORIES VALUES (16, '��', 0);
INSERT INTO CATEGORIES VALUES (17, '��������', 0);
INSERT INTO CATEGORIES VALUES (18, '��Ÿ', 0);