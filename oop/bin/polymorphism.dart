class Employee {
  String name;
  Employee(this.name);
}

class Manager extends Employee {
  Manager(String name) : super(name);
}

class VicePresident extends Manager {
  VicePresident(String name) : super(name);
}

void main(List<String> args) {
  Employee employee = Employee('rivan');
  print(employee);

  employee = Manager('rivan');
  print(employee);

  employee = VicePresident('rivan');
  print(employee);
}
