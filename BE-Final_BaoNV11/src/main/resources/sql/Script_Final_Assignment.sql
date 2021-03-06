-- CREATE TABLE
CREATE TABLE users (
    user_no      NUMBER NOT NULL,
    name        NVARCHAR2(50) NOT NULL,
    username    NVARCHAR2(20) NOT NULL,
    password     NVARCHAR2(255) NOT NULL,
    created_by    NVARCHAR2(20) NOT NULL,
    created_on   TIMESTAMP(3) NOT NULL,
    modified_by   NVARCHAR2(20) NOT NULL,
    modified_on   TIMESTAMP(3) NOT NULL,
    CONSTRAINT members_fk PRIMARY KEY ( user_no )
);

CREATE TABLE DOCUMENT (
    DOCUMENT_NO      NUMBER NOT NULL,
    FILE_NAME    NVARCHAR2(255) NOT NULL,
    url    NVARCHAR2(255),
    created_by    NVARCHAR2(20) NOT NULL,
    created_on   TIMESTAMP(3) NOT NULL,
    modified_by   NVARCHAR2(20) NOT NULL,
    modified_on   TIMESTAMP(3) NOT NULL,
    CONSTRAINT document_fk PRIMARY KEY ( DOCUMENT_NO )
);

CREATE TABLE USER_DOCUMENT (
    user_document_no      NUMBER NOT NULL,
    user_no      NUMBER NOT NULL,
    document_no      NUMBER NOT NULL,
    PERMISSION_NAME    NVARCHAR2(20) NOT NULL,
    created_by    NVARCHAR2(20) NOT NULL,
    created_on   TIMESTAMP(3) NOT NULL,
    modified_by   NVARCHAR2(20) NOT NULL,
    modified_on   TIMESTAMP(3) NOT NULL,
    CONSTRAINT users_document_pk PRIMARY KEY ( user_document_no ),
    CONSTRAINT users_fk FOREIGN KEY (user_no) REFERENCES users(user_no),
    CONSTRAINT documents_fk FOREIGN KEY (document_no) REFERENCES DOCUMENT(document_no)
);

CREATE SEQUENCE  "SOIBAC1001"."DOCUMENT_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE SEQUENCE  "SOIBAC1001"."USERS_NO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE SEQUENCE  "SOIBAC1001"."USER_DOCUMENT_NO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE SEQUENCE  "SOIBAC1001"."ROLE_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE SEQUENCE  "SOIBAC1001"."USER_ROLE_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

-- INSERT DATA
-- USERS
INSERT INTO SOIBAC1001.USERS (USER_NO, USERNAME, PASSWORD, CREATED_ON, CREATED_BY, MODIFIED_BY, MODIFIED_ON, EMAIL, NAME) VALUES (2, 'thang', '123', TO_TIMESTAMP('2020-08-02 19:43:02.441', 'YYYY-MM-DD HH24:MI:SS.FF3'), 'tien', 'tien', TO_TIMESTAMP('2020-08-02 19:43:02.441', 'YYYY-MM-DD HH24:MI:SS.FF3'), '123@gmail.com', 'thang');
INSERT INTO SOIBAC1001.USERS (USER_NO, USERNAME, PASSWORD, CREATED_ON, CREATED_BY, MODIFIED_BY, MODIFIED_ON, EMAIL, NAME) VALUES (1, 'bao', '123', TO_TIMESTAMP('2020-08-02 18:34:24.705', 'YYYY-MM-DD HH24:MI:SS.FF3'), null, null, TO_TIMESTAMP('2020-08-02 18:34:24.705', 'YYYY-MM-DD HH24:MI:SS.FF3'), 'abc@gmail.com', 'bao');

-- ROLES
INSERT INTO SOIBAC1001.ROLE (ROLE_NO, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON, DESCRIPTION, ROLE_NAME) VALUES (1, 'bao', TO_TIMESTAMP('2020-07-30 07:27:13.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), 'bao', TO_TIMESTAMP('2020-07-30 07:27:13.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), null, 'ROLE_ADMIN');
INSERT INTO SOIBAC1001.ROLE (ROLE_NO, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON, DESCRIPTION, ROLE_NAME) VALUES (2, 'bao', TO_TIMESTAMP('2020-07-30 07:30:35.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), 'bao', TO_TIMESTAMP('2020-07-30 07:30:35.000000', 'YYYY-MM-DD HH24:MI:SS.FF6'), null, 'ROLE_USER');

-- USER ROLE
INSERT INTO SOIBAC1001.USER_ROLE (USER_ROLE_NO, USER_NO, ROLE_NO, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON) VALUES (6, 21, 2, 'bao', TO_TIMESTAMP('2020-08-03 02:41:36.000', 'YYYY-MM-DD HH24:MI:SS.FF3'), 'bao', TO_TIMESTAMP('2020-08-03 02:41:36.000', 'YYYY-MM-DD HH24:MI:SS.FF3'));
INSERT INTO SOIBAC1001.USER_ROLE (USER_ROLE_NO, USER_NO, ROLE_NO, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON) VALUES (7, 24, 2, 'bao', TO_TIMESTAMP('2020-08-03 02:41:07.000', 'YYYY-MM-DD HH24:MI:SS.FF3'), 'bao', TO_TIMESTAMP('2020-08-03 02:41:07.000', 'YYYY-MM-DD HH24:MI:SS.FF3'));

-- DOCUMENT
INSERT INTO SOIBAC1001.DOCUMENT (DOCUMENT_NO, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON, FILE_NAME, URL) VALUES (1, 'bao', TO_TIMESTAMP('2020-08-02 21:34:45.962000', 'YYYY-MM-DD HH24:MI:SS.FF6'), 'tien', TO_TIMESTAMP('2020-08-02 21:34:45.962000', 'YYYY-MM-DD HH24:MI:SS.FF6'), 'ft_batch_xlsx_2019_VIE.xlsx', 'E:\upload\2020-08-02\ft_batch_xlsx_2019_VIE.xlsx');