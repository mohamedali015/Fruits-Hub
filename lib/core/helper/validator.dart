abstract class Validator {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Field required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

// static String? phone(String? value) {
//   if (value == null || value.isEmpty) {
//     return TranslationKeys.phoneRequired.tr;
//   }
//   final phoneRegex = RegExp(r'^\d{11}$');
//   if (!phoneRegex.hasMatch(value)) {
//     return TranslationKeys.phoneValid.tr;
//   }
//   return null;
// }
}
