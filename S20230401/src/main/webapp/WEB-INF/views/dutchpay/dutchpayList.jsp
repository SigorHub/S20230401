<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../preset.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container {
				height: 280px;
				width: 800px;
				background-color: #FAEBFF;
				}
</style>
<script type="text/javascript">

	    function goWriteForm(p_mem_id) {
	 	 if ( p_mem_id != null ) {
	 		location.href="/dutchpay/dutchpayWriteForm";
	 	 } else {
	 		alert('로그인이 필요한 서비스입니다.');
	 	    location.href = '/login';
	 	 }
		}   
</script>
</head>
<body>

<a><strong>전체목록</strong></a>
<a href="${pageContext.request.contextPath }/board/dutchpay?category=1110">식료품</a>
<a href="${pageContext.request.contextPath }/board/dutchpay?category=1120">의류/잡화</a>
<a href="${pageContext.request.contextPath }/board/dutchpay?category=1130">생활용품</a>
<a href="${pageContext.request.contextPath }/board/dutchpay?category=1140">해외배송</a>
<a href="${pageContext.request.contextPath }/board/dutchpay?category=1150">기타</a><p>

<input type="button" value="글쓰기" onclick="goWriteForm(${memberInfo.mem_id})">   

<form action="/dutchpay/articleSearch">
	<select name="search">
		<option value="art_title">제목</option>
<!-- 		<option value="mem_nickname">작성자</option>
 -->	</select>
	<input type="text" name="keyWord" placeholder="검색어를 입력해주세요">
	<button type="submit">검색</button><p>
</form> 

	 <c:forEach var="ATR" items="${dutchpayList }">
	 
	<div class="container" >
		<input type="hidden" name="brd_id" value="${ATR.brd_id }">
		<input type="hidden" name="art_id" value="${ATR.art_id }">
		
		
		
		<span>작성자 : ${ATR.mem_image}  ${ATR.mem_nickname } (${ATR.mem_username })</span><p>
		<span>${ATR.comm_value }</span>
		<span><a href="/dutchpay/dutchpayDetail?art_id=${ATR.art_id}&brd_id=${ATR.brd_id}">제목 : ${ATR.art_title }</a>
		
		
		
		작성날짜 : <fmt:formatDate value="${ATR.art_regdate}" pattern="yyyy년M월d일  h시mm분"/> </span><p>
		<span>태그 : ${ATR.art_tag1 }  ${ATR.art_tag2 }  ${ATR.art_tag3 }  ${ATR.art_tag4 } ${ATR.art_tag5 }</span><p>
		<span>가격 : ${ATR.trd_cost }원</span><p>
		<span>지역 : ${ATR.reg_name }</span><p>
		<span>모집인원 수 : ${ATR.trd_max }명 (작성자 제외)</span><p>
		<span>마감일자 : <fmt:formatDate value="${ATR.trd_enddate}" pattern="yyyy년M월d일  h시mm분 까지"/> </span><p>
		<span>추천 ${ATR.art_good }  비추천 ${ATR.art_bad }  조회수${ATR.art_read }  댓글수${ATR.reply_count }</span>
	</div>
	<hr>
	</c:forEach>
                       <!-- 1              10    -->
 	 <c:if test ="${page.startPage > page.pageBlock }">
    	<a href="${pageContext.request.contextPath }/board/dutchpay?category=${category }&currentPage=${page.startPage-page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
    	<a href="${pageContext.request.contextPath }/board/dutchpay?category=${category }&currentPage=${i}">[${i}]</a>
	</c:forEach>
					<!-- 10              5    -->
    <c:if test="${page.endPage < page.totalPage }">
    	<a href="${pageContext.request.contextPath }/board/dutchpay?category=${category }&currentPage=${page.startPage+page.pageBlock}">[다음]</a>
    </c:if>
 
 
</body>
</html>