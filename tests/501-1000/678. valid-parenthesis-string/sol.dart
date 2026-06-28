class Solution {
  bool checkValidString(String s) {
    int low = 0, high = 0;
    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (char == '(') {
        low++;
        high++;
      } else if (char == ')') {
        low = (low - 1).clamp(0, low);
        high--;
      } else {
        low = (low - 1).clamp(0, low);
        high++;
      }
      if (high < 0) return false;
    }
    return low == 0;
  }
}
