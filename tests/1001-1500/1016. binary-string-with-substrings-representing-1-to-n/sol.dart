class Solution {
  bool queryString(String s, int n) {
    for (int num = n; num >= 1; num--) {
      String target = num.toRadixString(2);
      int length = target.length;
      int left = 0;
      bool valid = false;
      for (int right = 0; right < s.length; right++) {
        while (right - left + 1 > length) {
          left++;
        }
        if (s.substring(left, right + 1) == target) {
          valid = true;
          break;
        }
      }
      if (!valid) {
        return false;
      }
    }
    return true;
  }
}
