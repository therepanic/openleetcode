class Solution {
  String shiftingLetters(String s, List<int> shifts) {
    int n = shifts.length;
    List<int> l = List.filled(n, 0);
    int z = shifts.reduce((a, b) => a + b);
    l[0] = z;
    for (int i = 1; i < n; i++) {
      l[i] = l[i - 1] - shifts[i - 1];
    }
    List<int> p = s.codeUnits.map((c) => c - 97).toList();
    StringBuffer k = StringBuffer();
    for (int i = 0; i < n; i++) {
      k.writeCharCode((p[i] + l[i]) % 26 + 97);
    }
    return k.toString();
  }
}
