class Todo {
  String? id;
  String? todotext;
  bool isDone;

  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });

  static List<Todo> todolist() {
    return [
      Todo(id: '01', todotext: 'Sunday', isDone: true),
      Todo(id: '02', todotext: 'Monday', isDone: true),
      Todo(id: '03', todotext: 'Tuesday', isDone: true),
      Todo(id: '04', todotext: 'Wednesday', isDone: false),
      Todo(id: '05', todotext: 'Thursday', isDone: false),
      Todo(id: '06', todotext: 'Saturday', isDone: false),
    ];
  }
}
