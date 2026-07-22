class Solution {
  int balancedStringSplit(String s) {
    int bal = 0;
    int count = 0;
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == 'L') {
        bal++;
      } else if (c == 'R') {
        bal--;
      }
      if (bal == 0) {
        count++;
      }
    }
    return count;
  }
}
