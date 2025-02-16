class UserProfileModel {
  final String firstName;
  final String lastName;
  final String email;

  UserProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}
