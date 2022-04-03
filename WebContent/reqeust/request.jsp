<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 객체</title>
</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<th>메소드 명</th>
			<th>기능</th>
		</tr>
		<tr> 
			<td>getContextPath()</td>
			<td>웹 어플리케이션의 컨텍스트 패스를 얻습니다.</td>
		</tr>
		<tr> 
			<td>getMethod()</td>
			<td>get방식과 post방식을 구분할 수 있습니다.</td>
		</tr>
		<tr> 
			<td>getSession()</td>
			<td>세션 객체를 얻습니다.</td>
		</tr>
		<tr> 
			<td>getProtocol()</td>
			<td>해당 프로토콜을 얻습니다.</td>
		</tr>
		<tr> 
			<td>getRequestURL()</td>
			<td>요청 URL을 얻습니다.</td>
		</tr>
		<tr> 
			<td>getRequestURI()</td>
			<td>요청 URI을 얻습니다.(컨텍스트 패스 이하의 값)</td>
		</tr>
		<tr> 
			<td>getQueryString()</td>
			<td>쿼리스틀링 얻습니다.</td>
		</tr>
	</table>
	<%
		out.print("서버 : " + request.getServerName() + "<br>");
		out.print("포트번호 : " + request.getServerPort() + "<br>");
		out.print("요청 방식 : " + request.getMethod() + "<br>");
		out.print("프로토콜 : " + request.getProtocol() + "<br>");
		out.print("URL : " + request.getRequestURL() + "<br>");
		out.print("URI : " + request.getRequestURI() + "<br>");
		out.print("Context Path : " + request.getContextPath() + "<br>");
	%>
	<hr>
	<form action="printMember.jsp" method="post">
		<label>id : <input type="text" name="id" size="10em"></label><br>
		<label>password : <input type="password" name="pw" size="10em"></label><br>
		<label>name : <input type="text" name="name" size="10em"></label><br>
		<input type="checkbox" name="hooby" value="축구">축구
		<input type="checkbox" name="hooby" value="야구" checked="checked">야구
		<input type="checkbox" name="hooby" value="농구">농구
		<input type="checkbox" name="hooby" value="테니스">테니스 <br>
		<input type="radio" name="sex" value="남">남
		<input type="radio" name="sex" value="여">여 <br>
		<input type="submit" value="전송">
	</form>
</body>
</html>