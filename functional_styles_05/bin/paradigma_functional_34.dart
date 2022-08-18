// pure functions
int sum(int num1, int num2) {
  return num1 + num2;
}

// recursion
int fibonacci(n) {
  if (n <= 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

// immutable variables
var x = 5;
// x = x + 1; //Contoh variable yang tidak immutable