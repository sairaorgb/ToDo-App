import 'package:flutter/material.dart';

class taskTile extends StatelessWidget {
  final bool checkValue;
  final String taskName;
  final int index;
  Function(int) onChanged;
  Function(int) deleteTask;
  taskTile(
      {super.key,
      required this.index,
      required this.checkValue,
      required this.taskName,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: checkValue,
        onChanged: (value) => onChanged(index),
        checkColor: Colors.black,
        activeColor: checkValue ? Colors.yellow : Colors.black,
      ),
      title: Text(
        taskName,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      trailing: GestureDetector(
          onTap: () => deleteTask(index), child: Icon(Icons.delete)),
    );
  }
}
