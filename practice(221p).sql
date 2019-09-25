--## SQL 실전문제 (221p)
--홀수문제

--Q1
CREATE TABLE T_TBL1(
T_EMPNO NUMBER(4) NOT NULL,
T_ENAME VARCHAR2(10),
T_JOB VARCHAR2(9),
T_MGR NUMBER(4),
T_HIREDATE DATE,
T_SAL NUMBER(7,2),
T_COMM NUMBER(7,2),
T_DEPTNO NUMBER(2),
CONSTRAINT T_TBL1_PK PRIMARY KEY(T_EMPNO));
--Q3
INSERT INTO T_TBL1 VALUES('7369','SMITH','CLERK',7902,TO_DATE('1980-12-17','YYYY-MM-DD'),800,NULL,20);
INSERT INTO T_TBL1 VALUES('7566','JONES','MANAGER',7839,TO_DATE('1981-04-02','YYYY-MM-DD'),2975,NULL,20);
INSERT INTO T_TBL1 VALUES('7788','SCOTT','ANALYST',7566,TO_DATE('1987-07-13','YYYY-MM-DD'),3000,NULL,20);
INSERT INTO T_TBL1 VALUES('7876','ADAMS','CLERK',7788,TO_DATE('1987-07-13','YYYY-MM-DD'),1100,NULL,20);
INSERT INTO T_TBL1 VALUES('7902','FORD','ANALYST',7566,TO_DATE('1981-12-03','YYYY-MM-DD'),3000,NULL,20);
--Q5
CREATE TABLE T_EMP10(
T_EMPNO NUMBER(4) NOT NULL,
T_ENAME VARCHAR2(10),
T_JOB VARCHAR2(9),
T_MGR NUMBER(4),
T_HIREDATE DATE,
T_SAL NUMBER(7,2),
T_COMM NUMBER(7,2),
T_DEPTNO NUMBER(2),
CONSTRAINT T_EMP10_PK PRIMARY KEY(T_EMPNO));

INSERT INTO T_EMP10 VALUES('7782','CLARK','MANAGER',7839,TO_DATE('1981-06-09','YYYY-MM-DD'),2450,NULL,10);
INSERT INTO T_EMP10 VALUES('7839','KING','PRESIDENT',NULL,TO_DATE('1981-11-17','YYYY-MM-DD'),5000,NULL,10);
INSERT INTO T_EMP10 VALUES('7934','MILLER','CLERK',7782,TO_DATE('1982-01-23','YYYY-MM-DD'),1300,NULL,10);

SELECT * FROM T_EMP10;
--Q7
ALTER TABLE T_TBL1
ADD (T_GENDER CHAR(1));
--Q9
ALTER TABLE T_TBL1
MODIFY (T_GENDER VARCHAR2(10));
--Q11
TRUNCATE TABLE T_TBL1;
--Q13
CREATE TABLE T_EMP2(
T_EMPNO NUMBER(4) NOT NULL,
T_ENAME VARCHAR2(10),
T_JOB VARCHAR2(9),
T_MGR NUMBER(4),
T_HIREDATE DATE,
T_SAL NUMBER(7,2),
T_COMM NUMBER(7,2),
T_DEPTNO NUMBER(2)
CONSTRAINT T_EMP2_FK REFERENCES DEPT(DEPTNO),
CONSTRAINT T_EMP2_PK PRIMARY KEY(T_EMPNO));

CREATE TABLE T_EMP3(
T_EMPNO NUMBER(4) NOT NULL,
T_ENAME VARCHAR2(10),
T_JOB VARCHAR2(9),
T_MGR NUMBER(4),
T_HIREDATE DATE,
T_SAL NUMBER(7,2) NOT NULL,
T_COMM NUMBER(7,2),
T_DEPTNO NUMBER(2),
CONSTRAINT T_EMP3_PK PRIMARY KEY(T_EMPNO));
--Q15
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_TBL1';
--Q17
ALTER TABLE T_EMP2
ENABLE CONSTRAINT T_EMP2_FK;
--Q19
DROP TABLE T_EMP2;
--Q21
CREATE VIEW V_EMP20
AS SELECT *
FROM EMP
WHERE DEPTNO = '20';

SELECT *
FROM V_EMP20;
--Q23
CREATE VIEW V_EMP_DEPT
AS SELECT EMPNO, ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM V_EMP_DEPT;
--Q25
SELECT EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE IS NOT NULL
ORDER BY HIREDATE DESC)
WHERE ROWNUM <= 5;
--Q27
SELECT DNAME
FROM (SELECT DNAME, AVG(SAL)
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DNAME
ORDER BY 2 DESC)
WHERE ROWNUM <= 2;