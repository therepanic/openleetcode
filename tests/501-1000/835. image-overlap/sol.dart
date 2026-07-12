class Solution {
  int largestOverlap(List<List<int>> img1, List<List<int>> img2) {
    int n = img1.length;
    List<List<int>> a = [];
    List<List<int>> b = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (img1[i][j] == 1) a.add([i, j]);
        if (img2[i][j] == 1) b.add([i, j]);
      }
    }
    Map<String, int> cnt = {};
    for (var p1 in a) {
      for (var p2 in b) {
        String key = '${p1[0] - p2[0]},${p1[1] - p2[1]}';
        cnt[key] = (cnt[key] ?? 0) + 1;
      }
    }
    if (cnt.isEmpty) return 0;
    return cnt.values.reduce((x, y) => x > y ? x : y);
  }
}
