bool isEmail({required String email}) {
  // Regular expression for validating an Email
  final emailRegExp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  return emailRegExp.hasMatch(email);
}
