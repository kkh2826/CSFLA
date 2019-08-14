/**
 * 
 */
function infoConfirm() {
	if(document.reg_form.id.value.length == 0) {
		alert("아이디는 필수입력 항목입니다.");
		reg.form.id.focus();
		return;
	}
	
	if(document.reg_form.pw.value.length == 0) {
		alert("비밀번호는 필수 입력사항 입니다.");
		reg_form.password.focus();
		return;
	}
	
	if(document.reg_form.pw.value != document.reg_form.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_form.password.focus();
		return;
	}
	
	if(document.reg_form.name.value.length == 0) {
		alert("이름은 필수 입력사항 입니다.");
		reg_form.name.focus();
		return;
	}
	
	if(document.reg_form.email.value.length == 0) {
		alert("이메일은 필수 입력사항 입니다.");
		reg_form.email.focus();
		return;
	}
	
	document.reg_form.submit();
}


function updateCheck() {
	   if(document.reg_form.pw.value.length == 0) {
	      alert("비밀번호는 필수 입력사항 입니다.");
	      reg_form.password.focus();
	      return;
	   }
	   if(document.reg_form.pw.value != document.reg_form.pw_check.value) {
	      alert("비밀번호가 일치하지 않습니다.");
	      reg_form.password.focus();
	      return;
	   }
	   if(document.reg_form.name.value.length == 0) {
	      alert("이름은 필수 입력사항 입니다.");
	      reg_form.name.focus();
	      return;
	   }
	   
	   if(document.reg_form.email.value.length == 0) {
	      alert("이메일은 필수 입력사항 입니다.");
	      reg_form.email.focus();
	      return;
	   }
	   
	   document.reg_form.submit();
	}

	function requireCheck() {
	   if ( document.req_form.title.value.length == 0 ) {
	      alert("제목을 입력해주세요.");
	      req_form.title.focus();
	      return;
	   }
	   if ( document.req_form.description.value.length == 0 ) {
	      alert("내용을 입력해주세요.");
	      req_form.description.focus();
	      return;
	   }
	   
	   document.req_form.submit();
	}

