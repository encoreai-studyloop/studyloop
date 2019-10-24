
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
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'fff@fff.fff','김이름','ireum12345','pic',to_date('89/07/24','RR/MM/DD'),'남','010-1234-5667','12345','0',0,0,to_date('19/07/24','RR/MM/DD'),'경기 성남시 분당구 판교역로 235 (삼평동)@101호','13494', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'alice91897@gmail.com','신유진','신뉴','pic',to_date('96/09/18','RR/MM/DD'),'여','01095793739','Dtmth9918!!','1',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 삼성로 150 (대치동)@107동 303호','06288', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'jaeyoung@gmail.com','대조영','조02','pic',to_date('09/12/16','RR/MM/DD'),'남','0111234567','!234o','1',0,0,to_date('19/07/24','RR/MM/DD'),'경기 고양시 일산서구 일현로 123 (탄현동)@발해아파트 2동 9호','10241', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'joonil@naver.com','윤준일','chocoz','pic',to_date('19/06/30','RR/MM/DD'),'남','01095959595','1234','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강동구 풍산로 237 (강일동)@어딘가','05208', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'abcde@abc.de','천둥','thunder','pic',to_date('10/01/01','RR/MM/DD'),'여','010-1234-7890','12345','1',0,0,to_date('19/07/24','RR/MM/DD'),'제주특별자치도 제주시 첨단로 242 (영평동)@산 242','63309', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'abc@email.com','마이클','michael','pic',to_date('19/07/09','RR/MM/DD'),'여','010-0101-1111','111','0',0,0,to_date('19/07/24','RR/MM/DD'),'경기 성남시 분당구 판교역로28번길 3-5 (백현동)@백화점','13536', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'abcd@naver.com','강나다','다나강','pic',to_date('19/07/27','RR/MM/DD'),'여','01056789012','!234o6','1',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 개포로32길 13 (개포동, 삼성파크빌)@3동 701호','06309', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'abcde@hanmail.net','홍길동','redroad','pic',to_date('89/12/14','RR/MM/DD'),'여','01034567890','!234o67','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 개포로124길 27 (일원동, 삼성사원아파트)@6동 8호','06339', '0', '0', '0', '0', '0');
Insert into ENCORE.WS_USER  values (SEQ_WS_USER_id.NEXTVAL,'yoojinshin9918@gmail.com','신유진','신뉴99','pic',to_date('96/09/18','RR/MM/DD'),'성별','01041639857','111!!','0',0,0,to_date('19/07/24','RR/MM/DD'),'서울 강남구 삼성로 150 (대치동)@미도아파트 207동 1407호','06288', '0', '0', '0', '0', '0');


/*스터디 시간 데이터 */
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/09/20','RR/MM/DD'),'3@6@','15:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/07/26','RR/MM/DD'),'2@3@','16:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/08/19','RR/MM/DD'),'1@2@3@4@5@6@','08:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/08/19','RR/MM/DD'),'0@2@4@','14:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/11/19','RR/MM/DD'),'2@4@','20:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/09/19','RR/MM/DD'),'0@1@2@3@','15:45');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/08/01','RR/MM/DD'),'0@1@2@3@4@5@6@','14:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/07/25','RR/MM/DD'),'3@','00:00');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/09/11','RR/MM/DD'),'2@5@','19:15');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL,to_date('19/08/03','RR/MM/DD'),'5@','15:03');
Insert into ENCORE.WS_STUDYTIME (ID,SDATE,SDAY,STIME) values (SEQ_WS_STUDYTIME_id.NEXTVAL ,to_date('19/08/19','RR/MM/DD'),'0@1@2@3@4@6@','05:00');



/* 스터디 데이터 */
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'나라건국할 사람!!!!','같이 나라 건국에 대해 의견 공유를 해봅시당','하루 6시간 잡고 3시간 정치토론, 3시간 무술스터디 진행예정
','쫄보 아니면 됨','차차 진행해보면서 커리큘럼 넣을 예정인데 제가 나라 건국해 본 경험 있어서 믿고 따라오면 됨
일단 사회학 중심으로 공부해봅시다',null,'5000','https://open.kakao.com/o/sBXxwAxb',1,3333,'1','\studyloop\views\host\img\T3s2Bnn.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/20','RR/MM/DD'),'종로역 1번 출구 앞 스벅',3,3,43,1);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'돈이 없어서 취업 빨리 하실분 구합니다','취업이 궁하신분들을 위한 속성 스터디입니다.','일단 저희 스터디는 다른거 없고 빠르게 취직하기 위해 서로에게 자극을 주는 방식으로 진행됩니다.
욕설, 폭언, 폭행 모두 가능합니다. ','걍 빨리 취직하고싶은 사람','따로 없음','올때 멘탈강화 하고오셈','4천원','https://open.kakao.com/o/sBXxwAxb',1,5,'0','\studyloop\views\host\img\eclipse.png',to_date('19/07/24','RR/MM/DD'),to_date('19/09/19','RR/MM/DD'),'사당역 5출 스타벅스',4,8,7,2);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'정보보안 스터디','정보보안기사 자격증과 모의해킹 스터디입니다.','하반기 정보보안기사 자격증 필기, 실기 함께 준비해요. 

하루 최소 2시간씩 공부하며, 

필기 합격 후 실기 준비와 실습 병행합니다.','컴퓨터 전공이거나 관련 공부 경험 있으신 분, 
보안 쪽 진로 희망하시는 분이면 좋겠습니다.','- 정보보안개론

- 운영체제

- 네트워크보안

- 시스템보안

- 해킹사례연구','파스쿠찌 음료 비용 개인적으로 준비하시면 됩니다~','0','https://open.kakao.com/o/sBXxwAxb',2,5,'1','\studyloop\views\host\img\image_readtop_2018_194894_15221182793253362.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'강남역 파스쿠찌',1,1,31,3);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'심리학 학과보충 _  심리학 연구 방법론 공부 및 직접 실험 설계','심리학 학과 보충 수업으로 심리학 연구 방법론 같이 공부 하실 분 구해요. ','Introduction to Psychology Research Methods _ Howitt and Cramer 교재로 같이 공부 

챕터별로 피피티 자료 나눠드릴 거임 

연구 방법론 배우고 후에는 배운거 토대로 실제 실험 설계 및 가상 이론까지 정리','심라학 2~3학년 
2학기 대비 또는 재수강땐 만점을 얻고 싶은 분','매번 올 때 마다 챕터 한개 끝나고 끝난 후에 서로 퀴즈 문제 내기


하루에 약 2시간에서 2시간 반 정도 소모

/

일주일에 3번 할 예정( 요일과 시간은 협의 가능 ) ',null,'음료값 정도','https://open.kakao.com/o/sBXxwAxb',1,10,'1','\studyloop\views\host\img\시카고.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/01','RR/MM/DD'),'강남역 11출 할리스',2,1,41,4);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'자바 공부할 사람?.?','자바를 같이 공부해봅시다','하루 4시간 잡고 1시간 이론 공부, 3시간 코딩해봅시다','코딩 좋아하면 상관없음',null,null,'0','https://open.kakao.com/o/sBXxwAxb',1,7,'1','\studyloop\views\host\img\자바개발자(1).jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/10/20','RR/MM/DD'),'강남역 11번 출구 앞 할리스',3,1,31,5);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'오라클 DB 스터디','오라클 DB 아직도 모르니?','형이 친절하게 알려줄게
1. oracle 11g xe 를 깐다
2. cmd 창을 켠다
3. 접속한다.
4. 쿼리 날린다.

쉽지?','오라클 개초보','일단 깔아봐',null,'없음','https://open.kakao.com/o/sBXxwAxb',1,15,'0','\studyloop\views\host\img\oracle11g.png',to_date('19/07/24','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'인사동 카페골목',4,13,12,6);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'커뮤니케이션 졸업 포트폴리오용 영상 만들기','커뮤니케이션 학 _졸업 포트폴리오용 영상 만들기 ','대본, 연출, 연기, 카메라 / 음향 감독 전부 다 구함

','- 졸작 겁나 급하신 분

- 방송국 / 영화사 취업하려는데 영상 포트폴리오 필요하신 분

- 시간 약속 잘 지킬거구 저처럼 똥줄 타신 분 만( 추진력을 위해 )','그 날 아이디어 또는 진전 있을 때 까지 집에 못감

정확한 시간은 오픈 채팅으로 구할거고 그 뒤로는 대본에 따라 촬영할 시간에 각자 알아서 필요한거 챙기고 오시면 됌',null,'알아서 돈 필요할거 같음 가져와','https://open.kakao.com/o/sBXxwAxb',1,20,'1','\studyloop\views\host\img\시카고1.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/01','RR/MM/DD'),'홍대 8출 ',2,2,44,7);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'26일 시험 벼락치기 스터디','스터디원 급구입니다!!','26일 시험 대비로 
25일 모여서 밤샘공부합니다.','열심히 공부하실분 아무나 오세요!!!','시험 예상문제 각자 준비해서 공유하고 질의응답 하는 방식으로 진행합니다.','출결은 자유롭게 열심히 합시다~','10000','https://open.kakao.com/o/sBXxwAxb',1,5,'0','\studyloop\views\host\img\thunderstorm-71366_1280.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/07/25','RR/MM/DD'),'엔코아 지하',5,1,31,8);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'컴퓨터공학 스터디','java와 javascript 공부 모임입니다','2시간 java 공부
1시간 oracle 공부
1시간 javascript 공부 입니다','java, javascript 프로젝트 경험이 있는 분을 우대합니다','일단 한달정도 스터디를 진행해보고 한달 후 회의해서 세부 커리큘럼을 만들겠습니다','목동 및 마포 거주자 우대합니다','회당 10000원','abc.kakao.com',1,5,'1','\studyloop\views\host\img\agent2.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'오목교역 탐앤탐스',6,5,31,9);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'같이 체력단련해봅시다','나라 건국할 사람 스터디원이 같이 병행하면 좋을 스터디!','하루 3시간 잡고 2시간 칼, 1시간 맨몸 ㄱㄱ','운동 꽤 좀 하는 사람이면 좋을 듯. 빡세게 나갈 거임','세부 커리큘럼 이런 거 생각 안 해 봄. 난 쿨남이니까','열심히 해봅시다','3000','https://open.kakao.com/o/sBXxwAxb',1,43,'0','\studyloop\views\host\img\쥬몽.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/07/30','RR/MM/DD'),'신사역 3번 출구 앞 헬스장',3,4,50,10);
Insert into ENCORE.WS_STUDYINFO (ID,TITLE,INTRO,PROCESS,TARGET,CURRICULUM,SCOMMENT,SCOST,CHAT_URL,CUR_PERSONNEL,MAX_PERSONNEL,TERM,PICTURE,REGDATE,DEADLINE,PLACE,USER_ID,LOC_ID,CAT_ID,STUDYTIME_ID) values (SEQ_WS_STUDYINFO_id.NEXTVAL,'아침 조깅','아침 조깅 할 사람 ','그딴거 없고 걍 뛸 거임 
살 빼','빨리 와 안그럼 누나한테 혼난다','걍 뛰어',null,'지각할 때마다 5천만원','https://open.kakao.com/o/sBXxwAxb',1,20,'1','\studyloop\views\host\img\다운로드.jpg',to_date('19/07/24','RR/MM/DD'),to_date('19/08/19','RR/MM/DD'),'강남역부터 한강까지 한바퀴 뛸 거임',9,1,51,11);


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



