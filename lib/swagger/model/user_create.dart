part of swagger.api;

class UserCreate {
  String? name;

  String? email;

  int? age;

  String? bio;

  String? profilePhoto;

  String? password;

  UserCreate();

  @override
  String toString() {
    return 'UserCreate[name=$name, email=$email, age=$age, bio=$bio, profilePhoto=$profilePhoto, password=$password, ]';
  }

  UserCreate.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    email = json['email'];
    age = json['age'];
    bio = json['bio'];
    profilePhoto = json['profile_photo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'bio': bio,
      'profile_photo': profilePhoto,
      'password': password
    };
  }

  static List<UserCreate> listFromJson(List<dynamic>? json) {
    return json == null
        ? <UserCreate>[]
        : json.map((value) => UserCreate.fromJson(value)).toList();
  }

  static Map<String, UserCreate> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, UserCreate>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = UserCreate.fromJson(value));
    }
    return map;
  }
}
