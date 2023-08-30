<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>굿즈 등록</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	<jsp:include page="menu.jsp"/>
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="title"/></h1>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
        <% out.println("<br>"); %>
      </div>
    </div>
    </section>
	
	<div class="container" >
		<% out.println("<br>"); %>
		<div class="text-right"> 
			<a href="?language=ko" class="btn btn-secondary" style="cursor:pointer; font-family: 'Jua', sans-serif;">Korean</a> <a href="?language=en" class="btn btn-primary" style="cursor:pointer; font-family: 'Jua', sans-serif;">English</a>
		</div>
		<form name="newGoods" action="./processAddGoods.jsp"class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="goodsId" /></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" id="goodsId" name="goodsId" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="gname" /></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" id="name" name="name" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="maker"/></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" name="maker" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="description"/></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<textarea name="description" cols="50" rows="2" class="form-control" style="text-align: center"></textarea>
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="category"/></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" name="category" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="form-group row" style="text-align: center">
				<label class="col-sm-5" style="cursor:pointer; font-family: 'Jua', sans-serif;"><fmt:message key="goodsImage" /></label>
				<div class="col-sm-4" style="text-align: center; display:inline-block;">
					<input type="file" name="goodsImage" class="form-control" style="text-align: center">
				</div>
			</div>
		<div class="text-right"> 
			<input type="button" class="btn btn-primary" style="cursor:pointer; font-family: 'Jua', sans-serif;" value="<fmt:message key="button" />" onclick="CheckAddGoods()">
		</div>
		</form>
	</div>
	</fmt:bundle>
	<jsp:include page="footer.jsp"/>
</body>
</html>