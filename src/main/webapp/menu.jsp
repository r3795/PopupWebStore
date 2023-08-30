<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Marhey&display=swap" rel="stylesheet">
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
	  <img src="./resources/images/mokoko_nav.gif" width="50">
      <h5 class="my-0 mr-md-auto font-weight-normal" style="font-family: 'Marhey', cursive;">Mokoko</h5>
      <nav class="my-2 my-md-0 mr-md-3">
      	<%
			String id = (String)request.getRemoteUser();
        	if(id != null) {
        %>
        <a class="p-2 text-dark" style="font-family: 'Marhey', cursive;">ID : <%=(String)request.getRemoteUser() %></a>
        <%
        	}
        %>
        <a class="p-2 text-dark" href="welcome.jsp" style="font-family: 'Marhey', cursive;">Home</a>
        <a class="p-2 text-dark" href="goodss.jsp" style="font-family: 'Marhey', cursive;">Product</a>
        <%
			id = (String)request.getRemoteUser();
        	if(id != null && !id.equals("admin")) {
        %>
        <a class="p-2 text-dark" href="cart.jsp" style="font-family: 'Marhey', cursive;">Wish</a>
        <%
        	}
        %>
        <%
			id = (String)request.getRemoteUser();
        	if(id != null && id.equals("admin")) {
        %>
        <a class="p-2 text-dark" href="addGoods.jsp" style="font-family: 'Marhey', cursive;">Register</a>
        <a class="p-2 text-dark" href="editGoods.jsp?edit=update" style="font-family: 'Marhey', cursive;">Edit</a>
        <a class="p-2 text-dark" href="editGoods.jsp?edit=delete" style="font-family: 'Marhey', cursive;">Delete</a>
        <%
        	}
        %>
        <%
			id = (String)request.getRemoteUser();
        	if(id != null) {
        %>
        <a class="btn btn-outline-primary" href="logout.jsp" style="font-family: 'Marhey', cursive;">Logout</a>
                <%
        	}
        %>
      </nav>
    </div>