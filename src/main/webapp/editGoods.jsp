<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>굿즈 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 굿즈를 삭제합니다!!") == true)
			location.href = "./deleteGoods.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">굿즈 편집</h1>
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
		<%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "SELECT * FROM Goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<div class="row" style=" font-family: 'Jua', sans-serif;">
			<div class="col-md-3" align="center" >
				<img src="./resources/images/<%=rs.getString("g_fileName")%>"
					style="width: 50%">
			</div>
			<div class="col-md-7">
				<p><h5><b>[<%=rs.getString("g_category")%>] <%=rs.getString("g_name")%></b></h5>
				<p style="padding-top: 20px"><%=rs.getString("g_description")%>
			</div>
			<div class="col-md-2" style="padding-top: 70px">
				<p><%
					if (edit.equals("update")) {
				%>
				<a href="./updateGoods.jsp?id=<%=rs.getString("g_id")%>"
					class="btn btn-success" role="button">수정 &raquo;</a>
				<%
					} else if (edit.equals("delete")) {
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("g_id")%>')"
					class="btn btn-danger" role="button">삭제 &raquo;</a>
				<%
					}
				%>
			</div>
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
	<jsp:include page="footer.jsp" />
</body>
</html>