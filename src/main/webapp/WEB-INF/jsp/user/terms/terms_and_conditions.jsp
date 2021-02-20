<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  
<style type="text/css">
	.tag{
		display:inline
	}
	#home-icon {
		width:30px;
		height:30px;
	}
	
	.phrase {
		border-bottom-style: solid;
		padding-top: 10px;
		padding-bottom: 10px 
	}
	
	.main {
		width:1380px;
		height:inherit;
		margin:auto auto;
	}
	
	.contents {
		width:970px;
		height:inherit;
		margin:auto auto;
	}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<!-- 메인 메뉴바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/main"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/user/board">| 커뮤니티</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/main/store">| 스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/user/scrap">| 내 스크랩</a>
    </li>
  </ul>
</nav>

<!-------- 하위 메뉴바 ------->
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/main">홈</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/main/images">사진</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/main/info">정보</a>
    </li>
  </ul>
</nav>

<div class="jumbotron text-center">
  <h1>My First Bootstrap Page</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>

<!-------- 메인 --------->
<div id="main">
	<div class="contents">
		<div class="content-category-box">
			<h2 class="content-category-left">	         구해줘홈즈 이용약관</h2>
		</div>	
		<div class="terms_contents">
		<br><br>
		
		<div class="phrase">
		<h3>구해줘홈즈 프로젝트 이용약관</h3>
		<구해줘홈즈 프로젝트>('homes.com'이하 '구해줘홈즈 ')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br>
		<구해줘홈즈 프로젝트>('구해줘홈즈 ') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br>
		○ 본 방침은부터 2020년 12월 17일부터 시행됩니다.<br>			
		</div>
		
		<div class="phrase">
		<h3>1. 개인정보의 처리 목적</h3>
		<구해줘홈즈 프로젝트>('homes.com'이하 '구해줘홈즈 ')은(는) 개인정보를 다음의 목적을 위해 처리합니다.<br>
		처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.<br><br>
		가. 홈페이지 회원가입 및 관리<br>
		회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지 등을 목적으로 개인정보를 처리합니다.<br><br>
		나. 민원사무 처리<br>
		민원인의 신원 확인 등을 목적으로 개인정보를 처리합니다.<br><br>
		다. 마케팅 및 광고에의 활용<br>
		인구통계학적 특성에 따른 서비스 제공 및 광고 게재 등을 목적으로 개인정보를 처리합니다.<br>				
		</div>
		
		<div class="phrase">
		<h3>2. 개인정보 파일 현황</h3>
		•1. 개인정보 파일명 : members<br>
		•개인정보 항목 : 이메일, 휴대전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 생년월일, 이름, 서비스 이용 기록, 접속 로그, 필요한 상담 종류<br>
		•수집방법 : 홈페이지<br>			
		•보유근거 : 관령 법령<br>
		•보유기간 : 3년<br>
		•관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
		</div>
		
		<div class="phrase">
		<h3>3. 개인정보의 처리 및 보유 기간</h3>
		① <구해줘홈즈 프로젝트>('구해줘홈즈 ')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.<br>
		② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
		•1.<홈페이지 회원가입 및 관리><br>			
		•<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여 보유.이용됩니다.<br>
		•보유근거 : 관령 법령<br>
		•관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년<br>
		•예외사유 : 회원이 탈퇴 원할 시 즉시 파기<br>
		</div>
		
		<div class="phrase">
		<h3>4. 개인정보의 제3자 제공에 관한 사항</h3>
		① <구해줘홈즈 프로젝트>('homes.com'이하 '구해줘홈즈 ')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
		② <구해줘홈즈 프로젝트>('homes.com')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>
		•1. <구해줘홈즈 프로젝트><br>			
		•개인정보를 제공받는 자 : 구해줘홈즈<br>
		•제공받는 자의 개인정보 이용목적 : 회원 관리<br>
		•제공받는 자의 보유.이용기간: 회원 탈퇴 시 까지<br>
		</div>
		
		<div class="phrase">
		<h3>5. 개인정보처리 위탁</h3>
		① <구해줘홈즈 프로젝트><br>
		('구해줘홈즈 ')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
		② <구해줘홈즈 프로젝트>('homes.com'이하 '구해줘홈즈 ')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>	
		③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>		
		</div>
		
		<div class="phrase">
		<h3>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</h3>
		① 정보주체는 구해줘홈즈 프로젝트에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.<br>
		② 제1항에 따른 권리 행사는구해줘홈즈 프로젝트에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 구해줘홈즈 프로젝트은(는) 이에 대해 지체 없이 조치하겠습니다.<br>
		③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>			
		④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>
		⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>
		⑥ 구해줘홈즈 프로젝트은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>
		</div>
		
		<div class="phrase">
		<h3>7. 처리하는 개인정보의 항목 작성</h3>
		① <구해줘홈즈 프로젝트>('homes.com'이하 '구해줘홈즈 ')은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br>
		<홈페이지 회원가입 및 관리><br>
		•필수항목 : 이메일, 휴대전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름<br>			
		</div>
		
		<div class="phrase">
		<h3>8. 개인정보의 파기</h3>
		<구해줘홈즈 프로젝트>('구해줘홈즈 ')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다.<br>
		파기의 절차, 기한 및 방법은 다음과 같습니다.<br>
		-파기절차<br>
		이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br>
		-파기기한<br>
		이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br>
		-파기방법<br>
		전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다<br>
		</div>
		
		<div class="phrase">
		<h3>9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</h3>
		① 구해줘홈즈 프로젝트 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.<br>
		</div>
		
		<div class="phrase">
			<h3>10. 개인정보 처리방침 변경</h3>
			①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br>
		</div>
		
		<div class="phrase">
			<h3>11. 개인정보의 안전성 확보 조치</h3>
			<구해줘홈즈 프로젝트>('구해줘홈즈 ')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br>
			① 정기적인 자체 감사 실시<br>
			개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br>
		</div>
		
		</div>
	</div>
</div>
</body>
</html>