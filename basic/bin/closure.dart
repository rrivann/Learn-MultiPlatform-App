void main(List<String> args) {
  var counter = 0;
  void increment() {
    print('incremet');
    counter++;
  }

  increment();
  increment();
  print(counter);
}
