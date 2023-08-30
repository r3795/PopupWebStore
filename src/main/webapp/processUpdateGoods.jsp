<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
	String filename = "";
	String realFolder = "C:\\WebProject\\GoodsMarket\\src\\main\\webapp\\resources\\images"; // 웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; // 인코딩 타입
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기5MB
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, 
			new DefaultFileRenamePolicy());

	String goodsId = multi.getParameter("goodsId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String maker = multi.getParameter("maker");
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM Goods WHERE g_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, goodsId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE Goods SET g_name = ?, g_unitPrice = ?, g_maker = ?, g_description = ?, g_category = ?, g_unitsInStock = ?, g_condition = ?, g_fileName = ? WHERE g_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, maker);
			pstmt.setString(4, description);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, fileName);
			pstmt.setString(9, goodsId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE Goods SET g_name = ?, g_unitPrice = ?, g_maker = ?, g_description = ?, g_category = ?, g_unitsInStock = ?, g_condition = ?, g_fileName = ? WHERE g_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, maker);
			pstmt.setString(4, description);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, fileName);
			pstmt.setString(9, goodsId);
			pstmt.executeUpdate();
		}
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editGoods.jsp?edit=update");
%>