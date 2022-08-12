class Manager {
  String? name;

  void sayHello(String name) {
    print('hello $name, my name is ${this.name}');
  }
}

class VicePresident extends Manager {}

void main(List<String> args) {
  var manager = Manager();
  manager.name = 'rivan';
  manager.sayHello('albani');

  var vp = VicePresident();
  vp.name = 'rivan';
  vp.sayHello('albani');
}
