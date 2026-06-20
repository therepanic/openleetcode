class Solution {
  int titleToNumber(String columnTitle) {
    int ans = 0;
    for (final code in columnTitle.codeUnits) ans = ans * 26 + code - 64;
    return ans;
  }
}
