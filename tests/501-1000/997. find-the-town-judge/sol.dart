class Solution {
  int findJudge(int n, List<List<int>> trust) {
    var indegree = List.filled(n + 1, 0);
    var outdegree = List.filled(n + 1, 0);
    for (var edge in trust) {
      int a = edge[0];
      int b = edge[1];
      outdegree[a]++;
      indegree[b]++;
    }
    for (int i = 1; i <= n; i++) {
      if (outdegree[i] == 0 && indegree[i] == n - 1) {
        return i;
      }
    }
    return -1;
  }
}
