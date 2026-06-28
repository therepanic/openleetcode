class Solution {
  String crackSafe(int n, int k) {
    if (n == 1) {
      return List.generate(k, (i) => i.toString()).join("");
    }

    final adj = <String, List<int>>{};
    final startNode = List.filled(n - 1, "0").join();
    final path = <String>[startNode];
    final edgePath = <int>[];
    final res = StringBuffer();

    while (path.isNotEmpty) {
      final node = path.last;
      if (!adj.containsKey(node)) {
        adj[node] = [];
        for (int i = k - 1; i >= 0; i--) {
          adj[node]!.add(i);
        }
      }
      if (adj[node]!.isNotEmpty) {
        final digit = adj[node]!.removeLast();
        path.add((node + digit.toString()).substring(1));
        edgePath.add(digit);
      } else {
        path.removeLast();
        if (edgePath.isNotEmpty) {
          res.write(edgePath.removeLast().toString());
        }
      }
    }

    return res.toString() + startNode;
  }
}
