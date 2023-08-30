<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Goods"%>
<%@ page import="dao.GoodsRepository"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">장바구니</h1>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
      </div>
    </div>
    </section>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger" style="color:white; font-family: 'Jua', sans-serif;">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success" style="color:white; font-family: 'Jua', sans-serif;">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover" style=" font-family: 'Jua', sans-serif;">
				<tr>
					<th>굿즈</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
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
					<td><%=goods.getGoodsId()%> - <%=goods.getName()%></td>
					<td><%=goods.getUnitPrice()%></td>
					<td><%=goods.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=goods.getGoodsId()%>" class="badge badge-danger" style="color:white; font-family: 'Jua', sans-serif;">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./goodss.jsp" class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
