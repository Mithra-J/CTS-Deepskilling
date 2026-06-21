

// TestBuilder.java

public class TestBuilder {
    public static void main(String[] args) {
        Computer basicPC = new Computer.Builder()
                .setCpu("Intel i3")
                .setRam("8GB")
                .setStorage("256GB SSD")
                .build();
        basicPC.specs();

        Computer gamingPC = new Computer.Builder()
                .setCpu("Intel i9")
                .setRam("32GB")
                .setStorage("2TB SSD")
                .setGraphicsCard(true)
                .build();
        gamingPC.specs();
    }
}