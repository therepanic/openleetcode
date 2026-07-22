class Solution {
  List<int> kWeakestRows(List<List<int>> mat, int k) {
    Map<int, int> d = {};
    for (int i = 0; i < mat.length; i++) {
      int sum = mat[i].fold(0, (prev, val) => prev + val);
      d[i] = sum;
    }
    var entries = d.entries.toList()
      ..sort((a, b) => a.value == b.value ? a.key.compareTo(b.key) : a.value.compareTo(b.value));
    return entries.take(k).map((e) => e.key).toList();
  }
}
