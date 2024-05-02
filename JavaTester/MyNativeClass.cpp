#include "MyNativeClass.h"
#include <stdio.h>

#include <hello.hpp>
#include <add.hpp>

JNIEXPORT void JNICALL Java_MyNativeClass_myNativeMethod(JNIEnv *env, jclass cls)
{
  printf("Hello from native method!\n");
}

JNIEXPORT void JNICALL Java_MyNativeClass_hello(JNIEnv *, jclass)
{
  hello();
}

JNIEXPORT jint JNICALL Java_MyNativeClass_add(JNIEnv *, jclass, jint a, jint b)
{
  return add((int)a, int(b));
}

JNIEXPORT void JNICALL Java_MyNativeClass_hi(JNIEnv *env, jclass, jstring str)
{
  const char *c_str = env->GetStringUTFChars(str, NULL);

  if (c_str == NULL)
  {
    return;
  }
  std::string s(c_str);
  env->ReleaseStringUTFChars(str, c_str);

  hi(s);
}