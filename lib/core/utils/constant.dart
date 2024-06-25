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
}
