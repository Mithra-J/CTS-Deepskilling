// TaskLinkedList.java
public class TaskLinkedList {
    private Task head = null;

    // Add at end — O(n)
    public void addTask(Task t) {
        if (head == null) { head = t; return; }
        Task current = head;
        while (current.next != null) current = current.next;
        current.next = t;
        System.out.println("Added: " + t);
    }

    // Search — O(n)
    public Task searchTask(int taskId) {
        Task current = head;
        while (current != null) {
            if (current.taskId == taskId) return current;
            current = current.next;
        }
        return null;
    }

    // Traverse — O(n)
    public void traverse() {
        System.out.println("\n--- Task List ---");
        Task current = head;
        while (current != null) {
            System.out.println(current);
            current = current.next;
        }
    }

    // Delete — O(n)
    public void deleteTask(int taskId) {
        if (head == null) return;
        if (head.taskId == taskId) { head = head.next; System.out.println("Deleted task: " + taskId); return; }
        Task current = head;
        while (current.next != null) {
            if (current.next.taskId == taskId) {
                current.next = current.next.next;
                System.out.println("Deleted task: " + taskId);
                return;
            }
            current = current.next;
        }
        System.out.println("Task not found: " + taskId);
    }
}