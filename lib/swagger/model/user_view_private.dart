part of swagger.api;

class UserViewPrivate {
  String? name;

  String? email;

  int? age;

  String? bio;

  String? profilePhoto;

  int? id;

  String? userUuid;

  String? joinedDate;

  int? chatMessages;

  String? token;

  UserViewPrivate();

  @override
  String toString() {
    return 'UserViewPrivate[name=$name, email=$email, age=$age, bio=$bio, profilePhoto=$profilePhoto, id=$id, userUuid=$userUuid, joinedDate=$joinedDate, chatMessages=$chatMessages, token=$token, ]';
  }

  UserViewPrivate.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    email = json['email'];
    age = json['age'];
    bio = json['bio'];
    profilePhoto = json['profile_photo'];
    id = json['id'];
    userUuid = json['user_uuid'];
    joinedDate = json['joined_date'];
    chatMessages = json['chat_messages'];
    token = json['token'];
  }

  Map<String, dynamic>? toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'bio': bio,
      'profile_photo': profilePhoto,
      'id': id,
      'user_uuid': userUuid,
      'joined_date': joinedDate,
      'chat_messages': chatMessages,
      'token': token
    };
  }

  static List<UserViewPrivate> listFromJson(List<dynamic>? json) {
    return json == null
        ? <UserViewPrivate>[]
        : json.map((value) => UserViewPrivate.fromJson(value)).toList();
  }

  static Map<String, UserViewPrivate> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, UserViewPrivate>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = UserViewPrivate.fromJson(value));
    }
    return map;
  }
}
