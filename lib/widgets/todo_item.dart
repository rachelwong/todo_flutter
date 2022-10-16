import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/model/todo.dart';
import '../contants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem,
      this.onEditItem});
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onEditItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          print('Clicked on Todo Item');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(todo.todoText!),
        trailing: Container(
            width: 75,
            height: 35,
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: tdBlue,
                  ),
                  child: IconButton(
                      color: Colors.white,
                      iconSize: 18,
                      icon: Icon(Icons.edit_note),
                      onPressed: () {
                        print('Clicked on edit icon');
                        onEditItem(todo.id);
                      }),
                ),
                SizedBox(width: 5),
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: tdRed,
                  ),
                  child: IconButton(
                      color: Colors.white,
                      iconSize: 18,
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        print('Clicked on delete button');
                        onDeleteItem(todo.id);
                      }),
                ),
              ],
            )));
  }
}
