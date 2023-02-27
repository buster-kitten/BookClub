<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.outer').on('click', function() {
	      if ($(this).prop('checked') ) {
	        $(this).next().next().addClass("active");
	        $(this).next().addClass("outer_checked");
	      } else {
	        $(this).next().next().removeClass("active");
	        $(this).next().removeClass("outer_checked");
	      }
	    });
	$('.inbetween').on('click', function() {
	      if ($(this).prop('checked') ) {
	        $(this).next().next().addClass("active");
	        $(this).next().addClass("in_checked");
	      } else {
	        $(this).next().next().removeClass("active");
	        $(this).next().removeClass("in_checked");
	      }
	    });
	});

</script>
<style>
* {
	margin:0;
	padding:0;
}
body {
	width:100%;
	height:100%;
}
[type="checkbox"] {
	display:none;
}

label {
	display:block;
	float:left;
	width:100px;
	height:100px;
	border-radius:50%;
	background-color:#d6b3a6;
	text-align:center;
	line-height:100px;
	color:#fff;
	font-size:18px;
}
.health, .hobby, .literature, .genrenovel, .business, 
.art, .history, .cartoon, .genrecartoon, .humanities, 
.philosophy, .w_philosophy, .religion, .science, 
.socialscience, .computer, .language, .English, 
.SLang, .Chinese, .Japanese, .Spanish, .French, 
.German, .test  {
	display:none;
}

.active {
	display:block;
}
.outer_checked {
	background-color:#bd8671;
}
.first_sub>label{
	background-color:#a68f84;
}
.second_sub>label{
	background-color:#7b706c;
}
</style>
</head>
<body>
	<div class="join2back">
		<form name="interest" value="form" method="post" class="joinin2form" action="joinin2Process.jsp">
			<p id=""></p>
			<%String email = request.getParameter("email");%>
			<input type="hidden" value="<%=email %>">
			<div class="checks">
				<div>
					<input type="checkbox" id="health" name="건강" class="outer">
					<label for="health">건강</label>
					<div class="health first_sub">
						<input type="checkbox" id="운동" name="운동"><label for="운동">운동</label>
						<input type="checkbox" id="건강정보" name="건강정보"><label for="건강정보">건강정보</label>
						<input type="checkbox" id="의학" name="의학"><label for="의학">의학</label>
						<input type="checkbox" id="정신건강" name="정신건강"><label for="정신건강">정신건강</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="hobby" name="interest" value="취미" class="outer">
					<label for="hobby">취미</label>
					<div class="hobby first_sub">
						<input type="checkbox" id="공예" name="interest" value="공예"><label for="공예">공예</label>
						<input type="checkbox" id="반려동물" name="interest" value="반려동물"><label for="반려동물">반려동물</label>
						<input type="checkbox" id="기타취미" name="interest" value="기타취미"><label for="기타취미">기타취미</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="literature" name="interest" value="문학" class="outer">
					<label for="literature">문학</label>
					<div class="literature first_sub">
						<input type="checkbox" id="소설" name="interest" value="소설"><label for="소설">소설</label>
						<input type="checkbox" id="시" name="interest" value="시"><label for="시">시</label>
						<input type="checkbox" id="희곡" name="interest" value="희곡"><label for="희곡">희곡</label>	
						<input type="checkbox" id="genrenovel" name="interest" value="장르소설" class="inbetween">
						<label for="genrenovel">장르소설</label>
							<div class="genrenovel second_sub">
								<input type="checkbox" id="추리" name="interest" value="추리"><label for="추리">추리</label>
								<input type="checkbox" id="SF" name="interest" value="SF"><label for="SF">SF</label>
								<input type="checkbox" id="웹소설" name="interest" value="웹소설"><label for="웹소설">웹소설</label>
								<input type="checkbox" id="라이트노벨" name="interest" value="라이트노벨"><label for="라이트노벨">라이트노벨</label>
								<input type="checkbox" id="판타지" name="interest" value="판타지"><label for="판타지">판타지</label>
								<input type="checkbox" id="호러" name="interest" value="호러"><label for="호러">호러</label>
								<input type="checkbox" id="로맨스" name="interest" value="로맨스"><label for="로맨스">로맨스</label>
								<input type="checkbox" id="무협" name="interest" value="무협"><label for="무협">무협</label>
								<input type="checkbox" id="스릴러" name="interest" value="스릴러"><label for="스릴러">스릴러</label>
							</div>
						<input type="checkbox" id="한국문학" name="interest" value="한국문학"><label for="한국문학">한국문학</label>
						<input type="checkbox" id="일본문학" name="interest" value="일본문학"><label for="일본문학">일본문학</label>
						<input type="checkbox" id="중국문학" name="interest" value="중국문학"><label for="중국문학">중국문학</label>
						<input type="checkbox" id="영미문학" name="interest" value="영미문학"><label for="영미문학">영미문학</label>
						<input type="checkbox" id="프랑스문학" name="interest" value="프랑스문학"><label for="프랑스문학">프랑스문학</label>
						<input type="checkbox" id="독일문학" name="interest" value="독일문학"><label for="독일문학">독일문학</label>
						<input type="checkbox" id="러시아문학" name="interest" value="러시아문학"><label for="러시아문학">러시아문학</label>
						<input type="checkbox" id="스페인/중남미문학" name="interest" value="스페인/중남미문학"><label for="스페인/중남미문학">스페인/중남미문학</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="business" name="interest" value="경제경영" class="outer">
					<label for="business">경제경영</label>
					<div class="business first_sub">
						<input type="checkbox" id="경제학" name="interest" value="경제학"><label for="경제학">경제학</label>
						<input type="checkbox" id="경영학" name="interest" value="경영학"><label for="경영학">경영학</label>
						<input type="checkbox" id="마케팅" name="interest" value="마케팅"><label for="마케팅">마케팅</label>
						<input type="checkbox" id="재테크" name="interest" value="재테크"><label for="재테크">재테크</label>
						<input type="checkbox" id="창업" name="interest" value="창업"><label for="창업">창업</label>
						<input type="checkbox" id="트렌드" name="interest" value="트렌드"><label for="트렌드">트렌드</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="art" name="interest" value="예술/대중문화" class="outer">
					<label for="art">예술/대중문화</label>
					<div class="art first_sub">
						<input type="checkbox" id="미술" name="interest" value="미술"><label for="미술">미술</label>
						<input type="checkbox" id="음악" name="interest" value="음악"><label for="음악">음악</label>
						<input type="checkbox" id="영화" name="interest" value="영화"><label for="영화">영화</label>
						<input type="checkbox" id="드라마" name="interest" value="드라마"><label for="드라마">드라마</label>
						<input type="checkbox" id="사진" name="interest" value="사진"><label for="사진">사진</label>
						<input type="checkbox" id="건축" name="interest" value="건축"><label for="건축">건축</label>
						<input type="checkbox" id="연극" name="interest" value="연극"><label for="연극">연극</label>
						<input type="checkbox" id="뮤지컬" name="interest" value="뮤지컬"><label for="뮤지컬">뮤지컬</label>
						<input type="checkbox" id="오페라" name="interest" value="오페라"><label for="오페라">오페라</label>
						<input type="checkbox" id="예술경영" name="interest" value="예술경영"><label for="예술경영">예술경영</label>
						<input type="checkbox" id="공연기획" name="interest" value="공연기획"><label for="공연기획">공연기획</label>
						<input type="checkbox" id="디자인" name="interest" value="디자인"><label for="디자인">디자인</label>
						<input type="checkbox" id="무용" name="interest" value="무용"><label for="무용">무용</label>
						<input type="checkbox" id="TV" name="interest" value="TV"><label for="TV">TV</label>
						<input type="checkbox" id="라디오" name="interest" value="라디오"><label for="라디오">라디오</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="history" name="interest" value="역사" class="outer">
					<label for="history">역사</label>
					<div class="history first_sub">
						<input type="checkbox" id="한국사" name="interest" value="한국사"><label for="한국사">한국사</label>
						<input type="checkbox" id="북한사" name="interest" value="북한사"><label for="북한사">북한사</label>
						<input type="checkbox" id="중국사" name="interest" value="중국사"><label for="중국사">중국사</label>
						<input type="checkbox" id="일본사" name="interest" value="일본사"><label for="일본사">일본사</label>
						<input type="checkbox" id="동아시아사" name="interest" value="동아시아사"><label for="동아시아사">동아시아사</label>
						<input type="checkbox" id="서아시아사" name="interest" value="서아시아사"><label for="서아시아사">서아시아사</label>
						<input type="checkbox" id="중앙아시아사" name="interest" value="중앙아시아사"><label for="중앙아시아사">중앙아시아사</label>
						<input type="checkbox" id="아메리카사" name="interest" value="아메리카사"><label for="아메리카사">아메리카사</label>
						<input type="checkbox" id="유럽사" name="interest" value="유럽사"><label for="유럽사">유럽사</label>
						<input type="checkbox" id="아프리카사" name="interest" value="아프리카사"><label for="아프리카사">아프리카사</label>
						<input type="checkbox" id="오세아니아사" name="interest" value="오세아니아사"><label for="오세아니아사">오세아니아사</label>
						<input type="checkbox" id="전쟁사" name="interest" value="전쟁사"><label for="전쟁사">전쟁사</label>
						<input type="checkbox" id="역사학" name="interest" value="역사학"><label for="역사학">역사학</label>
						<input type="checkbox" id="테마사" name="interest" value="테마사"><label for="테마사">테마사</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="cartoon" name="interest" value="만화" class="outer">
					<label for="cartoon">만화</label>
					<div class="cartoon first_sub">
						<input type="checkbox" id="그래픽노블" name="interest" value="그래픽노블"><label for="그래픽노블">그래픽노블</label>
						<input type="checkbox" id="한국만화" name="interest" value="한국만화"><label for="한국만화">한국만화</label>
						<input type="checkbox" id="일본만화" name="interest" value="일본만화"><label for="일본만화">일본만화</label>
						<input type="checkbox" id="유럽만화" name="interest" value="유럽만화"><label for="유럽만화">유럽만화</label>
						<input type="checkbox" id="북미만화" name="interest" value="북미만화"><label for="북미만화">북미만화</label>
						<input type="checkbox" id="웹툰" name="interest" value="웹툰"><label for="웹툰">웹툰</label>
						<input type="checkbox" id="genrecartoon" name="interest" value="장르만화"><label for="genrecartoon">장르만화</label>
						<div class="genrecartoon">
							<input type="checkbox" id="소년만화" name="interest" value="소년만화"><label for="소년만화">소년만화</label>
							<input type="checkbox" id="순정만화" name="interest" value="순정만화"><label for="순정만화">순정만화</label>
							<input type="checkbox" id="성인만화" name="interest" value="성인만화"><label for="성인만화">성인만화</label>
							<input type="checkbox" id="스포츠만화" name="interest" value="스포츠만화"><label for="스포츠만화">스포츠만화</label>
							<input type="checkbox" id="코믹만화" name="interest" value="코믹만화"><label for="코믹만화">코믹만화</label>
						</div>
						<input type="checkbox" id="인디만화" name="interest" value="인디만화"><label for="인디만화">인디만화</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="humanities" name="interest" value="인문" class="outer">
					<label for="humanities">인문</label>
					<div class="humanities first_sub">
						<input type="checkbox" id="philosophy" name="interest" value="철학"><label for="philosophy">철학</label>
						<div class="philosophy">
							<input type="checkbox" id="동양철학" name="interest" value="동양철학"><label for="동양철학">동양철학</label>
							<input type="checkbox" id="w_philosophy" name="interest" value="서양철학"><label for="w_philosophy">서양철학</label>
							<div class="w_philosophy">
								<input type="checkbox" id="독일철학" name="interest" value="독일철학"><label for="독일철학">독일철학</label>
								<input type="checkbox" id="프랑스철학" name="interest" value="프랑스철학"><label for="프랑스철학">프랑스철학</label>
								<input type="checkbox" id="영미철학" name="interest" value="영미철학"><label for="영미철학">영미철학</label>
							</div>
						</div>
						<input type="checkbox" id="심리학" name="interest" value="심리학"><label for="심리학">심리학</label>
						<input type="checkbox" id="정신분석학" name="interest" value="정신분석학"><label for="정신분석학">정신분석학</label>
						<input type="checkbox" id="신화학" name="interest" value="신화학"><label for="신화학">신화학</label>
						<input type="checkbox" id="religion" name="interest" value="종교학"><label for="religion">종교학</label>
						<div class="religion">
							<input type="checkbox" id="개신교" name="interest" value="개신교"><label for="개신교">개신교</label>
							<input type="checkbox" id="가톨릭" name="interest" value="가톨릭"><label for="가톨릭">가톨릭</label>
							<input type="checkbox" id="불교" name="interest" value="불교"><label for="불교">불교</label>
							<input type="checkbox" id="이슬람교" name="interest" value="이슬람교"><label for="이슬람교">이슬람교</label>
							<input type="checkbox" id="힌두교" name="interest" value="힌두교"><label for="힌두교">힌두교</label>
							<input type="checkbox" id="명상" name="interest" value="명상"><label for="명상">명상</label>
							<input type="checkbox" id="선" name="interest" value="선"><label for="선">선</label>
						</div>
						<input type="checkbox" id="기호학" name="interest" value="기호학"><label for="기호학">기호학</label>
						<input type="checkbox" id="언어학" name="interest" value="언어학"><label for="언어학">언어학</label>
						<input type="checkbox" id="논리학" name="interest" value="논리학"><label for="논리학">논리학</label>
						<input type="checkbox" id="인류학" name="interest" value="인류학"><label for="인류학">인류학</label>
						<input type="checkbox" id="고고학" name="interest" value="고고학"><label for="고고학">고고학</label>
						<input type="checkbox" id="문화이론" name="interest" value="문화이론"><label for="문화이론">문화이론</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="science" name="interest" value="수학/과학" class="outer">
					<label for="science">수학/과학</label>
					<div class="science first_sub">
						<input type="checkbox" id="기초과학" name="interest" value="기초과학"><label for="기초과학">기초과학</label>
						<input type="checkbox" id="교양과학" name="interest" value="교양과학"><label for="교양과학">교양과학</label>
						<input type="checkbox" id="뇌과학" name="interest" value="뇌과학"><label for="뇌과학">뇌과학</label>
						<input type="checkbox" id="생명과학" name="interest" value="생명과학"><label for="생명과학">생명과학</label>
						<input type="checkbox" id="의학" name="interest" value="의학"><label for="의학">의학</label>
						<input type="checkbox" id="법의학" name="interest" value="법의학"><label for="법의학">법의학</label>
						<input type="checkbox" id="물리학" name="interest" value="물리학"><label for="물리학">물리학</label>
						<input type="checkbox" id="천문학" name="interest" value="천문학"><label for="천문학">천문학</label>
						<input type="checkbox" id="지구과학" name="interest" value="지구과학"><label for="지구과학">지구과학</label>
						<input type="checkbox" id="수학" name="interest" value="수학"><label for="수학">수학</label>
						<input type="checkbox" id="화학" name="interest" value="화학"><label for="화학">화학</label>
						<input type="checkbox" id="공학" name="interest" value="공학"><label for="공학">공학</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="socialscience" name="interest" value="사회과학" class="outer">
					<label for="socialscience">사회과학</label>
					<div class="socialscience first_sub">
						<input type="checkbox" id="교육학" name="interest" value="교육학"><label for="교육학">교육학</label>
						<input type="checkbox" id="사회운동" name="interest" value="사회운동"><label for="사회운동">사회운동</label>
						<input type="checkbox" id="사회사상" name="interest" value="사회사상"><label for="사회사상">사회사상</label>
						<input type="checkbox" id="미래학" name="interest" value="미래학"><label for="미래학">미래학</label>
						<input type="checkbox" id="지리학" name="interest" value="지리학"><label for="지리학">지리학</label>
						<input type="checkbox" id="정치학" name="interest" value="정치학"><label for="정치학">정치학</label>
						<input type="checkbox" id="외교학" name="interest" value="외교학"><label for="외교학">외교학</label>
						<input type="checkbox" id="행정학" name="interest" value="행정학"><label for="행정학">행정학</label>
						<input type="checkbox" id="사회학" name="interest" value="사회학"><label for="사회학">사회학</label>
						<input type="checkbox" id="법학" name="interest" value="법학"><label for="법학">법학</label>
						<input type="checkbox" id="여성학" name="interest" value="여성학"><label for="여성학">여성학</label>
						<input type="checkbox" id="언론/미디어학" name="interest" value="언론/미디어학"><label for="언론/미디어학">언론/미디어학</label>
						<input type="checkbox" id="비평/칼럼" name="interest" value="비평/칼럼"><label for="비평/칼럼">비평/칼럼</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="computer" name="interest" value="컴퓨터" class="outer">
					<label for="computer">컴퓨터</label>
					<div class="computer first_sub">
						<input type="checkbox" id="그래픽" name="interest" value="그래픽"><label for="그래픽">그래픽</label>
						<input type="checkbox" id="멀티미디어" name="interest" value="멀티미디어"><label for="멀티미디어">멀티미디어</label>
						<input type="checkbox" id="프로그래밍" name="interest" value="프로그래밍"><label for="프로그래밍">프로그래밍</label>
						<input type="checkbox" id="오피스" name="interest" value="오피스"><label for="오피스">오피스</label>
						<input type="checkbox" id="웹디자인" name="interest" value="웹디자인"><label for="웹디자인">웹디자인</label>
						<input type="checkbox" id="컴퓨터공학" name="interest" value="컴퓨터공학"><label for="컴퓨터공학">컴퓨터공학</label>
						<input type="checkbox" id="게임" name="interest" value="게임"><label for="게임">게임</label>
						<input type="checkbox" id="애플리케이션" name="interest" value="애플리케이션"><label for="애플리케이션">애플리케이션</label>
					</div>
				</div>
				<div>
					<input type="checkbox" id="language" name="interest" value="어학" class="outer">
					<label for="language">어학</label>
					<div class="language first_sub">
						<input type="checkbox" id="문법" name="interest" value="문법"><label for="문법">문법</label>
						<input type="checkbox" id="어휘" name="interest" value="어휘"><label for="어휘">어휘</label>
						<input type="checkbox" id="작문" name="interest" value="작문"><label for="작문">작문</label>
						<input type="checkbox" id="듣기" name="interest" value="듣기"><label for="듣기">듣기</label>
						<input type="checkbox" id="회화" name="interest" value="회화"><label for="회화">회화</label>
						<input type="checkbox" id="English" name="interest" value="영어"><label for="English">영어</label>
						<div class="English">
							<input type="checkbox" id="TOEIC" name="interest" value="TOEIC"><label for="TOEIC">TOEIC</label>
							<input type="checkbox" id="TOEFL" name="interest" value="TOEFL"><label for="TOEFL">TOEFL</label>
							<input type="checkbox" id="TOEICSpeaking" name="interest" value="TOEICSpeaking"><label for="TOEICSpeaking">TOEIC Speaking</label>
							<input type="checkbox" id="TEPS" name="interest" value="TEPS"><label for="TEPS">TEPS</label>
							<input type="checkbox" id="OPIC" name="interest" value="OPIC"><label for="OPIC">OPIC</label>
						</div>
						<input type="checkbox" id="SLang" name="interest" value="제2외국어"><label for="SLang">제2외국어</label>
						<div class="SLang">
							<input type="checkbox" id="Chinese" name="interest" value="중국어"><label for="Chinese">중국어</label>	
							<div class="Chinese">
								<input type="checkbox" id="HSK" name="interest" value="HSK"><label for="HSK">HSK</label>
								<input type="checkbox" id="TSC" name="interest" value="TSC"><label for="TSC">TSC</label>
								<input type="checkbox" id="CPT" name="interest" value="CPT"><label for="CPT">CPT</label>
							</div>
							<input type="checkbox" id="Japanese" name="interest" value="일본어"><label for="Japanese">일본어</label>	
							<div class="Japanese">
								<input type="checkbox" id="JLPT" name="interest" value="JLPT"><label for="JLPT">JLPT</label>
								<input type="checkbox" id="JPT" name="interest" value="JPT"><label for="JPT">JPT</label>
							</div>
							<input type="checkbox" id="Spanish" name="interest" value="스페인어"><label for="Spanish">스페인어</label>	
							<div class="Spanish">
								<input type="checkbox" id="DELE" name="interest" value="DELE"><label for="DELE">DELE</label>
								<input type="checkbox" id="CELA" name="interest" value="CELA"><label for="CELA">CELA</label>
								<input type="checkbox" id="SIELE" name="interest" value="SIELE"><label for="SIELE">SIELE</label>
							</div>
							<input type="checkbox" id="French" name="interest" value="프랑스어"><label for="French">프랑스어</label>	
							<div class="French">
								<input type="checkbox" id="DELF" name="interest" value="DELF"><label for="DELF">DELF</label>
								<input type="checkbox" id="DALF" name="interest" value="DALF"><label for="DALF">DALF</label>
							</div>
							<input type="checkbox" id="German" name="interest" value="독일어"><label for="German">독일어</label>	
							<div class="German">
								<input type="checkbox" id="Telc" name="interest" value="Telc"><label for="Telc">Telc</label>
								<input type="checkbox" id="Goethe-Zertifikat" name="interest" value="Goethe-Zertifikat"><label for="Goethe-Zertifikat">Goethe-Zertifikat</label>
							</div>
							<input type="checkbox" id="러시아어" name="interest" value="러시아어"><label for="러시아어">러시아어</label>
							<input type="checkbox" id="이탈리아어" name="interest" value="이탈리아어"><label for="이탈리아어">이탈리아어</label>
							<input type="checkbox" id="아랍어" name="interest" value="아랍어"><label for="아랍어">아랍어</label>
							<input type="checkbox" id="기타언어" name="interest" value="기타언어"><label for="기타언어">기타언어</label>
						</div>
					</div>
				</div>
				<div>
					<input type="checkbox" id="test" name="interest" value="수험" class="outer">
					<label for="test">수험</label>
					<div class="test first_sub">
						<input type="checkbox" id="수능" name="interest" value="수능"><label for="수능">수능</label>
						<input type="checkbox" id="공무원" name="interest" value="공무원"><label for="공무원">공무원</label>
						<input type="checkbox" id="국가자격" name="interest" value="국가자격"><label for="국가자격">국가자격</label>
						<input type="checkbox" id="민간자격" name="interest" value="민간자격"><label for="민간자격">민간자격</label>
						<input type="checkbox" id="한국사능력검정" name="interest" value="한국사능력검정"><label for="한국사능력검정">한국사능력검정</label>
						<input type="checkbox" id="공인중개사" name="interest" value="공인중개사"><label for="공인중개사">공인중개사</label>
						<input type="checkbox" id="운전면허" name="interest" value="운전면허"><label for="운전면허">운전면허</label>
						<input type="checkbox" id="한자" name="interest" value="한자"><label for="한자">한자</label>
						<input type="checkbox" id="한국어능력검정" name="interest" value="한국어능력검정"><label for="한국어능력검정">한국어능력검정</label>
						<input type="checkbox" id="TESAT" name="interest" value="TESAT"><label for="TESAT">TESAT</label>
						<input type="checkbox" id="LEET" name="interest" value="LEET"><label for="LEET">LEET</label>
						<input type="checkbox" id="PSAT" name="interest" value="PSAT"><label for="PSAT">PSAT</label>
						<input type="checkbox" id="NCS" name="interest" value="NCS"><label for="NCS">NCS</label>
					</div>	
				</div>
				<div class="button_div">
					<button type="submit" class="shortin_button">선택완료</button>
					<button type="button" class="later_button" onclick="re_set()">나중에 선택</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>