class SignUserModel {
  final String email;
  final String id;

  SignUserModel({required this.email, required this.id});

  factory SignUserModel.fromJson(Map<String, dynamic> json) => SignUserModel(
        email: json['email'],
        id: json['id'],
      );
}
