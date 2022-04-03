<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>printMembber</title>
</head>
<body>
	<%
		String id, pw, name, sex;
		String[] hobby;
	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		sex = request.getParameter("sex");
		hobby = request.getParameterValues("hobby");	//Array로 온다.
	%>
	
	id : <%= id %> </br>
	pw : <%= pw %> </br>
	name : <%= name %> </br>
	sex : <%= sex %> </br>
	hobby : <%= Arrays.toString(hobby) %> </br>
	uri : https://chrismare.tistory.com/entry/requestresponse-%EA%B0%9D%EC%B2%B4?category=1019271
</body>
</html>