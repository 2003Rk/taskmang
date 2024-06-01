import 'package:flutter/material.dart';
import 'package:task_tracker/Todo.dart';

class Todoitem extends StatelessWidget {
  final Todo todo;
  final onTodochanged;
  final onDeleteitem;
  Todoitem ({Key? key, required this.todo, this.onTodochanged, this.onDeleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onTodochanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20  , vertical: 5),
         tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.blue,),
        title: Text(todo.todotext!,
        style: TextStyle(
          color: Colors.black,
          decoration: todo.isDone? TextDecoration.lineThrough:null
        ),

        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
           child: IconButton(
             color: Colors.white,
             iconSize: 20,
             icon: Icon(Icons.delete),
             onPressed: (){
                onDeleteitem(todo.id);

             },
           ),
        ),
      ),
    );
  }
}
