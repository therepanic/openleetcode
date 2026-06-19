class Solution {
  String licenseKeyFormatting(String s, int k) {
    s = s.replaceAll("-", "").toUpperCase();
    List<String> result = [];
    int i = s.length;
    while (i > 0) {
      int start = i - k;
      if (start < 0) start = 0;
      result.insert(0, s.substring(start, i));
      i -= k;
    }
    return result.join("-");
  }
}
