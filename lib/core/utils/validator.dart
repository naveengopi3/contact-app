class Validator {
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name.';
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Please enter a valid name";
    }
    return null;
  }

  String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number is required';
  }

  final phoneRegExp = RegExp(r'^[6-9]\d{9}$');
  if (!phoneRegExp.hasMatch(value.trim())) {
    return 'Enter a valid 10-digit phone number';
  }

  return null;
}

}