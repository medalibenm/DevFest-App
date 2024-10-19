import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_therapist/features/Authentification/screens/sign_in.dart';
import '../../../common/repositories/Auth_Repo.dart';

class RegisterController extends GetxController {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> RegisterFormKey = GlobalKey<FormState>();
  final privacyPolicy = false.obs;
  final passwordEye = true.obs;

  Future registerClick() async {
    final bool = await AuthRepo()
        .Register(username.value.text, password.value.text, email.value.text);

    if (bool) {
      Get.offAll(() => signInScreen());
    } else {
      return Get.snackbar(
        'Error',
        "Check your network",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
    }
  }
}
