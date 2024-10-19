import 'package:get/get.dart';
import 'package:my_therapist/features/Tasks/TaskAPI.dart';
import 'package:my_therapist/features/Tasks/model/taskModel.dart';

class TaskController extends GetxController {
  List<Taskmodel>? tasks = [];

  Future LoadTasks() async {
    final Mtasks = await ApiTask().TaskFunction();
    if (tasks != null) {
      tasks = Mtasks;
      return true;
    }
    return false;
  }
}
