class Solution {
public:
    int numWays(vector<string>& words, string target) {
        const int MOD = 1000000007;
        int n = words.size();
        int m = words[0].size();
        vector<vector<int>> A(m, vector<int>(26, 0));
        for (const string& word : words) {
            for (int j = 0; j < m; ++j) {
                A[j][word[j] - 'a']++;
            }
        }
        vector<vector<int>> dp(m, vector<int>(target.size(), -1));
        
        function<int(int,int)> F = [&](int i, int j) -> int {
            if (j == target.size()) return 1;
            if (i == m) return 0;
            if (dp[i][j] != -1) return dp[i][j];
            long long count = F(i+1, j);
            count = (count + (long long)A[i][target[j]-'a'] * F(i+1, j+1)) % MOD;
            dp[i][j] = (int)count;
            return dp[i][j];
        };
        return F(0, 0);
    }
};
