<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/GoodsMarketDB";
	String user = "root";
	String password = "root1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection(url, user, password);
%>