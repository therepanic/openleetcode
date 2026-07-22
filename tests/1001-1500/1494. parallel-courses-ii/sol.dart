class Solution {
  late int n;
  late int k;
  late List<List<int>> graph;
  late Map<String, int> memo;

  int minNumberOfSemesters(int n, List<List<int>> relations, int k) {
    this.n = n;
    this.k = k;
    graph = List.generate(n, (_) => []);
    List<int> inDegrees = List.filled(n, 0);
    for (var rel in relations) {
      int prev = rel[0] - 1;
      int next = rel[1] - 1;
      inDegrees[next]++;
      graph[prev].add(next);
    }
    memo = {};
    return recurse((1 << n) - 1, inDegrees);
  }

  int recurse(int mask, List<int> inDegrees) {
    if (mask == 0) return 0;
    String key = '$mask-${inDegrees.toString()}';
    if (memo.containsKey(key)) return memo[key]!;

    List<int> nodes = [];
    for (int i = 0; i < n; i++) {
      if ((mask & (1 << i)) != 0 && inDegrees[i] == 0) {
        nodes.add(i);
      }
    }
    int ans = 1 << 60;
    int combLimit = k < nodes.length ? k : nodes.length;
    List<List<int>> combos = getCombinations(nodes, combLimit);
    for (var kNodes in combos) {
      int newMask = mask;
      List<int> newInDeg = List.from(inDegrees);
      for (var node in kNodes) {
        newMask ^= (1 << node);
        for (var child in graph[node]) {
          newInDeg[child]--;
        }
      }
      ans = min(ans, 1 + recurse(newMask, newInDeg));
    }
    memo[key] = ans;
    return ans;
  }

  List<List<int>> getCombinations(List<int> nodes, int k) {
    List<List<int>> result = [];
    void helper(int start, List<int> current) {
      if (current.length == k) {
        result.add(List.from(current));
        return;
      }
      for (int i = start; i < nodes.length; i++) {
        current.add(nodes[i]);
        helper(i + 1, current);
        current.removeLast();
      }
    }
    helper(0, []);
    return result;
  }
}
