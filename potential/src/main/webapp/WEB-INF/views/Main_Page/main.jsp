<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>isMedia</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sweetalert.css">
<link href="/resources/css/index.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login.css" rel="stylesheet" type="text/css">  
<script type="text/javascript" src="/resources/js/jquery/jquery-1.9.0.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>  
</head>
<body>
<div id="container">

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">

	
		<div class="container_index">
		
		<div id="search">
			<form id="search_form" action="/ISMEDIA/bom/pjtlist" method="get">
				<input type="text" id="kwd" name="kwd" value="${pjtlist.keyword }">
				<input type="submit" value="찾기">
			</form>
		</div>
		
		<div id="seperate">
		<img src="/resources/images/index/company.GIF" style="float:left;"/>
				<div id="log-border">
					<form class="login-form" name="loginform" method="post"  >
					<ul>
					<c:choose>
					<c:when test='${empty sessionScope.authUser }'>
						<li><input id="id" name="id" class="form-control" type="text" value="" placeholder="사원번호"></li>
						<li><input id="password" name="password" type="password" class="form-control" value="" placeholder="비밀번호"></li>
						<button class="btn btn-primary btn-block" type="button" id="btn_Login">로그인</button>
					</c:when>	

					<c:otherwise>
						<li class="form-control">${authUser.name}님</li>
						<button class="btn btn-primary btn-block" type="button" id="btn_logout"><a href="/ISMEDIA/logout">로그아웃</button>
					</c:otherwise>				
					</c:choose>

					</ul>
						
					</form>
				</div>
		</div>
		
		<div id="map"></div>
		<div id="text_index">
		<h4 id="index_map"></h4>
		</div>
		
	</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>

</body>
<script>
$(function() {	
 	//로그인 가능 여부 (아디 & 비번  일치 여부)
	 $("#btn_Login").on("click", function(){
		if($("#id").val() == ""){
			sweetAlert("아이디를 입력해주십시오.", "Something went wrong!", "error");
			$("#id").focus();
			return false;
			}
		
		if($("#password").val() == ""){
			sweetAlert("비밀번호를 입력해주십시오.", "Something went wrong!", "error");
			$("#password").focus();
			return false;
			}
		
		var id = $("#id").val();
		var password = $("#password").val();	
	
		$.ajax({	
			url: "checkLogin",
			type: "POST",
			data: {"id": id, "password": password},
			dataType: "text",
			success: function(result){	
				console.log(result);
				if(result == "false"){
					console.log(result);
					sweetAlert("유효하지 않는 로그인입니다.", "다시 시도해주세요.", "error");
					return false;
				}
				
				 if(result == "true"){
					 location.href='/ISMEDIA/main';
					
				} 
			},
			
			error: function(jsXHR, status, e){
				console.error("error:"+status+":"+e);
			}
		});
	});
});
</script>
</html>