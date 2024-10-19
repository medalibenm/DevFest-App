import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: SingleChildScrollView(
        child: Column(
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
            ElevatedButton(
                onPressed: () => controller.LoadTasks(),
                child: Text('Refresh')),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.tasks?.length,
                itemBuilder: (context, index) {
                  var task = controller.tasks?[index];
                  return Container(
                    child: Text('${task?.taskName}'),
                  );
                },
              ),
            )
          ],
        ),
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
