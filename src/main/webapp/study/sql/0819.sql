show tables;

desc test1;

/*
 	기본 키(primary key) : 테이블을 대표하는 키, 중복을 허용하지 않는다.
		: 기본키안의 필드를 여러개 줄수 있으나, 독립 필드로 여러개의 기본키는 허용하지 않는다. 	
		: primary key는 자동으로 index 한다.
 */

create table test2 (
	idx  int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

desc test2;

create table test3 (
	idx  int not null,
	name varchar(20) not null,
	age int default 20,
	/*test3Code varchar(10) not null primary key 기본키는 중복될 수 없음*/
	test3Code varchar(10) not null,
	primary key(name, test3Code)
);

desc test3;

/*
 	유니크 키
 	기본키를 대신해서 중복을 불허할 때 사용하는 키(자동 인덱싱됨.)
 */
create table test4 (
	idx  int not null auto_increment primary key,
	product varchar(20) not null,
	price int default 20,
	test4Code varchar(10) not null unique key
);

desc test4;

drop table test4;

insert into test4 value (default, '냉장고', 1000, 'N001');
insert into test4 value (default, '오디오', 500, 'A002');
insert into test4 value (default, '선풍기', 800, 'S001');
insert into test4 value (default, '에어컨', 1500, 'AI001');
insert into test4 value (default, '전자레인지', 800, 'JJ001');
insert into test4 value (default, '전기밥솥', 700, 'JG002');
-- insert into test4 value (default, '다리미', 300, 'JG002');

select * from test4;

/*
 	외래키(foreign key) : 메인 테이블에서 다른테이블의 정보를 찾기 위해 테이블 간의 관계 설정을 해야 함.
 		메인 테이블의 키는 중복될 수 없는(primary, unique)키를 사용하고, 관계 설정된 다른 테이블의 키를 외래키라고 함.
 		현재 코드 : test4Code(유니크-외래키)를 관계설정에 이용.
 */


create table test5 (
	idx  int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test4Code varchar(10) not null,
	foreign key(test4Code) references test4(test4Code)
);

insert into test5 values (default, '홍길동', 23, 'N001');
-- insert into test5 values (default, '홍길동', 23, 'N002');
insert into test5 values (default, '홍길동', 23, 'N001');

select * from test5;

desc test5;

/* ---------- 위는 연습임 ------------ */

/* 학과(hakkwa) 테이블 */
CREATE TABLE hakkwa (
	code INT NOT NULL PRIMARY KEY,	/* 학과코드 */
	name VARCHAR(20) NOT NULL 			/* 학과명 */
	/*UNIQUE KEY(name)*/
);
DESC hakkwa;
DROP TABLE hakkwa;

-- 기본키 추가
ALTER TABLE hakkwa ADD PRIMARY KEY(code);
-- 기본키 삭제
ALTER TABLE hakkwa DROP PRIMARY KEY;

-- 유니크키 추가
ALTER TABLE hakkwa ADD UNIQUE KEY(name);
-- 유니크키 삭제
ALTER TABLE hakkwa DROP INDEX name;

INSERT INTO hakkwa VALUES (101, '컴퓨터공학과');
INSERT INTO hakkwa VALUES (102, '경영학과');
INSERT INTO hakkwa VALUES (103, '건축공학과');
INSERT INTO hakkwa VALUES (104, '토목공학과');
INSERT INTO hakkwa VALUES (105, '기계공학과');
INSERT INTO hakkwa VALUES (106, '영문과');
INSERT INTO hakkwa VALUES (107, '물리학과');

SELECT * FROM hakkwa;
SELECT * FROM hakkwa order by name desc;

/* 학생정보테이블(student) */
CREATE TABLE student (
	idx INT NOT NULL auto_increment PRIMARY KEY, /* 학생 고유번호 */
	name VARCHAR(20) NOT NULL, 	/* 학생 성명 */
	hakkwa_code INT,		/* 학과 코드(관계설정용), 외래키 */
	age INT DEFAULT 20,					/* 학생나이 */
	FOREIGN KEY(hakkwa_code) references hakkwa(code)
	/* 수정에는 CASCADE, 삭제에는 SET DEFAULT 옵션을 주고 테스트 해보자. */
	/* 원래 외래키 설정부에 이어서 작성하나 기니까 아래로 뺐다.(윗 라인에 ',' 를 쓰지 않음!)*/
	ON UPDATE CASCADE
	ON DELETE RESTRICT/**/
);
DESC student;
DROP TABLE student;

insert into student values (default, '홍길동', 101, default);
insert into student values (default, '김말숙', 102, 22);
insert into student values (default, '이기자', 102, 32);
insert into student values (default, '소나무', 103, 28);
insert into student values (default, '김연아', 104, 24);
insert into student values (default, '강감찬', 104, default);
insert into student values (default, '홍길순', 103, 20);
insert into student values (default, '고인돌', 104, 19);
insert into student values (default, '손흥민', 105, 19);
insert into student values (default, '아톰맨', 105, default);
insert into student values (default, '비톰맨', 106, 27);

select * from student;

select * from hakkwa where code=101;
select * from student where hakkwa_code=107;
select * from student where name='비톰맨';

delete from hakkwa where code = 101;
delete from hakkwa where code = 102;

update student set hakkwa_code = 101 where name='비톰맨';
update hakkwa set code=108 where code =101;

/* 현재 DBMS에 모든 TABLE 제약조건 확인하기? */
SELECT * FROM information_schema.TABLE_CONSTRAINTS;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='springgroup';

/* springgroup 데이터 베이스의 student 테이블의 foreign key를 삭제 */
ALTER TABLE student DROP FOREIGN KEY student_ibfk_1;


/* -------------------------조인(JOIN) 설정---------------------------- */

-- 일반 JOIN(Inner Join) = 내부 조인 = 교집합
SELECT * FROM hakkwa INNER JOIN student WHERE hakkwa.code = student.hakkwa_code;
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code;
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code ORDER BY hakkwa.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code WHERE s.hakkwa_code=105 ORDER BY h.name;
SELECT h.*, s.name FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT h.*, s.name AS 성명 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
	-- 실제 프로그램에서는 AS 다음에 영어로 필드를 선언할 것(VO에서 변수로 사용가능) --
SELECT h.*, s.name AS 성명, s.age AS 나이 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;


-- Left Join :Left Outer Join: 왼쪽 테이블 기준, 오른쪽 테이블을 조합?(왼쪽 테이블의 모든 필드를 보여줌.)
SELECT * FROM hakkwa h LEFT JOIN student s ON h.code = s.hakkwa_code;
SELECT * FROM hakkwa h LEFT JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

-- Right Join :Right Outer Join: 오른쪽 테이블 기준, 왼쪽 테이블을 조합?(왼쪽 테이블의 모든 필드를 보여줌.)
SELECT * FROM hakkwa h RIGHT JOIN student s ON h.code = s.hakkwa_code;
SELECT * FROM hakkwa h RIGHT JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

-- Cross Join : 곱집합(모든 경우의 수), 합집합은 다음 기회에(mySql에서는 다른 명령을 써야함...)
SELECT * FROM hakkwa, student;
-- 응용
SELECT * FROM hakkwa h, student s WHERE h.code = s.hakkwa_code;
SELECT * FROM hakkwa h, student s WHERE h.code = s.hakkwa_code and s.hakkwa_code=105;

-- 합집합 : 완전 외부조인(Full Outer Join) - mySQL에서는 지원하지 않는다.
	-- SELECT * FROM hakkwa h FULL OUTER JOIN student s; --
	
-- 합집합 : union을 이용하여 합집합의 개념으로 사용한다.(곱집합에서 중복되는 값을 빼버린다.) - Merge
-- 해당 테이블의 필드명이 동일하면 테이블을 병합, 필드명이 다르면 왼쪽 테이블을 기준으로 처리함.
-- 병합할 테이블의 컬럼수를 일치 시켜야 함.
-- ALL을 사용하면 중복자료 모두 출력함.
SELECT * FROM hakkwa UNION SELECT hakkwa_code,name AS irum FROM student;
SELECT code FROM hakkwa UNION SELECT hakkwa_code FROM student;
SELECT code FROM hakkwa UNION ALL SELECT hakkwa_code AS code FROM student;
SELECT * FROM hakkwa UNION ALL SELECT hakkwa_code AS code, name AS irum FROM student;
