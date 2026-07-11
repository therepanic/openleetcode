class Solution {
  String longestDupSubstring(String s) {
    int n = s.length;
    int base1 = 131, base2 = 31;
    int mod1 = 1000000005, mod2 = 1000000007;

    List<int> h1 = List.filled(n + 1, 0);
    List<int> p1 = List.filled(n + 1, 1);
    List<int> h2 = List.filled(n + 1, 0);
    List<int> p2 = List.filled(n + 1, 1);

    for (int i = 0; i < n; i++) {
      h1[i + 1] = (h1[i] * base1 + s.codeUnitAt(i)) % mod1;
      p1[i + 1] = (p1[i] * base1) % mod1;
      h2[i + 1] = (h2[i] * base2 + s.codeUnitAt(i)) % mod2;
      p2[i + 1] = (p2[i] * base2) % mod2;
    }

    String Function(int) check = (int L) {
      var seen = <int>{};
      for (int i = 0; i <= n - L; i++) {
        int v1 = (h1[i + L] - h1[i] * p1[L]) % mod1;
        if (v1 < 0) v1 += mod1;
        int v2 = (h2[i + L] - h2[i] * p2[L]) % mod2;
        if (v2 < 0) v2 += mod2;
        int key = v1 * mod2 + v2;
        if (seen.contains(key)) return s.substring(i, i + L);
        seen.add(key);
      }
      return "";
    };

    int lo = 1, hi = n;
    String res = "";
    while (lo <= hi) {
      int mid = (lo + hi) ~/ 2;
      String t = check(mid);
      if (t.isNotEmpty) {
        res = t;
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
    return res;
  }
}
