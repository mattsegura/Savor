String? validateField(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;
}
