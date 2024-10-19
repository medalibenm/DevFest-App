import 'dart:async';
import 'package:get/get.dart';
import '../../features/Authentification/Authapi.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/Authentification/screens/login_register.dart';

class AuthRepo extends GetxController {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  // var isLoggedIn = false.obs; // Observable variable to track login state

  // @override
  // void onInit() {
  //   super.onInit();
  //   checkIfTokenExists();
  // }

  // Future<void> checkIfTokenExists() async {
  //   String? token = await storage.read(key: 'token');
  //   isLoggedIn.value = token != null; // Update the observable value
  // }

  Future Login(String username, String password) async {
    final user = await ApiService().login(username, password);
    if (user != null && user.token.isNotEmpty) {
      await storage.write(key: 'token', value: user.token);
      return true;
    }
    return false;
  }

  Future Register(String username, String password, String email) async {
    final user = await ApiService().register(username, password, email);
    if (user != null && user.id.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> getHeader() async {
    final token = await storage.read(key: 'token');
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    Get.offAll(() => loginRegister());
  }
}
