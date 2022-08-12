class Manager {
  String? name;

  void sayHello(String name) {
    print('hello $name, my name is Manager ${this.name}');
  }
}

class VicePresident extends Manager {
  @override
  void sayHello(String name) {
    print('hello $name, my name is Vp ${this.name}');
  }
}

class Clevel extends Manager {
  @override
  void sayHello(String name) {
    print('hello $name, my name is Clevel ${this.name}');
  }
}

void main(List<String> args) {
  var manager = Manager();
  manager.name = 'rivan';
  manager.sayHello('albani');

  var vp = VicePresident();
  vp.name = 'rivan';
  vp.sayHello('albani');

  var cl = Clevel();
  cl.name = 'rivan';
  cl.sayHello('albani');
}
