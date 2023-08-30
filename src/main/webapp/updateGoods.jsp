<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>굿즈 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">굿즈 수정</h1>
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
	<div class="container" style="color:white; font-family: 'Jua', sans-serif;">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("g_fileName")%>" alt="image"
					style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newGoods" action="./processUpdateGoods.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">굿즈 코드</label>
						<div class="col-sm-3">
							<input type="text" id="goodsId" name="goodsId" class="form-control"
								value='<%=rs.getString("g_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">굿즈명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value='<%=rs.getString("g_name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice"
								class="form-control" value='<%=rs.getString("g_unitPrice")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제작사</label>
						<div class="col-sm-3">
							<input type="text" name="maker" class="form-control"
								value='<%=rs.getString("g_maker")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control" placeholder="간단 소개"><%=rs.getString("g_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value='<%=rs.getString("g_category")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock"
								class="form-control" value='<%=rs.getString("g_unitsInStock")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="goodsImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
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
</body>
</html>