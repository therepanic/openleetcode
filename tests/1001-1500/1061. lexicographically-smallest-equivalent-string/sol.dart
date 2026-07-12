class Solution {
  String smallestEquivalentString(String s1, String s2, String baseStr) {
    Map<String, List<String>> adj = {};
    for (int i = 0; i < s1.length; i++) {
      String a = s1[i];
      String b = s2[i];
      adj.putIfAbsent(a, () => []).add(b);
      adj.putIfAbsent(b, () => []).add(a);
    }

    String dfs(String ch, Set<String> visited) {
      visited.add(ch);
      String minCh = ch;
      for (String nei in adj[ch] ?? []) {
        if (!visited.contains(nei)) {
          String candidate = dfs(nei, visited);
          if (candidate.compareTo(minCh) < 0) {
            minCh = candidate;
          }
        }
      }
      return minCh;
    }

    StringBuffer result = StringBuffer();
    for (int i = 0; i < baseStr.length; i++) {
      Set<String> visited = {};
      result.write(dfs(baseStr[i], visited));
    }
    return result.toString();
  }
}
