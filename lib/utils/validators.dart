bool isStringEmpty(String text) {
  String trimmedString = text.trim();

  return trimmedString == '';
}

bool isPhoneNumberAValidNigeriaPhoneNumber(String phone) {
  RegExp regexWithCallingCode =
      RegExp(r'^\+234([7-9]{1})([0-1]{1})([0-9]{8}$)');
  RegExp regexWithoutCallingCode = RegExp(r'^0[7-9]{1}[0-1]{1}[0-9]{8}$');

  return regexWithoutCallingCode.hasMatch(phone) ||
      regexWithCallingCode.hasMatch(phone);
}
