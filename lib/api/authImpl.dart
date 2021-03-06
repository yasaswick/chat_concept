import 'package:chat_concept/res/constants.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:chat_concept/res/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
  Future<UserViewPrivate?> register(String name, String email, String password,
      String age, String bio) async {
    var userDetails = UserCreate(name, email, int.parse(age), bio,
        AppConstants.PROFILE_PLACEHOLDER, password);
    var result = await _api.createUserUserPost(userDetails);

    var preferences = await SharedPreferences.getInstance();
    if (result != null) {
      await preferences.setString(
          AppPreferences.access_token, result.token ?? '');
      defaultApiClient.setAccessToken(result.token ?? '');
    }
    return result;
  }

  //upload profile pic method
  Future<UserViewPrivate?> updloadProfilePic(Uri? imageFile) async {
    if (imageFile != null) {
      var image = await http.MultipartFile.fromPath('file', imageFile.path);
      var result = await _api.uploadProfileImageUserProfileImagePost(image);
      return result;
    }
  }

  //get user profile from token
  Future<UserView?> getProfileFromToken() async {
    var result = await _api.getUserByTokenUserTokenGet();
    print(result);
    return result;
  }

  //get user profile from id
  Future<UserView?> getProfileById(String id) async {
    var result = await _api.getUserById(id);
    print(result);
    return result;
  }
}
