class User {
  final String id;
  final String name;
  final String email;
  final String? cid;

  User({required this.id, required this.name, required this.email, this.cid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      cid: json['cid'] ?? '',
    );
  }
}

// {"name":"KEVEN W. C. D. SANTOS","email":"jf5143437@gmail.com","id":"118027","cid":""}
