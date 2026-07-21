class Solution {
  bool validateBinaryTreeNodes(int n, List<int> leftChild, List<int> rightChild) {
    List<int> inDegree = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      for (int child in [leftChild[i], rightChild[i]]) {
        if (child != -1) {
          if (child < 0 || child >= n) return false;
          inDegree[child]++;
          if (inDegree[child] > 1) return false;
        }
      }
    }

    int root = -1;
    for (int i = 0; i < n; i++) {
      if (inDegree[i] == 0) {
        if (root != -1) return false;
        root = i;
      }
    }
    if (root == -1) return false;

    var queue = <int>[root];
    List<bool> visited = List.filled(n, false);
    visited[root] = true;
    int count = 1;

    while (queue.isNotEmpty) {
      int node = queue.removeAt(0);
      for (int child in [leftChild[node], rightChild[node]]) {
        if (child == -1) continue;
        if (visited[child]) return false;
        visited[child] = true;
        count++;
        queue.add(child);
      }
    }
    return count == n;
  }
}
