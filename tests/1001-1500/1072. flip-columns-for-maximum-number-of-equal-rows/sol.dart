class Solution {
  int maxEqualRowsAfterFlips(List<List<int>> matrix) {
    final count = <String, int>{};
    int ans = 0;

    for (final row in matrix) {
      final flip = row[0];
      final key = row.map((x) => (x ^ flip).toString()).join(',');
      count[key] = (count[key] ?? 0) + 1;
      if (count[key]! > ans) ans = count[key]!;
    }

    return ans;
  }
}
