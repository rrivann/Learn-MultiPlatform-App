class Car {
  String name = '';

  void drive() {}

  int getTier() => 0;
}

abstract class HasBrand {
  String getBrand();
}

class Avanza implements Car, HasBrand {
  @override
  String getBrand() => "Toyota";

  @override
  String name = 'Avanza';

  @override
  void drive() {
    print('drive avanza');
  }

  @override
  int getTier() => 4;
}
