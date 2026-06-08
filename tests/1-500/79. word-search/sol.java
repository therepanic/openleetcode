class Solution {
    private char[][] board;
    private char[] word;
    private int rows;
    private int cols;

    public boolean exist(char[][] board, String word) {
        this.board = board;
        this.word = word.toCharArray();
        rows = board.length;
        cols = board[0].length;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (board[r][c] == this.word[0] && dfs(r, c, 0)) return true;
            }
        }
        return false;
    }

    private boolean dfs(int r, int c, int idx) {
        if (idx == word.length) return true;
        if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != word[idx]) return false;
        char saved = board[r][c];
        board[r][c] = '#';
        boolean found = dfs(r + 1, c, idx + 1) || dfs(r - 1, c, idx + 1) || dfs(r, c + 1, idx + 1) || dfs(r, c - 1, idx + 1);
        board[r][c] = saved;
        return found;
    }
}
