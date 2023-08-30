<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="py-5 text-center container" style="background-image:url('./resources/images/mokoko.jpg'); opacity:0.8; border-radius:2%">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	<% out.println("<br>"); %>
        <h1 class="fw-light" style="color:white; font-family: 'Jua', sans-serif;">배송 정보</h1>
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
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">
				<label class="col-sm-2" style=" font-family: 'Jua', sans-serif;">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" style=" font-family: 'Jua', sans-serif;">배송일</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control" />(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" style=" font-family: 'Jua', sans-serif;">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" style=" font-family: 'Jua', sans-serif;">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" style=" font-family: 'Jua', sans-serif;">주소</label>
				<div class="col-sm-5">
					<input name="addressName" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;" role="button"> 이전 </a> 
					<input	type="submit" class="btn btn-primary" style="color:white; font-family: 'Jua', sans-serif;" value="등록" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" style="color:white; font-family: 'Jua', sans-serif;" role="button"> 취소 </a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
