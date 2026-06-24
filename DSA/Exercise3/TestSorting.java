public class TestSorting {
    public static void main(String[] args){
        Order[] orders1={
            new Order(1,"Alice",5000),
            new Order(2,"Bob",15000),
            new Order(3,"Charlie",3200),
            new Order(4,"Diana",800)
        };
        Order[] orders2=orders1.clone();
        System.out.println("--- Bubble sort ---");
        bubbleSort.sort(orders1);
        for(Order o:orders1){
            System.out.println(o);
        }
        System.out.println("\n--- Quick sort ---");
        quickSort.sort(orders2,0,orders2.length-1);
            for(Order o:orders2){
                System.out.println(o);
            }
        
    }    
}
