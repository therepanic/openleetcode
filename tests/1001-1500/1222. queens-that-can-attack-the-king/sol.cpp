class Solution {
public:
    vector<vector<int>> queensAttacktheKing(vector<vector<int>>& queens, vector<int>& king) {
        vector<vector<bool>> board(8, vector<bool>(8, false));
        for (auto& q : queens) {
            board[q[0]][q[1]] = true;
        }

        vector<pair<int, int>> directions = {
            {-1, 0}, {1, 0}, {0, 1}, {0, -1},
            {-1, -1}, {-1, 1}, {1, -1}, {1, 1}
        };

        vector<vector<int>> ans;
        for (auto& [dr, dc] : directions) {
            int r = king[0], c = king[1];
            while (r >= 0 && r < 8 && c >= 0 && c < 8) {
                r += dr;
                c += dc;
                if (r < 0 || r >= 8 || c < 0 || c >= 8) break;
                if (board[r][c]) {
                    ans.push_back({r, c});
                    break;
                }
            }
        }
        return ans;
    }
};
