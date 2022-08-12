import 'dart:ffi';

void main(List<String> args) {
  int? age = null;
  age = 1;

  if (age != null) {
    double toDouble = age.toDouble();
    print(toDouble);
  }

  String name = 'rivan';
  String nullableName = name;

  int? nullableprice = null;

  if (nullableprice != null) {
    int? price = nullableprice;
  }

  String? first;
  // first = 'a';
  var nameFirst = first ?? 'Rivan';
  print(nameFirst);

  int? nullablenumber;

  int nonNullablenumber = nullablenumber!;

  int? intNumber;
  double? dataDouble = intNumber?.toDouble();
  print(dataDouble);
}
