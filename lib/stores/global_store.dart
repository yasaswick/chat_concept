import 'package:chat_concept/api/authImpl.dart';
import 'package:chat_concept/res/preference.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'global_store.g.dart';

@singleton
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  final AuthImpl _auth = AuthImpl();

  @observable
  int bottomNavBarIndex = 0;

  @observable
  int pageIndex = 0;

  @observable
  UserView? currentUser;

  @action
  void setbottomNavBarIndex(int value) => bottomNavBarIndex = value;

  @action
  void setPageIndex(int value) => pageIndex = value;

  @action
  Future setAccessToken() async {
    //Set Access token to default api client
    var preferences = await SharedPreferences.getInstance();
    var currentToken = preferences.getString(AppPreferences.access_token);
    if (currentToken != null) {
      defaultApiClient.setAccessToken(currentToken);
      print('access token set');
    } else {
      print('no access token found');
    }
  }

  @action
  Future<UserView?> getUserFromToken() async {
    //Get user from token
    UserView? loggedInUser;
    await _auth.getProfileFromToken().then((user) {
      loggedInUser = user;
      currentUser = user;
    }).catchError((onError) {});
    return loggedInUser;
  }

  @action
  void setCurrentUser(UserViewPrivate? user) {
    print(user);
    UserView();
    currentUser = UserView.fromUserViewPrivate(user);
  }

  @action
  void removeUser() async {
    currentUser = null;
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(AppPreferences.access_token, '');
    defaultApiClient.setAccessToken('');
  }
}
