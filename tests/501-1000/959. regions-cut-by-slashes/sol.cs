public class Solution {
    private int[] parents = new int[0];

    private int Find(int x) {
        if (parents[x] != x) {
            parents[x] = Find(parents[x]);
        }
        return parents[x];
    }

    private bool Union(int x, int y) {
        int rx = Find(x);
        int ry = Find(y);
        if (rx == ry) {
            return false;
        }
        parents[rx] = ry;
        return true;
    }

    public int RegionsBySlashes(string[] grid) {
        int n = grid.Length;
        parents = new int[4 * n * n];
        for (int i = 0; i < parents.Length; i++) {
            parents[i] = i;
        }
        int count = 4 * n * n;

        int[][][] merges = new int[][][] {
            new int[][] { new int[] {0, 1}, new int[] {1, 2}, new int[] {2, 3} },
            new int[][] { new int[] {0, 3}, new int[] {1, 2} },
            new int[][] { new int[] {0, 1}, new int[] {2, 3} }
        };

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                int cellBase = (i * n + j) * 4;
                int idx = grid[i][j] == ' ' ? 0 : (grid[i][j] == '/' ? 1 : 2);

                foreach (var pair in merges[idx]) {
                    int u = pair[0], v = pair[1];
                    if (Union(cellBase + u, cellBase + v)) {
                        count--;
                    }
                }

                if (i + 1 < n) {
                    int downBase = ((i + 1) * n + j) * 4;
                    if (Union(cellBase + 2, downBase)) {
                        count--;
                    }
                }

                if (j + 1 < n) {
                    int rightBase = (i * n + (j + 1)) * 4;
                    if (Union(cellBase + 1, rightBase + 3)) {
                        count--;
                    }
                }
            }
        }
        return count;
    }
}
