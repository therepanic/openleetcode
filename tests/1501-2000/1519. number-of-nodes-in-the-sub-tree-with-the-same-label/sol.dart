class Solution {
  List<int> countSubTrees(int n, List<List<int>> edges, String labels) {
    var matrix = List.generate(n, (_) => <int>[]);
    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      matrix[u].add(v);
      matrix[v].add(u);
    }

    var parent = List.filled(n, -1);
    var order = <int>[0];
    for (int i = 0; i < order.length; i++) {
      int node = order[i];
      for (int child in matrix[node]) {
        if (child != parent[node]) {
          parent[child] = node;
          order.add(child);
        }
      }
    }

    var counts = List.generate(n, (_) => List.filled(26, 0));
    var ans = List.filled(n, 0);
    for (int i = order.length - 1; i >= 0; i--) {
      int node = order[i];
      int label = labels.codeUnitAt(node) - 97;
      counts[node][label]++;
      ans[node] = counts[node][label];
      if (parent[node] != -1) {
        for (int j = 0; j < 26; j++) {
          counts[parent[node]][j] += counts[node][j];
        }
      }
    }
    return ans;
  }
}
