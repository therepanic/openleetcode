class Solution {
public:
    bool winnerSquareGame(int n) {
        vector<vector<int>> memo(2, vector<int>(n + 1, -1));
        function<bool(int, int)> dp = [&](int player, int stones) -> bool {
            if (stones == 0) return false;
            if (memo[player][stones] != -1) return memo[player][stones] == 1;
            int sqrt = (int)std::sqrt(stones);
            for (int i = sqrt; i >= 1; i--) {
                int sq = i * i;
                if (sq == stones || !dp(player ^ 1, stones - sq)) {
                    memo[player][stones] = 1;
                    return true;
                }
            }
            memo[player][stones] = 0;
            return false;
        };
        return dp(0, n);
    }
};
