import 'package:chat_concept/swagger/api.dart';

//Authentication handling class
class AuthImpl {
  final _api = UserApi();

  //login method
  Future<UserViewPrivate?> login(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    return result;
  }

  //register method
  Future register(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }

  //upload profile pic method
  Future updloadProfilePic(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }

  //get user profile from token
  Future<UserView?> getProfileFromToken() async {
    var result = await _api.getUserByTokenUserTokenGet();
    print(result);
    return result;
  }
}
