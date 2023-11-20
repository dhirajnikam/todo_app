import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:todoapp/core/text_widget/neu_text.dart';
import 'package:todoapp/feature/add_task/view/add_task_page.dart';
import 'package:todoapp/feature/home/controller/home_controller.dart';
import 'package:todoapp/utils/floor/dao/todo_class.dart';
import 'package:todoapp/utils/floor/model/floor.dart';
import 'package:todoapp/utils/height_width_converter.dart';

class HomePage extends StatefulWidget with NeuText {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  Future<List<Todo>>? todoList;

  @override
  void initState() {
    homeController.getAllTodo();
    todoList = DatabaseManager().dao.findAllTodo();
    print(todoList.toString().length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 230, 208),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(child: widget.customText("Your Task"))),
                  NeuIconButton(
                    buttonColor: Colors.pink.shade300,
                    buttonWidth: 50,
                    onPressed: () {
                      Get.to(AddTaskPage());
                    },
                    enableAnimation: true,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: heightValue(20)),
              FutureBuilder(
                  future: todoList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return GetBuilder<HomeController>(
                        init: HomeController(),
                        initState: (_) {},
                        builder: (_) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data![index];
                                return NeuCard(
                                  cardColor: Colors.white,
                                  child: ListTile(
                                    title: Container(
                                      color: Colors
                                          .blue, // Set the desired color for the title
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors
                                                .white, // Set the desired text color for the title
                                          ),
                                        ),
                                      ),
                                    ),
                                    subtitle: Text(data.description),
                                  ),
                                );
                              });
                        },
                      );
                    } else {
                      return const Center(child: Text("No Data"));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
