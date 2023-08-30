<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage ="exceptionNoGoodsId.jsp"%>
<html>
<head>
<link rel="stylesheet" 	href="./resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>굿즈 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("굿즈를 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">굿즈 정보</h1>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
      </div>
    </div>
    </section>
	<%@ include file="dbconn.jsp"%>
	<%
		String goodsId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM Goods WHERE g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container" style=" font-family: 'Jua', sans-serif;">
			<div class="row">
				<div class="col-md-4">
					<img src="./resources/images/<%=rs.getString("g_fileName")%>"
						style="width: 100%" />
				</div>
				<div class="col-md-8">
					<h4><b>[<%=rs.getString("g_category")%>]<%=rs.getString("g_name")%></b></h4>
					<p><%=rs.getString("g_description")%>
					<p><b>굿즈 코드 : </b><span class="badge badge-danger"> <%=rs.getString("g_id")%></span>
					<p><b>제작사</b> : <%=rs.getString("g_maker")%>
					<p>분류 : <%=rs.getString("g_category")%>
					<h4><%=rs.getString("g_unitPrice")%>원</h4>
					<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("g_id")%>" method="post">
					<%
						String id = (String)request.getRemoteUser();
						if(id != null && !id.equals("admin")) {
					%>
						<a href="#" class="btn btn-info" onclick="addToCart()">굿즈 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<%
						}
					%>
						<a href="./goodss.jsp" class="btn btn-secondary">굿즈 목록 &raquo;</a>
					</form>
				</div>
			</div>
			<hr>
		</div>
		<%
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		%>
		<jsp:include page="footer.jsp" />
</body>
</html>
