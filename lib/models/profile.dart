class Profile {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;

  Profile(
      {this.firstName, this.lastName, this.userName, this.email, this.phone});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userName: json['username'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  static List<Profile> mapArray(List<dynamic> data) {
    return data.map((json) => Profile.fromJson(json)).toList();
  }
}
