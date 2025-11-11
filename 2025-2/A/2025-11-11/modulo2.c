#include <stdio.h>
#include "header.h"

// extern int a;

int fun1(int i, float f) {
    return fun2(f, i) + a;
}