public class Solution {
    public int ShoppingOffers(IList<int> price, IList<IList<int>> special, IList<int> needs) {
        int p = price.Count;
        var memo = new Dictionary<string, int>();
        return dp(needs, price, special, p, memo);
    }
    
    private int dp(IList<int> curr, IList<int> price, IList<IList<int>> special, int p, Dictionary<string, int> memo) {
        bool allZero = true;
        foreach (int x in curr) {
            if (x != 0) {
                allZero = false;
                break;
            }
        }
        if (allZero) return 0;
        
        string key = string.Join(",", curr);
        if (memo.ContainsKey(key)) return memo[key];
        
        int n = curr.Count;
        int res = 0;
        for (int i = 0; i < p; i++) {
            res += curr[i] * price[i];
        }
        
        foreach (var offer in special) {
            bool canUse = true;
            for (int i = 0; i < n; i++) {
                if (curr[i] < offer[i]) {
                    canUse = false;
                    break;
                }
            }
            if (canUse) {
                var newCurr = new List<int>();
                for (int i = 0; i < n; i++) {
                    newCurr.Add(curr[i] - offer[i]);
                }
                res = Math.Min(res, offer[offer.Count - 1] + dp(newCurr, price, special, p, memo));
            }
        }
        
        memo[key] = res;
        return res;
    }
}
