class Database {
  Database() {
    print("create new database connection");
  }

  static Database database = Database();

  factory Database.get() {
    return database;
  }
}

void main(List<String> args) {
  var db = Database.get();
  var db2 = Database.get();

  print(db == db2);
}
