void main(List<String> args) {
  dynamic variable = 100;

  var variableString = variable as int;

  print(variable);
  print(variableString);

  print(variableString is String);
  print(variableString is! String);
}
