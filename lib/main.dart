import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'NavBar.dart';
import 'common/repositories/Auth_Repo.dart';
import 'features/Authentification/screens/login_register.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthRepo().storage.read(key: 'token');
  var isLogged = token != null ? true : false;
  runApp(MyApp(
    loggedIn: isLogged,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({this.loggedIn});
  final loggedIn;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: loggedIn ? Navigationbar() : loginRegister(),
    );
  }
}
