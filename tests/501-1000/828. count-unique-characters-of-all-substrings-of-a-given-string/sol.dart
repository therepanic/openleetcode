class Solution {
  int uniqueLetterString(String s) {
    int n = s.length;
    List<int> left = List.filled(n, 0);
    List<int> right = List.filled(n, 0);
    List<int> prev = List.filled(26, -1);

    for (int i = 0; i < n; i++) {
      int idx = s.codeUnitAt(i) - 'A'.codeUnitAt(0);
      left[i] = prev[idx];
      prev[idx] = i;
    }

    prev = List.filled(26, n);

    for (int i = n - 1; i >= 0; i--) {
      int idx = s.codeUnitAt(i) - 'A'.codeUnitAt(0);
      right[i] = prev[idx];
      prev[idx] = i;
    }

    int ans = 0;
    for (int i = 0; i < n; i++) {
      ans += (i - left[i]) * (right[i] - i);
    }
    return ans;
  }
}
