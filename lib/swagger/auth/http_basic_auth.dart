part of swagger.api;

class HttpBasicAuth implements Authentication {
  String username = '';
  String password = '';

  @override
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    var str = (username) + ':' + (password);
    headerParams['Authorization'] = 'Basic ' + base64.encode(utf8.encode(str));
  }
}
