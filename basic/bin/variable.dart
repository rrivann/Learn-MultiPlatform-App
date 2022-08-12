void main(List<String> args) {
  var a = '1';
  final name = 'a';
  const lastName = 'b';
  print(a + name + lastName);

  late var value = getValue();
  print('variable created');
  print(value);
}

String getValue() {
  print('GetValue() call');
  return 'rivan';
}
