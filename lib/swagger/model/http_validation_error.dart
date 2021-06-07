part of swagger.api;

class HTTPValidationError {
  List<ValidationError> detail = [];

  HTTPValidationError();

  @override
  String toString() {
    return 'HTTPValidationError[detail=$detail, ]';
  }

  HTTPValidationError.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    detail = ValidationError.listFromJson(json['detail']);
  }

  Map<String, dynamic> toJson() {
    return {'detail': detail};
  }

  static List<HTTPValidationError> listFromJson(List<dynamic> json) {
    return json == null
        ? <HTTPValidationError>[]
        : json.map((value) => HTTPValidationError.fromJson(value)).toList();
  }

  static Map<String, HTTPValidationError> mapFromJson(
      Map<String, Map<String, dynamic>>? json) {
    var map = <String, HTTPValidationError>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = HTTPValidationError.fromJson(value));
    }
    return map;
  }
}