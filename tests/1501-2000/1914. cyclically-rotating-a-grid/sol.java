class Solution {

    public int[][] rotateGrid(int[][] grid, int k) {

        int t = 0, l = 0;

        int b = grid.length - 1, r = grid[0].length - 1;

        while (t < b && l < r) {

            int ln = b - t, wid = r - l;

            int perimeter = 2 * ln + 2 * wid;

            int steps = k % perimeter;

            while (steps-- > 0) {

                int tmp = grid[t][l];

                for (int i = l; i < r; i++) grid[t][i] = grid[t][i + 1];

                for (int i = t; i < b; i++) grid[i][r] = grid[i + 1][r];

                for (int i = r; i > l; i--) grid[b][i] = grid[b][i - 1];

                for (int i = b; i > t; i--) grid[i][l] = grid[i - 1][l];

                grid[t + 1][l] = tmp;

            }

            t++; l++; b--; r--;

        }

        return grid;

    }

}
