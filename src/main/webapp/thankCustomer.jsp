<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";		

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">주문 완료</h1>
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
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>	주문은	<%	out.println(shipping_shippingDate);	%>에 배송될 예정입니다! !	
		<p>	주문번호 :	<%	out.println(shipping_cartId);	%>		
	</div>
	<div class="container">
		<p>	<a href="./goodss.jsp" class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;"> &laquo; 굿즈 목록</a>		
	</div>
</body>
</html>
<%
	session.invalidate();

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>
