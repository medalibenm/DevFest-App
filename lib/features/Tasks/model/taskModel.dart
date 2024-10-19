class Taskmodel {
  final String id;
  final String userID;
  final String taskName;
  final String taskDescp;
  final String taskDeadline; // convert it to datatime and add reminder
  final String taskType;
  final String taskState;

  Taskmodel(
      {required this.id,
      required this.userID,
      required this.taskName,
      required this.taskDescp,
      required this.taskDeadline,
      required this.taskType,
      required this.taskState});

  factory Taskmodel.FormJson(Map<String, dynamic> json) {
    return Taskmodel(
        id: json['id'].toString(),
        userID: json['User_id']['id'].toString(),
        taskName: json['task_id']['task_name'],
        taskDescp: json['task_id']['task_description'],
        taskDeadline: json['task_id']['task_deadline'],
        taskType: json['task_id']['task_type'],
        taskState: json['state']);
  }
}
