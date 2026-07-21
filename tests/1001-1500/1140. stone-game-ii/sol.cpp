class Solution {
public:
    int stoneGameII(vector<int>& piles) {
        int n = piles.size();
        vector<int> suffix(n + 1, 0);
        for (int i = n - 1; i >= 0; i--) {
            suffix[i] = suffix[i + 1] + piles[i];
        }
        vector<vector<int>> memo(n, vector<int>(n + 1, -1));
        
        function<int(int, int)> best = [&](int i, int m) -> int {
            if (i >= n) return 0;
            if (memo[i][m] != -1) return memo[i][m];
            int answer = 0;
            for (int x = 1; x <= min(2 * m, n - i); x++) {
                answer = max(answer, suffix[i] - best(i + x, max(m, x)));
            }
            memo[i][m] = answer;
            return answer;
        };
        
        return best(0, 1);
    }
};
