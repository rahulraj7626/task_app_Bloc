import 'package:flutter/material.dart';
import 'package:task_app_bloc/blocs/bloc_exports.dart';

import '../model/task_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.red[50], borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(taskList[index].title),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Checkbox(
                      value: taskList[index].isDone,
                      onChanged: ((value) {
                        context
                            .read<TaskBloc>()
                            .add(UpdateTask(task: taskList[index]));
                      }),
                    ),
                    IconButton(
                        onPressed: () {
                          context
                              .read<TaskBloc>()
                              .add(DeleteTask(task: taskList[index]));
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
