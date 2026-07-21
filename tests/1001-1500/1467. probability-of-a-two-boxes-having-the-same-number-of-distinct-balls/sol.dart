import 'dart:collection';

class Solution {
  double getProbability(List<int> balls) {
    int sm = balls.fold(0, (a, b) => a + b);
    List<int> expanded = [];
    for (int i = 0; i < balls.length; i++) {
      for (int j = 0; j < balls[i]; j++) {
        expanded.add(i);
      }
    }
    
    Map<String, int> memo = HashMap();
    
    int dp(int i, int cnt0, int mask0, int mask1) {
      String key = '$i,$cnt0,$mask0,$mask1';
      if (memo.containsKey(key)) return memo[key]!;
      
      int cnt1 = i - cnt0;
      if (cnt0 > sm ~/ 2 || cnt1 > sm ~/ 2) {
        memo[key] = 0;
        return 0;
      }
      
      if (i == expanded.length) {
        int result = popCount(mask0) == popCount(mask1) ? 1 : 0;
        memo[key] = result;
        return result;
      }
      
      int result = dp(i + 1, cnt0 + 1, mask0 | (1 << expanded[i]), mask1) +
                   dp(i + 1, cnt0, mask0, mask1 | (1 << expanded[i]));
      memo[key] = result;
      return result;
    }
    
    int favorable = dp(0, 0, 0, 0);
    int total = comb(sm, sm ~/ 2);
    return favorable / total;
  }
  
  int popCount(int n) {
    int count = 0;
    while (n != 0) {
      count += n & 1;
      n >>= 1;
    }
    return count;
  }
  
  int comb(int n, int k) {
    if (k > n) return 0;
    int res = 1;
    for (int i = 1; i <= k; i++) {
      res = res * (n - k + i) ~/ i;
    }
    return res;
  }
}
