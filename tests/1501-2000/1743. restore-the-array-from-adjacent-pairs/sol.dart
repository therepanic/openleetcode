class Solution {
  List<int> restoreArray(List<List<int>> adjacentPairs) {
    Map<int, int> xorMap = {};
    Map<int, int> degree = {};

    for (var pair in adjacentPairs) {
      int u = pair[0], v = pair[1];
      xorMap[u] = (xorMap[u] ?? 0) ^ v;
      xorMap[v] = (xorMap[v] ?? 0) ^ u;
      degree[u] = (degree[u] ?? 0) + 1;
      degree[v] = (degree[v] ?? 0) + 1;
    }

    int start = 0;
    degree.forEach((key, value) {
      if (value == 1) {
        start = key;
        return;
      }
    });

    int n = adjacentPairs.length + 1;
    List<int> res = List.filled(n, 0);

    res[0] = start;
    int prev = 0;

    for (int i = 1; i < n; i++) {
      res[i] = (xorMap[res[i - 1]] ?? 0) ^ prev;
      prev = res[i - 1];
    }

    return res;
  }
}
