import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_therapist/features/Tasks/TaskAPI.dart';
import 'package:my_therapist/features/Tasks/model/taskModel.dart';
import '../../../features/Tasks/controller/task_controller.dart';
import '../../../features/Tasks/screens/widgets/title_picture.dart';
import '../../../utils/helpers/helper_functions.dart';

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
            height: 30,
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
                          return Container(
                            child: Center(child: Text(task.taskType)),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('No data'),
                      );
                    }
                  }))
        ],
      ),
    ));
  }
}

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer({
    super.key,
    this.title,
    this.color,
  });
  final title;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffD6D6D6), width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            decoration: BoxDecoration(
                color: THelperFunctions.getColor(color),
                shape: BoxShape.circle),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: GoogleFonts.urbanist(
                color: Color(0xff171950),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
