import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_tracker/Todo.dart';
import 'package:task_tracker/splash.dart';
import 'package:task_tracker/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todolist = Todo.todolist();
  final todocontroller = TextEditingController();
  var search = TextEditingController();
  List<Todo> foundtodo = [];

  @override
  void initState() {
    // TODO: implement initState
    foundtodo = todolist;
    super.initState();
  }
  // Initialize the todo list
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              width: 60,
              height: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/man2.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handletodochanges(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deletetodoitem(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void addtotoitem(String todo) {
    setState(() {
      todolist.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todotext: todo,
      ));
    });
    todocontroller.clear();
  }
     void runfilter(String enterkeyword){
    List<Todo> results = [];
    if(enterkeyword.isEmpty){
      results = todolist;
    }
     else{
        results = todolist.where((item) => item.todotext!.toLowerCase().contains(enterkeyword.toLowerCase())).toList();
    }
      setState(() {
        foundtodo = results;
      });
     }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 30),

            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller:search,
                    onChanged: (value)=>runfilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All To Do',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      for (Todo todo in foundtodo.reversed)
                        Todoitem(
                          todo: todo,
                          onTodochanged: _handletodochanges,
                          onDeleteitem: deletetodoitem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(bottom: 30, right: 20, left: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todocontroller,
                      decoration: InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      addtotoitem(todocontroller.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      minimumSize: MaterialStateProperty.all(Size(60, 60)),
                      elevation: MaterialStateProperty.all(10),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

