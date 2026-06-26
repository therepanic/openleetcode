class Solution {
  bool checkInclusion(String s1, String s2) {
    int n1 = s1.length, n2 = s2.length;
    if (n2 < n1) return false;

    List<int> c1 = List.filled(26, 0);
    List<int> c2 = List.filled(26, 0);

    for (int i = 0; i < n1; i++) {
      c1[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      c2[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    if (_listEquals(c1, c2)) return true;

    for (int i = n1; i < n2; i++) {
      c2[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      c2[s2.codeUnitAt(i - n1) - 'a'.codeUnitAt(0)]--;

      if (_listEquals(c1, c2)) return true;
    }

    return false;
  }

  bool _listEquals(List<int> a, List<int> b) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
