import 'package:flutter/material.dart';
import 'package:mk_todo/utils/button.dart';

class alerDialog extends StatefulWidget {
  final Function(String) onSave;
  final VoidCallback onCancel;
  final TextEditingController? taskController;
  alerDialog(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.taskController});

  @override
  State<alerDialog> createState() => _alerDialogState();
}

class _alerDialogState extends State<alerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: widget.taskController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    buttonFunction: () =>
                        widget.onSave(widget.taskController!.text),
                    buttonName: "Save"),
                SizedBox(
                  width: 20,
                ),
                Button(buttonFunction: widget.onCancel, buttonName: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
