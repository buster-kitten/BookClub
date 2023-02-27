<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
String clubname=request.getParameter("clubname");  
String booktitle=request.getParameter("booktitle");
String president=request.getParameter("president");
%>
<title>북클럽 수정</title>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-3.6.1.min.js"></script>
<script>
function check() {
	const FRM=document.forms[0];
	const CN=FRM.clubname;
	const CP=FRM.capacity;
	const BT=FRM.booktitle;
	const AT=FRM.author;
	const PB=FRM.publisher;
	const PL=FRM.plan;
	const DD=FRM.duedate;
	const RD=FRM.recentdate;
	const WY=FRM.way;
	
	if(CN.value==""){
		alert("[클럽명]\n클럽명을 입력해주세요.");
		CN.focus();
		return false;
	}else if (CN.value.length<1||CN.value.length>20){
		alert("[클럽명]\n20자 미만으로 작성해주세요.");
		CN.focus();
		return false;
	}else if (CP.value==""){
		alert("[멤버 수]\n멤버 수를 입력해주세요.");
		CP.focus();
		return false;
	}else if (isNaN(CP.value)){
		alert("[멤버 수]\n숫자로만 입력해주세요.");
		CP.focus();
		return false;
	}else if (BT.value==""){
		alert("[책 제목]\n책 제목을 입력해주세요.");
		BT.focus();
		return false;
	}else if (AT.value==""){
		alert("[작가]\n작가를 입력해주세요.");
		AT.focus();
		return false;
	}else if (PB.value==""){
		alert("[출판사]\n출판사를 입력해주세요.");
		PB.focus();
		return false;
	}else if (PL.value==""){
		alert("[단위]\n단위를 입력해주세요.");
		PL.focus();
		return false;
	}else if (isNaN(PL.value)){
		alert("[단위]\n숫자로만 입력해주세요.");
		PL.focus();
		return false;
	}else if (DD.value==""){
		alert("[모집 마감일]\n모집 마감일을 입력해주세요.");
		DD.focus();
		return false;
	}else if (RD.value==""){
		alert("[모임 시작일]\n모임 시작일을 입력해주세요.");
		RD.focus();
		return false;
	}else if (WY.value==""){
		alert("[참여 방식]\n참여방식을 선택해주세요.");
		return false;
	}
	
}

function printUnit()  {	
	var unit = document.getElementById("unit");
    var unitText = unit.options[unit.selectedIndex].value;
	
	document.getElementById("unitname").innerText = unitText;
}

$(document).ready(function(){
    $('#region').hide();
		
	$("input[name='way']").change(function(){
		if($("input[name='way']:checked").val() == '오프라인'){
			$('#region').show();
			$("select[name='region'] option[value='-']").remove();
		}	
		else if($("input[name='way']:checked").val() == '온라인'){
			$('#region').hide();			
			$("select[name='region']").prepend("<option value='-' selected></option>")
		}
	});
	
	$('#unit_other').hide();
	
	$("select[name='unit']").change(function(){
		if($("input[name='unit']:selected").val() == 'other'){
			$('#unit_other').show();
		}	
	});
});
</script>
</head>
<body>
	<%@include file="../jsp/DBConn.jsp" %>
	<%
	String sessionNick = (String)session.getAttribute("sessionNick");
		if(sessionNick==null) {		
	%>
	<script>
		alert("먼저 로그인 하십시오.")
		location.href="../member/login.jsp?from=../jsp/addClub.jsp";
	</script>
	<%}else {
			session.setMaxInactiveInterval(1800);
	%> 
	<div class="addClubback">
		<div class="addclubWrap">			
		<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select c.representimg, c.capacity, b.author, b.publisher, c.cycle, c.unit, c.plan, to_char(c.duedate,'YYYY-MM-DD'), to_char(c.recentdate,'YYYY-MM-DD'), c.way, c.region from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and c.clubname=? and c.booktitle=? and c.president=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,clubname);
			pstmt.setString(2,booktitle);
			pstmt.setString(3,sessionNick);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String representimg=rs.getString(1);
				int capacity=rs.getInt(2);
				String author=rs.getString(3);
				String publisher=rs.getString(4);
				String cycle=rs.getString(5);
				String unit=rs.getString(6);
				String plan=rs.getString(7);
				String duedate=rs.getString(8);
				String recentdate=rs.getString(9);
				String way=rs.getString(10);
				String region=rs.getString(11);
				
		%>
			<form name="newClub" method="post" action="updateClub2.jsp" class="addClubform" enctype="multipart/form-data" onsubmit="return check()">
				<h2>클럽 수정</h2>
				<div class="addClubInfo">
					<label for="clubname" class="jointit">클럽명<span class="astrix">*</span></label>
					<input type="text" name="clubname" id="clubname" class="basic_in" placeholder="클럽명을 입력해 주세요." value="<%=clubname%>" readonly>
				</div>
				<div class="addClubInfo">
					<label for="capacity" class="jointit">멤버 수<span class="astrix">*</span><span class="noticeplace">&nbsp;&nbsp;(최대 30명)</span></label>
					<input type="text" name="capacity" id="capacity" class="basic_in" placeholder="숫자로만 입력해 주세요."  value="<%=capacity%>" onfocus="this.value=''">
				</div>
				<div class="addClubInfo">
					<label for="booktitle" class="jointit">책 제목<span class="astrix">*</span></label>
					<input type="text" name="booktitle" id="booktitle" class="basic_in" placeholder="책 제목을 입력해 주세요." value="<%=booktitle%>" readonly>
				</div>
				<div class="addClubInfo">
					<label for="representimg" class="jointit">표지 이미지</label>
					<input type="file" name="representimg" id="representimg" class="basic_in">
				</div>
				<div class="addClubInfo">
					<label for="author" class="jointit">작가<span class="astrix">*</span></label>
					<input type="text" name="author" id="author" class="basic_in" placeholder="작가를 입력해 주세요." value="<%=author%>" onfocus="this.value=''">
				</div>
				<div class="addClubInfo">
					<label for="publisher" class="jointit">출판사<span class="astrix">*</span></label>
					<input type="text" name="publisher" id="publisher" class="basic_in" placeholder="출판사를 입력해 주세요." value="<%=publisher%>" onfocus="this.value=''">
				</div>
				<div class="addClubInfo">
					<label for="cycle" class="jointit">주기<span class="astrix">*</span></label>
					<select name="cycle" id="cycle" class="basic_sel">
						<option value="1" <%if (cycle.equals("1")) {%> selected<%}%>>매일</option>
						<option value="2" <%if (cycle.equals("2")) {%> selected<%}%>>2일</option>
						<option value="3" <%if (cycle.equals("3")) {%> selected<%}%>>3일</option>
						<option value="5" <%if (cycle.equals("5")) {%> selected<%}%>>5일</option>
						<option value="7" <%if (cycle.equals("7")) {%> selected<%}%>>1주</option>
						<option value="10" <%if (cycle.equals("10")) {%> selected<%}%>>10일</option>
						<option value="14" <%if (cycle.equals("14")) {%> selected<%}%>>2주</option>
						<option value="30" <%if (cycle.equals("30")) {%> selected<%}%>>1개월</option>
					</select>
				</div>
				<div class="addClubInfo">
					<label for="unit" class="jointit">단위<span class="astrix">*</span></label>
					<select name="unit" id="unit" class="basic_sel" onchange="printUnit()">
						<option value="챕터" <%if (unit.equals("챕터")) {%> selected<%}%>>챕터</option>
						<option value="주" <%if (unit.equals("주")) {%> selected<%}%>>주</option>
						<option value="장" <%if (unit.equals("장")) {%> selected<%}%>>장</option>
						<option value="페이지" <%if (unit.equals("페이지")) {%> selected<%}%>>페이지</option>
					</select>
				</div>
				<div class="addClubInfo notenter">
					<input type="text" name="plan" id="plan" class="short_in3" placeholder="숫자로만 입력해 주세요." value="<%=plan%>" onfocus="this.value=''">&nbsp;&nbsp;<label for="plan" class="jointit unitline" id="unitname"><%=unit %></label>
				</div>
				<div class="addClubInfo">
					<label for="duedate" class="jointit">모집 마감일<span class="astrix">*</span></label>
					<input type="date" name="duedate" id="duedate" class="basic_in" value="<%=duedate%>">
				</div>
				<div class="addClubInfo">
					<label for="recetdate" class="jointit">모임 시작일<span class="astrix">*</span></label>
					<input type="date" name="recentdate" id="recentdate" class="basic_in" value="<%=recentdate%>">
				</div>
				<div class="addClubInfo">
					<label for="" class="jointit">참여 방식<span class="astrix">*</span></label><br>
					<input type="radio" name="way" id="online" value="온라인" class="way_radio" <%if (way.equals("온라인")) {%> checked<%}%>><label for="online">&nbsp;온라인</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="way" id="offline" value="오프라인" class="way_radio" <%if (way.equals("오프라인")) {%> checked<%}%>><label for="offline">&nbsp;오프라인</label>
				</div>
				<div id="region" class="addClubInfo">
					<label for="region2" class="jointit">지역</label>
					<select name="region" id="region2" class="basic_sel region">
						<option value="서울" <%if (region.equals("서울")) {%> selected<%}%>>서울</option>
						<option value="부산" <%if (region.equals("부산")) {%> selected<%}%>>부산</option>
						<option value="대구" <%if (region.equals("대구")) {%> selected<%}%>>대구</option>
						<option value="인천" <%if (region.equals("인천")) {%> selected<%}%>>인천</option>
						<option value="광주" <%if (region.equals("광주")) {%> selected<%}%>>광주</option>
						<option value="대전" <%if (region.equals("대전")) {%> selected<%}%>>대전</option>
						<option value="울산" <%if (region.equals("울산")) {%> selected<%}%>>울산</option>
						<option value="세종" <%if (region.equals("세종")) {%> selected<%}%>>세종</option>
						<option value="경기" <%if (region.equals("경기")) {%> selected<%}%>>경기</option>
						<option value="강원" <%if (region.equals("강원")) {%> selected<%}%>>강원</option>
						<option value="충북" <%if (region.equals("충북")) {%> selected<%}%>>충북</option>
						<option value="충남" <%if (region.equals("충남")) {%> selected<%}%>>충남</option>
						<option value="전북" <%if (region.equals("전북")) {%> selected<%}%>>전북</option>
						<option value="전남" <%if (region.equals("전남")) {%> selected<%}%>>전남</option>
						<option value="경북" <%if (region.equals("경북")) {%> selected<%}%>>경북</option>
						<option value="경남" <%if (region.equals("경남")) {%> selected<%}%>>경남</option>
						<option value="제주" <%if (region.equals("제주")) {%> selected<%}%>>제주</option>
					</select>
				</div>		
				<div class="addClubInfo">
					<input type="hidden" name="president" value="<%=sessionNick %>">
					<input type="hidden" name="memberlist" value="<%=sessionNick %>">
					<input type="submit" class="joinin_button2" value="다음단계로">
					<input type="reset" value="취소" class="jcancel_button">
				</div>
			</form>
		<%
				}
			}catch(Exception e) {
				System.out.println("수정 실패");
				e.printStackTrace();
			}
		%>
		</div>
	</div>
	<%}%>
</body>
</html>