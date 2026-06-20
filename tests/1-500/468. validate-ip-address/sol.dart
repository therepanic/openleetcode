class Solution {
  String validIPAddress(String queryIP) {
    if ('.'.allMatches(queryIP).length == 3) {
      List<String> parts = queryIP.split('.');
      bool valid = true;
      for (String p in parts) {
        if (p.isEmpty || int.tryParse(p) == null) {
          valid = false;
          break;
        }
        int num = int.parse(p);
        if (num < 0 || num > 255 || num.toString() != p) {
          valid = false;
          break;
        }
      }
      if (valid) return "IPv4";
    } else if (':'.allMatches(queryIP).length == 7) {
      List<String> parts = queryIP.split(':');
      bool valid = true;
      final hexChars = RegExp(r'^[0-9a-fA-F]+$');
      for (String p in parts) {
        if (p.length < 1 || p.length > 4 || !hexChars.hasMatch(p)) {
          valid = false;
          break;
        }
      }
      if (valid) return "IPv6";
    }
    return "Neither";
  }
}
