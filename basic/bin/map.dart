void main(List<String> args) {
  Map<String, String> map1 = {};
  var map2 = Map<String, String>();
  var map3 = <String, String>{};

  map1['first'] = 'rivan';
  print(map1['first']);
  map1.remove('first');
  print(map1.length);
}
