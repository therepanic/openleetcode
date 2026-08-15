class Solution {
  String replaceDigits(String s) {
    List<String> chars = s.split('');
    for (int i = 1; i < chars.length; i += 2) {
      String ch = chars[i - 1];
      int digit = int.parse(chars[i]);
      chars[i] = String.fromCharCode(ch.codeUnitAt(0) + digit);
    }
    return chars.join();
  }
}
