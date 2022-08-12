import 'data/product.dart';

void main(List<String> args) {
  var product = Product();
  product.id = '1';
  product.name = 'a';
  print(product.toString());
  print(product);
}
