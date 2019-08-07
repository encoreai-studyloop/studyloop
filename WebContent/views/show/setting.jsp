<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!-- project path -->
<c:set var="project" value="/studyloop/views/show/"/>


<!-- view page-->
<!-- tab -->
<c:set var="tab_summary" value="요약"/>
<c:set var="tab_info" value="스터디 정보"/>
<c:set var="tab_attendee" value="참석자 정보"/>
<c:set var="tab_chat" value="오픈채팅"/>
<c:set var="tab_qna" value="Q & A"/>

<!-- main str -->
<c:set var="str_studyintro" value="스터디 소개"/>
<c:set var="str_studyform" value="스터디 형태"/>
<c:set var="str_oneday" value="one-day"/>
<c:set var="str_regular" value="정기"/>
<c:set var="str_deadline" value="모집 마감일"/>
<c:set var="str_process" value="진행 방식"/>
<c:set var="str_target" value="모집 대상"/>
<c:set var="str_curriculum" value="커리큘럼"/>
<c:set var="str_cost" value="스터디 비용"/>
<c:set var="str_location" value="스터디 장소"/>
<c:set var="str_curpersonnel" value="현재 참석 인원"/>
<c:set var="str_maxpersonnel" value="모집 예정 인원"/>
<c:set var="str_attendee" value="현재 참석자 정보"/>
<c:set var="str_primiumfnc" value="  ( premium 기능  )"/>
<c:set var="str_comment" value="스터디장의 코멘트"/>
<c:set var="str_locinfo" value="위치 정보"/>
<c:set var="str_chatwith" value="스터디장과 오픈채팅 연결"/>

<!-- attendee str -->
<c:set var="str_master" value="스터디장"/>
<c:set var="str_order" value="순번"/>
<c:set var="str_school" value="학교명"/>
<c:set var="str_major" value="전공"/>
<c:set var="str_schoolstat" value="학적상태"/>
<c:set var="str_rate" value="평점"/>

<!-- sidebar str -->
<c:set var="str_spot" value="위치"/>
<c:set var="str_day" value="요일"/>
<c:set var="str_time" value="시간"/>
<c:set var="str_day" value="요일"/>
<c:set var="str_loc" value="장소"/>
<c:set var="str_acost" value="추가비용"/>

<!-- button -->
<c:set var="btn_chat" value="1:1채팅은 마이페이지에서 확인가능합니다"/>
<c:set var="btn_apply" value="스터디 신청하기"/>
<c:set var="btn_applyclosed" value="모집 마감"/>
<c:set var="btn_prev" value="이전으로"/>
<c:set var="btn_rmblur" value="참석자 보기"/>
<c:set var="btn_getad" value="광고 보기"/>

<!-- message -->
<c:set var="msg_emptyAttendee" value="아직 이 스터디에 참가한 스터디원이 없습니다. 첫 스터디원이 되어 주세요!"/>


<!-- apply page -->
<!-- button -->
<c:set var="btn_savedinfo" value="저장된 정보 불러오기"/>

<!-- table str -->
<c:set var="str_saveguide" value="※ 다음 스터디 신청 시 이번에 입력된 정보를 '${btn_savedinfo}' 버튼으로 불러올 수 있습니다."/>
<c:set var="str_applyinfo" value="신청 정보"/>
<c:set var="str_school" value="학교 (최종 학력)"/>
<c:set var="str_attending" value="재학"/>
<c:set var="str_graduate" value="졸업"/>
<c:set var="str_dropout" value="중퇴"/>
<c:set var="str_major" value="학과"/>

<c:set var="str_career" value="경력"/>
<c:set var="str_workspace" value="근무처"/>
<c:set var="str_dayworkstart" value="근무시작일"/>
<c:set var="str_dayworkend" value="근무종료일"/>
<c:set var="str_add" value="추가"/>
<c:set var="str_del" value="삭제"/>

<c:set var="str_langrade" value="어학점수"/>
<c:set var="str_lang" value="언어"/>
<c:set var="str_exam" value="시험명"/>
<c:set var="str_grade" value="점수/등급"/>
<c:set var="str_odate" value="취득일"/>

<c:set var="str_certificate" value="자격증"/>
<c:set var="str_cert" value="자격증명"/>

<c:set var="str_purpose" value="스터디 참여 목적"/>
<c:set var="str_goal" value="개인 목표"/>
<c:set var="str_aintro" value="자기소개"/>
<c:set var="str_arequest" value="요청사항"/>

<!-- placeholder -->
<c:set var="str_school_ex" value="ex) OO고등학교, OO대학교, OO대학원"/>
<c:set var="str_major_ex" value="학과가 없는 경우 '없음'"/>
<c:set var="str_career_ex" value="ex) OO 인턴, OO 근무"/>
<c:set var="str_lang_ex" value="어학성적 입력"/>
<c:set var="str_cert_ex" value="자격증 입력"/>
<c:set var="str_purpose_ex" value="스터디에 참여하는 목적을 적어주세요."/>
<c:set var="str_goal_ex" value="이 스터디 참여로 이룰 개인 목표를 적어주세요."/>
<c:set var="str_aintro_ex" value="자기소개를 자유롭게 작성해주세요."/>
<c:set var="str_arequest_ex" value="스터디장에게 요청 사항이 있다면 작성해주세요."/>


<!-- apply result page -->
<!-- page str -->
<c:set var="page_result" value="스터디 신청 완료"/>

<!-- message -->
<c:set var="msg_checkresult" value="신청한 스터디의 정보를 다시 한 번 확인해주세요."/>

<!-- button -->
<c:set var="btn_close" value="닫기"/>
<c:set var="btn_mypage" value="마이페이지로 이동"/>

