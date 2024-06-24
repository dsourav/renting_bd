import 'package:renting_bd/core/utils/enums.dart';

extension RoleExtension on UserRole? {
  toGreetings() {
    if (this == UserRole.landlord) {
      return "Hello Lanlord!";
    } else if (this == UserRole.tenant) {
      return "Hello Tenant!";
    } else {
      return "Renting BD";
    }
  }
}
