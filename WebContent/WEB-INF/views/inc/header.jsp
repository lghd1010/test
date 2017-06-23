<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- nav -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- ajaxSubmit 처리를 위한 링크 -->
<script src="http://malsup.github.com/jquery.form.js"></script>

<script type="text/javascript">
	
	//로그인 유지 확인
	$.ajax({
		url:"rememberAjax.go",
		type:"POST",
		success:function(data){
			if(data.result == "refresh"){
				alert('로그인 상태 유지를 체크하셨습니다. 자동 로그인 합니다.');
				location.replace('index.go');
			}
		}
	});

	/* 로그인 버튼  */
	$(document).ready(function() {
		
		$("#myBtn").click(function() {
			location.replace("login.go")
		});
	/* 로그아웃 버튼 */
		$("#myBtn2").click(function() {
			location.replace("logout.go");
		});
	/* 쪽지 열기 */
		$('#messageWindow').click(function() {
			window.open('message.jsp', 'My message', 'width=500,height=500');
		});
		$('#messageWindow1').click(function() {
			window.open('message.jsp', 'My message', 'width=500,height=500');
		});

	/* 내 정보 버튼*/
		$('#myPage').click(function() {
			location.replace("memberBoard.go?mno=1");
		});

	/* 회원 가입하기*/
		$('#Register').click(function() {
			location.replace("signin.go");
		});

	/* 비밀번호 찾기 */
		$('#find').click(function() {
			location.replace("pwSearch.go");
		});
	
	/* 관리자 페이지 */
		$('#admin').click(function() {
			location.replace("adhome.go");
		});
	
		//방문자수 확인
		$.ajax({
			url : "visitCountAjax.go",
			type : "POST",
			success : function(data) {
				$('#todayCount').html(data.todayCount);
				$('#totalCount').html(data.totalCount);
			}
		});
	
	});
</script>
<nav class="navbar navbar-default" role="navigation"
	style="margin-bottom: 0px;background-color: #E15656; border-color: #D83939;">
<div class="container" style="margin-top: 0px; margin-bottom: 0px;"
	align="center">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.go" style="color: white;">AhnCheat</a>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li><a href="index.go" style="color: white;">검색</a></li>
			<li><a href="registration.go" style="color: white;">피해등록 </a></li>
			<li><a href="home.go" style="color: white;">홈</a></li>
		</ul>
		<!-- ////////////////////////////////////////////////////////// -->
		<%-- <!--  2단계 Spring taglib 사용방법(인증과 권한) -->
				<se:authorize ifNotGranted="ROLE_USER">
					<li><a
						href="${pageContext.request.contextPath}/login.go">로그인</a></li>
				</se:authorize>
			<se:authentication property="email" var="email" />
				<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
					<li><a href="${pageContext.request.contextPath}/logout.go">
							(${email})로그아웃</a></li>
				</se:authorize>		 --%>
		<!--//////////////////////////////////////////////////////  -->
		<div class="links">
			<div class="container" align="right">
				<!-- 로그인 버튼 _ 로그인 전과 후의 변화 -->
				<c:choose>
					<c:when test="${empty memberInfo}">
						<!-- 세션이 null 이면 -->
						<button type="button" class="btn btn-default" id="myBtn"
							style="margin-right: 10px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span>로그인
						</button>
						<button type="button" class="btn btn-default" id="Register"
							style="margin-right: 10px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span> 회원가입 
						</button>
						<button type="submit" class="btn btn-default" id="find"
							style="margin-right: 10px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span> 비밀번호 찾기
						</button>
					</c:when>
					<c:otherwise>
						<!-- 세션이 있다면_ -->
						<button style="margin-top: 10px;" type="button"
							class="btn btn-default btn-sm" id="messageWindow">
							<span class="glyphicon glyphicon-envelope" id="new"></span>&nbsp;<span id="messageText">쪽지</span></button>
						<button type="button" class="btn btn-default" id="myBtn2"
							style="margin-right: 20px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span>
							<c:if test="${memberInfo.typeno==1}">
								<c:out value="관리자_" />
							</c:if>
							<c:if test="${memberInfo.typeno==0}">
								<c:out value="사용자_" />
							</c:if>
								<c:if test="${memberInfo.typeno==2}">
								<c:out value="경찰_" />
							</c:if>
							<c:if test="${memberInfo.typeno==3}">
								<c:out value="변호사_" />
							</c:if>
							 ${memberInfo.name}님 로그아웃
						</button>
						<button type="button" class="btn btn-default" id="myPage"
							style="margin-right: 10px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span> 내 정보
						</button>
					<c:if test="${memberInfo.typeno==1}">
						<button type="button" class="btn btn-default" id="admin"
							style="margin-right: 10px; margin-top: 10px">
							<span class="glyphicon glyphicon-log-in"></span> 관리자페이지 
						</button>
					</c:if>	
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</nav>