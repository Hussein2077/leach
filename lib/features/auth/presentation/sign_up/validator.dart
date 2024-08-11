String? validateSignUpForm({
  required String name,
  required String userName,
  required String email,
  required String phone,
  required String password,
  required String  confirmPassword,
  required String country,
  required String city,
}) {
  if (name.isEmpty) {
    return 'Name cannot be empty';
  }
  if (userName.isEmpty) {
    return 'Username cannot be empty';
  }
  if (email.isEmpty) {
    return 'Email cannot be empty';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
    return 'Enter a valid email address';
  }
  if (phone.isEmpty) {
    return 'Phone number cannot be empty';
  }
  if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(phone)) {
    return 'Enter a valid phone number';
  }
  if (password.isEmpty) {
    return 'Password cannot be empty';
  }
  if (password.length < 8) {
    return 'Password must be at least 6 characters long';
  }
  if (country.isEmpty) {
    return 'Country cannot be empty';
  }
  if (city.isEmpty) {
    return 'City cannot be empty';
  }
  if(password!= confirmPassword){
    return  'Password does not match';
  }

  return null;
}
