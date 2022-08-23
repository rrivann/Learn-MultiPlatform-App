import 'package:flutter/material.dart';
import 'package:submission_app/models/todo.dart';
import 'package:submission_app/models/todo_item.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 900) {
        return HomePageWeb(
          constraints: constraints,
        );
      } else {
        return HomePageMobile(
          constraints: constraints,
        );
      }
    });
  }
}

class HomePageMobile extends StatefulWidget {
  final BoxConstraints constraints;

  const HomePageMobile({Key? key, required this.constraints}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final uuid = const Uuid();
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Column(
              children: [_listTodo(todosList, _handleTodo, _deleteTodo)],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                _newTodo(_todoController, widget.constraints),
                _buttonAdd(
                    context, _addTodo, _todoController, widget.constraints)
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodo(Todo todo) => setState(() => todo.isDone = !todo.isDone);
  void _deleteTodo(String id) =>
      setState(() => todosList.removeWhere((value) => value.id == id));
  void _addTodo(String todo) {
    setState(() => todosList.add(Todo(id: uuid.v4(), todoText: todo)));
    _todoController.clear();
  }
}

class HomePageWeb extends StatefulWidget {
  final BoxConstraints constraints;
  const HomePageWeb({Key? key, required this.constraints}) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  final uuid = const Uuid();
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Column(
              children: [_listTodo(todosList, _handleTodo, _deleteTodo)],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                _newTodo(_todoController, widget.constraints),
                _buttonAdd(
                    context, _addTodo, _todoController, widget.constraints)
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodo(Todo todo) => setState(() => todo.isDone = !todo.isDone);
  void _deleteTodo(String id) =>
      setState(() => todosList.removeWhere((value) => value.id == id));
  void _addTodo(String todo) {
    setState(() => todosList.add(Todo(id: uuid.v4(), todoText: todo)));
    _todoController.clear();
  }
}

AppBar _appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.blue,
    title: const Text('Todo App'),
  );
}

Expanded _listTodo(List todosList, Function handleTodo, Function deleteTodo) {
  return Expanded(
    child: ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            'All Todo',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        for (Todo todo in todosList)
          TodoItem(
            todo: todo,
            onTodoChange: handleTodo,
            onTodoDelete: deleteTodo,
          )
      ],
    ),
  );
}

Expanded _newTodo(
    TextEditingController todoController, BoxConstraints constraints) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(
        bottom: 20,
        left: constraints.maxWidth > 900 ? 200 : 20,
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 12,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: todoController,
        decoration: const InputDecoration(
            hintText: 'Add new todo', border: InputBorder.none),
      ),
    ),
  );
}

Container _buttonAdd(BuildContext context, Function addTodo,
    TextEditingController todoController, BoxConstraints constraints) {
  return Container(
    margin: EdgeInsets.only(
        bottom: 20, right: constraints.maxWidth > 900 ? 200 : 20),
    child: ElevatedButton(
      onPressed: () {
        if (todoController.text != '') {
          addTodo(todoController.text);
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Alert !!'),
                  content: const Text('Please fill new todo'),
                  actions: [
                    MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    )
                  ],
                );
              });
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    ),
  );
}
