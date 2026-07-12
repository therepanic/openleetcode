class Solution {
    private int[] parents;
    private int count;

    private int find(int x) {
        if (x != parents[x]) {
            parents[x] = find(parents[x]);
        }
        return parents[x];
    }

    private boolean union(int x, int y) {
        int rx = find(x);
        int ry = find(y);
        if (rx != ry) {
            parents[rx] = ry;
            return true;
        }
        return false;
    }

    public int regionsBySlashes(String[] grid) {
        int n = grid.length;
        parents = new int[4 * n * n];
        count = 4 * n * n;
        for (int i = 0; i < parents.length; i++) {
            parents[i] = i;
        }

        int[][][] merges = {
            {{0, 1}, {1, 2}, {2, 3}}, // ' '
            {{0, 3}, {1, 2}},         // '/'
            {{0, 1}, {2, 3}}          // '\\'
        };

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                int base = (i * n + j) * 4;
                int idx;
                char c = grid[i].charAt(j);
                if (c == ' ') idx = 0;
                else if (c == '/') idx = 1;
                else idx = 2;

                for (int[] pair : merges[idx]) {
                    int u = pair[0], v = pair[1];
                    if (union(base + u, base + v)) {
                        count--;
                    }
                }

                if (i + 1 < n) {
                    int downBase = ((i + 1) * n + j) * 4;
                    if (union(base + 2, downBase)) {
                        count--;
                    }
                }

                if (j + 1 < n) {
                    int rightBase = (i * n + (j + 1)) * 4;
                    if (union(base + 1, rightBase + 3)) {
                        count--;
                    }
                }
            }
        }
        return count;
    }
}
