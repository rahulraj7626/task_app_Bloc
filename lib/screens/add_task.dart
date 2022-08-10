import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';
import '../model/task_model.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(children: [
        const Text(
          "Add Task",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        TextField(
          autofocus: true,
          controller: title,
          decoration: const InputDecoration(
              hintText: "Enter title", border: OutlineInputBorder()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            ElevatedButton(
                onPressed: () {
                  var task = Task(title: title.text);
                  context.read<TaskBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: Text("Add")),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
