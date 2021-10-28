class StringUtil {
  String getFirstName(String fullName) {
    List<String> names = fullName.split(' ');
    return names[0];
  }
}
