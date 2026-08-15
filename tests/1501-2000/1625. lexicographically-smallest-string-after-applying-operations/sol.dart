class Solution {
  String findLexSmallestString(String s, int a, int b) {
    int n = s.length;
    Set<String> seen = {};
    void dfs(String cur) {
      if (seen.contains(cur)) return;
      seen.add(cur);
      List<String> add = cur.split('');
      for (int i = 1; i < n; i += 2) {
        add[i] = ((int.parse(add[i]) + a) % 10).toString();
      }
      dfs(add.join());
      dfs(cur.substring(n - b) + cur.substring(0, n - b));
    }
    dfs(s);
    return seen.reduce((a, b) => a.compareTo(b) <= 0 ? a : b);
  }
}
