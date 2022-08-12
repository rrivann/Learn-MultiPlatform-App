class Customer {
  String firstName = '';
  String lastName = '';
  String fullName = '';

  Customer(this.fullName)
      : firstName = fullName.split(" ")[0],
        lastName = fullName.split(" ")[1] {
    print("Create new customer");
  }
}

void main(List<String> args) {
  var customer = Customer("Rivan Albani");
  print(customer.firstName);
  print(customer.lastName);
  print(customer.fullName);
}
