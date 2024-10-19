import 'package:get/get.dart';
import '../../features/Authentification/model/user_model.dart';
import '../../features/Authentification/Authapi.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/Authentification/screens/login_register.dart';

class AuthRepo extends GetxController {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  UserModel? activeUser;
  Future Login(String username, String password) async {
    final user = await ApiService().login(username, password);
    if (user != null && user.token.isNotEmpty) {
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'id', value: user.id);
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

  Future<String?> getUserID() async {
    return await storage.read(key: 'id');
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'id');
    Get.offAll(() => loginRegister());
  }
}
