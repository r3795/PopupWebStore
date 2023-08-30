package dto;
 
public class Goods implements java.io.Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
    private String goodsId;//도서 id
    private String name; //도서이름
    private Integer unitPrice;// 가격
    private String description;//설명
    private String maker;//출판사
    private String category;//분류
    private long unitsInStock;//재고 수
    private String condition; //신상품 중고품 재생품
    private String filename;
    private int quantity;
    
    public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Goods() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public Goods(String goodsId, String name, Integer unitPrice) {
        this.goodsId = goodsId;
        this.name = name;
        this.unitPrice = unitPrice;
    }
 
    public String getGoodsId() {
        return goodsId;
    }
    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getMaker() {
        return maker;
    }
    public void setMaker(String maker) {
        this.maker = maker;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public long getUnitsInStock() {
        return unitsInStock;
    }
    public void setUnitsInStock(long unitsInStock) {
        this.unitsInStock = unitsInStock;
    }
    public String getCondition() {
        return condition;
    }
    public void setCondition(String condition) {
        this.condition = condition;
    }

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
    
}