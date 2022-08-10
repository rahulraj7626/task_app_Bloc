import 'package:flutter/material.dart';
import 'package:task_app_bloc/screens/list_widget.dart';
import '../model/task_model.dart';
import 'add_task.dart';
import 'package:task_app_bloc/blocs/bloc_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void _addTask(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskWidget(),
              ),
            );
          });
    }

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Bloc Task App',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    _addTask(context);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: ListWidget(taskList: taskList),
        );
      },
    );
  }
}
