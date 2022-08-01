void main(List<String> args) {
  var numberSet = {1, 4, 6};
  Set<int> anotherSet = new Set.from([1, 4, 6, 4, 1]);
  print(anotherSet);

  // Output: {1, 4, 6}
  numberSet.add(6);
  numberSet.addAll({2, 2, 3});
  numberSet.remove(3);
  print(numberSet.elementAt(2));

  // Output: 6
  var setA = {1, 2, 4, 5};
  var setB = {1, 5, 7};

  var union = setA.union(setB);
  var intersection = setA.intersection(setB);

  print(union);
  print(intersection);

// union: {1, 2, 4, 5, 7}
// intersection: {1, 5}
}
