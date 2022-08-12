void main() {
  print(upperFunction('Rivan'));
  print(lowerFunction('RIVANN'));

  sayHello('rivan', upperFunction);
  sayHello('rivan', (String name) => name.toLowerCase());
}

var upperFunction = (String name) {
  return name.toUpperCase();
};
var lowerFunction = (String name) => name.toLowerCase();

void sayHello(String name, String Function(String) filter) {
  var filteredName = filter(name);
  print('hi $filteredName');
}
