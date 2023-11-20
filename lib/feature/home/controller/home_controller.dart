import 'package:get/get.dart';
import 'package:todoapp/utils/floor/dao/todo_class.dart';
import 'package:todoapp/utils/floor/model/floor.dart';
import 'package:todoapp/utils/pre_define_snack_bar/custom_snack_bar.dart';

class HomeController extends GetxController {
  List<Todo> todos = [];

  Future<List<Todo>> getAllTodo() async {
    try {
      todos = await DatabaseManager().dao.findAllTodo();
      update();

      // print(todos[0].title);
      // print(todos[0].description);
      // print(todos[0].done);
      CustomSnackbarUtil.showSuccess(message: "Get all todo success");
      return todos;
    } catch (e) {
      CustomSnackbarUtil.showError(message: e.toString());
      throw Exception(e.toString());
    }
  }
}
