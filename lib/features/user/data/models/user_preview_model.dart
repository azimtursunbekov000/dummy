class UserDataModel {
  final List<UserPreview> data;
  final int total;
  final int page;
  final int limit;

  UserDataModel({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      data: (json['data'] as List)
          .map((item) => UserPreview.fromJson(item))
          .toList(),
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
  final String? picture;
  final String? gender;
  final String? email;
  final String? dateOfBirth;
  final String? registerDate;
  final String? phone;
  final Location? location;

  UserPreview({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    this.picture,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.registerDate,
    this.phone,
    this.location,
  });

  factory UserPreview.fromJson(Map<String, dynamic> json) {
    return UserPreview(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture'],
      gender: json['gender'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      registerDate: json['registerDate'],
      phone: json['phone'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'gender': gender,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'registerDate': registerDate,
      'phone': phone,
      'location': location?.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'timezone': timezone,
    };
  }
}
