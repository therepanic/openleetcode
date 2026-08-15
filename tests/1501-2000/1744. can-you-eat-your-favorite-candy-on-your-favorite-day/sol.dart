class Solution {
  List<bool> canEat(List<int> candiesCount, List<List<int>> queries) {
    int n = candiesCount.length;
    int m = queries.length;
    List<bool> ans = List.filled(m, false);
    List<int> psum = List.filled(n + 1, 0);
    for (int i = 1; i <= n; i++) {
      psum[i] = psum[i - 1] + candiesCount[i - 1];
    }
    for (int i = 0; i < m; i++) {
      int t = queries[i][0];
      int day = queries[i][1];
      int cap = queries[i][2];
      int minDays = psum[t] ~/ cap;
      int maxDays = psum[t + 1] - 1;
      ans[i] = minDays <= day && day <= maxDays;
    }
    return ans;
  }
}
