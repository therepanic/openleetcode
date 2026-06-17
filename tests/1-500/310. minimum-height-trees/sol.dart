class Solution {
  List<int> findMinHeightTrees(int n, List<List<int>> edges) {
    if (n < 3) {
      return List.generate(n, (i) => i);
    }

    List<Set<int>> adjacencyList = List.generate(n, (_) => <int>{});
    for (var edge in edges) {
      int a = edge[0], b = edge[1];
      adjacencyList[a].add(b);
      adjacencyList[b].add(a);
    }

    List<int> leaves = [];
    for (int i = 0; i < n; i++) {
      if (adjacencyList[i].length == 1) {
        leaves.add(i);
      }
    }

    int remainingNodes = n;
    while (remainingNodes > 2) {
      remainingNodes -= leaves.length;
      List<int> newLeaves = [];
      for (int leaf in leaves) {
        int neighbor = adjacencyList[leaf].first;
        adjacencyList[neighbor].remove(leaf);
        if (adjacencyList[neighbor].length == 1) {
          newLeaves.add(neighbor);
        }
      }
      leaves = newLeaves;
    }

    return leaves;
  }
}
