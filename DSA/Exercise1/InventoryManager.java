import java.util.HashMap;
import java.util.Map;
public class InventoryManager {
    private HashMap<Integer,Product>inventory=new HashMap<>();
    public void addProduct(Product p){
        inventory.put(p.productId,p);
        System.out.println("Added: "+p);
    }//O(1)
    public void updateProduct(int productId,int newQty,double newPrice){
        Product p=inventory.get(productId);
        if(p!=null){
            p.quantity=newQty;
            p.price=newPrice;
            System.out.println("Updated: "+p);
        }else{
            System.out.println("Product not found for the productID: "+productId);
        }
    }
    public void deleteProduct(int productId){
        Product removed=inventory.remove(productId);
        if(removed!=null){
            System.out.println("Deleted: "+removed);
        }else{
            System.out.println("Product not found for the productID: "+productId);
        }
    }
    public void displayAll(){
        System.out.println("\n--- Inventory ---");
        for(Map.Entry<Integer,Product>e:inventory.entrySet()){
            System.out.println(e.getValue());
        }
    }
}
