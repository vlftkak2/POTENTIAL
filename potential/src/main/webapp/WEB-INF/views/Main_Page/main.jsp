<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POTENTIAL</title>
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
		
		<!-- 메인 검색창 -->
		<div id="search">
			<form id="search_form" action="/ISMEDIA/bom/pjtlist" method="get">
				<input type="text" class="search_form_text" id="kwd" name="kwd" value="${pjtlist.keyword}" placeholder="입력 해주세요!">
				<input type="submit" class="btn search-primary search-block" value="검색">
			</form>
		</div>
		
		<!-- 아이콘 메뉴 -->
		<div id="icon_menu">
		<div class="menu ml-120" style="float:left;">
		<a href=""><img src="/resources/images/index/index_menu/beauty.png" alt="beauty"/></a>
		<h2><a href="">미용</a></h2>
		</div>
		<div class="menu ml-120" style="float:left; ">
		<a href=""><img src="/resources/images/index/index_menu/massage.png" /></a>
		<h2><a href="">마사지</a></h2>
		</div>
		
		<div class="menu ml-120" style="float:left; ">
		<a href=""><img src="/resources/images/index/index_menu/health.png"/></a>
		<h2><a href="">건강</a></h2>
		</div>
		
		<div class="menu ml-120" style="float:left; ">
		<a href=""><img src="/resources/images/index/index_menu/education.png"/></a>
		<h2><a href="">교육</a></h2>
		</div>
		
		<div class="menu ml-120" style="float:left; ">
		<a href=""><img src="/resources/images/index/index_menu/sport.png"/></a>
		<h2><a href="">스포츠</a></h2>
		</div>
		
		<div class="menu ml-120" style="float:left; ">
		<a href=""><img src="/resources/images/index/index_menu/home.png"/></a>
		<h2><a href="">홈서비스</a></h2>
		</div>
		
		</div>
		
		<!-- 인기서비스 -->
		<div id="popular_service">
		<!--  
			<div class="popular_pagenation">
				<button>&lt;</button>
				<button>&gt;</button>
			</div>
	     -->
			<div class="popular_content">
				<div class="popular_title" style="float:left;" >
				<h1 class="popular_font">인기 서비스</h1>
				<p>지금 실시간 인기서비스를 <br> 바로 확인해보세요!</p>
				</div>
				
				<div class="popular_info" style="float:left;">
				
				   <div class="popular_info_Detail ml-50" style="float:left;">
				<a href=""><img src="/resources/images/index/index_popular/data1.GIF"/></a>
				   </div>
	
				   	<div class="popular_info_Detail ml-50" style="float:left;">
				<a href=""><img src="/resources/images/index/index_popular/data2.GIF"/></a>
				   </div>
				   
				   	<div class="popular_info_Detail ml-50" style="float:left;">
				<a href=""><img src="/resources/images/index/index_popular/data3.GIF"/></a>
				   </div>
				   
				   	<div class="popular_info_Detail ml-50" style="float:left;">
				<a href=""><img src="/resources/images/index/index_popular/data4.GIF"/></a>
				   </div>
				   
				</div>
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