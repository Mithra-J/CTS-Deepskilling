// Task.java
public class Task {
    int taskId;
    String taskName;
    String status;
    Task next; // pointer to next node — this is what makes it a linked list

    public Task(int taskId, String taskName, String status) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.status = status;
        this.next = null;
    }

    public String toString() {
        return "ID: " + taskId + ", Name: " + taskName + ", Status: " + status;
    }
}