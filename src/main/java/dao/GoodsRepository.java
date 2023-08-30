package dao;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.Goods;
public class GoodsRepository {
    private  ArrayList<Goods> listOfGoodss = new ArrayList<>();
    private static GoodsRepository instance = new GoodsRepository();
      
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private static String url = "jdbc:mysql://localhost:3306/GoodsMarketDB";
    private static String user = "root";
    private static String password = "root1234";
    
	public static GoodsRepository getInstance() {
		return instance;
	}
		 
    public GoodsRepository(){
        
    }
    public ArrayList<Goods> getAllGoodss(){
    	String sql = "select * from Goods";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getString("g_Id"));
				goods.setName(rs.getString("g_name"));
				goods.setUnitPrice(rs.getInt("g_unitPrice"));
				goods.setMaker(rs.getString("g_maker"));
				goods.setDescription(rs.getString("g_description"));
				goods.setCategory(rs.getString("g_category"));
				goods.setUnitsInStock(rs.getLong("g_unitsInStock"));
				goods.setCondition(rs.getString("g_condition"));
				goods.setFilename(rs.getString("g_filename"));
				
				listOfGoodss.add(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return listOfGoodss;
	}
    
    public Goods getGoodsById(String goodsId) {
		Goods goodsById = new Goods();
		String sql = "select * from Goods where goodsId = ?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodsId);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			if(rs.next()) {
				goodsById.setGoodsId(rs.getString("g_Id"));
				goodsById.setName(rs.getString("g_name"));
				goodsById.setUnitPrice(rs.getInt("g_unitPrice"));
				goodsById.setMaker(rs.getString("g_maker"));
				goodsById.setDescription(rs.getString("g_description"));
				goodsById.setCategory(rs.getString("g_category"));
				goodsById.setUnitsInStock(rs.getLong("g_unitsInStock"));
				goodsById.setCondition(rs.getString("g_condition"));
				goodsById.setFilename(rs.getString("g_filename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		
		return goodsById;
	}
    public void addGoods(Goods goods)
	{
		listOfGoodss.add(goods);
	}
}