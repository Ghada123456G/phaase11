package phase1;

public class Coffee extends Beverage{

	private int numOfProduct;
	
	public Coffee(int NOP , String name, double ml, String exp, String pName) {
		super(name, ml,  exp, pName);
		numOfProduct= NOP;
	}
	
	public String toString() {
		return super.toString() + ", Number of product: " + numOfProduct;
	}

	public int getNumOfProduct() {
		return numOfProduct;
	}

	public void setNumOfProduct(int numOfProduct) {
		this.numOfProduct = numOfProduct;
	}
}
