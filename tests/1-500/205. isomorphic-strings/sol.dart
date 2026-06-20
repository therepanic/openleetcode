class Solution {
  bool isIsomorphic(String s, String t) {
    final st = List.filled(256, -1);
    final ts = List.filled(256, -1);
    for (int i = 0; i < s.length; i++) {
      final a = s.codeUnitAt(i), b = t.codeUnitAt(i);
      if (st[a] != ts[b]) return false;
      st[a] = i;
      ts[b] = i;
    }
    return true;
  }
}
