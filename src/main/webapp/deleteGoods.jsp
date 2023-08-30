<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String goodsId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT * FROM Goods";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "DELETE FROM Goods WHERE g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 굿즈가 없습니다");

	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("editGoods.jsp?edit=delete");
%>