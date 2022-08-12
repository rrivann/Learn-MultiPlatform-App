class Manager {
  String? name;
  Manager(this.name);
}

class VicePresident extends Manager {
  VicePresident(String name) : super(name) {
    print("create new vice");
  }
}

void main(List<String> args) {
  var manager = Manager('al');
  print(manager.name);
  var vp = VicePresident('riv');
  print(vp.name);
}
