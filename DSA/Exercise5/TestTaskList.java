// TestTaskList.java
public class TestTaskList {
    public static void main(String[] args) {
        TaskLinkedList list = new TaskLinkedList();

        list.addTask(new Task(1, "Design DB", "Pending"));
        list.addTask(new Task(2, "Build API", "In Progress"));
        list.addTask(new Task(3, "Write Tests", "Pending"));

        list.traverse();

        Task found = list.searchTask(2);
        System.out.println("\nSearch ID 2: " + (found != null ? found : "Not Found"));

        list.deleteTask(2);
        list.traverse();
    }
}