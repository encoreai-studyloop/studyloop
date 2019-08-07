/**
 * script.js
 */

var applyconfirm = "작성한 내용으로 스터디에 신청하시겠습니까?";
var signinconfirm = "스터디를 신청하려면 로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?";
var adconfirm = "광고를 보고 포인트를 적립하시겠습니까?";

var emptyschool = "학교가 입력되지 않았습니다.";
var emptyschool_status = "학적 상태가 체크되지 않았습니다.";
var emptyschool_major = "학과가 입력되지 않았습니다.";
var emptypurpose = "스터디 참여 목적이 입력되지 않았습니다.";
var emptygoal = "스터디 참여 목표가 입력되지 않았습니다.";

var applyerror = "스터디 신청 중 에러가 발생했습니다.";
var pointcheck = "포인트가 적립되어 참석자 명단을 조회할 수 있습니다.";
var resultcheck = "스터디 신청이 완료되었습니다.\n수락 상황은 마이페이지에서 확인할 수 있습니다.";



function applycheck() {
	
	var radioCheck = function( name ){
		var radioArr = document.getElementsByName( name );
		
		for( i=0; i < radioArr.length; i++ ){
			if( radioArr[i].checked ){
				radioValue = radioArr[i].value;
				return radioValue;
			}
		}
	}
	var radioschool = radioCheck( "radio-school" );

	if ( applyform.school.value == "" ) {
		alert( emptyschool );
		applyform.school.focus;
		return false;
	} else if ( radioschool == undefined ) {
		alert( emptyschool_status );
		return false;
	} else if ( applyform.major.value == "" ) {
		alert( emptyschool_major );
		applyform.major.focus;
		return false;
	}
	else if ( applyform.purpose.value == "" ) {
		alert( emptypurpose );
		applyform.purpose.focus;
		return false;
	} else if ( applyform.goal.value == "" ) {
		alert( emptygoal );
		applyform.goal.focus;
		return false;
	} else {
		if ( confirm( applyconfirm ) ) {
			return true;
		} else {
		return false;
		}
	}
}

function openapplyform() {
	window.open('applyForm.do', '${tab_qna}', 'width=990, height=700, top=35, left=155');
}

function openqna() {
	window.open('boardlist.do', '${btn_apply}', 'width=1175, height=700, top=35, left=155');
}

function signedcheck() {
	if ( confirm( signinconfirm ) ) {
		location.href="login.do";
    } else {
        return false;
    }
}

function adcheck() {
	if ( confirm( adconfirm ) ) {
		return true;
	} else 
		return false;
}