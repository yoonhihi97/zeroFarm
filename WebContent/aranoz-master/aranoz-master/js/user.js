function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}

function checkId() {
	let idInput = document.checkform.email_front;
	let email = idInput.value;
	let email_sel = document.checkform.selbox.value;

	let user = email + email_sel;

	if (email == "" || email == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}

	var reg_id = /^[A-za-z0-9]{5,16}$/;
	if (!reg_id.test(email)) {
		alert("아이디는 숫자, 영문(5~16자)만 입력 가능합니다.");
		idInput.focus();
		return false;
	}

	if (email_sel == "" || email_sel == null) {
		alert("이메일을 선택하세요!");
		document.joinform.selbox.focus();
		return false;
	}

	$.ajax({
		url : contextPath + "/user/CheckIdOk.us?email=" + user,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			if (data == 'O') {
				if (confirm("사용할 수 있는 아이디입니다 사용하시겠습니까?")) {
					document.checkform.submit();
				}
			}
			if (data == 'X') {
				alert("이미 존재하는 아이디입니다.")
				window.close();
			}
			if (data == 'D') {
				alert("이미 탈퇴한 아이디입니다. 관리자에게 문의하세요.")
				window.close();
			}
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}

function sendit() {
	// 유효성 검사
	let joinform = document.joinform;
	let idTag = joinform.email;
	let pwTag = document.getElementById("password").value;
	let nameTag = document.getElementById("name").value;
	let phoneTag = document.getElementById("phonenum").value;
	let addrTag = document.getElementById("sample6_postcode").value

	if (idTag.value == "" || idTag.value == null) {
		alert("이메일은 필수 항목입니다.");
		idTag.focus();
		return false;
	}

	if (pwTag == "" || pwTag == null) {
		alert("비밀번호는 필수 항목입니다.");
		return false;
	}

	// 대문자,소문자,숫자,해당 특수문자들이 다 포함된 8자 이상인지 판단하는 정규식
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,}$/;
	if (!reg.test(pwTag)) {
		alert("비밀번호는 8자 이상이며, 숫자, 대문자, 소문자, 특수문자 모두를 포함해야 합니다.");
		document.getElementById("password").focus();
		return false;
	}
	// 연속된 문자가 있는지 확인하는 정규식
	if (/(\w)\1\1\1/.test(pwTag)) {
		alert("비밀번호는 같은문자를 4번 사용하실 수 없습니다!");
		document.getElementById("password").focus();
		return false;
	}
	if (pwTag.search(' ') != -1) {
		alert("비밀번호는 공백을 포함할 수 없습니다!");
		document.getElementById("password").focus();
		return false;
	}
	if (nameTag == "" || nameTag == null) {
		alert("이름을 입력하세요!");
		document.getElementById("name").focus();
		return false;
	}

	let reg_name = /^[가-힣a-zA-Z]+$/;
	if (!reg_name.test(nameTag)) {
		alert("이름은 한글과 영문만 입력하세요.")
		document.getElementById("name").focus();
		return false;
	}

	if (phoneTag == "" || phoneTag == null) {
		alert("핸드폰번호를 입력하세요!");
		document.getElementById("phonenum").focus();
		return false;
	}

	let reg_mobile = /^\d{3}\d{3,4}\d{4}$/;
	if (!reg_mobile.test(phoneTag)) {
		alert("핸드폰번호를 제대로 입력하세요.");
		document.getElementById("phonenum").focus();
		return false;
	}
	if (addrTag == "" || addrTag == null) {
		alert("주소는 필수 입력사항입니다.");
		document.getElementById("sample6_postcode").focus();
		return false;
	}

	alert("회원가입을 축하드립니다!")
	// 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
	joinform.submit();
}

// 직접 입력
$(function() {
	$("#selboxDirect").hide();
	$("#selbox").change(function() {
		if ($("#selbox").val() == "direct") {
			$("#selboxDirect").show();
		} else {
			$("#selboxDirect").hide();
		}
	})
});

// 이메일 인증
// 회원가입
function join_openChild() {
	window.name = "joinview";
	openWin = window.open('/zerofarm/app/user/join_email.jsp', 'a',
			'width=470, height=643, left=100, top=50')
}


// 비밀번호 찾기
function find_openChild() {
	window.name = "find_pwview";
	openWin = window.open('/zerofarm/app/user/find_email.jsp', 'a',
			'width=470, height=643, left=100, top=50')
}
// 회원삭제
// 아이디 동일한 것 있는지 찾음
function findId() {
	let idInput = document.checkform.email_front;
	let email = idInput.value;
	let email_sel = document.checkform.selbox.value;

	let user = email + email_sel;

	if (email == "" || email == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}
	var reg_id = /^[A-za-z0-9]{5,16}$/;
	if (!reg_id.test(email)) {
		alert("아이디는 숫자, 영문(5~16자)만 입력 가능합니다.");
		idInput.focus();
		return false;
	}
	if (email_sel == "" || email_sel == null) {
		alert("이메일을 선택하세요!");
		document.joinform.selbox.focus();
		return false;
	}
	$.ajax({
		url : contextPath + "/user/CheckIdOk.us?email=" + user,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			if (data == 'O') {
				alert("가입한 아이디가 존재하지 않습니다.")
				window.close();
			} 
			if(data == "X"){
				if (confirm("메일로 새로운 비밀번호를 보내드립니다.\n보내시겠습니까?")) {
					document.checkform.submit();
				}
			}
			if(data == "D"){
				alert("이미 탈퇴한 회원입니다. 관리자에게 문의하세요.")
				window.close();
			}
			
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}
// 회원삭제
function delete_openChild() {
	window.name = "delete_pwview";
	openWin = window.open('/zerofarm/app/user/delete_email.jsp', 'a',
			'width=470, height=643, left=100, top=50')
}
// 삭제하기 위해 현재 로그인한 아이디와 인증받으려는 이메일이 같은지 확인
function deleteId() {
	let idInput = document.checkform.email_front;
	let email = idInput.value;
	let email_sel = document.checkform.selbox.value;

	let user = email + email_sel;

	if (email == "" || email == null) {
		alert("아이디를 입력하세요!");
		idInput.focus();
		return false;
	}
	var reg_id = /^[A-za-z0-9]{5,16}$/;
	if (!reg_id.test(email)) {
		alert("아이디는 숫자, 영문(5~16자)만 입력 가능합니다.");
		idInput.focus();
		return false;
	}
	if (email_sel == "" || email_sel == null) {
		alert("이메일을 선택하세요!");
		document.joinform.selbox.focus();
		return false;
	}
	$.ajax({
		url : contextPath + "/user/DeleteIdCheck.us?email=" + user,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			if (data == 'O') {
				alert("로그인한 아이디와 일치하지 않습니다..")
				window.close();
			} else {
				if (confirm("인증번호를 받으시겠습니까?")) {
					document.checkform.submit();
				}
			}
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}

// 로그인 하기
function login() {
	let idTag = document.getElementById("name");
	let pwTag = document.getElementById("password");
	if (idTag.value == "" || idTag.value == null) {
		alert("아이디를 입력하세요.");
		idTag.focus();
		return false;
	}
	if (pwTag.value == "" || pwTag.value == null) {
		alert("비밀번호를 입력하세요.");
		pwTag.focus();
		return false;
	}
	document.getElementById("login_submit").submit();
}

function setParentText() {
	opener.document.getElementById("email").value = id_join;
}

// 회원가입 이메일 인증
function joinAuthCheck() {

	let auth_check = document.getElementById("auth").value;

	$.ajax({
		url : contextPath + "/user/CheckEmailAuth.us?auth_check=" + auth_check,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			if (data == 'O') {
				alert("이메일 인증에 성공했습니다!");
				setParentText();
				window.close();
			} else {
				alert("이메일 인증에 실패하셨습니다.!");
				window.close();
			}
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}
// 회원탈퇴 이메일 인증
function deleteAuthCheck() {

	let auth_check = document.getElementById("auth").value;

	$.ajax({
		url : contextPath + "/user/CheckEmailAuth.us?auth_check=" + auth_check,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			if (data == 'O') {
				if (!confirm("정말로 회원 탈퇴하시겠습니까?")) {
					window.close();
				}
				location.href = contextPath + "/user/userDeleteOkAction.us";
			} else {
				alert("이메일 인증에 실패하셨습니다.!");
				window.close();
			}
		},
		error : function() {
			console.log("ajax실패");
		}
	})
}
// 비밀번호 체크
function pwCheck() {
	let pwform = document.pwchange;
	let pw = pwchange.pw;
	let pwch = pwchange.pw_ch;
	let pwchre = pwchange.pw_ch_re;

	if (pw.value == "" || pw.value == null) {
		alert("현재 비밀번호를 입력하세요.");
		pw.focus();
		return false;
	}
	if (pwch.value == "" || pwch.value == null) {
		alert("변경할 비밀번호를 입력하세요.");
		pwch.focus();
		return false;
	}
	if (pwchre.value == "" || pwchre.value == null) {
		alert("재확인 비밀번호를 입력하세요.");
		pwchre.focus();
		return false;
	}
	if (pwch.value != pwchre.value) {
		alert("입력한 비밀번호와 재확인 비밀번호가 다릅니다.");
		return false;
	}
	if (pwch.value.search(' ') != -1) {
		alert("비밀번호는 공백을 포함할 수 없습니다!");
		pwch.focus
		return false;
	}
	if (/(\w)\1\1\1/.test(pwch)) {
		alert("비밀번호는 같은문자를 4번 사용하실 수 없습니다!");
		pwch.focus();
		return false;
	}
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~!@#$%^&*_-]).{8,}$/;
	if (!reg.test(pwch.value)) {
		alert("비밀번호는 8자 이상이며, 숫자, 대문자, 소문자, 특수문자 모두를 포함해야 합니다.");
		pwch.focus();
		return false;
	}
	if (pwch.value == pw.value) {
		alert("현재 비밀번호와 새 비밀번호는 같을 수 없습니다.");
		return false;
	}

	pwchange.submit();
}
