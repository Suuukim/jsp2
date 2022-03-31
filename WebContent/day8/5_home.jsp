<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>
	<h3>여기는 HOME 입니다.</h3>
	<hr>
	<div>
		로그인을 했을까요? : ${user != null} 
	</div>
	<div>
	<c:if test="${user==null }">
		<button type="button" onclick="location.href='3_loginForm.jsp'">로그인</button>
	</c:if>
	
	<c:if test="${user!=null}">
		<h5>${user.name }님 환영합니다.</h5>
		<button type="button" onclick="location.href='6_logout.jsp'">로그아웃</button>
	</c:if>
	</div>
	<script type="text/javascript">
		setTimeout(function(){
			//파라미터 처리하는 방법
			if('${param.logout}'=='y')
				alert('로그아웃 되었습니다.');
			if('${param.login}'=='y')
				alert('로그인 완료 되었습니다.');
			if('${param.login}'=='n')
				alert('로그인 정보가 옳지 않습니다.');
		},100);
	</script>	
</body>
</html>