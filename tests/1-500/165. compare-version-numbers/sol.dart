class Solution {
  int compareVersion(String version1, String version2) {
    final a = version1.split('.');
    final b = version2.split('.');
    final n = a.length > b.length ? a.length : b.length;
    for (var i = 0; i < n; i++) {
      final x = i < a.length ? int.parse(a[i]) : 0;
      final y = i < b.length ? int.parse(b[i]) : 0;
      if (x < y) return -1;
      if (x > y) return 1;
    }
    return 0;
  }
}
