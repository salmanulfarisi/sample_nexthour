class SignupModel {
  SignupModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
