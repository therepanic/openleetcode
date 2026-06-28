class Solution {
public:
    int countPalindromicSubsequences(string s) {
        const int MOD = 1000000007;
        int n = s.size();
        vector<vector<int>> memo(n + 1, vector<int>(n + 1, -1));
        
        function<int(int, int)> dp = [&](int left, int right) -> int {
            if (left >= right) return 0;
            if (memo[left][right] != -1) return memo[left][right];
            long long res = 0;
            for (char ch : {'a', 'b', 'c', 'd'}) {
                int l = s.find(ch, left);
                if (l == -1 || l >= right) continue;
                int r = s.rfind(ch, right - 1);
                if (r == -1 || r < left) continue;
                if (l == r) {
                    res += 1;
                } else {
                    res += dp(l + 1, r) + 2;
                }
            }
            res %= MOD;
            memo[left][right] = (int)res;
            return (int)res;
        };
        
        return dp(0, n);
    }
};
