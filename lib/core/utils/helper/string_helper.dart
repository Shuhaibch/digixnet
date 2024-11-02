class CStringHelper {
  static String addNewLine(String string) {
    return string.replaceAll('.-', '.\n-');
  }
}
