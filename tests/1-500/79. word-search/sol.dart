class Solution {
  bool exist(List<List<String>> board, String word) {
    final rows = board.length;
    final cols = board[0].length;

    bool dfs(int r, int c, int idx) {
      if (idx == word.length) return true;
      if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[idx]) return false;
      final saved = board[r][c];
      board[r][c] = '#';
      final found = dfs(r + 1, c, idx + 1) || dfs(r - 1, c, idx + 1) || dfs(r, c + 1, idx + 1) || dfs(r, c - 1, idx + 1);
      board[r][c] = saved;
      return found;
    }

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        if (board[r][c] == word[0] && dfs(r, c, 0)) return true;
      }
    }
    return false;
  }
}
