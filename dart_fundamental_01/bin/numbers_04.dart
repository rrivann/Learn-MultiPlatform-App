void main(List<String> args) {
  // var number = 2022;
  // var hex = 0xDEADBEEF;
  // var decimal = 2.1;
  // var pi = 3.14;
  // double withoutDecimal = 7; //same as double withoutDecimal = 7.0

  // convert

  // string -> int
  var eleven = int.parse('11');
  print(eleven);

  // string -> double
  var elevenPointTwo = double.parse('11.2');
  print(elevenPointTwo);

  // int -> string
  var elevenAsString = 11.toString();
  print(elevenAsString);

  // double -> string
  var piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
}
