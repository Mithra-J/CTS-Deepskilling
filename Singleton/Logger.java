// Logger.java
public class Logger {
    // Step 1: private static instance — the ONE and only instance, held by the class itself
    private static Logger instance;
    
    private int logCount = 0; // just to prove it's really shared state

    // Step 2: private constructor — NO ONE outside this class can do `new Logger()`
    private Logger() {
        System.out.println("Logger instance created!");
    }

    // Step 3: public static method — the ONLY door in
    public static Logger getInstance() {
        if (instance == null) {           // first time? create it
            instance = new Logger();
        }
        return instance;                   // every other time, return the SAME object
    }

    public void log(String message) {
        logCount++;
        System.out.println("[LOG #" + logCount + "]: " + message);
    }
}