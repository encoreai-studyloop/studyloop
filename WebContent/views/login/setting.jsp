<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="project" value="/studyloop/views/login/"/>
<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_input" value="가입 페이지"/>
<c:set var="page_confirm" value="아이디 중북확인"/>
<c:set var="page_login" value="로그인 페이지"/>
<c:set var="page_delete" value="회원탈퇴 페이지"/>
<c:set var="page_modify" value="회원 수정 페이지"/>
<c:set var="page_jusosearch" value="주소 검색"/>
<c:set var="msg_main" value="회원이 아니시면 가입을 해주세요"/>
<c:set var="msg_input" value="회원정보를 작성해 주세요 "/>
<c:set var="msg_id_x" value="는 사용하실 수 없습니다"/>
<c:set var="msg_id_o" value="는 사용 가능합니다"/>
<c:set var="msg_login" value="회원가입에 성공했습니다. 로그인 해주세요."/>
<c:set var="msg_login_error" value="아이디 혹은 비밀번호를 다시 확인해주세요."/>
<c:set var="msg_login_main" value="님 안녕하세요."/>
<c:set var="msg_modify" value="회원 정보를 수정해주세요"/>
<c:set var="msg_passwd" value="탈퇴를 위한 비밀번호를 입력하세요"/>
<c:set var="msg_mod_passwd" value="수정을 위한 비밀번호를 입력하세요"/>
<c:set var="msg_juso_search" value="검색하시고자 하는 [동, 읍, 면] 을 입력해주세요. ex) 서초동"/>

<c:set var="str_id" value="ID"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_repasswd" value="비밀번호 확인"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_reg_date" value="가입일"/>
<c:set var="str_juso" value="주소"/>

<c:set var="btn_login" value="Login"/>
<c:set var="btn_cancel" value="Cancel"/>
<c:set var="btn_input" value="Submit"/>
<c:set var="btn_input_cancel" value="Revert"/>
<c:set var="btn_ok" value="Check"/>
<c:set var="btn_ok_cancel" value="Cancel"/>
<c:set var="btn_modify" value="Modify"/>
<c:set var="btn_delete" value="Erase"/>
<c:set var="btn_logout" value="Logout"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>
