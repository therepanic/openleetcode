class Solution {
  int superEggDrop(int k, int n) {
    List<List<int>> memo = List.generate(k + 1, (_) => List.filled(n + 1, -1));
    
    int solve(int eggs, int floors) {
      if (floors <= 1 || eggs == 1) return floors;
      if (memo[eggs][floors] != -1) return memo[eggs][floors];
      
      int low = 1, high = floors;
      int ans = floors;
      
      while (low <= high) {
        int mid = (low + high) ~/ 2;
        int breakCase = solve(eggs - 1, mid - 1);
        int notBreakCase = solve(eggs, floors - mid);
        
        int cur = 1 + (breakCase > notBreakCase ? breakCase : notBreakCase);
        if (cur < ans) ans = cur;
        if (breakCase < notBreakCase) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }
      
      memo[eggs][floors] = ans;
      return ans;
    }
    
    return solve(k, n);
  }
}
