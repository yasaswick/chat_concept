part of swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  String basePath;
  var client = IOClient();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _RegList = RegExp(r'^List<(.*)>$');
  final _RegMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: '/'}) {
    _authentications['Authorization'] = new OAuth('Authorization');
  }

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'AuthDetails':
          return AuthDetails.fromJson(value);
        case 'BodyUploadProfileImageUserProfileImagePost':
          return BodyUploadProfileImageUserProfileImagePost.fromJson(value);
        case 'HTTPValidationError':
          return HTTPValidationError.fromJson(value);
        case 'UserCreate':
          return UserCreate.fromJson(value);
        case 'UserView':
          return UserView.fromJson(value);
        case 'UserViewPrivate':
          return UserViewPrivate.fromJson(value);
        case 'ValidationError':
          return ValidationError.fromJson(value);
        default:
          print('Deserialization eroor');
      }
    } catch (e, stack) {
      throw ApiException.withInner(
          500, 'Exception during deserialization.', e, stack);
    }
    throw ApiException(
        500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    var serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<http.Response> invokeAPI(
      String path,
      String method,
      List<QueryParam> queryParams,
      Object body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams
        .where((p) => p.value != null)
        .map((p) => '${p.name}=${p.value}');
    var queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    var url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if (body is http.MultipartRequest) {
      var request = http.MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return http.Response.fromStream(response);
    } else {
      var msgBody = contentType == 'application/x-www-form-urlencoded'
          ? formParams
          : serialize(body);
      switch (method) {
        case 'POST':
          return client.post(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case 'PUT':
          return client.put(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case 'DELETE':
          return client.delete(Uri.parse(url), headers: headerParams);
        case 'PATCH':
          return client.patch(Uri.parse(url),
              headers: headerParams, body: msgBody);
        default:
          return client.get(Uri.parse(url), headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames,
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      var auth = _authentications[authName];
      if (auth == null) {
        throw ArgumentError('Authentication undefined: ' + authName);
      }
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      } else {
        if ((auth as ApiKeyAuth).paramName == 'Authorization') {
          (auth).apiKey = accessToken;
        }
      }
    });
  }
}
