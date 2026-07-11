class Solution {
  String gcdOfStrings(String str1, String str2) {
    if (str1 + str2 != str2 + str1) {
      return "";
    }
    
    int gcd(int len1, int len2) {
      int minVal = len1 < len2 ? len1 : len2;
      for (int i = minVal; i >= 1; i--) {
        if (len1 % i == 0 && len2 % i == 0) {
          return i;
        }
      }
      return 1;
    }
    
    return str1.substring(0, gcd(str1.length, str2.length));
  }
}
