class AppUser {
  final String name;
  final String email;
  final String phoneNumper;

  AppUser({required this.name, required this.email, required this.phoneNumper});

  //convert App user to -> json format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumper': phoneNumper,
    };
  }

  //convert json format -> App user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      name: jsonUser['name'],
      email: jsonUser['email'],
      phoneNumper: jsonUser['phoneNumper'],
    );
  }
}
