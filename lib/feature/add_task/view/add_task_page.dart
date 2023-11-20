import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:todoapp/core/text_widget/neu_text.dart';
import 'package:todoapp/feature/add_task/controller/add_task_controller.dart';
import 'package:todoapp/utils/floor/model/floor.dart';
import 'package:todoapp/utils/height_width_converter.dart';
import 'package:todoapp/utils/notification/notification_utils.dart';
import 'package:todoapp/utils/pre_define_snack_bar/custom_snack_bar.dart';

class AddTaskPage extends StatefulWidget with NeuText {
  AddTaskPage({super.key});

  // Default selection for notification frequency is 'Daily'
  bool isDailySelected = true;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final addTaskController = AddTaskController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 230, 208),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeuIconButton(
                    buttonColor: Colors.pink.shade300,
                    buttonWidth: 50,
                    onPressed: () {
                      Get.back();
                    },
                    enableAnimation: true,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(child: Center(child: widget.customText("Add Task"))),
                ],
              ),
              SizedBox(height: heightValue(20)),

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              NeuContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Title',
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightValue(20)),

              // Description
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              NeuContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Description',
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightValue(20)),

              // Reminder Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reminder",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              NeuContainer(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      // Daily Toggle
                      SwitchListTile(
                        title: const Text('Daily'),
                        value: widget.isDailySelected,
                        onChanged: (bool value) {
                          setState(() {
                            widget.isDailySelected = value;
                          });
                        },
                      ),
                      // Weekly Toggle
                      SwitchListTile(
                        title: const Text('Weekly'),
                        value: !widget.isDailySelected,
                        onChanged: (bool value) {
                          setState(() {
                            widget.isDailySelected = !value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              // SizedBox(height: heightValue(0)),

              // Add Task Button
              NeuTextButton(
                onPressed: () {
                  addTaskController.addToDo(
                      titleController.text, descriptionController.text);
                },
                enableAnimation: true,
                text: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
