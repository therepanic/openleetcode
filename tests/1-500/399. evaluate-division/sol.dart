class Solution {
  List<double> calcEquation(List<List<String>> equations, List<double> values, List<List<String>> queries) {
    Map<String, Map<String, double>> g = {};
    for (int i = 0; i < equations.length; i++) {
      String a = equations[i][0];
      String b = equations[i][1];
      double v = values[i];
      g.putIfAbsent(a, () => {});
      g[a]![b] = v;
      g.putIfAbsent(b, () => {});
      g[b]![a] = 1.0 / v;
    }
    
    double dfs(String x, String y) {
      if (!g.containsKey(x) || !g.containsKey(y)) return -1.0;
      List<MapEntry<String, double>> stack = [MapEntry(x, 1.0)];
      Set<String> visited = {};
      while (stack.isNotEmpty) {
        var entry = stack.removeLast();
        String c = entry.key;
        double r = entry.value;
        if (c == y) return r;
        visited.add(c);
        for (var n in g[c]!.keys) {
          if (!visited.contains(n)) {
            stack.add(MapEntry(n, r * g[c]![n]!));
          }
        }
      }
      return -1.0;
    }
    
    return queries.map((q) => dfs(q[0], q[1])).toList();
  }
}
