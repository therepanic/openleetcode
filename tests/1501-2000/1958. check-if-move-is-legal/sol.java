class Solution {
    public boolean checkMove(char[][] board, int rMove, int cMove, char color) {
        char opposite = color == 'B' ? 'W' : 'B';
        int[][] dirs = {{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}};

        for (int[] d : dirs) {
            int r = rMove + d[0];
            int c = cMove + d[1];
            int cnt = 0;

            while (r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite) {
                r += d[0];
                c += d[1];
                cnt++;
            }

            if (cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color) {
                return true;
            }
        }

        return false;
    }
}
