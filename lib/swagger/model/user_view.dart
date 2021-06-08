part of swagger.api;

class UserView {
  String? name;

  String? email;

  int? age;

  String? bio;

  String? profilePhoto;

  int? id;

  String? userUuid;

  String? joinedDate;

  int? chatMessages;

  UserView();

  @override
  String toString() {
    return 'UserView[name=$name, email=$email, age=$age, bio=$bio, profilePhoto=$profilePhoto, id=$id, userUuid=$userUuid, joinedDate=$joinedDate, chatMessages=$chatMessages, ]';
  }

  UserView.fromJson(Map<String, dynamic>? json) {
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
  }

  UserView.fromUserViewPrivate(UserViewPrivate? user) {
    if (user == null) return;
    name = user.name;
    email = user.email;
    age = user.age;
    bio = user.bio;
    profilePhoto = user.profilePhoto;
    id = user.id;
    userUuid = user.userUuid;
    joinedDate = user.joinedDate;
    chatMessages = user.chatMessages;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'bio': bio,
      'profile_photo': profilePhoto,
      'id': id,
      'user_uuid': userUuid,
      'joined_date': joinedDate,
      'chat_messages': chatMessages
    };
  }

  static List<UserView> listFromJson(List<dynamic>? json) {
    return json == null
        ? <UserView>[]
        : json.map((value) => UserView.fromJson(value)).toList();
  }

  static Map<String, UserView> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, UserView>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = UserView.fromJson(value));
    }
    return map;
  }
}
