public class Product {
    int productId;
    String productName;
    int quantity;
    double price;
    public Product(int productID,String productName, int quantity, double price){
        this.productId=productID;
        this.productName=productName;
        this.quantity=quantity;
        this.price=price;
    }
    public String toString(){
        return "ID: "+productId+", Name: "+productName+" ,Quantity+ "+quantity+", Price: "+price;
    }
}
