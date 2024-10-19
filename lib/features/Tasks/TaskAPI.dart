import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_therapist/common/repositories/Auth_Repo.dart';
import 'package:my_therapist/utils/constants/api.dart';
import 'dart:convert';
import './model/taskModel.dart';

class ApiTask {
  final AuthRepo auth = Get.put(AuthRepo());
  final String baseUrl = Tapi.baseurl;

  Future<List<Taskmodel>?> TaskFunction() async {
    final id = await auth.getUserID();
    final response = await http.get(Uri.parse('$baseUrl/api/tasks/1'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body.map((e) => Taskmodel.FormJson(e)).toList();
    } else {
      return null;
    }
  }
}
