import 'package:flutter/material.dart';
import 'package:test_flutter/contants/colors.dart';
import 'package:test_flutter/widgets/todo_item.dart';

import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
            title: const Text('Todo App', style: TextStyle(color: tdBlack)),
            backgroundColor: tdBGColor),
        body: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(children: [
                  Expanded(
                    child: ListView(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 50),
                          child: const Text('All ToDos',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500))),
                      for (Todo todo in todosList)
                        TodoItem(
                            todo: todo,
                            onToDoChanged: _handleTodoChange,
                            onDeleteItem: _deleteTodoItem),
                    ]),
                  ),
                ])),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                              controller: _todoController,
                              decoration: const InputDecoration(
                                  hintText: 'Add a new item')))),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                          onPressed: () {
                            print("Add button clicked");
                            _addToDoItem(_todoController.text);
                          })),
                ])),
          ],
        ));
  }

  _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((el) => el.id == id);
    });
  }

  _addToDoItem(String todoText) {
    setState(() {
      todosList.add(Todo(id: DateTime.now().toString(), todoText: todoText));
      print(DateTime.now());
    });
    _todoController.clear(); // clear the field after entering
  }
}
