import 'package:chat_concept/swagger/api.dart';

class AuthImpl {
  final _api = UserApi();

  void login() async {
    var loginCredentials = AuthDetails('test2@testd.com', '123456789');
    var result = await _api.loginUserUserLoginPost(loginCredentials);
    print(result);
  }
}
