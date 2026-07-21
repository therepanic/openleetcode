class Solution {
  int kConcatenationMaxSum(List<int> arr, int k) {
    const MOD = 1000000007;
    
    int kadanes(List<int> nums) {
      int best = 0;
      int total = 0;
      for (int x in nums) {
        total += x;
        if (total < 0) total = 0;
        if (total > best) best = total;
      }
      return best;
    }
    
    if (k <= 3) {
      List<int> extended = [];
      for (int i = 0; i < k; i++) {
        extended.addAll(arr);
      }
      return kadanes(extended) % MOD;
    }
    
    int sum = arr.fold(0, (a, b) => a + b);
    int s = sum > 0 ? (sum * (k - 1)) % MOD : 0;
    
    List<int> doubleArr = [...arr, ...arr];
    
    int v1 = s + kadanes(arr);
    int v2 = kadanes(doubleArr);
    return (v1 > v2 ? v1 : v2) % MOD;
  }
}
