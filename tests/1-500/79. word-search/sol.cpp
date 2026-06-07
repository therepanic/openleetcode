class Solution {
public:
    bool exist(vector<vector<char>>& board, string word) {
        if (board.empty() || board[0].empty()) return false;
        int rows = (int)board.size();
        int cols = (int)board[0].size();
        function<bool(int, int, int)> dfs = [&](int r, int c, int idx) {
            if (idx == (int)word.size()) return true;
            if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[idx]) return false;
            char saved = board[r][c];
            board[r][c] = '#';
            bool found = dfs(r + 1, c, idx + 1) || dfs(r - 1, c, idx + 1) || dfs(r, c + 1, idx + 1) || dfs(r, c - 1, idx + 1);
            board[r][c] = saved;
            return found;
        };
        for (int r = 0; r < rows; ++r) for (int c = 0; c < cols; ++c) if (board[r][c] == word[0] && dfs(r, c, 0)) return true;
        return false;
    }
};
