class Solution {
public:
    int numDecodings(string s) {
        const int M = 1000000007;
        int n = s.length() - 1;
        
        unordered_map<string, long long> d;
        for (int i = 1; i <= 26; i++) d[to_string(i)] = 1;
        for (int i = 0; i <= 9; i++) d["*" + to_string(i)] = 1 + (i < 7 ? 1 : 0);
        d["*"] = 9;
        d["**"] = 15;
        d["1*"] = 9;
        d["2*"] = 6;
        
        vector<long long> dp(n + 2, 0);
        dp[0] = d[string(1, s[0])];
        dp[n + 1] = 1;
        
        for (int i = 0; i < n; i++) {
            string one(1, s[i + 1]);
            string two = string(1, s[i]) + s[i + 1];
            
            long long count = (d[one] * dp[i]) % M;
            count = (count + d[two] * (i > 0 ? dp[i - 1] : 1)) % M;
            dp[i + 1] = count;
            
            if (dp[i + 1] == 0) return 0;
        }
        
        return (int)dp[n];
    }
};
