class Solution {
  int atMostNGivenDigitSet(List<String> digits, int n) {
    int d = digits.length;
    String s = n.toString();
    int k = s.length;
    List<int> vals = digits.map((x) => x.codeUnitAt(0)).toList();

    int powInt(int base, int exp) {
      var result = 1;
      for (var i = 0; i < exp; i++) {
        result *= base;
      }
      return result;
    }

    int ans = 0;
    for (int len = 1; len < k; len++) {
      ans += powInt(d, len);
    }

    for (int i = 0; i < k; i++) {
      int ch = s.codeUnitAt(i);
      int cnt = 0;
      for (int digit in vals) {
        if (digit < ch) {
          cnt++;
        }
      }
      ans += cnt * powInt(d, k - i - 1);

      if (!vals.contains(ch)) {
        return ans;
      }
      if (i == k - 1) {
        ans++;
      }
    }

    return ans;
  }
}
