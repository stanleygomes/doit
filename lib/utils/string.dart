class StringUtil {
  static String? getFirstName(String? fullName) {
    if (fullName == null) {
      return null;
    }

    List<String> names = fullName.split(' ');
    return names[0];
  }
}
