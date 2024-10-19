class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String token;
  final String expiry;

  UserModel(
      {required this.expiry,
      required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.token});

  factory UserModel.formJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      id: json['id'].toString(),
      expiry: json['expiry'].toString(),
      username: '',
      email: '',
      password: '',
    );
  }

  factory UserModel.registerJson(Map<String, dynamic> json) {
    return UserModel(
      token: '',
      id: json['id'].toString(),
      expiry: '',
      username: '',
      email: '',
      password: '',
    );
  }
}
