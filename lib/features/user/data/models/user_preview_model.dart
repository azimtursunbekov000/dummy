class DataModel {
  final List<UserPreview> data;
  final int total;
  final int page;
  final int limit;

  DataModel({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      data: (json['data'] as List).map((item) => UserPreview.fromJson(item)).toList(),
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
    );
  }
}

class UserPreview {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  UserPreview({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory UserPreview.fromJson(Map<String, dynamic> json) {
    return UserPreview(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture'],
    );
  }
}

class UserFull {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String dateOfBirth;
  final String registerDate;
  final String phone;
  final String picture;
  final Location location;

  UserFull({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.registerDate,
    required this.phone,
    required this.picture,
    required this.location,
  });

  factory UserFull.fromJson(Map<String, dynamic> json) {
    return UserFull(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      registerDate: json['registerDate'],
      phone: json['phone'],
      picture: json['picture'],
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final String street;
  final String city;
  final String state;
  final String country;
  final String timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      timezone: json['timezone'],
    );
  }
}
