import 'package:flutter/material.dart';
import 'package:task_management/task_model.dart';

import 'Widgets/custom_list_tile.dart';
import 'Widgets/custom_text.dart';
import 'Widgets/custom_text_form_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TaskModel> listOfTasks = [];

  TextEditingController titleTEController = TextEditingController();
  TextEditingController descTEController = TextEditingController();
  TextEditingController daysReqTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: listOfTasks.length,
        itemBuilder: (context, index) {
          return CustomListTile(
            onLongPress: () => taskDetailsBottomSheet(index),
            title: listOfTasks[index].title,
            subtitle: listOfTasks[index].description,
            days: listOfTasks[index].daysRequired.toString(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 0, thickness: 2,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTaskShowDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void taskDetailsBottomSheet(int index) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Task Details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Divider(thickness: 1,),
              CustomText('Title: ${listOfTasks[index].title}'),
              CustomText('Description: ${listOfTasks[index].description}'),
              CustomText('Days Required: ${listOfTasks[index].daysRequired}'),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      listOfTasks.removeAt(index);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Delete')
                ),
              )
            ],
          ),
        );
      }
    );
  }

  void addTaskShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[50],
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                controller: titleTEController,
                label: 'Title',
                hint: 'Title of Task',
              ),
              CustomTextFormField(
                controller: descTEController,
                label: 'Description',
                hint: 'Brief description',
                maxLine: 4,
              ),
              CustomTextFormField(
                controller: daysReqTEController,
                label: 'Days Required',
                hint: 'Number of days',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => addNewTask(context),
              child: const Text('Save')
            )
          ],
        );
      }
    );
  }

  void addNewTask(BuildContext context) {
    setState(() {
      listOfTasks.add(
          TaskModel(
            titleTEController.text,
            descTEController.text,
            int.parse(daysReqTEController.text),
          )
      );
      Navigator.pop(context);
      titleTEController.clear();
      descTEController.clear();
      daysReqTEController.clear();
    });
  }
}
