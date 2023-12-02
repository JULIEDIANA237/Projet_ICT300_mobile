class LoginModel {
  String email = '';
  String password = '';

  bool isEmailError = false;
  String emailErrorMessage = '';

  bool isPasswordError = false;
  String passwordErrorMessage = '';

  bool validate() {
    bool isValid = true;

    if (email.isEmpty) {
      isEmailError = true;
      emailErrorMessage = 'Veuillez saisir une adresse e-mail.';
      isValid = false;
    } else {
      isEmailError = false;
      emailErrorMessage = '';
    }

    if (password.isEmpty) {
      isPasswordError = true;
      passwordErrorMessage = 'Veuillez saisir un mot de passe.';
      isValid = false;
    } else {
      isPasswordError = false;
      passwordErrorMessage = '';
    }

    return isValid;
  }
}