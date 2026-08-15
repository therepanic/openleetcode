class Solution {
  int minCost(int n, List<int> cuts) {
    List<int> c = [...cuts, 0, n]..sort();
    int m = c.length;
    List<List<int>> memo = List.generate(m, (_) => List<int>.filled(m, -1));
    return optimize(0, m-1, c, memo);
  }
  
  int optimize(int i, int j, List<int> c, List<List<int>> memo) {
    if (j - i <= 1) return 0;
    if (memo[i][j] != -1) return memo[i][j];
    int res = 1 << 31 - 1; // max int
    for (int k = i+1; k < j; k++) {
      int val = optimize(i, k, c, memo) + optimize(k, j, c, memo);
      if (val < res) res = val;
    }
    memo[i][j] = res + (c[j] - c[i]);
    return memo[i][j];
  }
}
