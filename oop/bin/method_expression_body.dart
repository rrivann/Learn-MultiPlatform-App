class Computer {
  void startUp() => print('computer is starting');
  void shutDown() => print('computer is shutting down');

  String getOperatingSystem() => 'MacOs';
}

void main(List<String> args) {
  var computer = Computer();
  computer.startUp();
  print('os: ${computer.getOperatingSystem()}');
  computer.shutDown();
}
