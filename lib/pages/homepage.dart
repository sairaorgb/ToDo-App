import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mk_todo/utils/alertDialog.dart';
import 'package:mk_todo/utils/tasktile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var mybox = Hive.box('myBox');

  List _tasks = [
    ["task 1", true],
    ["task 2", false]
  ];

  TextEditingController myController = TextEditingController();

  void onChanged(int index) {
    setState(() {
      _tasks[index][1] = !_tasks[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void onsave(String name) {
    setState(() {
      _tasks.add([name, false]);
      myController.clear();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Sabar ToDo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return alerDialog(
              onCancel: () => Navigator.pop(context),
              onSave: (String name) => onsave(name),
              taskController: myController,
            );
          },
        ),
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 32,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              return taskTile(
                index: index,
                taskName: _tasks[index][0],
                checkValue: _tasks[index][1],
                onChanged: (index) => onChanged(index),
                deleteTask: (index) => deleteTask(index),
              );
            }),
      ),
      // body: taskTile(checkValue: false, taskName: "sabar"),
    );
  }
}
