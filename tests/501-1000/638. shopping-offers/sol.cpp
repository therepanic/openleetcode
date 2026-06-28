class Solution {
public:
    int shoppingOffers(vector<int>& price, vector<vector<int>>& special, vector<int>& needs) {
        int p = price.size();
        map<vector<int>, int> memo;
        return dp(needs, price, special, p, memo);
    }
    
private:
    int dp(vector<int> curr, vector<int>& price, vector<vector<int>>& special, int p, map<vector<int>, int>& memo) {
        bool allZero = true;
        for (int x : curr) {
            if (x != 0) {
                allZero = false;
                break;
            }
        }
        if (allZero) return 0;
        
        if (memo.count(curr)) return memo[curr];
        
        int n = curr.size();
        int res = 0;
        for (int i = 0; i < p; i++) {
            res += curr[i] * price[i];
        }
        
        for (auto& offer : special) {
            bool canUse = true;
            for (int i = 0; i < n; i++) {
                if (curr[i] < offer[i]) {
                    canUse = false;
                    break;
                }
            }
            if (canUse) {
                vector<int> newCurr(n);
                for (int i = 0; i < n; i++) {
                    newCurr[i] = curr[i] - offer[i];
                }
                res = min(res, offer.back() + dp(newCurr, price, special, p, memo));
            }
        }
        
        memo[curr] = res;
        return res;
    }
};
