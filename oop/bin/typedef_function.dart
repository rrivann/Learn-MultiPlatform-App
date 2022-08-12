typedef Filter = String Function(String);

void sayHello(String name, Filter filter) {
  print('hello ${filter(name)}');
}

void main(List<String> args) {
  sayHello('rivan', (p0) => p0.toUpperCase());
}
