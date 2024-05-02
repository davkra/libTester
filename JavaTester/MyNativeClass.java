public class MyNativeClass {
  // Declare the native method
  public static native void myNativeMethod();

  // Load the native library
  static {
    System.loadLibrary("myNativeLibrary");
  }

  // Main method
  public static void main(String[] args) {
    myNativeMethod(); // Call the native method
  }
}
