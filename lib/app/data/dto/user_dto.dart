class UserDTO {
  final int id;
  final String name;
  final String email;
  final String website;

  UserDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'website': website,
    };
  }
}
