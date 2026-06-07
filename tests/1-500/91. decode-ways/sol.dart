class Solution {
  int numDecodings(String s) {
    if (s.isEmpty || s.codeUnitAt(0) == 48) {
      return 0;
    }

    int prev2 = 1;
    int prev1 = 1;
    for (int i = 1; i < s.length; i++) {
      int curr = 0;
      if (s.codeUnitAt(i) != 48) {
        curr += prev1;
      }
      int value =
          (s.codeUnitAt(i - 1) - 48) * 10 + (s.codeUnitAt(i) - 48);
      if (value >= 10 && value <= 26) {
        curr += prev2;
      }
      prev2 = prev1;
      prev1 = curr;
    }

    return prev1;
  }
}
