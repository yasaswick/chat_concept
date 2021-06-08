part of swagger.api;

class UserApi {
  final ApiClient apiClient = defaultApiClient;

  /// Create User
  ///
  ///
  Future<UserViewPrivate?> createUserUserPost(UserCreate body) async {
    Object postBody = body;

    // verify required params are set
    if (body == null) {
      throw ApiException(400, 'Missing required param: body');
    }

    // create path and map variables
    var path = '/user/'.replaceAll('{format}', 'json');

    // query params
    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};

    var contentTypes = <String>['application/json'];

    var contentType =
        contentTypes.length > 0 ? contentTypes[0] : 'application/json';
    var authNames = <String>[];

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserViewPrivate')
          as UserViewPrivate;
    } else {
      return null;
    }
  }

  /// Get User By Token
  ///
  ///
  Future<UserView?> getUserByTokenUserTokenGet() async {
    Object postBody = {};

    // verify required params are set

    // create path and map variables
    var path = '/user/token'.replaceAll('{format}', 'json');

    // query params
    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};

    var contentType = 'application/json';
    var authNames = ['Authorization'];

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserView') as UserView;
    } else {
      return null;
    }
  }

  /// Get User By Id
  ///
  ///
  Future<UserView?> getUserById(String id) async {
    Object postBody = {};

    // verify required params are set

    // create path and map variables
    var path = '/user/id/{id}'.replaceAll('{id}', id.toString());

    // query params
    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};

    var contentType = 'application/json';
    List<String> authNames = [];

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserView') as UserView;
    } else {
      return null;
    }
  }

  /// Login User
  ///
  ///
  Future<UserViewPrivate?> loginUserUserLoginPost(AuthDetails body) async {
    Object postBody = body;

    // verify required params are set
    if (body == null) {
      throw ApiException(400, 'Missing required param: body');
    }

    // create path and map variables
    var path = '/user/login'.replaceAll('{format}', 'json');

    // query params
    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};

    var contentTypes = <String>['application/json'];

    var contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : 'application/json';
    var authNames = <String>[];

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserViewPrivate')
          as UserViewPrivate;
    } else {
      return null;
    }
  }

  /// Upload Profile Image
  ///
  ///
  Future<UserViewPrivate?> uploadProfileImageUserProfileImagePost(
      http.MultipartFile? file) async {
    Object? postBody = {};

    // verify required params are set
    if (file == null) {
      throw ApiException(400, 'Missing required param: file');
    }

    // create path and map variables
    var path = '/user/profile_image'.replaceAll('{format}', 'json');

    // query params
    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};

    var contentTypes = <String>['multipart/form-data'];

    var contentType = 'multipart/form-data';
    var authNames = <String>['Authorization'];

    if (contentType.startsWith('multipart/form-data')) {
      var hasFields = false;
      var mp = http.MultipartRequest('POST', Uri.parse('/user/profile_image'));
      hasFields = true;
      mp.fields['file'] = file.field;
      mp.files.add(file);
      if (hasFields) postBody = mp;
    } else {
      print('null??');
    }

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserViewPrivate')
          as UserViewPrivate;
    } else {
      return null;
    }
  }
}
