import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

@singleton
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  @observable
  int bottomNavBarIndex = 0;
  @action
  void setbottomNavBarIndex(int value) => bottomNavBarIndex = value;
}