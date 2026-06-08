using System;

public class Solution {
    public bool Exist(char[][] board, string word) {
        int rows = board.Length;
        int cols = board[0].Length;
        bool Dfs(int r, int c, int idx) {
            if (idx == word.Length) return true;
            if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[idx]) return false;
            char saved = board[r][c];
            board[r][c] = '#';
            bool found = Dfs(r + 1, c, idx + 1) || Dfs(r - 1, c, idx + 1) || Dfs(r, c + 1, idx + 1) || Dfs(r, c - 1, idx + 1);
            board[r][c] = saved;
            return found;
        }
        for (int r = 0; r < rows; r++) for (int c = 0; c < cols; c++) if (board[r][c] == word[0] && Dfs(r, c, 0)) return true;
        return false;
    }
}
