class UserModel {
  final String id;
  final String name;
  final String email;
  final String cid;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      id: json['id']?.toString() ?? '',
      cid: json['cid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id, 'cid': cid};
  }
}

// {"name":"KEVEN W. C. D. SANTOS","email":"jf5143437@gmail.com","id":"118027","cid":""}
