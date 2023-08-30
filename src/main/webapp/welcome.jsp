<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Marhey&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>Welcome</title>
</head>
<body style="background-image:url('./resources/images/mokoko_welcome.jpg'); background-size:cover;">
	<%!String greeting = "Mokoko Online Store";
	String tagline = "Goods";%>

	<body class="text-center">
    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <main role="main" class="inner cover">
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <h1 class="cover-heading" style="font-family: 'Marhey', cursive;">In to the Mokoko World!</h1>
        <p class="lead" style="font-family: 'Jua', sans-serif;"> 온라인 팝업 스토어 개장! </p>
        <p class="lead">
          <a href="goodss.jsp" class="btn btn-lg btn-primary" style="color:white; font-family: 'Jua', sans-serif;">함께 하기</a>
        </p>
      </main>
      <hr>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>