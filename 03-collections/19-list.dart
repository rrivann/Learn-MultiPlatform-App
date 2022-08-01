void main(List<String> args) {
  // List<int> numberList = [1, 2, 3, 4, 5];
  var numberList = [1, 2, 3, 4, 5];
  var stringList = ['Hello', 'Dicoding', 'Dart'];
  List dynamicList = [1, 'Dicoding', true]; // List<dynamic>
  print(dynamicList[1]);
  print(dynamicList[3]);

  for (int i = 0; i < stringList.length; i++) {
    print(stringList[i]);
  }

  stringList.forEach((s) => print(s));
  stringList.add('Flutter');
  stringList.insert(0, 'Programming');
  stringList[1] = 'Application';

  stringList.remove('Programming'); // Menghapus list dengan nilai Programming
  stringList.removeAt(1); // Menghapus list pada index ke-1
  stringList.removeLast(); // Menghapus data list terakhir
  stringList.removeRange(0,
      2); // Menghapus list mulai index ke-0 sampai ke-1 (indeks 2 masih dipertahankan)

  var favorites = ['Seafood', 'Salad', 'Nugget', 'Soup'];
  var others = ['Cake', 'Pie', 'Donut'];
  var allFavorites = [...favorites, ...others];
  print(allFavorites);

/* output
[Seafood, Salad, Nugget, Soup, Cake, Pie, Donut]
 */

  var list;
  var list2 = [0, ...?list];
  print(list2);

/* output
[0]
 */
}
