
/* Drop Tables */

DROP TABLE ws_articlereport CASCADE CONSTRAINTS;
DROP TABLE ws_attend CASCADE CONSTRAINTS;
DROP TABLE ws_attendee CASCADE CONSTRAINTS;
DROP TABLE ws_board CASCADE CONSTRAINTS;
DROP TABLE WS_SCHEDULE CASCADE CONSTRAINTS;
DROP TABLE ws_studyreport CASCADE CONSTRAINTS;
DROP TABLE ws_studytime CASCADE CONSTRAINTS;
DROP TABLE ws_studyinfo CASCADE CONSTRAINTS;
DROP TABLE ws_category CASCADE CONSTRAINTS;
DROP TABLE WS_CERTIFICATE CASCADE CONSTRAINTS;
DROP TABLE WS_EXP CASCADE CONSTRAINTS;
DROP TABLE WS_LANGUAGE CASCADE CONSTRAINTS;
DROP TABLE ws_location CASCADE CONSTRAINTS;
DROP TABLE WS_REGPROCESS CASCADE CONSTRAINTS;
DROP TABLE ws_userreport CASCADE CONSTRAINTS;
DROP TABLE ws_reportcategory CASCADE CONSTRAINTS;
DROP TABLE WS_SCHOOL CASCADE CONSTRAINTS;
DROP TABLE WS_USER CASCADE CONSTRAINTS;
DROP TABLE WS_COMMENT CASCADE CONSTRAINTS;


/* Drop Sequences */

DROP SEQUENCE SEQ_ADDINFO_info_id;
DROP SEQUENCE SEQ_CATEGORY_cat_id;
DROP SEQUENCE SEQ_LOCATION_loc_id;
DROP SEQUENCE SEQ_S_BRIEF_INFO_info_id;
DROP SEQUENCE SEQ_USER_id;
DROP SEQUENCE SEQ_USER_user_id;
DROP SEQUENCE SEQ_ws_articlereport_id;
DROP SEQUENCE SEQ_ws_attendee_id;
DROP SEQUENCE SEQ_ws_attend_id;
DROP SEQUENCE SEQ_ws_board_id;
DROP SEQUENCE SEQ_ws_category_id;
DROP SEQUENCE SEQ_WS_CERTIFICATE_id;
DROP SEQUENCE SEQ_WS_EXP_id;
DROP SEQUENCE SEQ_WS_LANGUAGE1_id;
DROP SEQUENCE SEQ_WS_LANGUAGE_id;
DROP SEQUENCE SEQ_ws_location_id;
DROP SEQUENCE SEQ_WS_REGPROCESS_id;
DROP SEQUENCE SEQ_WS_REGRESULT_id;
DROP SEQUENCE SEQ_ws_reportcategory_id;
DROP SEQUENCE SEQ_WS_SCHEDULE_id;
DROP SEQUENCE SEQ_WS_SCHOOL_id;
DROP SEQUENCE SEQ_ws_studyinfo_id;
DROP SEQUENCE SEQ_ws_studyinfo_study_id;
DROP SEQUENCE SEQ_ws_studyreport_id;
DROP SEQUENCE SEQ_ws_studytime_id;
DROP SEQUENCE SEQ_ws_userreport_id;
DROP SEQUENCE SEQ_WS_USER_id;
DROP SEQUENCE SEQ_WS_COMMENT_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_ADDINFO_info_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CATEGORY_cat_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_LOCATION_loc_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_S_BRIEF_INFO_info_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_USER_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_USER_user_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_articlereport_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_attendee_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_attend_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_board_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_category_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_CERTIFICATE_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_EXP_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_LANGUAGE1_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_LANGUAGE_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_location_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_REGPROCESS_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_REGRESULT_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_reportcategory_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_SCHEDULE_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_SCHOOL_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_studyinfo_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_studyinfo_study_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_studyreport_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_studytime_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ws_userreport_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_USER_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_COMMENT_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WS_attendrate_id INCREMENT BY 1 START WITH 1;

/* Create Tables */

CREATE TABLE ws_articlereport
(
	-- �Խñ۽Ű� ������ȣ
	id number NOT NULL,
	-- �Խñ� �Ű� ����
	content varchar2(1000) NOT NULL,
	-- �Խñ� �Ű�ð�
	time timestamp NOT NULL,
	-- �Ű� �� ���� �г���
	reporter_nick varchar2(50) NOT NULL,
    -- �Ű� ���� ���� �г���
    suspect_nick varchar2(50) NOT NULL,
	-- ���͵� �Խñ� ����
	article_title varchar2(200) NOT NULL,
    -- ���͵� ����
	study_title varchar2(200) NOT NULL,
	-- �Ű� ī�װ� ������ȣ
	repcat_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_attend
(
	-- �⼮���̺� ������ȣ
	-- 
	id number NOT NULL,
	-- �⼮ ��¥
	attend_date date NOT NULL,
	-- �⼮����
	attendance number DEFAULT 0 NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	-- ���͵� ������ȣ
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_attendee
(
	-- ���������� ������ȣ
	id number NOT NULL,
	-- �ش� �������� ���� ����
	purpose varchar2(300) NOT NULL,
	-- �ش� �������� ��ǥ
	goal varchar2(100) NOT NULL,
	-- �����ڰ� �ۼ��� �ڱ�Ұ�
	intro varchar2(300),
	-- �����ڰ� �ۼ��� ��û ����
	request varchar2(300),
	-- ��û �ð�
	regdate date NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	-- ���͵� ������ȣ
	study_id number NOT NULL,
	-- ���μ��� ������ȣ
	regprocess_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_board
(
	-- ���͵� �Խ��� �� ��ȣ
	id number NOT NULL,
	-- �Խñ� ����
	title varchar2(300) NOT NULL,
	-- �Խñ� ����
	content varchar2(3000) NOT NULL,
	-- �Խñ� ��й�ȣ
	passwd varchar2(30) NOT NULL,
	-- �Խñ��� �ۼ��� �ð�
	logtime timestamp NOT NULL,
	-- �Խñ� ���� ���� ( 0 : ���� / 1 : ����� )
	secret varchar2(10) DEFAULT '0' NOT NULL,
	-- �Խñ��� ���� ���� ( 0 : �Ϲݱ� / 1 : ���� )
	notice varchar2(10) DEFAULT '0' NOT NULL,
    -- ��ȸ��
    readcount number NOT NULL,
    -- ���
    ref number NOT NULL,
    -- ��� ����
    re_step number NOT NULL,
    -- ��� ����
    re_level number NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	-- ���͵� ������ȣ
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_category
(
	-- ī�װ� ������ȣ
	id number NOT NULL,
	-- ��з�
	big varchar2(30) NOT NULL,
	-- �ߺз�
	middle varchar2(30) NOT NULL,
	-- �Һз�
	small varchar2(30) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_CERTIFICATE
(
	id number NOT NULL,
	-- �ڰ�����
	name varchar2(50) NOT NULL,
	-- ���� �� ���
	score varchar2(30) NOT NULL,
	-- �����
	obtain_date date NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_EXP
(
	id number NOT NULL,
	-- ��� ����
	experience varchar2(200) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_LANGUAGE
(
	id number NOT NULL,
	-- ����
	language varchar2(30) NOT NULL,
	-- �ڰ�����
	-- 
	name varchar2(40) NOT NULL,
	-- ���� �� ���
	score varchar2(30) NOT NULL,
	-- �����
	obtain_date date NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_LOCATION
(
    -- ����������ȣ
    id number NOT NULL,
    -- ��/��
    state_city varchar2(30) NOT NULL,
    -- ������
    detail_loc varchar2(30) NOT NULL,
    -- ����
    latitude number NOT NULL, 
    -- �浵
    longitude number NOT NULL, 
    PRIMARY KEY (id)
);


CREATE TABLE WS_REGPROCESS
(
	-- ���μ��� ������ȣ
	id number NOT NULL,
	-- ���μ��� �̸�(1����û���/1����������/2���������/2����������/��������) )
	name varchar2(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_reportcategory
(
	-- �Ű� ī�װ� ������ȣ
	id number NOT NULL,
	-- �Ű� ī�װ� �̸�
	-- 
	name varchar2(50) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);


CREATE TABLE WS_SCHEDULE
(
	-- ���� ���� ������ȣ
	id number NOT NULL,
	-- ���۳�¥
	start_date date NOT NULL,
    -- ����¥
	end_date date,
	-- ����
	content varchar2(300) NOT NULL,
    -- Ŭ���� �̸�
    classname varchar2(50) NOT NULL,
    -- ���� ����
    allDay varchar(10) NOT NULL,
	-- ���͵� ������ȣ
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_SCHOOL
(
	id number NOT NULL,
	-- �б� ��
	name varchar2(50) NOT NULL,
	-- ������
	major varchar2(50) NOT NULL,
	-- ���� ���� 0 - ���� 1 - ���� 2 - ����
	status varchar2(10) NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studyinfo
(
	-- ���͵� ������ȣ
	id number NOT NULL,
	-- ���͵� ����
	title varchar2(300) NOT NULL,
	-- ���͵� �Ұ�
	intro varchar2(1000) NOT NULL,
	-- ���͵� ���� ���
	process varchar2(1000) NOT NULL,
	-- ���͵� ���� ���
	target varchar2(500) NOT NULL,
	-- ���͵� ���� Ŀ��ŧ��
	curriculum varchar2(3000),
	-- ���͵��� �߰� �ڸ�Ʈ
	scomment varchar2(1000),
	-- ���͵� ���
	scost varchar2(100),
	-- ���͵� ����ä�� ��ũ
	chat_url varchar2(300) NOT NULL,
	-- ���͵� ���� ���� �ο�
	cur_personnel number NOT NULL,
	-- ���͵� ���� ���� �ο�
	max_personnel number NOT NULL,
	-- ���͵� ���� ( 0 : ������ / 1 : ���� )
	term varchar2(10) NOT NULL,
	-- ���͵� ���� ��ũ
	picture varchar2(1000) NOT NULL,
    -- ���͵� ��� �ð�
    regdate date NOT NULL,
	-- ���� ��������
	deadline date,
    -- �� ���
    place varchar2(100) NOT NULL,
	-- ���� ���� ��ȣ
	user_id number NOT NULL,
	-- ����������ȣ
	loc_id number NOT NULL,
	-- ī�װ� ������ȣ
	cat_id number NOT NULL,
    -- ���͵� �ð� ������ȣ
    studytime_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studyreport
(
	-- ���͵�Ű� ������ȣ
	id number NOT NULL,
	-- ���͵�Ű���
	content varchar2(1000) NOT NULL,
	-- �����Ű�ð�
	time timestamp NOT NULL,
	-- �Ű��� ���� �г���
	reporter_nick varchar2(50) NOT NULL,
    -- �Ű� ���� ���� �г���
	suspect_nick varchar2(50) NOT NULL,
    -- ���͵� ����
	study_title varchar2(200) NOT NULL,
	-- �Ű� ī�װ� ������ȣ
	repcat_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studytime
(
	-- ���͵�ð� ������ȣ
	id number NOT NULL,
	-- ���͵� ���۳�¥ ( �� / �� / �� )
	sdate date NOT NULL,
	-- ���͵� ��¥�� �ش��ϴ� ����
	-- ( 0 : �� / 1 : ȭ / 2 : �� / 3 : �� / 4 : �� / 5 : �� / 6 : �� )
	sday varchar2(15) NOT NULL,
	-- ���͵� �� �ð�
	stime varchar2(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_USER
(
	-- ���� ���� ��ȣ
	id number NOT NULL,
	-- ���� �̸���
	email varchar2(50) NOT NULL UNIQUE,
	-- ���� �̸�
	name varchar2(20) NOT NULL,
	-- ���� ����
	nick varchar2(30) NOT NULL UNIQUE,
	-- ���� ����
	pic varchar2(100) NOT NULL,
	-- ���� ����
	birth date NOT NULL,
	-- ���� ���� : ��, ��
	gender varchar2(10) NOT NULL,
	-- ���� �޴���ȭ��ȣ
	phone varchar2(30) NOT NULL UNIQUE,
	-- ���� ��й�ȣ
	passwd varchar2(20) NOT NULL,
	-- �����̾� ���� ����(0 - �̰���, 1 - ����)
	prime varchar2(10) DEFAULT '0' NOT NULL,
	-- ���� ����
	rate number(5,0) NOT NULL,
    -- ���� ����Ʈ
    point number NOT NULL,
	-- ���Գ�¥
	regdate date NOT NULL,
	-- ���� �ּ�
	address varchar2(200) NOT NULL,
	-- ���� �����ȣ
	zipcode varchar2(10) NOT NULL,
    -- ���� ���� ���
    visit varchar(50) NOT NULL,
    -- ���� ���ɻ�
    interest varchar(50) NOT NULL,
    -- ���� ��ǥ
    goal varchar(50) NOT NULL,
    -- ���� ���͵� ���� ����
    open varchar(10) NOT NULL,
    -- ���� ���͵� ���� ����
    part varchar(10) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_userreport
(
	-- �����Ű� ������ȣ
	-- 
	id number NOT NULL,
	-- ���� �Ű���
	content varchar2(1000) NOT NULL,
	-- �����Ű�ð�
	time timestamp NOT NULL,
	-- �Ű��� ���� �г���
	reporter_nick varchar2(50) NOT NULL,
    -- �Ű� ���� ���� �г���
    suspect_nick varchar2(50) NOT NULL,
	-- �Ű� ī�װ� ������ȣ
	repcat_id number NOT NULL,
	PRIMARY KEY (id)
);


create table ws_comment 
(
  id number NOT NULL,
  board_id number NOT NULL,
  study_id number NOT NULL,
  content varchar2(200) NOT NULL,
  writer varchar2(50) NOT NULL,
  regdate date NOT NULL,
  primary key (id)
);

create table ws_categoryforml
(
  id number NOT NULL,
  cat_id number NOT NULL,
  loc_id number NOT NULL,
  day_id number NOT NULL,
  primary key (id)
);

create table ws_attendrate
(
  id number NOT NULL,
  user_id number NOT NULL,
  study_id number NOT NULL,
  rate number NOT NULL,
  primary key (id)
);


create table ws_studyrecommend
(
  id number NOT NULL,
  user_cid number NOT NULL,
  studyc_id number NOT NULL,
  pre_rate number NOT NULL,
  primary key (id)
);

/* Create Foreign Keys */


ALTER TABLE ws_studyinfo
	ADD FOREIGN KEY (cat_id)
	REFERENCES ws_category (id)
;


ALTER TABLE ws_studyinfo
	ADD FOREIGN KEY (loc_id)
	REFERENCES ws_location (id)
;

ALTER TABLE ws_studyinfo
	ADD FOREIGN KEY (studytime_id)
	REFERENCES ws_studytime (id)
;


ALTER TABLE ws_attendee
	ADD FOREIGN KEY (regprocess_id)
	REFERENCES WS_REGPROCESS (id)
;


ALTER TABLE ws_articlereport
	ADD FOREIGN KEY (repcat_id)
	REFERENCES ws_reportcategory (id)
;


ALTER TABLE ws_studyreport
	ADD FOREIGN KEY (repcat_id)
	REFERENCES ws_reportcategory (id)
;


ALTER TABLE ws_userreport
	ADD FOREIGN KEY (repcat_id)
	REFERENCES ws_reportcategory (id) 
;


ALTER TABLE ws_attend
	ADD FOREIGN KEY (study_id)
	REFERENCES ws_studyinfo (id) ON DELETE CASCADE
;


ALTER TABLE ws_attendee
	ADD FOREIGN KEY (study_id)
	REFERENCES ws_studyinfo (id) ON DELETE CASCADE
;


ALTER TABLE ws_board
	ADD FOREIGN KEY (study_id)
	REFERENCES ws_studyinfo (id) ON DELETE CASCADE
;


ALTER TABLE WS_SCHEDULE
	ADD FOREIGN KEY (study_id)
	REFERENCES ws_studyinfo (id) ON DELETE CASCADE
;


ALTER TABLE ws_attend
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE ws_attendee
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE ws_board
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE WS_CERTIFICATE
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE WS_EXP
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE WS_LANGUAGE
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE WS_SCHOOL
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;


ALTER TABLE ws_studyinfo
	ADD FOREIGN KEY (user_id)
	REFERENCES WS_USER (id) ON DELETE CASCADE
;



/* Comments */

COMMENT ON COLUMN ws_articlereport.id IS '�Խñ۽Ű� ������ȣ';
COMMENT ON COLUMN ws_articlereport.content IS '�Խñ� �Ű� ����';
COMMENT ON COLUMN ws_articlereport.time IS '�Խñ� �Ű�ð�';
COMMENT ON COLUMN ws_articlereport.reporter_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_articlereport.article_id IS '���͵� �Խ��� �� ��ȣ';
COMMENT ON COLUMN ws_articlereport.repcat_id IS '�Ű� ī�װ� ������ȣ';
COMMENT ON COLUMN ws_attend.id IS '�⼮���̺� ������ȣ
';
COMMENT ON COLUMN ws_attend.attend_date IS '�⼮ ��¥';
COMMENT ON COLUMN ws_attend.attendance IS '�⼮����';
COMMENT ON COLUMN ws_attend.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_attend.study_id IS '���͵� ������ȣ';
COMMENT ON COLUMN ws_attendee.id IS '���������� ������ȣ';
COMMENT ON COLUMN ws_attendee.purpose IS '�ش� �������� ���� ����';
COMMENT ON COLUMN ws_attendee.goal IS '�ش� �������� ��ǥ';
COMMENT ON COLUMN ws_attendee.intro IS '�����ڰ� �ۼ��� �ڱ�Ұ�';
COMMENT ON COLUMN ws_attendee.request IS '�����ڰ� �ۼ��� ��û ����';
COMMENT ON COLUMN ws_attendee.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_attendee.study_id IS '���͵� ������ȣ';
COMMENT ON COLUMN ws_attendee.regprocess_id IS '���μ��� ������ȣ';
COMMENT ON COLUMN ws_board.id IS '���͵� �Խ��� �� ��ȣ';
COMMENT ON COLUMN ws_board.title IS '�Խñ� ����';
COMMENT ON COLUMN ws_board.content IS '�Խñ� ����';
COMMENT ON COLUMN ws_board.passwd IS '�Խñ� ��й�ȣ';
COMMENT ON COLUMN ws_board.logtime IS '�Խñ��� �ۼ��� �ð�';
COMMENT ON COLUMN ws_board.secret IS '�Խñ� ���� ���� ( 0 : ���� / 1 : ����� )';
COMMENT ON COLUMN ws_board.notice IS '�Խñ��� ���� ���� ( 0 : �Ϲݱ� / 1 : ���� )';
COMMENT ON COLUMN ws_board.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_board.study_id IS '���͵� ������ȣ';
COMMENT ON COLUMN ws_category.id IS 'ī�װ� ������ȣ';
COMMENT ON COLUMN ws_category.big IS '��з�';
COMMENT ON COLUMN ws_category.middle IS '�ߺз�';
COMMENT ON COLUMN ws_category.small IS '�Һз�';
COMMENT ON COLUMN WS_CERTIFICATE.name IS '�ڰ�����';
COMMENT ON COLUMN WS_CERTIFICATE.score IS '���� �� ���';
COMMENT ON COLUMN WS_CERTIFICATE.obtain_date IS '�����';
COMMENT ON COLUMN WS_CERTIFICATE.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN WS_EXP.experience IS '��� ����';
COMMENT ON COLUMN WS_EXP.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN WS_LANGUAGE.language IS '����';
COMMENT ON COLUMN WS_LANGUAGE.name IS '�ڰ�����
';
COMMENT ON COLUMN WS_LANGUAGE.score IS '���� �� ���';
COMMENT ON COLUMN WS_LANGUAGE.obtain_date IS '�����';
COMMENT ON COLUMN WS_LANGUAGE.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_location.id IS '����������ȣ';
COMMENT ON COLUMN ws_location.state_city IS '��/��';
COMMENT ON COLUMN ws_location.detail_loc IS '������';
COMMENT ON COLUMN WS_REGPROCESS.id IS '���μ��� ������ȣ';
COMMENT ON COLUMN WS_REGPROCESS.name IS '���μ��� �̸�(1����û���/1����������/2���������/2����������/��������) )';
COMMENT ON COLUMN ws_reportcategory.id IS '�Ű� ī�װ� ������ȣ';
COMMENT ON COLUMN ws_reportcategory.name IS '�Ű� ī�װ� �̸�
';
COMMENT ON COLUMN WS_SCHEDULE.id IS '���� ���� ������ȣ';
COMMENT ON COLUMN WS_SCHEDULE.schedule_date IS '��¥';
COMMENT ON COLUMN WS_SCHEDULE.content IS '����';
COMMENT ON COLUMN WS_SCHEDULE.study_id IS '���͵� ������ȣ';
COMMENT ON COLUMN WS_SCHOOL.name IS '�б� ��';
COMMENT ON COLUMN WS_SCHOOL.major IS '������';
COMMENT ON COLUMN WS_SCHOOL.status IS '���� ����';
COMMENT ON COLUMN WS_SCHOOL.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_studyinfo.id IS '���͵� ������ȣ';
COMMENT ON COLUMN ws_studyinfo.title IS '���͵� ����';
COMMENT ON COLUMN ws_studyinfo.intro IS '���͵� �Ұ�';
COMMENT ON COLUMN ws_studyinfo.process IS '���͵� ���� ���';
COMMENT ON COLUMN ws_studyinfo.target IS '���͵� ���� ���';
COMMENT ON COLUMN ws_studyinfo.curriculum IS '���͵� ���� Ŀ��ŧ��';
COMMENT ON COLUMN ws_studyinfo.scomment IS '���͵��� �߰� �ڸ�Ʈ';
COMMENT ON COLUMN ws_studyinfo.scost IS '���͵� ���';
COMMENT ON COLUMN ws_studyinfo.chat_url IS '���͵� ����ä�� ��ũ';
COMMENT ON COLUMN ws_studyinfo.place IS '���͵����� �ۼ��� �� ���';
COMMENT ON COLUMN ws_studyinfo.cur_personnel IS '���͵� ���� ���� �ο�';
COMMENT ON COLUMN ws_studyinfo.max_personnel IS '���͵� ���� ���� �ο�';
COMMENT ON COLUMN ws_studyinfo.term IS '���͵� ���� ( 0 : ������ / 1 : ���� )';
COMMENT ON COLUMN ws_studyinfo.picture IS '���͵� ���� ��ũ';
COMMENT ON COLUMN ws_studyinfo.deadline IS '���� ��������';
COMMENT ON COLUMN ws_studyinfo.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_studyinfo.loc_id IS '����������ȣ';
COMMENT ON COLUMN ws_studyinfo.cat_id IS 'ī�װ� ������ȣ';
COMMENT ON COLUMN ws_studyreport.id IS '���͵�Ű� ������ȣ';
COMMENT ON COLUMN ws_studyreport.content IS '���͵�Ű���';
COMMENT ON COLUMN ws_studyreport.time IS '�����Ű�ð�';
COMMENT ON COLUMN ws_studyreport.user_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_studyreport.repcat_id IS '�Ű� ī�װ� ������ȣ';
COMMENT ON COLUMN ws_studyreport.study_id IS '���͵� ������ȣ';
COMMENT ON COLUMN ws_studytime.id IS '���͵�ð� ������ȣ';
COMMENT ON COLUMN ws_studytime.sdate IS '���͵� ��¥ ( �� / �� / �� )';
COMMENT ON COLUMN ws_studytime.sday IS '���͵� ��¥�� �ش��ϴ� ����
( 0 : �� / 1 : ȭ / 2 : �� / 3 : �� / 4 : �� / 5 : �� / 6 : �� )';
COMMENT ON COLUMN ws_studytime.stime IS '���͵� �� �ð�';
COMMENT ON COLUMN WS_USER.id IS '���� ���� ��ȣ';
COMMENT ON COLUMN WS_USER.email IS '���� �̸���';
COMMENT ON COLUMN WS_USER.name IS '���� �̸�';
COMMENT ON COLUMN WS_USER.nick IS '���� ����';
COMMENT ON COLUMN WS_USER.pic IS '���� ����';
COMMENT ON COLUMN WS_USER.birth IS '���� ����';
COMMENT ON COLUMN WS_USER.gender IS '���� ���� : ��, ��';
COMMENT ON COLUMN WS_USER.phone IS '���� �޴���ȭ��ȣ';
COMMENT ON COLUMN WS_USER.passwd IS '���� ��й�ȣ';
COMMENT ON COLUMN WS_USER.prime IS '�����̾� ���� ����(0 - �̰���, 1 - ����)';
COMMENT ON COLUMN WS_USER.rate IS '���� ����';
COMMENT ON COLUMN WS_USER.regdate IS '���Գ�¥';
COMMENT ON COLUMN WS_USER.address IS '���� �ּ�';
COMMENT ON COLUMN WS_USER.zipcode IS '���� �����ȣ';
COMMENT ON COLUMN ws_userreport.id IS '�����Ű� ������ȣ
';
COMMENT ON COLUMN ws_userreport.suspect_id IS '������ ������ȣ';
COMMENT ON COLUMN ws_userreport.content IS '���� �Ű���';
COMMENT ON COLUMN ws_userreport.time IS '�����Ű�ð�';
COMMENT ON COLUMN ws_userreport.reporter_id IS '���� ���� ��ȣ';
COMMENT ON COLUMN ws_userreport.repcat_id IS '�Ű� ī�װ� ������ȣ';

/* �׽�Ʈ�� ������ ����*/


/*ī�װ� ������*/
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '����' ,'�ڼҼ�');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '����' ,'������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '����' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '�����' ,'�ڼҼ�');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '�����' ,'NCS');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '�����' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '�߼ұ��' ,'�ڼҼ�');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '�߼ұ��' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '������' ,'7��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '������' ,'9��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '���', '������' ,'5��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ǻ��' ,'����ó�����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ǻ��' ,'�������ȱ��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ǻ��' ,'��ǻ��Ȱ��ɷ�');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ǻ��' ,'������������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ȸ' ,'��ȸ����м���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '�丮' ,'�ѽ��������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '�丮' ,'�Ͻ��������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '�丮' ,'����������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ȸ' ,'���������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '�ڰ���', '��ȸ' ,'�ѱ���ɷ°�������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'TOEIC');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'OPIC');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'SAT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'TOEFL');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�Ϻ���' ,'JPLT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�Ϻ���' ,'JPT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�߱���' ,'HSK');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '���Ͼ�' ,'ZD');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'��ǻ�Ͱ���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'ȭ�а���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'ȯ�����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'�κ�����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '����' ,'�������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ι�' ,'�������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ι�' ,'ö��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ι�' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ι�' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ι�' ,'�߾��߹���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '��ȸ' ,'�ɸ���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '��ȸ' ,'�����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '��ȸ' ,'��ȸ��');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '��ȸ' ,'Ŀ�´����̼���');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ڿ�����' ,'������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ڿ�����' ,'����');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ڿ�����' ,'������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '����', '�ڿ�����' ,'��������');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '��Ÿ', 'ȸȭ' ,'����ȸȭ');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '��Ÿ', '�' ,'����Ʈ');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '��Ÿ', '�' ,'����');

/* �Ű� ī�װ� ������ */
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '�弳');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '���');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '���');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '���Ȱ ħ��');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '�Ҽ����� �µ�');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '������ ��');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '���� ��');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '���輺 ��');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '��Ÿ');

/* ���� ������ */
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.498144, 127.027645);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', 'ȫ��', 37.556733, 126.923640);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.555141, 126.936895);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.570158, 126.983027);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�Ż�', 37.516288, 127.019852);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '��', 37.524550, 126.875173);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '���', 37.513312, 127.100097);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.483826, 127.034657);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '���', 37.477029, 126.981723);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '���', 37.656217, 127.063224);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.619102, 126.921202);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '��ȭ', 37.582326, 127.001811);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.544552, 127.055959);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�λ絿', 37.573514, 126.984628);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '���', 37.653294, 126.843112);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�λ�', '����', 35.157752, 129.059074);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '��õ', '�۵�', 37.384085, 126.669269);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�Ǵ�', 37.540411, 127.069175);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�Ÿ�', 37.484200, 126.929669);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.539688, 126.945943);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.603330, 127.024716);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '������', 37.519899, 126.910335);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '���', 37.534733, 126.970668);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�սʸ�', 37.560624, 127.038649);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.498387, 126.856689);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����',37.504209, 126.951639);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.638702, 127.020542);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', 'ȸ��', 37.589637, 127.057805);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�湫��', 37.561493, 126.993791);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '�̾�', 37.627488, 127.027695);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', 'û����', 37.586905, 127.047116);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '����', 37.561261, 126.823061);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '����', 37.282965, 127.015077 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '���', 37.659522, 126.830691 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '�д�', 37.373957, 127.117045 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '������', 37.737490, 127.052330 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '��õ', '�۵�', 37.384128, 126.648875 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '��õ', '������', 37.447909, 126.709874 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '��õ', '����', 37.491808, 126.722004 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '����', '������', 36.332665, 127.434121 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�뱸', '�߾�', 35.865322, 128.592080 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�λ�', '����', 35.158229, 129.059964 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�λ�', '�ΰ��', 35.134244, 129.103096 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�λ�', '�ؿ��', 35.203188, 129.188330 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '�λ�', '����', 35.097725, 129.030553 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '����', 36.204927, 128.353218 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '���', '����', 35.551032, 129.262648 );



/* ��û ���μ��� ������ */
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '�������');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '1������');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '1������');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '��������');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '��������');

/* ���� ������ */
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'fff@fff.fff','���̸�','ireum12345','pic',to_date('89/07/24','RR/MM/DD'),'��','010-1234-5667','12345','0',0,0,to_date('19/07/24','RR/MM/DD'),'��� ������ �д籸 �Ǳ����� 235 (����)@101ȣ','13494','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'alice91897@gmail.com','������','�Ŵ�','pic',to_date('96/09/18','RR/MM/DD'),'��','01095793739','Dtmth9918!!','1',0,0,to_date('19/07/24','RR/MM/DD'),'���� ������ �Ｚ�� 150 (��ġ��)@107�� 303ȣ','06288','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'jaeyoung@gmail.com','������','��02','pic',to_date('09/12/16','RR/MM/DD'),'��','0111234567','!234o','1',0,0,to_date('19/07/24','RR/MM/DD'),'��� ���� �ϻ꼭�� ������ 123 (ź����)@���ؾ���Ʈ 2�� 9ȣ','10241','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'joonil@naver.com','������','chocoz','pic',to_date('19/06/30','RR/MM/DD'),'��','01095959595','1234','0',0,0,to_date('19/07/24','RR/MM/DD'),'���� ������ ǳ��� 237 (���ϵ�)@���','05208','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcde@abc.de','õ��','thunder','pic',to_date('10/01/01','RR/MM/DD'),'��','010-1234-7890','12345','1',0,0,to_date('19/07/24','RR/MM/DD'),'����Ư����ġ�� ���ֽ� ÷�ܷ� 242 (����)@�� 242','63309','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abc@email.com','����Ŭ','michael','pic',to_date('19/07/09','RR/MM/DD'),'��','010-0101-1111','111','0',0,0,to_date('19/07/24','RR/MM/DD'),'��� ������ �д籸 �Ǳ�����28���� 3-5 (������)@��ȭ��','13536','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcd@naver.com','������','�ٳ���','pic',to_date('19/07/27','RR/MM/DD'),'��','01056789012','!234o6','1',0,0,to_date('19/07/24','RR/MM/DD'),'���� ������ ������32�� 13 (������, �Ｚ��ũ��)@3�� 701ȣ','06309','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcde@hanmail.net','ȫ�浿','redroad','pic',to_date('89/12/14','RR/MM/DD'),'��','01034567890','!234o67','0',0,0,to_date('19/07/24','RR/MM/DD'),'���� ������ ������124�� 27 (�Ͽ���, �Ｚ�������Ʈ)@6�� 8ȣ','06339','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'yoojinshin9918@gmail.com','������','�Ŵ�99','pic',to_date('96/09/18','RR/MM/DD'),'����','01041639857','111!!','0',0,0,to_date('19/07/24','RR/MM/DD'),'���� ������ �Ｚ�� 150 (��ġ��)@�̵�����Ʈ 207�� 1407ȣ','06288','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'eee@dd.co','dd','dd','pic',to_date('19/08/27','RR/MM/DD'),'��','dd','dd','0',0,0,to_date('19/08/12','RR/MM/DD'),'dd@dd','dd','on@on@on','PC','MJ','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'seongsuu@gmail.com','������','��������','pic',to_date('91/12/28','RR/MM/DD'),'��','01033757609','tjdtnWld!234','0',0,0,to_date('19/08/29','RR/MM/DD'),'���� ������ ����� 130 (�ϻ絿, �����̾��Ӹ���)@�Ⱦ˷���','05256','on@on','BG','LA','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'shinnew124@gmail.com','������','�����124','pic',to_date('90/02/07','RR/MM/DD'),'��','01093234299','124','0',0,0,to_date('19/09/16','RR/MM/DD'),'��� ���� �ϻ꼭�� ������ 123 (ź����)@���ھ� �ǹ� 3�� 301ȣ','10241','on@on','BG','JB','2','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'encore@naver.com','��ö��','chulsoo123','pic',to_date('95/02/15','RR/MM/DD'),'��','01053232322','1234','0',0,0,to_date('19/09/16','RR/MM/DD'),'���� ������ ������� 298 (���ﵿ)@����','06253','on','PU','CT','1','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'cindy@naver.com','�ŵ�','cindy0','pic',to_date('19/09/26','RR/MM/DD'),'��','01066981926','1234','1',0,0,to_date('19/09/16','RR/MM/DD'),'���� ������ ������ 205 (������)@3�� 505ȣ','06303','on','BG','MJ','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'encore@daum.net','���ھ�','encore123','pic',to_date('91/01/10','RR/MM/DD'),'��','01019191191','1111','1',0,0,to_date('19/09/18','RR/MM/DD'),'���� ���빮�� ������2�� 10-2 (���̵�)@����','03721','on','PU','JB','0','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'playdata@naver.com','�÷���','playdata123','pic',to_date('00/06/01','RR/MM/DD'),'��','0106565656','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'���� ���ʱ� �����߾ӷ� ���� 31 (���ʵ�)@����','06718','on','CK','CT','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'wtf@naver.com','�����','jaewoop3344','pic',to_date('99/02/17','RR/MM/DD'),'��','01095666565','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'��� ���� ���籸 ������ 77 (�⵿��)@������Ʈ 202�� 401ȣ','10546','on','NE','JB','1','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'ncman@naver.com','�迣��','����ȸ������','pic',to_date('93/02/10','RR/MM/DD'),'��','01039393939','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'��� ������ �д籸 ����Ǳ���644���� 12 (����)@��������Ʈ�ǹ�','13494','on','BG','JB','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'qwerty1234@gmail.com','����Ƽ','qwerty','pic',to_date('94/03/04','RR/MM/DD'),'��','01011112222','1234','1',0,0,to_date('19/09/18','RR/MM/DD'),'��� ������ �д籸 �д�� 190 (�д絿, ������������������Ʈ)@101�� 1013ȣ','13581','on@on','FR','JB','3','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'poiuy0987@gmail.com','��ȣ��','poiuy','pic',to_date('91/12/23','RR/MM/DD'),'��','01098765432','0987','0',0,0,to_date('19/09/18','RR/MM/DD'),'��õ ������ ���з� 14 (���е�, ���е� �ÿ�����Ʈ)@17�� 1307ȣ','21938','on@on','BG','JB','3','3');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'needjob@naver.com','������','gujik','pic',to_date('94/06/08','RR/MM/DD'),'��','01097979797','111','1',0,0,to_date('19/09/19','RR/MM/DD'),'��� ������ �д籸 ��ΰ�ӵ��� 409 (����)@�������Ʈ','13473','on','BG','JB','0','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'needspec@naver.com','�����','����¯','pic',to_date('98/01/30','RR/MM/DD'),'��','01068686868','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'���� ��õ�� ���״�� 552 (��)@�񵿾���Ʈ','07946','on','IT','CT','1','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'goyangmajor@naver.com','������','�����������','pic',to_date('00/02/09','RR/MM/DD'),'��','0100101010','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'��� ���� ���籸 ȭ�߷� 164 (ȭ����, ��������5��������Ʈ)@503�� 1102ȣ','10474','on','IT','CT','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'etc@naver.com','��Ÿ��','etcman','pic',to_date('99/02/04','RR/MM/DD'),'��','01029292929','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'���� ������ ������ 202 (������)@������','06307','on','CO','AC','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcd@gmail.com','�ڿ���','yhp','pic',to_date('95/01/17','RR/MM/DD'),'��','01029293949','1234','0',0,0,to_date('19/09/16','RR/MM/DD'),'���� ���ʱ� ��õ��� 786 (��赿)@��','06761','on','PC','JB','0','0');
---------------------------------------------

/*���͵� �ð� ������ */
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (46,to_date('19/10/07','RR/MM/DD'),'0@','20:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (47,to_date('19/10/12','RR/MM/DD'),'5@','16:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (48,to_date('19/10/20','RR/MM/DD'),'6@','14:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (49,to_date('19/09/25','RR/MM/DD'),'0@2@4@','05:30');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (22,to_date('19/10/17','RR/MM/DD'),'3@5@','19:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (23,to_date('19/10/25','RR/MM/DD'),'5@','13:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (24,to_date('19/08/24','RR/MM/DD'),'3@','13:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (25,to_date('19/10/05','RR/MM/DD'),'5@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (26,to_date('19/09/25','RR/MM/DD'),'5@','14:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (27,to_date('19/10/25','RR/MM/DD'),'0@4@','18:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (28,to_date('19/10/19','RR/MM/DD'),'2@6@','12:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (29,to_date('19/10/19','RR/MM/DD'),'5@6@','14:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (30,to_date('19/10/11','RR/MM/DD'),'0@2@4@','16:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (31,to_date('19/09/28','RR/MM/DD'),'5@','15:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (32,to_date('19/08/19','RR/MM/DD'),'3@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (21,to_date('19/09/19','RR/MM/DD'),'1@5@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (33,to_date('19/11/01','RR/MM/DD'),'2@4@','13:50');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (34,to_date('19/10/05','RR/MM/DD'),'1@3@','16:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (35,to_date('19/08/19','RR/MM/DD'),'0@1@2@3@4@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (36,to_date('19/10/01','RR/MM/DD'),'2@4@','17:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (37,to_date('19/08/19','RR/MM/DD'),'1@4@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (38,to_date('19/08/19','RR/MM/DD'),'0@2@4@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (39,to_date('19/08/19','RR/MM/DD'),'2@4@','13:45:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (40,to_date('19/10/01','RR/MM/DD'),'0@1@2@3@4@5@6@','09:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (41,to_date('19/10/01','RR/MM/DD'),'1@2@3@4@','19:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (42,to_date('19/10/01','RR/MM/DD'),'1@2@3@4@','19:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (43,to_date('19/11/01','RR/MM/DD'),'5@6@','14:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (44,to_date('19/11/01','RR/MM/DD'),'0@1@2@3@4@5@6@','19:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (45,to_date('19/11/01','RR/MM/DD'),'5@6@','13:00');


/* ���͵� ������ */
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (46,'����ȭ�н��͵� �����ؿ�','ȭ�������ڵ��� ���� �����ϴ� ����','1�ð� ����ȭ�б���, 1�ð� ����� �� ��ȭ���� ���� ������ �����Դϴ�.','ȭ�п� ���� �⺻ ������ �ִ� ������ 1~3�г�',null,'����','0','https://open.kakao.com/o/sUB5AwEb',1,6,'1','/studyloop/views/host/img/ȭ��.png',to_date('19/09/19','RR/MM/DD'),to_date('19/09/30','RR/MM/DD'),'��ī�� ī��',64,36,32,46);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (47,'������ ���͵� ���� �Ͻ� ��','������ ���������� ����','30�� ���� ����ϰ� 1�ð� ������ ����å, ��, ���� �ڷ� ���� ��������','�����п� �����ִ� ��� �����е� ȯ��(����л��� x)','����','ȸ��� ���� ���� �� �ڷḦ �����ϴ� �� �̿�� �����Դϴ�.','2000','https://open.kakao.com/o/sUB5AwEb',1,4,'1','/studyloop/views/host/img/������.jfif',to_date('19/09/19','RR/MM/DD'),to_date('19/09/28','RR/MM/DD'),'ī��7�׷�',64,27,45,47);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (48,'�ѱ��� ���� ���� 1�� ����','�ھտ� ��ģ �ѱ��� ������ ����ġ��� ���� �غ�','1�ð� ���� Ǯ��, 1�ð� ����Ǯ�� �� �м� �� �� �ֱ�� 3ȸ �ݺ�','�ѱ��� 1�� ��ǥ�� �ƹ���','���, ��� ���� ����',null,'0','https://open.kakao.com/o/sUB5AwEb',1,3,'0','/studyloop/views/host/img/�ѱ���1.png',to_date('19/09/19','RR/MM/DD'),to_date('19/10/12','RR/MM/DD'),'��Ÿ����',64,45,21,48);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (49,'��ħ ���� ���� �ؿ�','�Ϸ� �ϰ� ���� �� ����, ��ħ ���� ���� �ؿ�','10�� ��Ʈ��Ī, 40�� ����, 10�� ������ ��Ʈ��Ī���� �����Ϸ��� �մϴ�~','20~30�� �����ִ� ������!','���� 5�ùݺ��� 6�ùݱ��� ����� �����Դϴ�.','������ ���� �ǰ��������䤾��','0','https://open.kakao.com/o/sUB5AwEb',1,2,'1','/studyloop/views/host/img/����.jfif',to_date('19/09/19','RR/MM/DD'),to_date('19/09/24','RR/MM/DD'),'����õ �Ա�',64,8,51,49);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (22,'�Ｚ�ڼҼ� �غ� ���� �Ͻ� �� ���ؿ�','�����ϰ� ���͵� �����ؼ� ���� �Ｚ���� �� ���մϴ�.','���͵� ������ ������ �ڼҼ��� �ۼ��ؿ� �� ���͵� �ð��� ������ �ڼҼ��� ÷���ϴ� �ð��� ������ �ϰڽ��ϴ�.','25 ~ 29������ �޽��ϴ�.
���� 800 �̻� �� ���� IM�̻��� ���� ������ �޽��ϴ�.',null,null,'0','https://open.kakao.com/o/sUB5AwEb',1,5,'1','/studyloop/views/host/img/�Ｚ.png',to_date('19/09/16','RR/MM/DD'),to_date('19/10/05','RR/MM/DD'),'������ �Ľ�����',64,1,1,22);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (23,'�ڵ��׽�Ʈ_���̽� ���� �غ��ؿ�! (GRWM)','�ڵ��׽�Ʈ_���̽����� ���� �غ��ؿ�!','���߿� �����ִ� �ڵ�����Ʈ ����Ʈ Ǯ�� ���� ���� �𸣴°� ���� �����ؿ�!


���� ���̽㸸!','- ��ҿ� ���α׷��� ��� �Ƿ������ ���Ͻô� ��

- �ʺ��� ����(�Թ��ڴ� ����) 

- �����ϰ� ���͵� ������ �� �帮�� ��

- ���� ����

','ù �� ����, ù���� ot �������� _ �̸�, ����, ��������, ��ҿ� �򰥷ȴ� �κ� ���ַ�,  �̸����ּ� ��ȯ, ������ ���͵� ��¥ �� 


�� �ڷδ� ���α׷��ӽ��� ���� �������� Ȱ��


�ϳ��� �ܰ躰�� Ǯ����� �𸣴°� ����


��� ù�� ������ �� �� ����Ʈ ȸ������ �ؼ� ù�� �ڱ�Ұ� �� �̸��� �ּҵ� �����սô�.

','�������� �ð�/��� ���� ����','���� ���ᰪ ������','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/python.png',to_date('19/09/16','RR/MM/DD'),to_date('19/10/15','RR/MM/DD'),'������ 11�� �Ľ���ġ ī��',61,1,2,23);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (24,'���� NCS ���͵� ���մϴ�','���� NCS ���� ������ �غ��ؼ� �մ� ���͵��Դϴ�.','���� �𿩼� NCS 1ȸ Ǯ�� ������ Ǯ��� �� ä��, �ǰ� ���� ','���� ���� ������(�ٸ� ������ ������ NCS �� ���� ��Ÿ ����� �غ���� �������)','Ǯ��� ���ǰ�� 1ȸ ä�� + Ǯ��
���ǰ�� ���� �ð��缭 Ǯ��
�� 3�ð� �ҿ� ����','���͵�� ��� ���ϳ� ���','3000','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/20081220062201_donglee_1.jpg',to_date('19/09/16','RR/MM/DD'),to_date('18/09/11','RR/MM/DD'),'��翪 ���͵��(����)',65,9,5,24);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (25,'������� ���� ���͵� ���� �Ͻ� �� ���ؿ�','������� ���͵� ���� �ؿ�','������� �����̽� �е� ���� �����ؿ�!
����� ķ��� ������ �����̸� ������ �е� ���������ص帳�ϴ�.
2�ð� ���࿹���Դϴ�.','���� �� �����ؼ� ���� ���� �� �𸣴� �����е����� ������� �մϴ�.
���� ������ �� �־� ���б� 1~2�г� ������ ������ �� �����ϴ�.
',null,null,'1000','https://open.kakao.com/o/sUB5AwEb',1,4,'1','/studyloop/views/host/img/dna.jpg',to_date('19/09/16','RR/MM/DD'),to_date('19/09/28','RR/MM/DD'),'�Ǵ뿪 �������ʽ�',64,18,35,25);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (26,'�彺ũ 4�� ���� �����ؿ�!','HSK 4�� �������� ���� ���⹮�� Ǯ�� ���� ���� ������ ���','4�޿� ������ �ܾ� �������� ���� ����, ���� ������ ���� �� �ϳ����� ������ ���� �ʺ�!','- hsk 4�� �� ���� ������ ��

- ����� ������ ���

- ���� ��� ����

','�Ϸ� �� 3�ð� ��Ƽ� 1�ð��� �ܾ� ���� (�ܿ��� ����, ���赵 ����)

������ 2�ð��� ���� ���� ���� �Ǵ� ���� ���� Ǯ�� �ϸ� ���� ������ ���ٹ�� ����',null,'���� ���ᰪ ������','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/hsk.jpg',to_date('19/09/16','RR/MM/DD'),to_date('19/09/25','RR/MM/DD'),'������ 1�� �ⱸ ��Ÿ���� ī�� ',61,1,28,26);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (27,'7�� ������ ���� �غ� ���� �ϽǺ�','7�� ������ ���� (������) �غ� ���� �ϽǺ� ���մϴ�.','1, ���� ���� �ΰ� ����
2. ���� �����ϰ� ���� Ǯ�����
3. ���� �𿩼� ��Ǯ','7�� �غ� ������ ���� �ϽǺ� ���մϴ�.(���� �����ź��̸� ����) ',null,null,'4000','https://open.kakao.com/o/sBXxwAxb',1,5,'1','/studyloop/views/host/img/bot.png',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'ȫ�� 9���� ���͵��',66,2,9,27);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (28,'���� 800�� ��ǥ ���͵� ���մϴ�','800���븦 ��ǥ���ϴ� ���� ���͵��Դϴ�.','�ܾ� ���� �ܿ��ͼ� �ܾ� �׽�Ʈ �� �����̱���
�� ȸ ���ǰ�� Ǯ�� ä������ �� �����Դϴ�.','������ ���� 600 �Ĺ��ε� 800���븦 ��ǥ�� �ϴ� ��ŭ �����밡 �����ô� �е��� �����մϴ�.','����','���� �ѹ� �ָ��ѹ� ����','3000�� Ŀ�Ǻ��','https://open.kakao.com/o/sBXxwAxb',1,6,'0','/studyloop/views/host/img/�ٿ�ε�.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'������ ��ó ī��',66,33,22,28);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (29,'�ѱ��� 1�� ���͵�','�ѱ��� 1�� �غ��ϱ� ���� ���͵��Դϴ�.','������ �ΰ��� ���� ���� �н� ��

�������� ���ǰ�縦 ���� ������ �����ϰ� ���� �ϱ� ������� �͵��� ���� �� �����Դϴ�.','������ �ѱ��翡 ���� ������ �ƿ� �����Ͻź��� ���� ����� �� �����ϴ�.',null,'�� ���� �Ϸ� ����','0','https://open.kakao.com/o/sBXxwAxb',1,5,'1','/studyloop/views/host/img/2016061001505_01.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'����',66,18,21,29);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (30,'�ѽ����� ���͵� ���մϴ�','�ѽ�������� �Ǳ� ���͵� ���մϴ�','���� �غ� ��ͼ� �ð� ��� �ǽ� ���ǰ�� �����մϴ�.
','�ѽ�������� ����Ϸ��� �� �̶�� �ƹ��� ȯ��',null,null,'����� 5000����','https://open.kakao.com/o/sBXxwAxb',1,3,'0','/studyloop/views/host/img/�ٿ�ε� (1).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'���з� 4�⿡ �丮�п� ��� �����մϴ�',67,12,17,30);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (31,'doe, a deer, a female deer ����ȸȭ���͵�','������� ���� ���͵� �����ƿ�','2�ð� ���� ����� �����Դϴ�.
1�ð��� ��ȭ, �̵�/���� �Ǵ� ������ ���� 1�ð��� �̸� ������ ��� �Ǵ� �ǰ߰����� �ϴ� ������ ȸȭ�� �����Ϸ��� �մϴ�.','20~35�� ���๫��',null,null,'1000','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/��ȸ.png',to_date('19/09/18','RR/MM/DD'),to_date('19/09/26','RR/MM/DD'),'����� �',64,10,49,31);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (32,'LG���� IT ���� ���� ���͵�','LG���� IT ���� ���� ���͵��Դϴ�.','1�� �����ڰ� �ǰ� ������ 4���� �������� �Ǽ� ���� ���ϰ� �ǵ�� ���ִ� ������ �����ұ� �մϴ�.','LG���� ���� �غ��Ͻô� ���ػ�',null,null,'0','https://open.kakao.com/o/sBXxwAxb',1,5,'0','/studyloop/views/host/img/2728413A53211EC410.png',to_date('19/09/18','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'������ ī��(����)',67,32,3,32);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (21,'7�� ���� �ڼҼ� ÷�� ���͵�','������ �غ��ϴ� ���ػ����� ���� �ڼҼ� ÷�� ���͵� �Դϴ�.','���� �غ��ϴ� ����� ���� �ڱ�Ұ����� ����� ���ư��鼭 ���� ÷�����ִ� ������� �����մϴ�.','���� �ڼҼ��̱� ������ �ظ��ϸ� �غ��غ��� �е� ���ַ� �ް� �ֽ��ϴ�.','�����Ͽ� 2�������� ��ȹ ���̸� ���� �������� �ٰ����� �������鳢�� �߰������� ���� �� �ֵ��� �� �����Դϴ�.','ȸ��� ī�� ���ᰪ�Դϴ�.','3000','https://open.kakao.com/o/sUB5AwEb',1,5,'1','/studyloop/views/host/img/180907_?????????TV1.png',to_date('19/09/16','RR/MM/DD'),to_date('21/08/19','RR/MM/DD'),'������ �α�(���� ����)',65,1,1,21);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (33,'��ȸ����м���2�� ���� �����ؿ�','��ȸ����м��� 2�� �ʱ� ���� ���� �غ��ؿ�.','��ȸ����м��� 2�� 2�� �Ǳ� �ѱ����� ������(2019) ���� é�� �ϳ��� �Ź� ���� ','������ ��� / ���͵� ������ �� �帱 ���','��ȸ����м��� 2�� 2�� �Ǳ� �ѱ����� ������(2019) ���� é�� �ϳ��� �Ź� ���� 

�Ŀ��� ����Ǯ�� + ���⹮�� �� ȸ�� ������ Ǯ�� ä���ؿ��� �𸣴°� ���� ����','��ȸ����м��� 2�� 2�� �Ǳ� �ѱ����� ������(2019) ���� ���� �غ�','���� ���ᰪ ������','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/�����.gif',to_date('19/09/18','RR/MM/DD'),to_date('19/11/01','RR/MM/DD'),'������ 3�� �� ����ī�� 2��',61,13,16,33);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (34,'�İ� �������� �����ϽǺ� ���մϴ�','�İ� ������ ���� ���� ���͵��Դϴ�.(���г�)','�Ʒ��� ���� ���͵� �����ϰ��� �ϴ� ������Դϴ�.

1. �˰���
2. DB
3. ��Ʈ��ũ
4. �ü��','�İ� 1~2�г� ���л� �� ���� ���ʰ� �����Ͻ� �е�','���� �𿩼� �������� �����ϸ鼭 �𸣴� �κ� ���� ã�ƺ��� �˷��ְ� �ϴ� ������ ������ �غ��Ϸ� �մϴ�.','���ǽ��� ���� ������ ���� ���� �����մϴ�.','���� ���ǽ� �뿩����','https://open.kakao.com/o/sBXxwAxb',2,5,'1','/studyloop/views/host/img/�ٿ�ε�1.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'�����α�',67,19,31,34);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (35,'����Ʈ ���� ������ ��','����Ʈ ���� �Ͻ� ������ ���մϴ�','�� 2�ð� ���࿹��
1�ð� �� - ����Ʈ
30�� - ������ �����','�ٷ��� ������� �����ź�(���� ���Ͱ��� ��Ϸ��� ��)','���͹� Ʈ���̴� ���࿹��(ũ�ν��� ��Ÿ��)','�ָ��� ��','��Ϻ� 3�� 10����','https://open.kakao.com/o/sBXxwAxb',1,3,'1','/studyloop/views/host/img/�ٿ�ε� (2).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/21','RR/MM/DD'),'ȭ�� ���̺����ｺ��',68,34,50,35);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (37,'������ ������ 1�� �ʱ�, �Ǳ� �غ� ���͵�','������ ������ 1�� �ʱ���� �Ǳ���� ���� �غ��� �� �����մϴ�.','�ʱ�� ������������ 1�� å ���� �����ؼ� �����ϸ� ���� �ٽ��ϴ�.
�Ǳ�� �ʱ� �հ� �� �����ϵ��� �ϰڽ��ϴ�.','������������ 1�� �ڰ��� �ʿ��Ͻ� �� ���',null,'��Ҵ� �����ε� ��õ ������ ����','ī����','https://open.kakao.com/o/sBXxwAxb',1,10,'1','/studyloop/views/host/img/800x0.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'���� �ֺ� ī��',68,39,15,37);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (38,'����ȸ��(����, �ݸ���, ���� ��) ���� ���� �غ��Ͻ� ��','���� ȸ�� ���� ���� �غ��ϴ� ������� ���� ���͵��Դϴ�.','����ȸ�� Ư���� �������� ��� IT ������ ����� ������ IT ���θ� ���� ���մϴ�.(�ڵ��׽�Ʈ ����)','����ȸ�� ���� �غ��Ͻô� ��',null,null,'3000','https://open.kakao.com/o/sBXxwAxb',1,8,'1','/studyloop/views/host/img/�ٿ�ε� (3).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'�������� ��ó',69,22,1,38);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (39,'SKCT ���� �غ��ϽǺ�','�� �Ϲݱ�  SKCT ���� �غ��ؿ�','���ǰ�� Ǯ�� ä�� 
������ �� 2ȸ (�׳� Ǯ�� �̸� Ǯ����� �Ϸ翡 2ȸ�� ���)','SKCT �غ��Ͻô� ��',null,null,'Ŀ�Ǻ�','https://open.kakao.com/o/sBXxwAxb',1,6,'1','/studyloop/views/host/img/255772436.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/30','RR/MM/DD'),'�Ż翪 ī���Ľ���ġ',69,5,2,39);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (40,'ȫ�� ���뷯�� ���̼���!! ��ħ�� �����սô�','��ħ 9�ù��뿡 ������ ���� �ѹ��� �پ��','�� �� ��� �𿩼� ���� �ѹ��� �ٰ� ���� �ػ�','1���� ��� ��ħ�� �ΰ��� �ǰ���� ���','���� ���� �ȿ��ų� ������ ��Ģ�� 5���� ������

ȫ�� 1�⿡�� �𿩼� ���� �ѹ��� �ٰ� ( �� 30 �� ~ 1�ð� �ҿ� ���� ) ���� �ػ� ',null,'5���� ( �����̳� �Ἦ �ÿ��� ) ','https://open.kakao.com/o/sUB5AwEb',1,6,'1','/studyloop/views/host/img/����.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/01','RR/MM/DD'),'ȫ�� 1�� ��',61,2,51,40);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (42,'���ð��� ����� �ʿ��Ͻź� ���� �����ؿ�','���� ����� ���� �����ϸ鼭 ���� ����!','�� ���Ǻ��� ����Ǯ�� + ��ų ���ַ� ���� ','���� ����� �ʿ��Ͻ� �� ','�ܾ��� ���ؼ� �ܾ� ���� ���� �����ؿ°� ����Ǯ��',null,'���� ���ᰪ ������','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/tf.jpg',to_date('19/09/19','RR/MM/DD'),to_date('19/10/01','RR/MM/DD'),'ķ�۽�Ÿ� 3�� �� ����',70,37,25,42);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (43,'����ó����� ���͵� ���մϴ�','����ó����� �ʱ� 2020�� ��� ���͵��մϴ�.','�� �� ���� �� é�;� ������ ���� Ǯ��

å ������ ������� + ���⹮�� Ǯ�� ','��ó�� �ʿ��� ���','�� �� ���� �� é�;� ������ ���� Ǯ��
--> ����� ù �� �ͼ� ���� ���� ����

å ������ ������� + ���⹮�� Ǯ�� 
--> ��������� �̱����� ��ó�� ���ַ� ',null,'���� ���ᰪ ������','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/wgr.jpg',to_date('19/09/19','RR/MM/DD'),to_date('19/11/01','RR/MM/DD'),'��ǿ� 8���ⱸ �������ʽ� 2�� ū ���̺�',71,7,12,43);

/*�Ÿ� ���� radian �Լ� */
CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER) 
RETURN NUMBER DETERMINISTIC 
IS
BEGIN
  /*
  -- radians = degrees / (180 / pi)
  -- RETURN nDegrees / (180 / ACOS(-1)); but 180/pi is a constant, so...
  */
  RETURN nDegrees / 57.29577951308232087679815481410517033235;
END RADIANS;
 
 
 
create or replace function DISTNACE_WGS84( H_LAT in number, H_LNG in number, T_LAT in number, T_LNG in number)
return number deterministic
is
begin
  return ( 6371.0 * acos(  
          cos( radians( H_LAT ) )*cos( radians( T_LAT /* ���� */ ) )
          *cos( radians( T_LNG /* �浵 */ )-radians( H_LNG ) )
          +
          sin( radians( H_LAT ) )*sin( radians( T_LAT /* ���� */ ) )        
         ));
end DISTNACE_WGS84;


commit;



