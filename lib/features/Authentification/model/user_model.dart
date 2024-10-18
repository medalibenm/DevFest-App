class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String token;

  UserModel({required this.id, required this.username, required this.email, required this.password, required this.token});

  factory UserModel.formJson(Map<String, dynamic> json) {
    return UserModel(email: '', password: '', token: json['token'], id: json['id'].toString(), username: '');
  }
}
