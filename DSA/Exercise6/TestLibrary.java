// TestLibrary.java
public class TestLibrary {
    public static void main(String[] args) {
        // Sorted alphabetically by title for binary search
        Book[] books = {
            new Book(1, "Clean Code", "Robert Martin"),
            new Book(2, "Design Patterns", "Gang of Four"),
            new Book(3, "Effective Java", "Joshua Bloch"),
            new Book(4, "Head First Java", "Kathy Sierra"),
            new Book(5, "The Pragmatic Programmer", "Andrew Hunt")
        };

        System.out.println("--- Linear Search ---");
        Book b1 = LibrarySearch.linearSearch(books, "Effective Java");
        System.out.println(b1 != null ? "Found: " + b1 : "Not Found");

        System.out.println("\n--- Binary Search ---");
        Book b2 = LibrarySearch.binarySearch(books, "Effective Java");
        System.out.println(b2 != null ? "Found: " + b2 : "Not Found");

        Book b3 = LibrarySearch.binarySearch(books, "Unknown Book");
        System.out.println("Search 'Unknown Book': " + (b3 != null ? b3 : "Not Found"));
    }
}