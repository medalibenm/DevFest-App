import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_therapist/utils/local_storage/storage_utility.dart';
import '../../../common/repositories/Auth_Repo.dart';

class SignInController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future LoginClick() async {
    final bool =
        await AuthRepo().Login(username.value.text, password.value.text);
    if (bool) {
      return Get.snackbar(
        'Success',
        "Welcome ${username.value.text}",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
    } else {
      return Get.snackbar(
        'Wrong credentials',
        "username or password invalid",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
    }
  }
}
