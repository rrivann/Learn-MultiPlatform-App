void main(List<String> args) {
  List<int> listInt = [];

  var listString = <String>[];

  listString.add('a');
  listString.add('b');
  listString.add('c');

  print(listInt);
  print(listString.length);

  print(listString[0]);
  listString[0] = 'rivan';
  listString.removeAt(1);
  print(listString);
}
