import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
    }
  }

  void _deleteTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.remove(task);
      });
    }
  }

  Widget _buildTodoItem(String todoText) {
    return ListTile(
        title: Text(todoText),
        trailing: IconButton(
            onPressed: () {
              _deleteTodoItem(todoText);
            },
            icon: Icon(Icons.delete)));
  }

  Widget _buildTodoList() {
    return ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTodoItem(_todoItems[index]);
        });
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add a new task'),
        ),
        body: TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addTodoItem(val);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
              hintText: 'Enter your task...',
              contentPadding: EdgeInsets.all(16.0)),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
