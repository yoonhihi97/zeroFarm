function Check(){
	let form = document.sellerjoinform;
	let email = form.ceo_email;
	let phone = form.ceo_phonenum;
	let company_num = form.company_num;
	let company_name = form.company_name;
	let bank = form.banktype;
	let accounth = form.account_holder;
	let account_num = form.account_num;
	
	if (email.value == "" || email.value == null) {
		alert("이메일은 필수 항목입니다.");
		email.focus();
		return false;
	}
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!regExp.test(email.value)) {
		alert("이메일을 제대로 입력하세요.");
		email.focus();
		return false;
	}
	if (phone.value == "" || phone.value == null) {
		alert("핸드폰 번호는 필수 항목입니다.");
		phone.focus();
		return false;
	}
	let reg_mobile = /^\d{3}\d{3,4}\d{4}$/;
	if (!reg_mobile.test(phone.value)) {
		alert("핸드폰번호를 제대로 입력하세요.");
		phone.focus();
		return false;
	}
	
	
	let reg_name = /^[가-힣a-zA-Z]+$/;
	if(!reg_name.test(company_name.value)){
		alert("사업자명 은 한글과 영문만 입력하세요.")
		company_name.focus();
		return false;
	}
	
	
	if (bank.value == "" || bank.value == null) {
		alert("은행명은 필수 항목입니다.");
		bank.focus();
		return false;
	}
	if (accounth.value == "" || accounth.value == null) {
		alert("예금주는 필수 항목입니다.");
		accounth.focus();
		return false;
	}
	
	if(!reg_name.test(accounth.value)){
		alert("예금주는 한글과 영문만 입력하세요.")
		accounth.focus();
		return false;
	}
	if (account_num.value == "" || account_num.value == null) {
		alert("계좌번호는 필수 항목입니다.");
		account_num.focus();
		return false;
	}
	
	if(confirm("판매자 등록 하시겠습니까?")){
		sellerjoinform.submit();		
	}
	return false;
	
}


















