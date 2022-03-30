<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!-- 함수 fn은 태그가 아닌 el과 함께 사용합니다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title> <!-- jsp1프로젝트의 day5폴더 예제 -->
<link rel="stylesheet" href="0_hrdkorea.css">
<style type="text/css">
	td{
		border: 1px solid gray;
	}
</style>
</head>
<body>		
<div class="wrap_container">
  <header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </header>
    <nav class="haeder-nav">
        <ul class="container">
          	<li><a href="">회원등록</a></li>
            <li><a href="">회원목록조회/수정</a></li>
            <li><a href="">회원매출조회</a></li>
            <li><a href="">홈으로.</a></li>
        </ul>
    </nav>
	 <section>
            <h2 style="text-align: center;" class="section"><strong>회원목록조회/수정</strong></h2>
            <div>
            <!-- action url을 현재 url과 같게 했습니다. -->
			<form action="memberSearch.jsp">
				<select name="column">
					<option value="name">이름</option>
					<option value="address">주소</option>
					<option value="grade">고객등급</option>
					<option value="city">거주지역</option>
				</select>
				
				<input name="find" placeholder="검색할 내용 입력">
				<select name="find">
						<!-- 사용자 선택하는 텍스트와 db테이블에 저장된 값이 다릅니다. -->
						<option value="A">VIP</option>
						<option value="B">일반</option>
						<option value="C">직원</option>
				</select>
				<button>검색</button>
				<button type="button" onclick="location.href='memberList.jsp'">전체보기</button>
			</form>            
            </div>
            <table style="width: 90%;margin: auto;text-align: center;"> 
                <tr style="text-align: center;">    
                    <td><strong>번호</strong></td>       
                    <td><strong>이름</strong></td>
                    <td><strong>연락처</strong></td>
                    <td><strong>주소</strong></td>
                    <td><strong>가입일자</strong></td>
                    <td><strong>고객등급</strong></td>
                    <td><strong>거주지역</strong></td>
                </tr>
<!-- el은 getAttribute 와 출력 -->
<c:forEach var="member" items="${list }">
				<tr> 
					<td > <a style="color: blue;" href="#">
					${member.custNo}</a> 
					</td>
					<td>${member.custName }</td>
					<td>${member.phone }</td>
					<td>${member.address }</td>
					<td>${member.joinDate }</td>
					<td>${member.grade=='A'? 'VIP': (member.grade=='B'? '일반':'직원') }
					<!-- 조건연산형식 :  조건? 참실행명령문 : 거짓실행명령문 -->
					<c:if test="${member.grade=='A' }">VIP</c:if>
					<c:if test="${member.grade=='B' }">일반</c:if>
					<c:if test="${member.grade=='C' }">직원</c:if>
					</td>
					<td>${member.city }</td>
				</tr>
</c:forEach>        		
<!-- //list의 데이터가 없을 때 list애트리뷰트가 null X, size()가 0(jstl의 length함수로 검사) -->
<c:if test="${fn:length(list)==0 }">
	            <tr>
              		<td colspan="7">조회 결과가 없습니다.</td>
              	</tr>
</c:if>		
            </table>
        </section>
    <footer>
        <p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
    </footer>
    </div>
</body>
</html>