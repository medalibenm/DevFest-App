import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/features/Tasks/TaskAPI.dart';
import 'package:my_therapist/features/Tasks/model/taskModel.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/task_box.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/task_status_container.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/warning_message.dart';
import 'package:my_therapist/utils/constants/colors.dart';
import '../../../features/Tasks/controller/task_controller.dart';
import '../../../features/Tasks/screens/widgets/title_picture.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:getwidget/getwidget.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorList = ['Grey', 'Blue', 'Orange', 'Green'];
    final statusList = ['All', 'Not Started', 'In Progress', 'Done'];
    final TaskController controller = Get.put(TaskController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          TitlePicture(),
          SizedBox(
            height: 20,
          ),
          WarningMessage(),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 35,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TaskStatusContainer(
                  title: statusList[index],
                  color: colorList[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: FutureBuilder(
                  future: ApiTask().TaskFunction(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('error : ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      controller.tasks = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) {
                          Taskmodel task = controller.tasks[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 22.0),
                            child: TaskBox(
                                name: task.taskName,
                                type: task.taskType,
                                state: task.taskState,
                                description: task.taskDescp,
                                deadline: task.taskDeadline),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('No data'),
                      );
                    }
                  })),
        ],
      ),
    ));
  }
}
