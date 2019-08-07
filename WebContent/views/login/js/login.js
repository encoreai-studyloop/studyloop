function deleteProcess(){
	var email = $( "p.email" ).text();

	var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "delForm.do"); //요청 보낼 주소
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "email");
    hiddenField.setAttribute("value", email);
    form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    form.submit();
}

function modifyProcess(){
	var email = $( "p.email" ).text();

	var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "modForm.do"); //요청 보낼 주소
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "email");
    hiddenField.setAttribute("value", email);
    form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    form.submit();
}


function authProcess(){
	var f = document.submitform; //폼 name
	if(f.email.value ==null || !f.email.value.includes("@")){
		alert("잘못된 이메일입니다. 확인해주세요");
		return false;
	}
	else{
		var form = document.createElement("form");
	    form.setAttribute("charset", "UTF-8");
	    form.setAttribute("method", "Post");  //Post 방식
	    form.setAttribute("action", "authForm.do"); //요청 보낼 주소
	    
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "email");
	    hiddenField.setAttribute("value", f.email.value);
	    form.appendChild(hiddenField);
	    
	    document.body.appendChild(form);
	    form.submit();
	}

}

function modifyAuthProcess(){
	var f = document.submitform; //폼 name
	if(f.email.value ==null || !f.email.value.includes("@")){
		alert("잘못된 이메일입니다. 확인해주세요");
		return false;
	}
	else{
		var form = document.createElement("form");
	    form.setAttribute("charset", "UTF-8");
	    form.setAttribute("method", "Post");  //Post 방식
	    form.setAttribute("action", "modifyAuthForm.do"); //요청 보낼 주소
	    
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "email");
	    hiddenField.setAttribute("value", f.email.value);
	    form.appendChild(hiddenField);
	    
	    document.body.appendChild(form);
	    form.submit();
	}
}

function delAuthProcess(){
	var f = document.submitform; //폼 name
	if(f.email.value ==null || !f.email.value.includes("@")){
		alert("잘못된 이메일입니다. 확인해주세요");
		return false;
	}
	else{
		var form = document.createElement("form");
	    form.setAttribute("charset", "UTF-8");
	    form.setAttribute("method", "Post");  //Post 방식
	    form.setAttribute("action", "delAuthForm.do"); //요청 보낼 주소
	    
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "email");
	    hiddenField.setAttribute("value", f.email.value);
	    form.appendChild(hiddenField);
	    
	    document.body.appendChild(form);
	    form.submit();
	}
}

function delConfirm(id){
	if (window.confirm('정말 탈퇴하시겠습니까?'))
	{
	    location = "delPro.do?id="+id;
	}
	else
	{
	    location = "mypage.do?id="+id;
	}
}

function checkauthnum(randnum){
	if(document.getElementById("vernum").value == randnum){
		alert("이메일 인증에 성공하였습니다. 다음 단계로 진행해주세요.")
		document.getElementById("verfinish").style.display=""; 
		document.getElementById("verbutton").style.display="none"; 
	}
	else{
		alert("인증번호가 일치하지 않습니다")
	}
}


function submitUser(){
	
    var f = document.submitform; //폼 name
    var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "inputPro.do"); //요청 보낼 주소
 
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "email");
    hiddenField.setAttribute("value", f.email.value);
    form.appendChild(hiddenField);

    if(f.nick.value == null || f.nick.value ==""){
    	alert("닉네임을 입력하세요");
    	return false;
    }
    else{
    	console.log($("#nickres").text())
    	if($("#nickres").text() == "사용할 수 없는 닉네임 입니다."){   		
    		alert("사용 불가능한 닉네임 입니다.");
    		return false;
    	}
    }
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "nick");
    hiddenField.setAttribute("value", f.nick.value);
    form.appendChild(hiddenField);

    if(f.name.value == null || f.name.value ==""){
    	alert("이름을 입력하세요");
    	return false;
    }  
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "name");
    hiddenField.setAttribute("value", f.name.value);
    form.appendChild(hiddenField);
      
    if(f.birth.value == null || f.birth.value ==""){
    	alert("생년월일을 입력하세요");
    	return false;
    }    
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "birth");
    hiddenField.setAttribute("value", f.birth.value);
    form.appendChild(hiddenField);
    
    
    if(f.gender.value == null || f.gender.value =="0"){
    	alert("성별을 선택하세요");
    	return false;
    }  
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "gender");
    hiddenField.setAttribute("value", f.gender.value);
    form.appendChild(hiddenField);
    
    if(f.phone.value == null || f.phone.value ==""){
    	alert("전화번호를 입력하세요");
    	return false;
    }  
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "phone");
    hiddenField.setAttribute("value", f.phone.value);
    form.appendChild(hiddenField);
    
    if(f.passwd.value == null || f.passwd.value ==""){   	
    	alert("비밀번호를 입력하세요");
    	return false;
    } 
    else{
    	if(f.passwd.value != f.repasswd.value){
        	alert("비밀번호를 다시 확인하세요");
        	return false;
    	}
    }
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "passwd");
    hiddenField.setAttribute("value", f.passwd.value);
    form.appendChild(hiddenField);
    
    if(f.address.value == null || f.address.value ==""){   	
    	alert("주소를 입력하세요");
    	return false;
    } 
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "address");
    hiddenField.setAttribute("value", f.address.value);
    form.appendChild(hiddenField);
    
    if(f.saddress.value == null || f.saddress.value ==""){   	
    	alert("상세 주소를 입력하세요");
    	return false;
    } 
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "saddress");
    hiddenField.setAttribute("value", f.saddress.value);
    form.appendChild(hiddenField);
 
    
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "zipcode");
    hiddenField.setAttribute("value", f.zipcode.value);
    form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    form.submit();
}

function execDaumPostcode() {
    new daum.Postcode(
            {
                oncomplete : function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== ''
                            && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== ''
                            && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                    }
                    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('add').value = fullRoadAddr;
                    
                    
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        //예상되는 도로명 주소에 조합형 주소를 추가한다.
                        var expRoadAddr = data.autoRoadAddress
                                + extraRoadAddr;
                        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                + expRoadAddr + ')';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                + expJibunAddr + ')';

                    } else {
                        document.getElementById('guide').innerHTML = '';
                    }
                }
            }).open();
}
