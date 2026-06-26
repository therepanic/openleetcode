public class Solution {
    public char[][] UpdateBoard(char[][] board, int[] click) {
        int[][] directions = new int[][] {
            new int[] {-1, -1}, new int[] {-1, 0}, new int[] {-1, 1},
            new int[] {0, -1}, new int[] {0, 1},
            new int[] {1, -1}, new int[] {1, 0}, new int[] {1, 1}
        };
        int rows = board.Length;
        int cols = board[0].Length;
        int r = click[0];
        int c = click[1];

        if (board[r][c] == 'M') {
            board[r][c] = 'X';
            return board;
        }

        void Reveal(int r, int c) {
            if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != 'E') {
                return;
            }
            int mines = CountMines(r, c);
            if (mines > 0) {
                board[r][c] = (char)('0' + mines);
            } else {
                board[r][c] = 'B';
                foreach (var dir in directions) {
                    Reveal(r + dir[0], c + dir[1]);
                }
            }
        }

        int CountMines(int r, int c) {
            int count = 0;
            foreach (var dir in directions) {
                int nr = r + dir[0];
                int nc = c + dir[1];
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == 'M') {
                    count++;
                }
            }
            return count;
        }

        Reveal(r, c);
        return board;
    }
}
