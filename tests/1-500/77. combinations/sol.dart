class Solution {
  List<List<int>> combine(int n, int k) {
    final res = <List<int>>[];
    final cur = <int>[];

    void dfs(int start) {
      if (cur.length == k) {
        res.add(List<int>.from(cur));
        return;
      }
      for (var i = start; i <= n; i++) {
        cur.add(i);
        dfs(i + 1);
        cur.removeLast();
      }
    }

    dfs(1);
    return res;
  }
}
