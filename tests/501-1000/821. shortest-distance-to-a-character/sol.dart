class Solution {
  List<int> shortestToChar(String s, String c) {
    int n = s.length;
    List<int> ans = List.filled(n, n);
    int prev = -n;
    for (int i = 0; i < n; i++) {
      if (s[i] == c) {
        prev = i;
      }
      ans[i] = i - prev;
    }
    prev = 2 * n;
    for (int i = n - 1; i >= 0; i--) {
      if (s[i] == c) {
        prev = i;
      }
      ans[i] = ans[i] < prev - i ? ans[i] : prev - i;
    }
    return ans;
  }
}
