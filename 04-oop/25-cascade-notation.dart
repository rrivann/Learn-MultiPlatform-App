import 'Animal.dart';

void main() {
  var dicodingCat = Animal('', 2, 4.2)
    ..name = 'Gray'
    ..eat();

  dicodingCat.name = 'Gray';
  dicodingCat.eat();

  // final addressBook = (AddressBookBuilder()
  //       ..name = 'jenny'
  //       ..email = 'jenny@example.com'
  //       ..phone = '415-555-0100')
  //     .build();
}
