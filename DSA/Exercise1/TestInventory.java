public class TestInventory {
    public static void main(String[] args){
        InventoryManager manager=new InventoryManager();
        manager.addProduct(new Product(1,"laptop",10,75000));
        manager.addProduct(new Product(2,"mouse",50,500));
        manager.addProduct(new Product(3,"keyboard",30,1200));
        manager.displayAll();
        manager.updateProduct(2,45,450);
        manager.deleteProduct(3);
        manager.displayAll();
    }
}
