<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h4 class="alert alert-danger" style="color:white; cursor:pointer; font-family: 'Jua', sans-serif;">요청하신 페이지를 찾을 수 없습니다.</h4>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
      </div>
    </div>
    </section>
	<div class="container" style=" font-family: 'Jua', sans-serif;">
		<p><%=request.getRequestURL()%></p>
		<p>
			<a href="goodss.jsp" class="btn btn-secondary" style="color:white; cursor:pointer; font-family: 'Jua', sans-serif;"> 굿즈 목록 &raquo;</a>
		</p>
	</div>
</body>
</html>
