package at.java.libtester;

public class MyNativeClass {
  // Declare the native method
  public static native void myNativeMethod();

  public static native void hello();

  public static native void hi(String str);

  public static native int add(int a, int b);

  // Load the native library
  static {
    System.loadLibrary("myNativeLibrary");
  }

  // Main method
  public static void main(String[] args) {
    myNativeMethod(); // Call the native method
    hello();
    hi("Test");
    System.out.println(add(-1, 2));
  }
}
