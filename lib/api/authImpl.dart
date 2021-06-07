import 'package:chat_concept/swagger/api.dart';

//Authentication handling class
class AuthImpl {
  final _api = UserApi();

  //login method
  void login(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }

  //register method
  void register(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }

  //upload profile pic method
  void updloadProfilePic(String email, String password) async {
    var loginCredentials = AuthDetails(email, password);
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }
}
