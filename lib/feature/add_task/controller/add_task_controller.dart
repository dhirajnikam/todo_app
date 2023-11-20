import 'package:get/get.dart';
import 'package:todoapp/utils/floor/dao/data_base.dart';
import 'package:todoapp/utils/floor/dao/todo_class.dart';
import 'package:todoapp/utils/floor/model/floor.dart';
import 'package:todoapp/utils/pre_define_snack_bar/custom_snack_bar.dart';

class AddTaskController extends GetxController {
  // add task
  addToDo(String title, String description) {
    try {
      if (title.isEmpty) {
        CustomSnackbarUtil.showWarning(message: 'Title is empty');
        return;
      }
      if (description.isEmpty) {
        CustomSnackbarUtil.showWarning(message: 'Description is empty');
        return;
      }
      if (title.length > 50) {
        CustomSnackbarUtil.showWarning(message: 'Title is too long');
        return;
      }
      if (description.length < 30) {
        CustomSnackbarUtil.showWarning(message: 'Description is too short');
        return;
      }

      final todo = Todo(
        0,
        title,
        description,
        false,
        DateTime.now().toString(),
      );
      DatabaseManager().dao.insertTodo(todo);
      CustomSnackbarUtil.showSuccess(message: 'Add task success');
      Get.back();
    } catch (e) {
      CustomSnackbarUtil.showError(message: e.toString());
    }
  }
}
