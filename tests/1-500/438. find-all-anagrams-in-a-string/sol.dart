class Solution {
  List<int> findAnagrams(String s, String p) {
    int n1 = s.length, n2 = p.length;
    List<int> res = [];
    if (n1 < n2) return res;

    List<int> a = List.filled(26, 0);
    List<int> b = List.filled(26, 0);

    for (int i = 0; i < n2; i++) {
      a[p.codeUnitAt(i) - 97]++;
      b[s.codeUnitAt(i) - 97]++;
    }

    bool listsEqual(List<int> x, List<int> y) {
      for (int i = 0; i < 26; i++) {
        if (x[i] != y[i]) return false;
      }
      return true;
    }

    if (listsEqual(a, b)) res.add(0);

    for (int i = n2; i < n1; i++) {
      b[s.codeUnitAt(i) - 97]++;
      b[s.codeUnitAt(i - n2) - 97]--;
      if (listsEqual(a, b)) res.add(i - n2 + 1);
    }

    return res;
  }
}
