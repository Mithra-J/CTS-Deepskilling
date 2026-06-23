public class Product {
    int productId;
    String productName;
    String category;
    public Product(int productID,String productName, String Category){
        this.productId=productID;
        this.productName=productName;
        this.category=category;
    }
    public String toString(){
        return "ID: "+productId+", Name: "+productName+" ,Category: "+category;
    }
}
