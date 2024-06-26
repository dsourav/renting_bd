abstract class Constant {
  // Image Path
  static const String emailEnvelopeIcon = "assets/images/email_envelope.png";
  static const String noResultsIcon = "assets/images/no_results.png";
  static const String noImageIcon = "assets/images/not_found.png";

  // Constant text
  static const invalidEmailLabel = "Email is not valid";
  static const invalidPhoneLabel = "Phone number is invalid";
  static const invalidUserNameLabel = "User name is invalid";
  static const passwordRequiredLabel = "Password is required";
  static const passwordIncorrectLengthLabel = "Password should be at least 8 character";
  static const selectRoleLabel = 'Please select a role.';
  static const isRequiredLabel = "is required";
  static const noRoleFoundLabel = "No Role Found";

  static const landlord = "landlord";
  static const tenant = "tenant";
  static const userRoles = [landlord, tenant];

  static String profileImageDirPath(String uuid) => "profile-image/$uuid";
  static String propertyImageDirPath(String uuid) => "property-image/$uuid";
}

class PropertyType {
  static const String apartment = "Apartment";
  static const String house = "House";
  static const String condo = "Condo";

  static const List<String> getAll = [apartment, house, condo];
}

class LocationType {
  static const String dhaka = "Dhaka";
  static const String chittagong = "Chittagong";
  static const String khulna = "Khulna";
  static const String rajshahi = "Rajshahi";
  static const String sylhet = "Sylhet";
  static const String barisal = "Barisal";
  static const String rangpur = "Rangpur";
  static const List<String> getAll = [dhaka, chittagong, khulna, rajshahi, sylhet, barisal, rangpur];
}
