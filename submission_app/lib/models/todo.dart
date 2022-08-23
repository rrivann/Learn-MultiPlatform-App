class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({required this.id, required this.todoText, this.isDone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: '1', todoText: 'Wake up at 05:00', isDone: true),
      Todo(id: '2', todoText: 'Breakfast', isDone: true),
      Todo(id: '3', todoText: 'Workout', isDone: true),
      Todo(id: '4', todoText: 'Going to work'),
      Todo(id: '5', todoText: 'Dinner with friends'),
      Todo(id: '6', todoText: 'Sleep')
    ];
  }
}
