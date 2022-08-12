import 'data/category.dart';

void main(List<String> args) {
  var category = Category('1', 'laptop');
  var category2 = Category('1', 'laptop');

  print(category == category);
  print(category == category2);

  print(category.hashCode);
  print(category2.hashCode);
}
