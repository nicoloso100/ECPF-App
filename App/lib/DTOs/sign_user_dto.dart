class SignUserDTO {
  final String email;
  final String password;

  SignUserDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
