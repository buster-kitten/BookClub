<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/style.css">
<script>
function check() {
	const FRM=document.forms[0];
	const NM=FRM.name;
	const ML=FRM.email;
	const PW=FRM.password;
	const PC=FRM.passconfirm;
	const PH=FRM.phone;
	let KOR=/^[가-힣]{2,5}/;
	let MLPAT=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let PWPAT=/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}/;
	let PHPAT=/01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
	
	if(NM.value==""){
		alert("[이름]\n이름을 입력해주세요.");
		NM.focus();
		return false;
	}else if (!KOR.test(NM.value)){
		alert("[이름]\n한글로 작성해주세요. (최소 2자 ~ 최대 5자)");
		NM.focus();
		return false;
	}else if (NM.value.length<2||NM.value.length>5){
		alert("[이름]\n한글로 작성해주세요. (최소 2자 ~ 최대 5자)");
		NM.focus();
		return false;
	}else if (ML.value==""){
		alert("[이메일]\n이메일 주소를 입력해주세요.");
		ML.focus();
		return false;
	}else if (!MLPAT.test(ML.value)){
		alert("[이메일]\n올바른 이메일을 입력해주세요.");
		ML.focus();
		return false;
	}else if (PW.value==""){
		alert("[비밀번호]\n비밀번호를 입력해주세요.");
		PW.focus();
		return false;
	}else if (!PWPAT.test(PW.value)){
		alert("[비밀번호]\n비밀번호를 입력해 주세요.(영문, 숫자, 특수문자 포함 8~20자)");
		PW.focus();
		return false;
	}else if (PC.value==""){
		alert("[비밀번호 확인]\n비밀번호를 재입력해주세요.");
		PC.focus();
		return false;
	}else if (PW.value!=PC.value){
		alert("[비밀번호 확인]\n비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		PC.focus();
		return false;
	}else if (PH.value==""){
		alert("[휴대폰 번호]\n휴대폰 번호를 입력해주세요.");
		PH.focus();
		return false;
	}else if (isNaN(PH.value)){
		alert("[휴대폰 번호]\n휴대폰 번호를 숫자로만 입력해주세요.");
		PH.focus();
		isValid=false;
	}else if (!PHPAT.test(PH.value)){
		alert("[휴대폰 번호]\n휴대폰 번호를 확인해주세요.");
		PH.focus();
		return false;
	}
}
function printName()  {
	const name = document.getElementById('name').value;
	document.getElementById("nickname").value = name;
}
</script>
</head>
<body>
	<div class="joininback">
		<form name="form" method="post" class="joininform" action="joininProcess.jsp" onsubmit="return check()">
			<h2>회원 가입</h2>
			<div class="joininfo">
				<label for="name" class="jointit">이름<span class="astrix">*</span></label>
				<input type="text" name="name" id="name" class="basic_in" placeholder="한글로 작성해주세요. (최소 2자 ~ 최대 5자)" onchange='printName()'>
			</div>
			<div class="joininfo">
				<label for="email" class="jointit">이메일<span class="astrix">*</span></label>
				<input type="text" name="email" id="email" class="basic_in" placeholder="이메일 주소를 입력해 주세요.">
			</div>
			<div class="joininfo">
				<label for="password" class="jointit">비밀번호<span class="astrix">*</span></label>
				<input type="password" name="password" id="password" class="basic_in" placeholder="비밀번호를 입력해 주세요.(영문, 숫자, 특수문자 포함 8~20자)">
			</div>
			<div class="joininfo">
				<label for="passconfirm" class="jointit">비밀번호 확인<span class="astrix">*</span></label>
				<input type="password" name="passconfirm" id="passconfirm" class="basic_in" placeholder="비밀번호를 재입력해 주세요.">
			</div>
			<div class="joininfo">
				<label for="phone" class="jointit">휴대폰 번호<span class="astrix">*</span></label>
				<input type="text" name="phone" id="phone" class="basic_in" placeholder="휴대폰 번호를 '-'없이 입력해주세요.">
			</div>
			<div class="joininfo">
				<label for="nickname" class="jointit">닉네임</label>
				<input type="text" name="nickname" id="nickname" class="basic_in" onfocus="this.value=''">
			</div>
			<div class="joininfo">
				<label for="region" class="jointit">거주지역</label>
				<select name="region" id="region" class="basic_sel">
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="인천">인천</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="제주">제주</option>
					<option value="해외">해외</option>
				</select>
			</div>
			<div class="joininfo">
				<%@include file="../jsp/DBConn.jsp" %>
				<%
				ResultSet rs=null;
				PreparedStatement pstmt=null;
				int maxidx=0;
				try{
					String sql="select max(idx) from bc_member";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
					maxidx=rs.getInt(1)+1;
					}
				}catch(Exception e){
					System.out.println("maxidx를 불러오는 데 실패하였습니다.");
					e.printStackTrace();
				}
				%>
				<input type="hidden" name="idx" value="<%=maxidx%>"> 
				<input type="submit" class="joinin_button2" value="회원가입">
				<input type="reset" value="취소" class="jcancel_button">
			</div>
		</form>
	</div>
</body>
</html>