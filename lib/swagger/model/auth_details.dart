part of swagger.api;

class AuthDetails {
  String? email;

  String? password;

  AuthDetails(this.email, this.password);

  @override
  String toString() {
    return 'AuthDetails[email=$email, password=$password]';
  }

  AuthDetails.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  static List<AuthDetails> listFromJson(List<dynamic>? json) {
    return json == null
        ? <AuthDetails>[]
        : json.map((value) => AuthDetails.fromJson(value)).toList();
  }

  static Map<String, AuthDetails> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, AuthDetails>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = AuthDetails.fromJson(value));
    }
    return map;
  }
}
