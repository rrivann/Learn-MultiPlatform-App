void sayHello(String first, [String? last, String middle = '']) {
  print('hello $first $last $middle');
}

void main(List<String> args) {
  sayHello(
    'rova',
    'last',
  );
}
