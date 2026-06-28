class Solution {
public:
    int movesToChessboard(vector<vector<int>>& board) {
        int n = board.size();
        
        auto fn = [&](vector<int>& vals) -> int {
            int total = 0, odd = 0;
            for (int i = 0; i < n; ++i) {
                if (vals[0] == vals[i]) {
                    ++total;
                    if (i & 1) ++odd;
                } else if ((vals[0] ^ vals[i]) != (1 << n) - 1) {
                    return INT_MAX / 2;
                }
            }
            int ans = INT_MAX / 2;
            if (n <= 2 * total && 2 * total <= n + 1) {
                ans = min(ans, odd);
            }
            if (n - 1 <= 2 * total && 2 * total <= n) {
                ans = min(ans, total - odd);
            }
            return ans;
        };
        
        vector<int> rows(n, 0), cols(n, 0);
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                if (board[i][j]) {
                    rows[i] ^= 1 << j;
                    cols[j] ^= 1 << i;
                }
            }
        }
        int ans = fn(rows) + fn(cols);
        return ans >= INT_MAX / 2 ? -1 : ans;
    }
};
