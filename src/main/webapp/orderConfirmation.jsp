<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Goods"%>
<%@ page import="dao.GoodsRepository"%>


<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

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
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">주문 정보</h1>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
      </div>
    </div>
    </section>

	<div class="container col-8 alert alert-info">
		<div class="text-center " style="font-family: 'Jua', sans-serif;">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left" style=" font-family: 'Jua', sans-serif;">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
				우편번호 : <% 	out.println(shipping_zipCode);%><br> 
				주소 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4" align="right" style=" font-family: 'Jua', sans-serif;">
				<p>	<em>배송일: <% out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover" style=" font-family: 'Jua', sans-serif;">			
			<tr>
				<th class="text-center">굿즈</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Goods> cartList = (ArrayList<Goods>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Goods>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Goods goods = cartList.get(i);
					int total = goods.getUnitPrice() * goods.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=goods.getName()%> </em></td>
				<td class="text-center"><%=goods.getQuantity()%></td>
				<td class="text-center"><%=goods.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right" style=" font-family: 'Jua', sans-serif;">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>
			
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button" style="color:white; font-family: 'Jua', sans-serif;"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;" role="button"> 취소 </a>			
		</div>
	</div>	
</body>
</html>
