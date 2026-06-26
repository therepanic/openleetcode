class Solution {
    public char[][] updateBoard(char[][] board, int[] click) {
        int[][] directions = {{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,1}, {1,-1}, {1,0}, {1,1}};
        int rows = board.length;
        int cols = board[0].length;
        int r = click[0];
        int c = click[1];

        if (board[r][c] == 'M') {
            board[r][c] = 'X';
            return board;
        }

        reveal(board, r, c, directions, rows, cols);
        return board;
    }

    private void reveal(char[][] board, int r, int c, int[][] directions, int rows, int cols) {
        if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != 'E') {
            return;
        }
        int mines = countMines(board, r, c, directions, rows, cols);
        if (mines > 0) {
            board[r][c] = (char) ('0' + mines);
        } else {
            board[r][c] = 'B';
            for (int[] dir : directions) {
                reveal(board, r + dir[0], c + dir[1], directions, rows, cols);
            }
        }
    }

    private int countMines(char[][] board, int r, int c, int[][] directions, int rows, int cols) {
        int count = 0;
        for (int[] dir : directions) {
            int nr = r + dir[0];
            int nc = c + dir[1];
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == 'M') {
                count++;
            }
        }
        return count;
    }
}
