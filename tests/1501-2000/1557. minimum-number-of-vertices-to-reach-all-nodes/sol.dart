class Solution {
  List<int> findSmallestSetOfVertices(int n, List<List<int>> edges) {
    List<bool> hasIncoming = List.filled(n, false);
    for (var edge in edges) {
      hasIncoming[edge[1]] = true;
    }
    List<int> result = [];
    for (int i = 0; i < n; i++) {
      if (!hasIncoming[i]) {
        result.add(i);
      }
    }
    return result;
  }
}
