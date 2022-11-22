/* Simple c program, doing some math.  */

#include <stdio.h>

int a [] = { 1, 2, 3, 4, 5 };

int madd(int a, int b, int c) {
  return a * b + c;
}

void pass() {
  return;
}

int main() {
  int res;

  pass();

  for (int i = 0; i < 5; i++) {
    res = madd(0  , a[1], a[i]);
    res = madd(res, a[2], a[i]);
    res = madd(res, a[2], a[i]);
    res = madd(res, a[3], a[i]);
    res = madd(res, a[4], a[i]);
  }

  printf("Result is = %d\n", res);

  return 0;
}
