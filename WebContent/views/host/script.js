/**
 * 주최관리
 */

var titleerror = "스터디 이름을 설정하세요";
var imageerror = "이미지 등록";
var categoryerror = "카테고리를 선택하세요";
var termerror = "스터디 형태를 선택하세요";
var max_personnelerror = "모집인원을 입력하세요";

var introerror = "스터디소개를 입력하세요";
var processerror = "진행방식을 입력하세요";
var targeterror = "모집대상을 입력하세요";
var chat_urlerror = "채팅 링크를 남겨주세요";
var locationerror = "스터디 장소를 설정해주세요";
var sdayerror = "스터디 요일을 선택하세요";
var stimeerror = "스터디 시간을 설정하세요";
var sdateerror = "스터디 시작일을 설정하세요";


function erroralert(msg){
	alert(msg);
	history.back();
}

function titlecheck(){		
	if(!titleform.title.value){
		alert(titleerror);
		titleform.title.focus();
		return false;
	}
	if(!titleform.picture.value){
		alert(imageerror);
		titleform.picture.focus();
		return false;
	}
	if(!titleform.category.value){
		alert(categoryerror);
		return false;
	}
	if(!titleform.term.value){
		alert(termerror);
		return false;	
	}

	if(!titleform.max_personnel.value){
		alert(max_personnelerror);
		titleform.max_personnel.focus();
		return false;
	}
	if(!parseInt(titleform.max_personnel.value)){
		alert("인원 수는 숫자로만 입력가능합니다");
		titleform.max_personnel.focus();
		return false;
	}
}
	
function infocheck(){
	 if(!infoform.intro.value){
		alert(introerror);
		infoform.intro.focus();
		return false;
	}
	 if(!infoform.process.value){
		alert(processerror);
		infoform.process.focus();
		return false;
	}
	 else if(!infoform.target.value){
		alert(targeterror);
		infoform.target.focus();
		return false;
	}
	 else if(!infoform.chat_url.value){
		alert(chat_urlerror);
		infoform.chat_url.focus();
		return false;
	}
}
 
function schedulecheck(){
	if(!scheduleform.location.value){
		alert(locationerror);
		scheduleform.location.focus();
		return false;
	}
	if(!scheduleform.spelocation.value){
		alert("세부장소를 작성해주세요");
		scheduleform.spelocation.focus();
		return false;
	}
	if(!scheduleform.scostopt.value){
		alert("회비 유무를 선택해주세요");
		return false;
	}
/*	
	if(scheduleform.scostopt.value==option2){
		scheduleform.scost.value==0;
	}
	*/
	var check = 0;
	for(var i=0;i<scheduleform.sday.length;i++){
		if(scheduleform.sday[i].checked==false){
			check++;
		}
	} 
	if(check == 7){
		alert(sdayerror);
		return false;
	}
	
	if(!scheduleform.stime.value){
		alert(stimeerror);
		scheduleform.stime.focus();
		return false;
	}else if(!scheduleform.sdate.value){
		alert(sdateerror);
		scheduleform.sdate.focus();
		return false;	
	}
}

function modifycheck(){
	if(!modifyform.modtitle.value){
		alert("수정하실 스터디의 제목을 입력해주세요");
		modifyform.modtitle.focus();
		return false;
	}
	if(!modifyform.modpicture.value){
		alert("수정하실 스터디의 이미지를 업로드해주세요");
		return false;
	}
	if(!modifyform.modcategory.value){
		alert("수정하실 스터디의 카테고리를 선택해주세요");
		return false;
	}
	if(!modifyform.modterm.value){
		alert("수정하실 스터디의 형태를 선택해주세요");
		return false;
	}
	if(!modifyform.modmax_personnel.value){
		alert("수정하실 스터디의 모집인원을 입력해주세요");
		modifyform.modmax_personnel.focus();
		return false;
	}
	
	if(!parseInt(modifyform.modmax_personnel.value)){
		alert("인원 수는 숫자로만 입력가능합니다");
		modifyform.modmax_personnel.focus();
		return false;
	}
	
	if(!modifyform.moddeadline.value){
		alert("수정하실 스터디의 모집마감일을 입력해주세요");
		modifyform.moddeadline.focus();
		return false;
	}
	if(!modifyform.modintro.value){
		alert("수정하실 스터디의 소개를 입력해주세요");
		modifyform.modintro.focus();
		return false;
	}
	if(!modifyform.modprocess.value){
		alert("수정하실 스터디의 진행방식을 입력해주세요");
		modifyform.modrocess.focus();
		return false;
	}
	if(!modifyform.modtarget.value){
		alert("수정하실 스터디의 모집대상을 입력해주세요");
		modifyform.modtarget.focus();
		return false;
	}
	if(!modifyform.modchat_url.value){
		alert("수정하실 스터디의 채팅링크를 올려주세요");
		modifyform.modchat_url.focus();
		return false;
	}
	if(!modifyform.modlocation.value){
		alert("수정하실 스터디의 장소를 선택해주세요");
		return false;
	}
	if(!modifyform.modspelocation.value){
		alert("수정하실 스터디의 세부장소를 입력해주세요");
		modifyform.modspelocation.focus();
		return false;
	}
	if(!modifyform.modscost.value){
		alert("수정하실 스터디의 회비를 입력해주세요");
		modifyform.modscost.focus();
		return false;
	}
	
	var check = 0;
	for(var i=0;i<modifyform.sday.length;i++){
		if(modifyform.sday[i].checked==false){
			check++;
		}
	} 
	if(check == 7){
		alert("수정하실 스터디의 요일을 선택해주세요");
		return false;
	}
	
	if(!modifyform.modstime.value){
		alert("수정하실 스터디의 시간을 입력해주세요");
		return false;
	}
	if(!modifyform.modsdate.value){
		alert("수정하실 스터디의 시작일을 입력해주세요");
		return false;
	}

}


	


