import 'data/product.dart';

void main(List<String> args) {
  var product = Product();
  product.id = '1';
  product.name = 'mac';
  // product._quantity = '1';
  product.getQuantity();
}
