class Solution {
    public List<List<Integer>> queensAttacktheKing(int[][] queens, int[] king) {
        boolean[][] board = new boolean[8][8];
        for (int[] q : queens) {
            board[q[0]][q[1]] = true;
        }

        int[][] directions = {
            {-1, 0}, {1, 0}, {0, 1}, {0, -1},
            {-1, -1}, {-1, 1}, {1, -1}, {1, 1}
        };

        List<List<Integer>> ans = new ArrayList<>();
        for (int[] d : directions) {
            int r = king[0], c = king[1];
            while (r >= 0 && r < 8 && c >= 0 && c < 8) {
                r += d[0];
                c += d[1];
                if (r < 0 || r >= 8 || c < 0 || c >= 8) break;
                if (board[r][c]) {
                    ans.add(List.of(r, c));
                    break;
                }
            }
        }
        return ans;
    }
}
