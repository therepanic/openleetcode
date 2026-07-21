class Solution {
  int distinctEchoSubstrings(String text) {
    int n = text.length;
    const b1 = 911382323;
    const b2 = 972663749;
    const m1 = 1000000007;
    const m2 = 1000000009;
    var p1 = List<int>.filled(n + 1, 1);
    var p2 = List<int>.filled(n + 1, 1);
    var h1 = List<int>.filled(n + 1, 0);
    var h2 = List<int>.filled(n + 1, 0);
    const a = 97;
    for (int i = 1; i <= n; i++) {
      int v = text.codeUnitAt(i - 1) - a;
      p1[i] = (p1[i - 1] * b1) % m1;
      p2[i] = (p2[i - 1] * b2) % m2;
      h1[i] = (h1[i - 1] * b1 + v) % m1;
      h2[i] = (h2[i - 1] * b2 + v) % m2;
    }
    List<int> get(int l, int r) {
      int v1 = (h1[r] - h1[l] * p1[r - l]) % m1;
      int v2 = (h2[r] - h2[l] * p2[r - l]) % m2;
      if (v1 < 0) v1 += m1;
      if (v2 < 0) v2 += m2;
      return [v1, v2];
    }
    var st = <String>{};
    for (int i = 0; i < n; i++) {
      int maxLen = (n - i) ~/ 2;
      for (int L = 1; L <= maxLen; L++) {
        if (get(i, i + L)[0] == get(i + L, i + 2 * L)[0] &&
            get(i, i + L)[1] == get(i + L, i + 2 * L)[1]) {
          var h = get(i, i + 2 * L);
          st.add("${2 * L},${h[0]},${h[1]}");
        }
      }
    }
    return st.length;
  }
}
