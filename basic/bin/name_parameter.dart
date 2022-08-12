void sayHello({String? first = 'rivan', required String? last}) {
  print('hello $first $last');
}

void main(List<String> args) {
  sayHello(first: 'rivan', last: 'albani');
  sayHello(last: 'albani');
}
