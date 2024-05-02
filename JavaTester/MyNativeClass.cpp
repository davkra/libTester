#include "MyNativeClass.h"
#include <stdio.h>

JNIEXPORT void JNICALL Java_MyNativeClass_myNativeMethod(JNIEnv *env, jclass cls)
{
  printf("Hello from native method!\n");
}