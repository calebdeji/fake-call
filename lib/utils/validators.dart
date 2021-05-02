bool isStringEmpty(String text) {
  String trimmedString = text.trim();

  return trimmedString == '';
}

bool isPhoneNumberValid(String phone) {
  RegExp regex = RegExp(r"^[0-9]{11}");

  return regex.hasMatch(phone);
}
