
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
	-- 게시글신고 고유번호
	id number NOT NULL,
	-- 게시글 신고 내용
	content varchar2(1000) NOT NULL,
	-- 게시글 신고시간
	time timestamp NOT NULL,
	-- 신고 한 유저 닉네임
	reporter_nick varchar2(50) NOT NULL,
    -- 신고 당한 유저 닉네임
    suspect_nick varchar2(50) NOT NULL,
	-- 스터디 게시글 제목
	article_title varchar2(200) NOT NULL,
    -- 스터디 제목
	study_title varchar2(200) NOT NULL,
	-- 신고 카테고리 고유번호
	repcat_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_attend
(
	-- 출석테이블 고유번호
	-- 
	id number NOT NULL,
	-- 출석 날짜
	attend_date date NOT NULL,
	-- 출석여부
	attendance number DEFAULT 0 NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	-- 스터디 고유번호
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_attendee
(
	-- 참석자정보 고유번호
	id number NOT NULL,
	-- 해당 참석자의 참여 목적
	purpose varchar2(300) NOT NULL,
	-- 해당 참석자의 목표
	goal varchar2(100) NOT NULL,
	-- 참석자가 작성한 자기소개
	intro varchar2(300),
	-- 참석자가 작성한 요청 사항
	request varchar2(300),
	-- 신청 시각
	regdate date NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	-- 스터디 고유번호
	study_id number NOT NULL,
	-- 프로세스 고유번호
	regprocess_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_board
(
	-- 스터디 게시판 글 번호
	id number NOT NULL,
	-- 게시글 제목
	title varchar2(300) NOT NULL,
	-- 게시글 내용
	content varchar2(3000) NOT NULL,
	-- 게시글 비밀번호
	passwd varchar2(30) NOT NULL,
	-- 게시글이 작성된 시간
	logtime timestamp NOT NULL,
	-- 게시글 공개 여부 ( 0 : 공개 / 1 : 비공개 )
	secret varchar2(10) DEFAULT '0' NOT NULL,
	-- 게시글의 공지 여부 ( 0 : 일반글 / 1 : 공지 )
	notice varchar2(10) DEFAULT '0' NOT NULL,
    -- 조회수
    readcount number NOT NULL,
    -- 댓글
    ref number NOT NULL,
    -- 댓글 스텝
    re_step number NOT NULL,
    -- 댓글 레벨
    re_level number NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	-- 스터디 고유번호
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_category
(
	-- 카테고리 고유번호
	id number NOT NULL,
	-- 대분류
	big varchar2(30) NOT NULL,
	-- 중분류
	middle varchar2(30) NOT NULL,
	-- 소분류
	small varchar2(30) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_CERTIFICATE
(
	id number NOT NULL,
	-- 자격증명
	name varchar2(50) NOT NULL,
	-- 점수 및 등급
	score varchar2(30) NOT NULL,
	-- 취득일
	obtain_date date NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_EXP
(
	id number NOT NULL,
	-- 경력 사항
	experience varchar2(200) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	-- 유저 고유 번호
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_LANGUAGE
(
	id number NOT NULL,
	-- 언어명
	language varchar2(30) NOT NULL,
	-- 자격증명
	-- 
	name varchar2(40) NOT NULL,
	-- 점수 및 등급
	score varchar2(30) NOT NULL,
	-- 취득일
	obtain_date date NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_LOCATION
(
    -- 지역고유번호
    id number NOT NULL,
    -- 시/도
    state_city varchar2(30) NOT NULL,
    -- 상세지역
    detail_loc varchar2(30) NOT NULL,
    -- 위도
    latitude number NOT NULL, 
    -- 경도
    longitude number NOT NULL, 
    PRIMARY KEY (id)
);


CREATE TABLE WS_REGPROCESS
(
	-- 프로세스 고유번호
	id number NOT NULL,
	-- 프로세스 이름(1차신청대기/1차수락거절/2차수락대기/2차수락거절/최종수락) )
	name varchar2(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_reportcategory
(
	-- 신고 카테고리 고유번호
	id number NOT NULL,
	-- 신고 카테고리 이름
	-- 
	name varchar2(50) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);


CREATE TABLE WS_SCHEDULE
(
	-- 일정 관리 고유번호
	id number NOT NULL,
	-- 시작날짜
	start_date date NOT NULL,
    -- 끝날짜
	end_date date,
	-- 내용
	content varchar2(300) NOT NULL,
    -- 클래스 이름
    classname varchar2(50) NOT NULL,
    -- 종일 여부
    allDay varchar(10) NOT NULL,
	-- 스터디 고유번호
	study_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_SCHOOL
(
	id number NOT NULL,
	-- 학교 명
	name varchar2(50) NOT NULL,
	-- 전공명
	major varchar2(50) NOT NULL,
	-- 졸업 유무 0 - 재학 1 - 졸업 2 - 휴학
	status varchar2(10) NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studyinfo
(
	-- 스터디 고유번호
	id number NOT NULL,
	-- 스터디 제목
	title varchar2(300) NOT NULL,
	-- 스터디 소개
	intro varchar2(1000) NOT NULL,
	-- 스터디 진행 방식
	process varchar2(1000) NOT NULL,
	-- 스터디 모집 대상
	target varchar2(500) NOT NULL,
	-- 스터디 세부 커리큘럼
	curriculum varchar2(3000),
	-- 스터디장 추가 코멘트
	scomment varchar2(1000),
	-- 스터디 비용
	scost varchar2(100),
	-- 스터디 오픈채팅 링크
	chat_url varchar2(300) NOT NULL,
	-- 스터디 현재 참석 인원
	cur_personnel number NOT NULL,
	-- 스터디 모집 예정 인원
	max_personnel number NOT NULL,
	-- 스터디 형태 ( 0 : 원데이 / 1 : 정기 )
	term varchar2(10) NOT NULL,
	-- 스터디 사진 링크
	picture varchar2(1000) NOT NULL,
    -- 스터디 등록 시간
    regdate date NOT NULL,
	-- 모집 마감기한
	deadline date,
    -- 상세 장소
    place varchar2(100) NOT NULL,
	-- 유저 고유 번호
	user_id number NOT NULL,
	-- 지역고유번호
	loc_id number NOT NULL,
	-- 카테고리 고유번호
	cat_id number NOT NULL,
    -- 스터디 시간 고유번호
    studytime_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studyreport
(
	-- 스터디신고 고유번호
	id number NOT NULL,
	-- 스터디신고내용
	content varchar2(1000) NOT NULL,
	-- 유저신고시간
	time timestamp NOT NULL,
	-- 신고한 유저 닉네임
	reporter_nick varchar2(50) NOT NULL,
    -- 신고 당한 유저 닉네임
	suspect_nick varchar2(50) NOT NULL,
    -- 스터디 제목
	study_title varchar2(200) NOT NULL,
	-- 신고 카테고리 고유번호
	repcat_id number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_studytime
(
	-- 스터디시간 고유번호
	id number NOT NULL,
	-- 스터디 시작날짜 ( 연 / 월 / 일 )
	sdate date NOT NULL,
	-- 스터디 날짜에 해당하는 요일
	-- ( 0 : 월 / 1 : 화 / 2 : 수 / 3 : 목 / 4 : 금 / 5 : 토 / 6 : 일 )
	sday varchar2(15) NOT NULL,
	-- 스터디 상세 시간
	stime varchar2(100) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE WS_USER
(
	-- 유저 고유 번호
	id number NOT NULL,
	-- 유저 이메일
	email varchar2(50) NOT NULL UNIQUE,
	-- 유저 이름
	name varchar2(20) NOT NULL,
	-- 유저 별명
	nick varchar2(30) NOT NULL UNIQUE,
	-- 유저 사진
	pic varchar2(100) NOT NULL,
	-- 유저 생일
	birth date NOT NULL,
	-- 유저 성별 : 남, 여
	gender varchar2(10) NOT NULL,
	-- 유저 휴대전화번호
	phone varchar2(30) NOT NULL UNIQUE,
	-- 유저 비밀번호
	passwd varchar2(20) NOT NULL,
	-- 프리미엄 가입 여부(0 - 미가입, 1 - 가입)
	prime varchar2(10) DEFAULT '0' NOT NULL,
	-- 유저 평점
	rate number(5,0) NOT NULL,
    -- 유저 포인트
    point number NOT NULL,
	-- 가입날짜
	regdate date NOT NULL,
	-- 유저 주소
	address varchar2(200) NOT NULL,
	-- 유저 우편번호
	zipcode varchar2(10) NOT NULL,
    -- 유저 유입 경로
    visit varchar(50) NOT NULL,
    -- 유저 관심사
    interest varchar(50) NOT NULL,
    -- 유저 목표
    goal varchar(50) NOT NULL,
    -- 유저 스터디 주최 경험
    open varchar(10) NOT NULL,
    -- 유저 스터디 참여 경험
    part varchar(10) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE ws_userreport
(
	-- 유저신고 고유번호
	-- 
	id number NOT NULL,
	-- 유저 신고내용
	content varchar2(1000) NOT NULL,
	-- 유저신고시간
	time timestamp NOT NULL,
	-- 신고한 유저 닉네임
	reporter_nick varchar2(50) NOT NULL,
    -- 신고 당한 유저 닉네임
    suspect_nick varchar2(50) NOT NULL,
	-- 신고 카테고리 고유번호
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

COMMENT ON COLUMN ws_articlereport.id IS '게시글신고 고유번호';
COMMENT ON COLUMN ws_articlereport.content IS '게시글 신고 내용';
COMMENT ON COLUMN ws_articlereport.time IS '게시글 신고시간';
COMMENT ON COLUMN ws_articlereport.reporter_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_articlereport.article_id IS '스터디 게시판 글 번호';
COMMENT ON COLUMN ws_articlereport.repcat_id IS '신고 카테고리 고유번호';
COMMENT ON COLUMN ws_attend.id IS '출석테이블 고유번호
';
COMMENT ON COLUMN ws_attend.attend_date IS '출석 날짜';
COMMENT ON COLUMN ws_attend.attendance IS '출석여부';
COMMENT ON COLUMN ws_attend.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_attend.study_id IS '스터디 고유번호';
COMMENT ON COLUMN ws_attendee.id IS '참석자정보 고유번호';
COMMENT ON COLUMN ws_attendee.purpose IS '해당 참석자의 참여 목적';
COMMENT ON COLUMN ws_attendee.goal IS '해당 참석자의 목표';
COMMENT ON COLUMN ws_attendee.intro IS '참석자가 작성한 자기소개';
COMMENT ON COLUMN ws_attendee.request IS '참석자가 작성한 요청 사항';
COMMENT ON COLUMN ws_attendee.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_attendee.study_id IS '스터디 고유번호';
COMMENT ON COLUMN ws_attendee.regprocess_id IS '프로세스 고유번호';
COMMENT ON COLUMN ws_board.id IS '스터디 게시판 글 번호';
COMMENT ON COLUMN ws_board.title IS '게시글 제목';
COMMENT ON COLUMN ws_board.content IS '게시글 내용';
COMMENT ON COLUMN ws_board.passwd IS '게시글 비밀번호';
COMMENT ON COLUMN ws_board.logtime IS '게시글이 작성된 시간';
COMMENT ON COLUMN ws_board.secret IS '게시글 공개 여부 ( 0 : 공개 / 1 : 비공개 )';
COMMENT ON COLUMN ws_board.notice IS '게시글의 공지 여부 ( 0 : 일반글 / 1 : 공지 )';
COMMENT ON COLUMN ws_board.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_board.study_id IS '스터디 고유번호';
COMMENT ON COLUMN ws_category.id IS '카테고리 고유번호';
COMMENT ON COLUMN ws_category.big IS '대분류';
COMMENT ON COLUMN ws_category.middle IS '중분류';
COMMENT ON COLUMN ws_category.small IS '소분류';
COMMENT ON COLUMN WS_CERTIFICATE.name IS '자격증명';
COMMENT ON COLUMN WS_CERTIFICATE.score IS '점수 및 등급';
COMMENT ON COLUMN WS_CERTIFICATE.obtain_date IS '취득일';
COMMENT ON COLUMN WS_CERTIFICATE.user_id IS '유저 고유 번호';
COMMENT ON COLUMN WS_EXP.experience IS '경력 사항';
COMMENT ON COLUMN WS_EXP.user_id IS '유저 고유 번호';
COMMENT ON COLUMN WS_LANGUAGE.language IS '언어명';
COMMENT ON COLUMN WS_LANGUAGE.name IS '자격증명
';
COMMENT ON COLUMN WS_LANGUAGE.score IS '점수 및 등급';
COMMENT ON COLUMN WS_LANGUAGE.obtain_date IS '취득일';
COMMENT ON COLUMN WS_LANGUAGE.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_location.id IS '지역고유번호';
COMMENT ON COLUMN ws_location.state_city IS '시/도';
COMMENT ON COLUMN ws_location.detail_loc IS '상세지역';
COMMENT ON COLUMN WS_REGPROCESS.id IS '프로세스 고유번호';
COMMENT ON COLUMN WS_REGPROCESS.name IS '프로세스 이름(1차신청대기/1차수락거절/2차수락대기/2차수락거절/최종수락) )';
COMMENT ON COLUMN ws_reportcategory.id IS '신고 카테고리 고유번호';
COMMENT ON COLUMN ws_reportcategory.name IS '신고 카테고리 이름
';
COMMENT ON COLUMN WS_SCHEDULE.id IS '일정 관리 고유번호';
COMMENT ON COLUMN WS_SCHEDULE.schedule_date IS '날짜';
COMMENT ON COLUMN WS_SCHEDULE.content IS '내용';
COMMENT ON COLUMN WS_SCHEDULE.study_id IS '스터디 고유번호';
COMMENT ON COLUMN WS_SCHOOL.name IS '학교 명';
COMMENT ON COLUMN WS_SCHOOL.major IS '전공명';
COMMENT ON COLUMN WS_SCHOOL.status IS '졸업 유무';
COMMENT ON COLUMN WS_SCHOOL.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_studyinfo.id IS '스터디 고유번호';
COMMENT ON COLUMN ws_studyinfo.title IS '스터디 제목';
COMMENT ON COLUMN ws_studyinfo.intro IS '스터디 소개';
COMMENT ON COLUMN ws_studyinfo.process IS '스터디 진행 방식';
COMMENT ON COLUMN ws_studyinfo.target IS '스터디 모집 대상';
COMMENT ON COLUMN ws_studyinfo.curriculum IS '스터디 세부 커리큘럼';
COMMENT ON COLUMN ws_studyinfo.scomment IS '스터디장 추가 코멘트';
COMMENT ON COLUMN ws_studyinfo.scost IS '스터디 비용';
COMMENT ON COLUMN ws_studyinfo.chat_url IS '스터디 오픈채팅 링크';
COMMENT ON COLUMN ws_studyinfo.place IS '스터디장이 작성한 상세 장소';
COMMENT ON COLUMN ws_studyinfo.cur_personnel IS '스터디 현재 참석 인원';
COMMENT ON COLUMN ws_studyinfo.max_personnel IS '스터디 모집 예정 인원';
COMMENT ON COLUMN ws_studyinfo.term IS '스터디 형태 ( 0 : 원데이 / 1 : 정기 )';
COMMENT ON COLUMN ws_studyinfo.picture IS '스터디 사진 링크';
COMMENT ON COLUMN ws_studyinfo.deadline IS '모집 마감기한';
COMMENT ON COLUMN ws_studyinfo.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_studyinfo.loc_id IS '지역고유번호';
COMMENT ON COLUMN ws_studyinfo.cat_id IS '카테고리 고유번호';
COMMENT ON COLUMN ws_studyreport.id IS '스터디신고 고유번호';
COMMENT ON COLUMN ws_studyreport.content IS '스터디신고내용';
COMMENT ON COLUMN ws_studyreport.time IS '유저신고시간';
COMMENT ON COLUMN ws_studyreport.user_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_studyreport.repcat_id IS '신고 카테고리 고유번호';
COMMENT ON COLUMN ws_studyreport.study_id IS '스터디 고유번호';
COMMENT ON COLUMN ws_studytime.id IS '스터디시간 고유번호';
COMMENT ON COLUMN ws_studytime.sdate IS '스터디 날짜 ( 연 / 월 / 일 )';
COMMENT ON COLUMN ws_studytime.sday IS '스터디 날짜에 해당하는 요일
( 0 : 월 / 1 : 화 / 2 : 수 / 3 : 목 / 4 : 금 / 5 : 토 / 6 : 일 )';
COMMENT ON COLUMN ws_studytime.stime IS '스터디 상세 시간';
COMMENT ON COLUMN WS_USER.id IS '유저 고유 번호';
COMMENT ON COLUMN WS_USER.email IS '유저 이메일';
COMMENT ON COLUMN WS_USER.name IS '유저 이름';
COMMENT ON COLUMN WS_USER.nick IS '유저 별명';
COMMENT ON COLUMN WS_USER.pic IS '유저 사진';
COMMENT ON COLUMN WS_USER.birth IS '유저 생일';
COMMENT ON COLUMN WS_USER.gender IS '유저 성별 : 남, 여';
COMMENT ON COLUMN WS_USER.phone IS '유저 휴대전화번호';
COMMENT ON COLUMN WS_USER.passwd IS '유저 비밀번호';
COMMENT ON COLUMN WS_USER.prime IS '프리미엄 가입 여부(0 - 미가입, 1 - 가입)';
COMMENT ON COLUMN WS_USER.rate IS '유저 평점';
COMMENT ON COLUMN WS_USER.regdate IS '가입날짜';
COMMENT ON COLUMN WS_USER.address IS '유저 주소';
COMMENT ON COLUMN WS_USER.zipcode IS '유저 우편번호';
COMMENT ON COLUMN ws_userreport.id IS '유저신고 고유번호
';
COMMENT ON COLUMN ws_userreport.suspect_id IS '피의자 고유번호';
COMMENT ON COLUMN ws_userreport.content IS '유저 신고내용';
COMMENT ON COLUMN ws_userreport.time IS '유저신고시간';
COMMENT ON COLUMN ws_userreport.reporter_id IS '유저 고유 번호';
COMMENT ON COLUMN ws_userreport.repcat_id IS '신고 카테고리 고유번호';

/* 테스트용 데이터 삽입*/


/*카테고리 데이터*/
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '대기업' ,'자소서');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '대기업' ,'인적성');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '대기업' ,'면접');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공기업' ,'자소서');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공기업' ,'NCS');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공기업' ,'면접');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '중소기업' ,'자소서');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '중소기업' ,'면접');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공무원' ,'7급');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공무원' ,'9급');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '취업', '공무원' ,'5급');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '컴퓨터' ,'정보처리기사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '컴퓨터' ,'정보보안기사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '컴퓨터' ,'컴퓨터활용능력');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '컴퓨터' ,'리눅스마스터');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '사회' ,'사회조사분석사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '요리' ,'한식조리기사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '요리' ,'일식조리기사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '요리' ,'양식조리기사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '사회' ,'유통관리사');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '자격증', '사회' ,'한국사능력검정시험');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '영어' ,'TOEIC');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '영어' ,'OPIC');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '영어' ,'SAT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '영어' ,'TOEFL');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '일본어' ,'JPLT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '일본어' ,'JPT');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '중국어' ,'HSK');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '어학', '독일어' ,'ZD');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'기계공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'컴퓨터공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'화학공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'환경공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'로봇공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '공학' ,'생명공학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '인문' ,'국어국문학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '인문' ,'철학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '인문' ,'사학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '인문' ,'유학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '인문' ,'중어중문학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '사회' ,'심리학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '사회' ,'통계학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '사회' ,'사회학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '사회' ,'커뮤니케이션학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '자연과학' ,'물리학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '자연과학' ,'수학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '자연과학' ,'생물학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '전공', '자연과학' ,'지구과학');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '기타', '회화' ,'영어회화');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '기타', '운동' ,'웨이트');
INSERT INTO WS_CATEGORY VALUES(SEQ_ws_CATEGORY_id.NEXTVAL, '기타', '운동' ,'조깅');

/* 신고 카테고리 데이터 */
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '욕설');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '비방');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '사기');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '사생활 침해');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '불성실한 태도');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '음란한 글');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '광고성 글');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '도배성 글');
INSERT INTO ws_reportcategory VALUES(SEQ_ws_reportcategory_id.NEXTVAL, '기타');

/* 지역 데이터 */
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '강남', 37.498144, 127.027645);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '홍대', 37.556733, 126.923640);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '신촌', 37.555141, 126.936895);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '종로', 37.570158, 126.983027);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '신사', 37.516288, 127.019852);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '목동', 37.524550, 126.875173);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '잠실', 37.513312, 127.100097);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '양재', 37.483826, 127.034657);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '사당', 37.477029, 126.981723);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '노원', 37.656217, 127.063224);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '은평', 37.619102, 126.921202);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '혜화', 37.582326, 127.001811);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '성수', 37.544552, 127.055959);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '인사동', 37.573514, 126.984628);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경기', '고양', 37.653294, 126.843112);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '부산', '서면', 35.157752, 129.059074);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '인천', '송도', 37.384085, 126.669269);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '건대', 37.540411, 127.069175);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '신림', 37.484200, 126.929669);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '마포', 37.539688, 126.945943);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '성북', 37.603330, 127.024716);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '영등포', 37.519899, 126.910335);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '용산', 37.534733, 126.970668);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '왕십리', 37.560624, 127.038649);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '구로', 37.498387, 126.856689);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '동작',37.504209, 126.951639);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '수유', 37.638702, 127.020542);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '회기', 37.589637, 127.057805);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '충무로', 37.561493, 126.993791);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '미아', 37.627488, 127.027695);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '청량리', 37.586905, 127.047116);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '서울', '강서', 37.561261, 126.823061);
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경기', '수원', 37.282965, 127.015077 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경기', '고양', 37.659522, 126.830691 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경기', '분당', 37.373957, 127.117045 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경기', '의정부', 37.737490, 127.052330 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '인천', '송도', 37.384128, 126.648875 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '인천', '구월동', 37.447909, 126.709874 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '인천', '부평', 37.491808, 126.722004 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '대전', '대전역', 36.332665, 127.434121 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '대구', '중앙', 35.865322, 128.592080 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '부산', '서면', 35.158229, 129.059964 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '부산', '부경대', 35.134244, 129.103096 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '부산', '해운대', 35.203188, 129.188330 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '부산', '남포', 35.097725, 129.030553 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '경상도', '구미', 36.204927, 128.353218 );
INSERT INTO WS_LOCATION VALUES(SEQ_WS_LOCATION_id.NEXTVAL, '울산', '울산대', 35.551032, 129.262648 );



/* 신청 프로세스 데이터 */
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '수락대기');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '1차거절');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '1차수락');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '최종거절');
INSERT INTO WS_REGPROCESS VALUES(SEQ_WS_REGPROCESS_id.NEXTVAL, '최종수락');

/* 유저 데이터 */
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'fff@fff.fff','김이름','ireum12345','pic',to_date('89/07/24','RR/MM/DD'),'남','010-1234-5667','12345','0',0,0,to_date('19/07/24','RR/MM/DD'),'경기 성남시 분당구 판교역로 235 (삼평동)@101호','13494','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'alice91897@gmail.com','신유진','신뉴','pic',to_date('96/09/18','RR/MM/DD'),'여','01095793739','Dtmth9918!!','1',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 삼성로 150 (대치동)@107동 303호','06288','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'jaeyoung@gmail.com','대조영','조02','pic',to_date('09/12/16','RR/MM/DD'),'남','0111234567','!234o','1',0,0,to_date('19/07/24','RR/MM/DD'),'경기 고양시 일산서구 일현로 123 (탄현동)@발해아파트 2동 9호','10241','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'joonil@naver.com','윤준일','chocoz','pic',to_date('19/06/30','RR/MM/DD'),'남','01095959595','1234','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강동구 풍산로 237 (강일동)@어딘가','05208','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcde@abc.de','천둥','thunder','pic',to_date('10/01/01','RR/MM/DD'),'여','010-1234-7890','12345','1',0,0,to_date('19/07/24','RR/MM/DD'),'제주특별자치도 제주시 첨단로 242 (영평동)@산 242','63309','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abc@email.com','마이클','michael','pic',to_date('19/07/09','RR/MM/DD'),'여','010-0101-1111','111','0',0,0,to_date('19/07/24','RR/MM/DD'),'경기 성남시 분당구 판교역로28번길 3-5 (백현동)@백화점','13536','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcd@naver.com','강나다','다나강','pic',to_date('19/07/27','RR/MM/DD'),'여','01056789012','!234o6','1',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 개포로32길 13 (개포동, 삼성파크빌)@3동 701호','06309','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcde@hanmail.net','홍길동','redroad','pic',to_date('89/12/14','RR/MM/DD'),'여','01034567890','!234o67','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 개포로124길 27 (일원동, 삼성사원아파트)@6동 8호','06339','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'yoojinshin9918@gmail.com','신유진','신뉴99','pic',to_date('96/09/18','RR/MM/DD'),'성별','01041639857','111!!','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 삼성로 150 (대치동)@미도아파트 207동 1407호','06288','0','0','0','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'eee@dd.co','dd','dd','pic',to_date('19/08/27','RR/MM/DD'),'여','dd','dd','0',0,0,to_date('19/08/12','RR/MM/DD'),'dd@dd','dd','on@on@on','PC','MJ','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'seongsuu@gmail.com','조성수','조성수다','pic',to_date('91/12/28','RR/MM/DD'),'남','01033757609','tjdtnWld!234','0',0,0,to_date('19/08/29','RR/MM/DD'),'서울 강동구 고덕로 130 (암사동, 프라이어팰리스)@안알랴쥼','05256','on@on','BG','LA','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'shinnew124@gmail.com','신유진','배고파124','pic',to_date('90/02/07','RR/MM/DD'),'여','01093234299','124','0',0,0,to_date('19/09/16','RR/MM/DD'),'경기 고양시 일산서구 일현로 123 (탄현동)@엔코아 건물 3층 301호','10241','on@on','BG','JB','2','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'encore@naver.com','김철수','chulsoo123','pic',to_date('95/02/15','RR/MM/DD'),'남','01053232322','1234','0',0,0,to_date('19/09/16','RR/MM/DD'),'서울 강남구 강남대로 298 (역삼동)@빌딩','06253','on','PU','CT','1','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'cindy@naver.com','신디영','cindy0','pic',to_date('19/09/26','RR/MM/DD'),'여','01066981926','1234','1',0,0,to_date('19/09/16','RR/MM/DD'),'서울 강남구 개포로 205 (개포동)@3동 505호','06303','on','BG','MJ','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'encore@daum.net','엔코아','encore123','pic',to_date('91/01/10','RR/MM/DD'),'남','01019191191','1111','1',0,0,to_date('19/09/18','RR/MM/DD'),'서울 서대문구 봉원사2길 10-2 (신촌동)@신촌','03721','on','PU','JB','0','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'playdata@naver.com','플레이','playdata123','pic',to_date('00/06/01','RR/MM/DD'),'여','0106565656','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'서울 서초구 서초중앙로 지하 31 (서초동)@남터','06718','on','CK','CT','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'wtf@naver.com','박재우','jaewoop3344','pic',to_date('99/02/17','RR/MM/DD'),'남','01095666565','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'경기 고양시 덕양구 간절로 77 (향동동)@고양아파트 202동 401호','10546','on','NE','JB','1','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'ncman@naver.com','김엔씨','게임회사취직','pic',to_date('93/02/10','RR/MM/DD'),'남','01039393939','111','0',0,0,to_date('19/09/18','RR/MM/DD'),'경기 성남시 분당구 대왕판교로644번길 12 (삼평동)@엔씨소프트건물','13494','on','BG','JB','0','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'qwerty1234@gmail.com','김쿼티','qwerty','pic',to_date('94/03/04','RR/MM/DD'),'남','01011112222','1234','1',0,0,to_date('19/09/18','RR/MM/DD'),'경기 성남시 분당구 분당로 190 (분당동, 샛별마을라이프아파트)@101동 1013호','13581','on@on','FR','JB','3','2');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'poiuy0987@gmail.com','이호산','poiuy','pic',to_date('91/12/23','RR/MM/DD'),'여','01098765432','0987','0',0,0,to_date('19/09/18','RR/MM/DD'),'인천 연수구 선학로 14 (선학동, 선학동 시영아파트)@17동 1307호','21938','on@on','BG','JB','3','3');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'needjob@naver.com','구직중','gujik','pic',to_date('94/06/08','RR/MM/DD'),'남','01097979797','111','1',0,0,to_date('19/09/19','RR/MM/DD'),'경기 성남시 분당구 경부고속도로 409 (삼평동)@삼평아파트','13473','on','BG','JB','0','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'needspec@naver.com','스펙왕','스펙짱','pic',to_date('98/01/30','RR/MM/DD'),'여','01068686868','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'서울 양천구 공항대로 552 (목동)@목동아파트','07946','on','IT','CT','1','1');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'goyangmajor@naver.com','김전공','고양시전공우먼','pic',to_date('00/02/09','RR/MM/DD'),'여','0100101010','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'경기 고양시 덕양구 화중로 164 (화정동, 은빛마을5단지아파트)@503동 1102호','10474','on','IT','CT','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'etc@naver.com','기타맨','etcman','pic',to_date('99/02/04','RR/MM/DD'),'남','01029292929','111','0',0,0,to_date('19/09/19','RR/MM/DD'),'서울 강남구 개포로 202 (개포동)@개포동','06307','on','CO','AC','0','0');
Insert into ENCORE.WS_USER (ID,EMAIL,NAME,NICK,PIC,BIRTH,GENDER,PHONE,PASSWD,PRIME,RATE,POINT,REGDATE,ADDRESS,ZIPCODE,VISIT,INTEREST,GOAL,OPEN,PART) values (SEQ_WS_USER_id.NEXTVAL,'abcd@gmail.com','박영희','yhp','pic',to_date('95/01/17','RR/MM/DD'),'여','01029293949','1234','0',0,0,to_date('19/09/16','RR/MM/DD'),'서울 서초구 과천대로 786 (방배동)@절','06761','on','PC','JB','0','0');
---------------------------------------------

/*스터디 시간 데이터 */
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


/* 스터디 데이터 */
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (46,'유기화학스터디 같이해요','화학전공자들이 같이 공부하는 모임','1시간 유기화학기초, 1시간 고분자 등 심화과목 공부 진행할 예정입니다.','화학에 대해 기본 지식이 있는 전공자 1~3학년',null,'없음','0','https://open.kakao.com/o/sUB5AwEb',1,6,'1','/studyloop/views/host/img/화학.png',to_date('19/09/19','RR/MM/DD'),to_date('19/09/30','RR/MM/DD'),'쿠카쿠 카페',64,36,32,46);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (47,'물리학 스터디 같이 하실 분','물리학 전공도들의 모임','30분 정도 토론하고 1시간 정도는 전공책, 논문, 각종 자료 갖고 공부하죠','물리학에 관심있는 모든 물리학도 환영(고등학생은 x)','없음','회비는 각종 유료 논문 자료를 구입하는 데 이용될 예정입니다.','2000','https://open.kakao.com/o/sUB5AwEb',1,4,'1','/studyloop/views/host/img/물리하.jfif',to_date('19/09/19','RR/MM/DD'),to_date('19/09/28','RR/MM/DD'),'카페7그램',64,27,45,47);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (48,'한국사 시험 같이 1급 따요','코앞에 닥친 한국사 시험을 벼락치기로 같이 준비','1시간 기출 풀이, 1시간 오답풀이 및 분석 을 한 주기로 3회 반복','한국사 1급 목표인 아무나','잡담, 사담 없을 예정',null,'0','https://open.kakao.com/o/sUB5AwEb',1,3,'0','/studyloop/views/host/img/한국사1.png',to_date('19/09/19','RR/MM/DD'),to_date('19/10/12','RR/MM/DD'),'스타벅스',64,45,21,48);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (49,'아침 조깅 같이 해요','하루 일과 시작 전 새벽, 아침 조깅 같이 해요','10분 스트레칭, 40분 조깅, 10분 마무리 스트레칭으로 진행하려고 합니다~','20~30대 관심있는 누구나!','오전 5시반부터 6시반까지 진행될 예정입니다.','열심히 같이 건강해져봐요ㅎㅎ','0','https://open.kakao.com/o/sUB5AwEb',1,2,'1','/studyloop/views/host/img/조깅.jfif',to_date('19/09/19','RR/MM/DD'),to_date('19/09/24','RR/MM/DD'),'양재천 입구',64,8,51,49);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (22,'삼성자소서 준비 같이 하실 분 구해요','성실하게 스터디 참여해서 같이 삼성가실 분 구합니다.','스터디 전까지 각자의 자소서를 작성해온 후 스터디 시간에 각자의 자소서를 첨삭하는 시간을 갖도록 하겠습니다.','25 ~ 29세까지 받습니다.
토익 800 이상 및 오픽 IM이상의 성적 소유자 받습니다.',null,null,'0','https://open.kakao.com/o/sUB5AwEb',1,5,'1','/studyloop/views/host/img/삼성.png',to_date('19/09/16','RR/MM/DD'),to_date('19/10/05','RR/MM/DD'),'강남역 파스쿠찌',64,1,1,22);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (23,'코딩테스트_파이썬 같이 준비해요! (GRWM)','코딩테스트_파이썬으로 같이 준비해요!','시중에 나와있는 코딩데스트 사이트 풀고 오고 서로 모르는거 같이 공부해요!


언어는 파이썬만!','- 평소에 프로그래밍 언어 실력향상을 원하시는 분

- 초보자 포함(입문자는 제외) 

- 성실하고 스터디 분위기 안 흐리실 분

- 성별 무관

','첫 날 제외, 첫날은 ot 느낌으로 _ 이름, 나이, 전공유무, 평소에 헷갈렸던 부분 위주로,  이메일주소 교환, 앞으로 스터디 날짜 등 


그 뒤로는 프로그래머스와 백준 저지등을 활용


하나씩 단계별로 풀어나가며 모르는거 공유


적어도 첫날 까지는 두 개 사이트 회원가입 해서 첫날 자기소개 시 이메일 주소도 공유합시다.

','앞으로의 시간/장소 협의 가능','각자 음료값 정도만','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/python.png',to_date('19/09/16','RR/MM/DD'),to_date('19/10/15','RR/MM/DD'),'강남역 11출 파스쿠치 카페',61,1,2,23);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (24,'한전 NCS 스터디 구합니다','한전 NCS 같이 열심히 준비해서 뚫는 스터디입니다.','같이 모여서 NCS 1회 풀고 저번에 풀어온 것 채점, 의견 공유 ','한전 지원 예정자(다른 한전과 유사한 NCS 를 가진 기타 공기업 준비생도 상관없음)','풀어온 모의고사 1회 채점 + 풀이
모의고사 같이 시간재서 풀기
총 3시간 소요 예정','스터디룸 비용 당일날 결산','3000','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/20081220062201_donglee_1.jpg',to_date('19/09/16','RR/MM/DD'),to_date('18/09/11','RR/MM/DD'),'사당역 스터디룸(미정)',65,9,5,24);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (25,'생명공학 전공 스터디 같이 하실 분 구해요','생명공학 스터디 같이 해요','생명공학 전공이신 분들 같이 공부해요!
교재는 캠밸로 진행할 예정이며 없으신 분들 제본나눔해드립니다.
2시간 진행예정입니다.','대학 갓 입학해서 뭐가 뭔지 잘 모르는 생명학도들을 대상으로 합니다.
쉬운 내용일 수 있어 대학교 1~2학년 정도가 적합할 것 같습니다.
',null,null,'1000','https://open.kakao.com/o/sUB5AwEb',1,4,'1','/studyloop/views/host/img/dna.jpg',to_date('19/09/16','RR/MM/DD'),to_date('19/09/28','RR/MM/DD'),'건대역 엔제리너스',64,18,35,25);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (26,'흐스크 4급 같이 공부해요!','HSK 4급 한자정리 부터 기출문제 풀이 까지 같이 공부할 사람','4급에 나오는 단어 정리부터 기출 문제, 자주 나오는 유형 등 하나부터 열까지 같이 궝부!','- hsk 4급 꼭 따고 싶으신 분

- 제대로 공부할 사람

- 성별 상관 없음

','하루 약 3시간 잡아서 1시간은 단어 정리 (외우기는 각자, 시험도 생략)

나머지 2시간은 문제 유형 공부 또는 기출 문제 풀이 하며 각자 문제의 접근방법 공유',null,'각자 음료값 정도만','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/hsk.jpg',to_date('19/09/16','RR/MM/DD'),to_date('19/09/25','RR/MM/DD'),'강남역 1번 출구 스타벅스 카페 ',61,1,28,26);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (27,'7급 공무원 시험 준비 같이 하실분','7급 공무원 시험 (지방직) 준비 같이 하실분 구합니다.','1, 과목 별로 인강 공유
2. 각자 공부하고 문제 풀어오기
3. 같이 모여서 문풀','7급 준비 빡세게 같이 하실분 구합니다.(경험 있으신분이면 좋음) ',null,null,'4000','https://open.kakao.com/o/sBXxwAxb',1,5,'1','/studyloop/views/host/img/bot.png',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'홍대 9출쪽 스터디룸',66,2,9,27);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (28,'토익 800대 목표 스터디 구합니다','800점대를 목표로하는 토익 스터디입니다.','단어 각자 외워와서 단어 테스트 볼 예정이구요
한 회 모의고사 풀고 채점까지 할 예정입니다.','점수가 지금 600 후반인데 800점대를 목표로 하는 만큼 점수대가 맞으시는 분들을 모집합니다.','없음','주중 한번 주말한번 예정','3000원 커피비용','https://open.kakao.com/o/sBXxwAxb',1,6,'0','/studyloop/views/host/img/다운로드.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'수원역 근처 카페',66,33,22,28);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (29,'한국사 1급 스터디','한국사 1급 준비하기 위한 스터디입니다.','공유된 인강을 통해 사전 학습 후

만나서는 모의고사를 통해 내용을 점검하고 서로 암기 비법같은 것들을 공유 할 예정입니다.','기존에 한국사에 대한 지식이 아예 전무하신분은 조금 힘드실 것 같습니다.',null,'토 일중 하루 예정','0','https://open.kakao.com/o/sBXxwAxb',1,5,'1','/studyloop/views/host/img/2016061001505_01.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'미정',66,18,21,29);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (30,'한식조리 스터디 구합니다','한식조리기사 실기 스터디 구합니다','각자 준비물 사와서 시간 재고 실습 모의고사 진행합니다.
','한식조리기사 취득하려는 분 이라면 아무나 환영',null,null,'대관비 5000원씩','https://open.kakao.com/o/sBXxwAxb',1,3,'0','/studyloop/views/host/img/다운로드 (1).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'대학로 4출에 요리학원 대관 가능합니다',67,12,17,30);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (31,'doe, a deer, a female deer 영어회화스터디','즐겁지만 알찬 스터디를 만들어보아요','2시간 동안 진행될 예정입니다.
1시간은 영화, 미드/영드 또는 강연을 보고 1시간은 이를 주제로 토론 또는 의견공유를 하는 식으로 회화를 진행하려고 합니다.','20~35세 남녀무관',null,null,'1000','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/영회.png',to_date('19/09/18','RR/MM/DD'),to_date('19/09/26','RR/MM/DD'),'노원역 놀숲',64,10,49,31);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (32,'LG전자 IT 직무 면접 스터디','LG전자 IT 직무 면접 스터디입니다.','1명씩 면접자가 되고 나머지 4명은 면접관이 되서 서로 평가하고 피드백 해주는 식으로 진행할까 합니다.','LG전자 면접 준비하시는 취준생',null,null,'0','https://open.kakao.com/o/sBXxwAxb',1,5,'0','/studyloop/views/host/img/2728413A53211EC410.png',to_date('19/09/18','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'강서구 카페(미정)',67,32,3,32);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (21,'7대 대기업 자소서 첨삭 스터디','대기업을 준비하는 취준생들을 위한 자소서 첨삭 스터디 입니다.','각자 준비하는 기업에 대해 자기소개서를 써오면 돌아가면서 서로 첨삭해주는 방식으로 진행합니다.','대기업 자소서이기 때문에 왠만하면 준비해보신 분들 위주로 받고 있습니다.','일주일에 2번정도로 계획 중이며 원서 마감일이 다가오면 구성원들끼리 추가적으로 모일 수 있도록 할 예정입니다.','회비는 카페 음료값입니다.','3000','https://open.kakao.com/o/sUB5AwEb',1,5,'1','/studyloop/views/host/img/180907_?????????TV1.png',to_date('19/09/16','RR/MM/DD'),to_date('21/08/19','RR/MM/DD'),'강남역 부근(추후 협의)',65,1,1,21);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (33,'사회조사분석사2급 같이 공부해요','사회조사분석사 2급 필기 시험 같이 준비해요.','사회조사분석사 2급 2차 실기 한권으로 끝내기(2019) 교재 챕터 하나씩 매번 나감 ','성실한 사람 / 스터디 분위기 안 흐릴 사람','사회조사분석사 2급 2차 실기 한권으로 끝내기(2019) 교재 챕터 하나씩 매번 나감 

후에는 문제풀이 + 기출문제 한 회씩 숙제로 풀고 채점해오고 모르는거 서로 질문','사회조사분석사 2급 2차 실기 한권으로 끝내기(2019) 교재 각자 준비','각자 음료값 정도만','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/사분제.gif',to_date('19/09/18','RR/MM/DD'),to_date('19/11/01','RR/MM/DD'),'성수동 3출 앞 스벅카페 2층',61,13,16,33);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (34,'컴공 전공공부 같이하실분 구합니다','컴공 학점을 위한 전공 스터디입니다.(저학년)','아래는 제가 스터디 진행하고자 하는 과목들입니다.

1. 알고리즘
2. DB
3. 네트워크
4. 운영체제','컴공 1~2학년 재학생 중 전공 기초가 부족하신 분들','같이 모여서 전공서적 공부하면서 모르는 부분 서로 찾아보고 알려주고 하는 간단한 식으로 준비하려 합니다.','강의실을 빌릴 대학은 추후 변경 가능합니다.','대학 강의실 대여예정','https://open.kakao.com/o/sBXxwAxb',2,5,'1','/studyloop/views/host/img/다운로드1.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'서울대부근',67,19,31,34);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (35,'웨이트 같이 조지실 분','웨이트 같이 하실 남성분 구합니다','총 2시간 진행예정
1시간 반 - 웨이트
30분 - 가벼운 유산소','근력이 어느정도 있으신분(서로 도와가며 운동하려고 함)','인터벌 트레이닝 진행예정(크로스핏 스타일)','주말은 쉼','등록비 3달 10만원','https://open.kakao.com/o/sBXxwAxb',1,3,'1','/studyloop/views/host/img/다운로드 (2).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/09/21','RR/MM/DD'),'화정 세이브존헬스장',68,34,50,35);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (37,'리눅스 마스터 1급 필기, 실기 준비 스터디','리눅스 마스터 1급 필기부터 실기까지 같이 준비할 분 모집합니다.','필기는 리눅스마스터 1급 책 같이 구매해서 공부하면 쉽게 붙습니다.
실기는 필기 합격 후 진행하도록 하겠습니다.','리눅스마스터 1급 자격증 필요하신 분 대상',null,'장소는 부평인데 인천 전지역 가능','카페비용','https://open.kakao.com/o/sBXxwAxb',1,10,'1','/studyloop/views/host/img/800x0.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'부평역 주변 카페',68,39,15,37);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (38,'게임회사(엔씨, 넷마블, 스게 등) 취준 같이 준비하실 분','게임 회사 취직 같이 준비하는 사람들을 위한 스터디입니다.','게임회사 특성상 인적성의 경우 IT 지식을 물어보기 때문에 IT 공부를 같이 겸합니다.(코딩테스트 포함)','게임회사 취직 준비하시는 분',null,null,'3000','https://open.kakao.com/o/sBXxwAxb',1,8,'1','/studyloop/views/host/img/다운로드 (3).jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/19','RR/MM/DD'),'영등포역 근처',69,22,1,38);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (39,'SKCT 같이 준비하실분','올 하반기  SKCT 같이 준비해요','모의고사 풀고 채점 
일주일 총 2회 (그날 풀고 미리 풀어오고 하루에 2회씩 담당)','SKCT 준비하시는 분',null,null,'커피비','https://open.kakao.com/o/sBXxwAxb',1,6,'1','/studyloop/views/host/img/255772436.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/30','RR/MM/DD'),'신사역 카페파스쿠치',69,5,2,39);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (40,'홍대 자취러들 모이세요!! 아침에 조깅합시다','아침 9시반쯤에 나가서 동네 한바퀴 뛰어요','걍 올 사람 모여서 동네 한바퀴 뛰고 각자 해산','1교시 없어도 아침형 인간이 되고싶은 사람','이유 없이 안오거나 늦으면 벌칙금 5만원 내야함

홍대 1출에서 모여서 동네 한바퀴 뛰고 ( 약 30 분 ~ 1시간 소요 예정 ) 각자 해산 ',null,'5만원 ( 지각이나 결석 시에만 ) ','https://open.kakao.com/o/sUB5AwEb',1,6,'1','/studyloop/views/host/img/ㅈㄱ.jpg',to_date('19/09/18','RR/MM/DD'),to_date('19/10/01','RR/MM/DD'),'홍대 1출 앞',61,2,51,40);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (42,'토플공부 고득점 필요하신분 같이 공부해요','토플 고득점 같이 공부하면서 점수 내요!','각 섹션별로 문제풀이 + 스킬 위주로 수업 ','토플 고득점 필요하신 분 ','단어장 정해서 단어 시험 보고 숙제해온거 문제풀이',null,'각자 음료값 정도만','https://open.kakao.com/o/sUB5AwEb',1,10,'1','/studyloop/views/host/img/tf.jpg',to_date('19/09/19','RR/MM/DD'),to_date('19/10/01','RR/MM/DD'),'캠퍼스타운역 3출 앞 스벅',70,37,25,42);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (43,'정보처리기사 스터디 구합니다','정보처리기사 필기 2020년 대비 스터디구합니다.','올 때 마다 한 챕터씩 나가고 문제 풀이

책 끝나면 요약정리 + 기출문제 풀이 ','정처기 필요한 사람','올 때 마다 한 챕터씩 나가고 문제 풀이
--> 교재는 첫 날 와서 같이 정할 거임

책 끝나면 요약정리 + 기출문제 풀이 
--> 요약정리는 이기주의 정처기 위주로 ',null,'각자 음료값 정도만','https://open.kakao.com/o/sUB5AwEb',1,8,'1','/studyloop/views/host/img/wgr.jpg',to_date('19/09/19','RR/MM/DD'),to_date('19/11/01','RR/MM/DD'),'잠실역 8번출구 앤젤리너스 2층 큰 테이블',71,7,12,43);

/*거리 계산용 radian 함수 */
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
          cos( radians( H_LAT ) )*cos( radians( T_LAT /* 위도 */ ) )
          *cos( radians( T_LNG /* 경도 */ )-radians( H_LNG ) )
          +
          sin( radians( H_LAT ) )*sin( radians( T_LAT /* 위도 */ ) )        
         ));
end DISTNACE_WGS84;


commit;



