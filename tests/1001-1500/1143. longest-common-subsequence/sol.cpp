class Solution {
public:
    int longestCommonSubsequence(string text1, string text2) {
        int m = text1.size();
        int n = text2.size();
        vector<vector<int>> memo(m, vector<int>(n, -1));

        function<int(int, int)> solve = [&](int i, int j) -> int {
            if (i >= m || j >= n) return 0;
            if (memo[i][j] != -1) return memo[i][j];

            if (text1[i] == text2[j]) {
                memo[i][j] = 1 + solve(i + 1, j + 1);
            } else {
                memo[i][j] = max(solve(i + 1, j), solve(i, j + 1));
            }
            return memo[i][j];
        };

        return solve(0, 0);
    }
};
