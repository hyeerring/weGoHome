-- DROP TABLE & SEQUENCE
DROP TABLE LIKELIST;
DROP TABLE REVIEWBOARD;
DROP TABLE ANIMALCOMMENT;
DROP TABLE ANIMAL;
DROP TABLE SHELTER;
DROP TABLE MEMBER;

DROP SEQUENCE LIKELIST_LNO_SEQ;
DROP SEQUENCE REVIEWBOARD_RNO_SEQ;
DROP SEQUENCE ANIMALCOMMENT_ACNO_SEQ;
DROP SEQUENCE ANIMAL_ANO_SEQ;

-- CREATE TABLE & SEQUENCE
CREATE TABLE MEMBER(
    MID         VARCHAR2(100) PRIMARY KEY,
    MPW         VARCHAR2(100) NOT NULL,
    MNAME       VARCHAR2(50) NOT NULL,
    MTEL        VARCHAR2(50) NOT NULL UNIQUE,
    MEMAIL      VARCHAR2(40) UNIQUE,
    MGENDER     VARCHAR2(1),
    MBIRTH      DATE,
    MADDRESS    VARCHAR2(255)
);

CREATE TABLE SHELTER(
    SID         VARCHAR2(100) PRIMARY KEY,
    SPW         VARCHAR2(100) NOT NULL,
    SNAME       VARCHAR2(100) NOT NULL,
    STEL        VARCHAR2(50) NOT NULL,
    SEMAIL      VARCHAR2(40) NOT NULL,
    SADDRESS    VARCHAR2(255) NOT NULL
);

CREATE TABLE ANIMAL(
    ANO         NUMBER(4) PRIMARY KEY,
    SID         VARCHAR2(100) NOT NULL,
    APHOTO      VARCHAR2(200) NOT NULL,
    ABREED      VARCHAR2(50) NOT NULL,
    AGENDER     VARCHAR2(50) NOT NULL,
    AAGE        NUMBER(2),
    AWEIGHT     NUMBER(2),
    ACONTENT    VARCHAR2(4000),
    AADDRESS    VARCHAR2(255),
    ARDATE      DATE DEFAULT SYSDATE NOT NULL,
    AADOPT      VARCHAR2(20) NOT NULL,
    AIP         VARCHAR2(20) NOT NULL,
    FOREIGN KEY(SID) REFERENCES SHELTER(SID)
);

CREATE SEQUENCE ANIMAL_ANO_SEQ
    MAXVALUE 9999
    NOCACHE
    NOCYCLE
;

CREATE TABLE ANIMALCOMMENT(
    ACNO       NUMBER(4) PRIMARY KEY,
    MID        VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    ANO        NUMBER(4) REFERENCES ANIMAL(ANO) NOT NULL,
    ACCONTENT  VARCHAR2(100) NOT NULL,
    ACRDATE    DATE DEFAULT SYSDATE NOT NULL,
    ACIP       VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE ANIMALCOMMENT_ACNO_SEQ
    MAXVALUE 9999
    NOCACHE
    NOCYCLE
;

CREATE TABLE REVIEWBOARD(
    RNO         NUMBER(4) PRIMARY KEY,
    MID         VARCHAR2(100) REFERENCES MEMBER(MID),
    SID         VARCHAR2(100) REFERENCES SHELTER(SID),
    RTITLE      VARCHAR2(100) NOT NULL,
    RCONTENT    VARCHAR2(4000) NOT NULL,
    RPW         VARCHAR2(100) NOT NULL,
    RPHOTO      VARCHAR2(200),
    RRDATE      DATE DEFAULT SYSDATE NOT NULL,
    RHIT        NUMBER(4) DEFAULT 0 NOT NULL,
    RGROUP      NUMBER(4) NOT NULL,
    RSTEP       NUMBER(4) NOT NULL,
    RINDENT     NUMBER(4) NOT NULL,
    RIP         VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE REVIEWBOARD_RNO_SEQ
    MAXVALUE 9999
    NOCACHE
    NOCYCLE
;

CREATE TABLE LIKELIST(
    LNO     NUMBER(4) PRIMARY KEY,
    MID     VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    ANO     NUMBER(4) REFERENCES ANIMAL(ANO) NOT NULL
);

CREATE SEQUENCE LIKELIST_LNO_SEQ
    START WITH 1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE
;
