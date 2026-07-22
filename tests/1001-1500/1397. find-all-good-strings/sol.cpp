class Solution {
public:
    const int MOD = 1000000007;
    
    int findGoodStrings(int n, string s1, string s2, string evil) {
        int m = evil.length();
        
        vector<int> lps(m, 0);
        for (int i = 1; i < m; i++) {
            int j = lps[i - 1];
            while (j > 0 && evil[i] != evil[j]) {
                j = lps[j - 1];
            }
            if (evil[i] == evil[j]) {
                lps[i] = j + 1;
            }
        }
        
        auto getNextState = [&](int currMatch, char c) -> int {
            while (currMatch > 0 && c != evil[currMatch]) {
                currMatch = lps[currMatch - 1];
            }
            if (c == evil[currMatch]) {
                currMatch++;
            }
            return currMatch;
        };
        
        vector<vector<vector<vector<int>>>> memo(
            n + 1, vector<vector<vector<int>>>(
                m + 1, vector<vector<int>>(
                    2, vector<int>(2, -1)
                )
            )
        );
        
        function<int(int, int, int, int)> dp = [&](int idx, int eIdx, int tightLo, int tightHi) -> int {
            if (eIdx == m) return 0;
            if (idx == n) return 1;
            
            if (memo[idx][eIdx][tightLo][tightHi] != -1) {
                return memo[idx][eIdx][tightLo][tightHi];
            }
            
            int res = 0;
            char lower = tightLo ? s1[idx] : 'a';
            char upper = tightHi ? s2[idx] : 'z';
            
            for (char c = lower; c <= upper; c++) {
                int nextEIdx = getNextState(eIdx, c);
                int nextTightLo = (tightLo && c == lower) ? 1 : 0;
                int nextTightHi = (tightHi && c == upper) ? 1 : 0;
                
                res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD;
            }
            
            return memo[idx][eIdx][tightLo][tightHi] = res;
        };
        
        return dp(0, 0, 1, 1);
    }
};
