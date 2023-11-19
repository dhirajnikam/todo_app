import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:todoapp/core/text_widget/neu_text.dart';
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
                    onPressed: () {},
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
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
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
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
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
              SizedBox(height: heightValue(20)),

              // Add Task Button
              NeuTextButton(
                onPressed: () {
                  // NotificationService().showNotification(
                  //   title: "Task Added",
                  //   body: "Task has been added successfully",
                  // );
                  AtlSnackbarUtil.showWarning(message: "1234");
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
