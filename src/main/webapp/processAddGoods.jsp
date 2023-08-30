<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String filename ="";
	String realFolder = "C:\\WebProject\\GoodsMarket\\src\\main\\webapp\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String goodsId = multi.getParameter("goodsId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String maker = multi.getParameter("maker");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else 
		price = Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty())
		stock = 0;
	else 
		stock = Long.valueOf(unitsInStock);
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;

	String sql = "INSERT INTO Goods VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, goodsId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, maker);
	pstmt.setString(5, description);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("goodss.jsp");
%>