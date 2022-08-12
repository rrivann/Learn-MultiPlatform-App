import 'data/repository.dart';

void main() {
  var repository = Repository('products');
  repository.id('1');
  repository.name('mac');
  repository.quantity(1000);
}
