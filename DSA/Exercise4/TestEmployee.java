// TestEmployee.java
public class TestEmployee {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);

        manager.addEmployee(new Employee(1, "Alice", "Developer", 80000));
        manager.addEmployee(new Employee(2, "Bob", "Manager", 95000));
        manager.addEmployee(new Employee(3, "Charlie", "Tester", 60000));

        manager.traverse();

        Employee found = manager.searchById(2);
        System.out.println("\nSearch ID 2: " + (found != null ? found : "Not Found"));

        manager.deleteEmployee(2);
        manager.traverse();
    }
}