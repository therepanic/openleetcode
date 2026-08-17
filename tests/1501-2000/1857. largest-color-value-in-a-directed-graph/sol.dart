class Solution {
  int largestPathValue(String colors, List<List<int>> edges) {
    final n = colors.length;
    final graph = List.generate(n, (_) => <int>[]);
    for (final edge in edges) {
      graph[edge[0]].add(edge[1]);
    }
    final counts = List.generate(n, (_) => List<int>.filled(26, 0));
    final state = List<int>.filled(n, 0);

    int dfs(int node) {
      if (state[node] == 1) return -1;
      if (state[node] == 2) return counts[node][colors.codeUnitAt(node) - 97];
      state[node] = 1;
      for (final next in graph[node]) {
        if (dfs(next) == -1) return -1;
        for (var c = 0; c < 26; c++) {
          if (counts[next][c] > counts[node][c]) counts[node][c] = counts[next][c];
        }
      }
      counts[node][colors.codeUnitAt(node) - 97]++;
      state[node] = 2;
      return counts[node][colors.codeUnitAt(node) - 97];
    }

    var answer = 0;
    for (var i = 0; i < n; i++) {
      final value = dfs(i);
      if (value == -1) return -1;
      if (value > answer) answer = value;
    }
    return answer;
  }
}
