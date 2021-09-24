String emailValidation(String value) {
  // if (value.isEmpty)
  //   return "name not be empty";
  // else
  if (value.contains("@gmial.com")) {
    return "Invalid Email Address !";
  }
  return null;
}

String passwordValidation(String value) {
  if (value.length < 6 && value.length > 6) {
    return "Password must be 6 characters";
  }
  return null;
}
