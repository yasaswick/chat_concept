import 'package:chat_concept/swagger/api.dart';
import 'package:chat_concept/res/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Authentication handling class
class AuthImpl {
  final _api = UserApi();

  //login method
  Future<UserViewPrivate?> login(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    var preferences = await SharedPreferences.getInstance();
    if (result != null) {
      await preferences.setString(
          AppPreferences.access_token, result.token ?? '');
      defaultApiClient.setAccessToken(result.token ?? '');
    }

    return result;
  }

  //register method
  Future<UserViewPrivate?> register(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
    var preferences = await SharedPreferences.getInstance();
    if (result != null) {
      await preferences.setString(
          AppPreferences.access_token, result.token ?? '');
      defaultApiClient.setAccessToken(result.token ?? '');
    }
    return result;
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
