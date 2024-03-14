class UserCreated {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;

  UserCreated({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory UserCreated.fromJson(Map<String, dynamic> json) {
    return UserCreated(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
      'updateAt': updatedAt,
    };
  }
}