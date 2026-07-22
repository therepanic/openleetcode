class Solution {
  List<bool> checkIfPrerequisite(int n, List<List<int>> prerequisites, List<List<int>> queries) {
    final reach = List.generate(n, (_) => List<bool>.filled(n, false));
    for (final edge in prerequisites) reach[edge[0]][edge[1]] = true;
    for (var k = 0; k < n; k++) {
      for (var i = 0; i < n; i++) {
        if (!reach[i][k]) continue;
        for (var j = 0; j < n; j++) reach[i][j] = reach[i][j] || reach[k][j];
      }
    }
    return queries.map((query) => reach[query[0]][query[1]]).toList();
  }
}
