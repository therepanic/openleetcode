class Solution {
  int shoppingOffers(List<int> price, List<List<int>> special, List<int> needs) {
    int p = price.length;
    Map<String, int> memo = {};
    
    int dp(List<int> curr) {
      if (curr.every((i) => i == 0)) return 0;
      String key = curr.toString();
      if (memo.containsKey(key)) return memo[key]!;
      
      int n = curr.length;
      int res = 0;
      for (int i = 0; i < p; i++) {
        res += curr[i] * price[i];
      }
      
      for (var offer in special) {
        bool canUse = true;
        for (int i = 0; i < n; i++) {
          if (curr[i] < offer[i]) {
            canUse = false;
            break;
          }
        }
        if (canUse) {
          List<int> newCurr = List.generate(n, (i) => curr[i] - offer[i]);
          int cand = offer.last + dp(newCurr);
          if (cand < res) res = cand;
        }
      }
      
      memo[key] = res;
      return res;
    }
    
    return dp(needs);
  }
}
