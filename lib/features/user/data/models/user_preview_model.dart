class UserPreviewModel {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

  UserPreviewModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory UserPreviewModel.fromJson(Map<String, dynamic> json) {
    return UserPreviewModel(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() => {
  "id": id,
  "title": title,
  "firstName": firstName,
  "lastName": lastName,
  "picture": picture,
};

}
