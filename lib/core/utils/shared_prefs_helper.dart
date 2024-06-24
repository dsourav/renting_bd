import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefsHelper {
  final SharedPreferences _preferences;
  SharedPrefsHelper(this._preferences);

  final _roleKey = 'role';

  Future<bool> setUserRole(String role) {
    return _preferences.setString(_roleKey, role);
  }

  Future<bool> removeRole() {
    return _preferences.remove(_roleKey);
  }

  UserRole? getUserRole() {
    final role = _preferences.getString(_roleKey);

    if (role == Constant.landlord) {
      return UserRole.landlord;
    } else if (role == Constant.tenant) {
      return UserRole.tenant;
    } else {
      return null;
    }
  }
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
