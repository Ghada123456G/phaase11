package phase1;

public class MiniMarket {

	  private String marketName;
	  Product [] pList;
	  Order[] oList;
	  private int products , orders;
	  
	  public MiniMarket(String name , int orderMax) {
		  marketName= name;
		  pList= new Product[1000];
		  products= 0;
		  oList= new Order[orderMax];
		  orders= 0;
	  }
	  
	  public void addProduct(Product P) {
		 // if(products < pList.length) {
			  pList[products++]= P; // Aggregation
			  P.setStock(true);
			//  return true;
		  //}
		  //else 
			//  return false;
	  }
	 
	 /* public void Stock(Product p) {
		  if(products == 0)
			  p.setStock(false);
		  else
			  p.setStock(true);
	  }*/
	  
	  public boolean addOrder(Order O) {
		 if(orders < oList.length) {
			  oList[orders++]= new Order(O);// Composition
			  oList[orders-1].setOrderID("233" + orders);
			  oList[orders-1].setDate();
			 // products-= O.getNumOfProduct();
			  return true;
		  }
		  else 
			 return false;
	  }
	  
	  public boolean cancelOrder(String mobile , String orderID) {
		 boolean x= false;
		  for(int i= 0 ; i < orders ; i++) {
			  if(oList[i].getMobile().equals(mobile) && oList[i].getOrderID().equals(orderID)) {
				  oList[i]= oList[--orders];
				  oList[orders]= null;
				  products+= oList[i].getNumOfProduct();
				  x= true;
			  }
			  else
				  x= false;
		  }
		  return x;
	  }
	  
	public Order searchOrder(String mobile , String orderID) {
		  Order o= oList[orders];
		  int c= 0;
		  for(int i= 0 ; i < orders ; i++) {
			  if(oList[i].getMobile().equals(mobile) && oList[i].getOrderID().equals(orderID)) {
				  o= oList[i];
				  c++;
			  }  
		  }
		  if(c == 0)
			  return null;
		  else	
			  return o;
	  }
	  
	  public Product searchProduct(String name ) {
		  Product p= null;
	
		  for(int i= 0 ; i < orders ; i++) {
			  if(pList[i].getName().equals(name)) {
				  p= pList[i];
			  }
		  }
		 return p;
	  }
	  
	  public Food[] getFood() {
		  Food[] list= new Food[products];
		  int count= 0;
		  for(int i= 0 ; i < products ; i++) {
			  if(pList[i] instanceof Food) 
				  list[count++]= (Food) pList[i];
		  }
		  if(count == 0)
			  return null;
		  else
			  return list;
	  }
	  
	  public Bakery[] getBakery() {
		  Bakery[] list= new Bakery[products];
		  int count= 0;
		  for(int i= 0 ; i < products ; i++) {
			  if(pList[i] instanceof Bakery) 
				  list[count++]= (Bakery) pList[i];
		  }
		  if(count == 0)
			  return null;
		  else
			  return list;
	  }
	  
	  public Beverage[] getBeverage() {
		  Beverage[] list= new Beverage[products];
		  int count= 0;
		  for(int i= 0 ; i < products ; i++) {
			  if(pList[i] instanceof Beverage) 
				  list[count++]= (Beverage) pList[i];
		  }
		  if(count == 0)
			  return null;
		  else
			  return list;
	  }
	  
	  public Coffee[] getCoffee() {
		  Coffee[] list= new Coffee[products];
		  int count= 0;
		  for(int i= 0 ; i < products ; i++) {
			  if(pList[i] instanceof Coffee) 
				  list[count++]= (Coffee) pList[i];
		  }
		  if(count == 0)
			  return null;
		  else
			  return list;
	  }
	  
	  public Product[] getAllStock() {
		  Product[] list= new Product[products];
		  int count= 0;
		  
		  for(int i= 0 ; i < products ; i++) {
			  if(pList[i].inStock())
				  list[count++]= pList[i];
		  }
		  if(count == 0)
			  return null;
		  else
			  return list;
	  }

	  public String toString() {
		  String str= "Market name: " + marketName + "\nProduct List: \n";
		
		  for(int i= 0 ; i < products ; i++) {
			 str+= pList[i];
		  }
		  str+= "\nOrder List: \n";
		  for(int i= 0 ; i < products ; i++) {
				 str+= oList[i];
			  }
		  str+= "\nNumber Of Products: "+ products + " Number Of Orders: " + orders;
		  return str;
		  
	  }
	public int getProducts() {
		return products;
	}

	public void setProducts(int products) {
		this.products = products;
	}

	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}  
}
