
public class Main {
    public static void main(String[] args) {
        // Check if a command-line argument was provided
        if (args.length > 0) {
            String userName = args[0];
            System.out.println("Hello, " + userName + "!");
        } else {
            System.out.println("Hello, Java Application!");
        }
    }
}