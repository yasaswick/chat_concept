part of swagger.api;

class BodyUploadProfileImageUserProfileImagePost {
  String? file;

  BodyUploadProfileImageUserProfileImagePost();

  @override
  String toString() {
    return 'BodyUploadProfileImageUserProfileImagePost[file=$file, ]';
  }

  BodyUploadProfileImageUserProfileImagePost.fromJson(
      Map<String, dynamic>? json) {
    if (json == null) return;
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    return {'file': file};
  }

  static List<BodyUploadProfileImageUserProfileImagePost> listFromJson(
      List<dynamic>? json) {
    return json == null
        ? <BodyUploadProfileImageUserProfileImagePost>[]
        : json
            .map((value) =>
                BodyUploadProfileImageUserProfileImagePost.fromJson(value))
            .toList();
  }

  static Map<String, BodyUploadProfileImageUserProfileImagePost> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, BodyUploadProfileImageUserProfileImagePost>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] =
          BodyUploadProfileImageUserProfileImagePost.fromJson(value));
    }
    return map;
  }
}
