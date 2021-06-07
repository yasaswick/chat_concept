part of swagger.api;

class ValidationError {
  List<String> loc = [];

  String? msg;

  String? type;

  ValidationError();

  @override
  String toString() {
    return 'ValidationError[loc=$loc, msg=$msg, type=$type, ]';
  }

  ValidationError.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    loc = (json['loc'] as List).map((item) => item as String).toList();
    msg = json['msg'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {'loc': loc, 'msg': msg, 'type': type};
  }

  static List<ValidationError> listFromJson(List<dynamic>? json) {
    return json == null
        ? <ValidationError>[]
        : json.map((value) => ValidationError.fromJson(value)).toList();
  }

  static Map<String, ValidationError> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, ValidationError>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ValidationError.fromJson(value));
    }
    return map;
  }
}
