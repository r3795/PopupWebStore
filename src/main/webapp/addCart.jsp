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

	ArrayList<Goods> goodsList = dao.getAllGoodss();
	Goods product = new Goods();
	for (int i = 0; i < goodsList.size(); i++) {
		product = goodsList.get(i);
		if (product.getGoodsId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Goods> list = (ArrayList<Goods>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Goods goodsQnt = new Goods();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getGoodsId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		product.setQuantity(1);
		list.add(product);
	}

	response.sendRedirect("goods.jsp?id=" + id);
%>