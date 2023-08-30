<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<style>
		.col-md-3 {
			overflow: hidden;
		}
		.col-md-3 img {
  			margin-left: 30px;
  			-webkit-transition: .3s ease-in-out;
  			transition: .3s ease-in-out;
		}
		.col-md-3:hover img {
  			margin-left: 0;
		}
	</style>
<title>굿즈 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">굿즈 목록</h1>
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
		<div class="row" align="center">
		<%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM Goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>

		<div class="col-md-3" Onclick="location.href='./goods.jsp?id=<%=rs.getString("g_Id")%>'" style="cursor:pointer; font-family: 'Jua', sans-serif;">
            <% out.println("<br>"); %>
            <img src="./resources/images/<%=rs.getString("g_filename")%>" style="width: 100%;">
            <h4>[<%=rs.getString("g_category")%>] <%=rs.getString("g_name") %></h4><p>
             <p><%=rs.getString("g_description")%>
        </div>
		<hr>
		<%
			}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

