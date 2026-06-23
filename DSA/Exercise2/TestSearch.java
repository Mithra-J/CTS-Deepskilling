// TestSearch.java
public class TestSearch {
    public static void main(String[] args) {
        // Sorted by productId for binary search to work
        Product[] products = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Mouse", "Electronics"),
            new Product(3, "Shirt", "Clothing"),
            new Product(4, "Book", "Education"),
            new Product(5, "Phone", "Electronics")
        };

        System.out.println("--- Linear Search ---");
        Product result1 = LinearSearch.search(products, 3);
        System.out.println(result1 != null ? "Found: " + result1 : "Not Found");

        System.out.println("\n--- Binary Search ---");
        Product result2 = BinarySearch.search(products, 3);
        System.out.println(result2 != null ? "Found: " + result2 : "Not Found");

        // Search for non-existent product
        Product result3 = BinarySearch.search(products, 99);
        System.out.println("Search 99: " + (result3 != null ? result3 : "Not Found"));
    }
}