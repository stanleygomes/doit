class StringUtil {
  static String? getFirstName(String? fullName) {
    if (fullName == null) {
      return null;
    }

    List<String> names = fullName.split(' ');
    return names[0];
  }

  static String ellipsis(String text, int maxLength) {
    var textLength = text.length;

    if (textLength > maxLength) {
      return '${text.substring(1, maxLength)}...';
    }

    return text;
  }
}
