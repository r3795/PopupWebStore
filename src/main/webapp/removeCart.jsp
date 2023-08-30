<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Goods"%>
<%@ page import="dao.GoodsRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("goodss.jsp");
		return;
	}

	GoodsRepository dao = GoodsRepository.getInstance();
	
	Goods goods = dao.getGoodsById(id);
	if (goods == null) {
		response.sendRedirect("exceptionNoGoodsId.jsp");
	}

	ArrayList<Goods> cartList = (ArrayList<Goods>) session.getAttribute("cartlist");
	Goods goodsQnt = new Goods();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getGoodsId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
