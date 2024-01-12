abstract class Validate {
  static String? validateEmail(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Enter Valid Email';
    } else if (value.isEmpty) {
      return 'Please enter your email!';
    } else {
      return null;
    }
  }

  static String? validateName(String name, String value) {
    if (value.isEmpty) {
      return '$name cannot be empty';
    }
    return null;
  }
}
