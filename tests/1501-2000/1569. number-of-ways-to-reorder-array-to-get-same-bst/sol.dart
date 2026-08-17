class Solution {
  int numOfWays(List<int> nums) {
    const MOD = 1000000007;
    int n = nums.length;
    
    List<List<int>> nCr = List.generate(n+1, (_) => List.filled(n+1, 0));
    for (int i = 0; i <= n; i++) {
      nCr[i][0] = 1;
      nCr[i][i] = 1;
      for (int j = 1; j < i; j++) {
        nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD;
      }
    }
    
    int dfs(List<int> arr) {
      if (arr.length <= 2) return 1;
      int root = arr[0];
      List<int> left = arr.sublist(1).where((x) => x < root).toList();
      List<int> right = arr.sublist(1).where((x) => x > root).toList();
      int leftWays = dfs(left);
      int rightWays = dfs(right);
      int L = left.length, R = right.length;
      return (nCr[L+R][L] * leftWays % MOD * rightWays) % MOD;
    }
    
    return (dfs(nums) - 1) % MOD;
  }
}
