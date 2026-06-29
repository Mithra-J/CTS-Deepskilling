// EmployeeManager.java
public class EmployeeManager {
    private Employee[] employees;
    private int count = 0;

    public EmployeeManager(int capacity) {
        employees = new Employee[capacity];
    }

    // Add — O(1)
    public void addEmployee(Employee e) {
        if (count < employees.length) {
            employees[count++] = e;
            System.out.println("Added: " + e);
        } else {
            System.out.println("Array full!");
        }
    }

    // Search — O(n)
    public Employee searchById(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id)
                return employees[i];
        }
        return null;
    }

    // Traverse — O(n)
    public void traverse() {
        System.out.println("\n--- All Employees ---");
        for (int i = 0; i < count; i++)
            System.out.println(employees[i]);
    }

    // Delete — O(n) due to shifting
    public void deleteEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                for (int j = i; j < count - 1; j++)
                    employees[j] = employees[j + 1];
                employees[--count] = null;
                System.out.println("Deleted employee ID: " + id);
                return;
            }
        }
        System.out.println("Employee not found: " + id);
    }
}