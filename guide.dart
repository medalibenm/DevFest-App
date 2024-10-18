// how would you do it in mvc

// ChatGPT a dit :
// ChatGPT
// In an MVC (Model-View-Controller) architecture using Flutter, the approach is structured to separate the business logic (Model), the UI (View), and the controllers or state management (Controller). Here's how you can implement the login and signup screens using MVC in Flutter:

// Folder Structure
// A typical MVC architecture in Flutter might have the following structure:

// bash
// Copier le code
// lib/
// │
// ├── models/
// │   └── user_model.dart         # Model representing user information
// │
// ├── views/
// │   ├── login_screen.dart       # UI for Login
// │   └── signup_screen.dart      # UI for Signup
// │
// ├── controllers/
// │   ├── auth_controller.dart    # Logic to handle login/signup
// │
// ├── services/
// │   └── api_service.dart        # API handling service
// │
// └── main.dart                   # Entry point of the application
// Step 1: Create the User Model
// In lib/models/user_model.dart, define the UserModel class to represent user data.

// dart
// Copier le code
// class UserModel {
//   final String email;
//   final String password;
//   final String token;

//   UserModel({required this.email, required this.password, required this.token});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       email: json['email'],
//       password: '', // Password is not returned in API response
//       token: json['token'],
//     );
//   }
// }
// Step 2: API Service Layer
// In lib/services/api_service.dart, handle the communication with the ReqRes API:

// dart
// Copier le code
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/user_model.dart';

// class ApiService {
//   static const baseUrl = 'https://reqres.in/api';

//   Future<UserModel?> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       return null;
//     }
//   }

//   Future<UserModel?> signup(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       return null;
//     }
//   }
// }
// Step 3: Create the Authentication Controller
// In lib/controllers/auth_controller.dart, the controller interacts with the service and manages state:

// dart
// Copier le code
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import '../services/api_service.dart';
// import '../models/user_model.dart';

// class AuthController {
//   final ApiService _apiService = ApiService();
//   final FlutterSecureStorage _storage = FlutterSecureStorage();

//   Future<bool> login(String email, String password) async {
//     final user = await _apiService.login(email, password);
//     if (user != null && user.token.isNotEmpty) {
//       await _storage.write(key: 'token', value: user.token);
//       return true;
//     }
//     return false;
//   }

//   Future<bool> signup(String email, String password) async {
//     final user = await _apiService.signup(email, password);
//     if (user != null && user.token.isNotEmpty) {
//       await _storage.write(key: 'token', value: user.token);
//       return true;
//     }
//     return false;
//   }

//   Future<String?> getToken() async {
//     return await _storage.read(key: 'token');
//   }

//   Future<void> logout() async {
//     await _storage.delete(key: 'token');
//   }
// }
// Step 4: Create the Login and Signup Views
// Login View (lib/views/login_screen.dart):
// The view handles UI and triggers controller actions on user interaction.

// dart
// Copier le code
// import 'package:flutter/material.dart';
// import '../controllers/auth_controller.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final AuthController _authController = AuthController();

//   Future<void> _login() async {
//     final email = _emailController.text;
//     final password = _passwordController.text;
//     final success = await _authController.login(email, password);
//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
//       // Navigate to home screen or another page
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Signup View (lib/views/signup_screen.dart):
// dart
// Copier le code
// import 'package:flutter/material.dart';
// import '../controllers/auth_controller.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final AuthController _authController = AuthController();

//   Future<void> _signup() async {
//     final email = _emailController.text;
//     final password = _passwordController.text;
//     final success = await _authController.signup(email, password);
//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup successful')));
//       // Navigate to login screen or home
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Signup')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _signup,
//               child: Text('Signup'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Step 5: Main Entry Point
// In lib/main.dart, you can set up routing and initialize the app:

// dart
// Copier le code
// import 'package:flutter/material.dart';
// import 'views/login_screen.dart';
// import 'views/signup_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter MVC Auth',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: '/login',
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/signup': (context) => SignupScreen(),
//       },
//     );
//   }
// }
// Step 6: Additional Features
// Token Management: After login/signup, store the token securely using flutter_secure_storage.
// Navigation: Once authenticated, navigate to a home screen or another part of the app.
// Error Handling: Enhance error handling to handle different types of responses from the API.
// Conclusion
// With this structure, the application follows the MVC pattern:

// Model: Defines the data structure (e.g., UserModel).
// View: Handles the UI (e.g., login/signup screens).
// Controller: Manages the business logic (e.g., API calls, authentication).
// This helps in organizing the code better and separating concerns in a Flutter app.