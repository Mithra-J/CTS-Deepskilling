

public class Computer {
    // final fields — once built, can't change
    private final String cpu;
    private final String ram;
    private final String storage;
    private final boolean hasGraphicsCard; // optional part

    // private constructor — takes the Builder, not individual params
    private Computer(Builder builder) {
        this.cpu = builder.cpu;
        this.ram = builder.ram;
        this.storage = builder.storage;
        this.hasGraphicsCard = builder.hasGraphicsCard;
    }

    public void specs() {
        System.out.println("CPU: " + cpu + ", RAM: " + ram + ", Storage: " + storage 
            + ", Graphics Card: " + (hasGraphicsCard ? "Yes" : "No"));
    }

    // Static nested Builder class
    public static class Builder {
        private String cpu;
        private String ram;
        private String storage;
        private boolean hasGraphicsCard = false; // default

        public Builder setCpu(String cpu) {
            this.cpu = cpu;
            return this; // returning `this` lets you CHAIN calls
        }

        public Builder setRam(String ram) {
            this.ram = ram;
            return this;
        }

        public Builder setStorage(String storage) {
            this.storage = storage;
            return this;
        }

        public Builder setGraphicsCard(boolean hasGraphicsCard) {
            this.hasGraphicsCard = hasGraphicsCard;
            return this;
        }

        public Computer build() {
            return new Computer(this); // hands itself to Computer's constructor
        }
    }
}