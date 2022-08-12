import 'data/customer.dart';

void main(List<String> args) {
  var customer = Customer('rivan', CustomerLevel.vip);
  print(customer.level);
  print(CustomerLevel.values);
}
