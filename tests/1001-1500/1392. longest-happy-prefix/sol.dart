class Solution {
  String longestPrefix(String s) {
    int n = s.length;
    List<int> prefix = List.filled(n, 0);
    int matched = 0;
    for (int i = 1; i < n; i++) {
      while (matched > 0 && s[i] != s[matched]) {
        matched = prefix[matched - 1];
      }
      if (s[i] == s[matched]) {
        matched++;
      }
      prefix[i] = matched;
    }
    return s.substring(0, prefix[n - 1]);
  }
}
