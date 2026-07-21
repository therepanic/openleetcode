public class Solution {
    public IList<IList<int>> QueensAttacktheKing(int[][] queens, int[] king) {
        bool[,] board = new bool[8, 8];
        foreach (var q in queens) {
            board[q[0], q[1]] = true;
        }

        int[][] directions = new int[][] {
            new int[] {-1, 0}, new int[] {1, 0}, new int[] {0, 1}, new int[] {0, -1},
            new int[] {-1, -1}, new int[] {-1, 1}, new int[] {1, -1}, new int[] {1, 1}
        };

        IList<IList<int>> ans = new List<IList<int>>();
        foreach (var d in directions) {
            int r = king[0], c = king[1];
            while (r >= 0 && r < 8 && c >= 0 && c < 8) {
                r += d[0];
                c += d[1];
                if (r < 0 || r >= 8 || c < 0 || c >= 8) break;
                if (board[r, c]) {
                    ans.Add(new List<int> { r, c });
                    break;
                }
            }
        }
        return ans;
    }
}
