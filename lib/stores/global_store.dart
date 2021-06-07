import 'package:chat_concept/swagger/api.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

@singleton
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  @observable
  int bottomNavBarIndex = 0;

  @observable
  UserView? currentUser;

  @action
  void setbottomNavBarIndex(int value) => bottomNavBarIndex = value;

  @action
  Future<UserView?> getUserFromToken() async {
    UserView? loggedInUser;
    await auth.getProfile().then((user) {
      loggedInUser = user;
      currentUser = user;
    }).catchError((onError) {});
    return loggedInUser;
  }
}
