import java.util.HashMap;
import java.util.Map;

class Solution {
    public int removeStones(int[][] stones) {
        int n = stones.length;
        DSU dsu = new DSU(n);
        Map<Integer, Integer> row = new HashMap<>();
        Map<Integer, Integer> col = new HashMap<>();

        for (int i = 0; i < n; i++) {
            int r = stones[i][0];
            int c = stones[i][1];
            Integer prevRow = row.get(r);
            if (prevRow != null) {
                dsu.union(i, prevRow);
            } else {
                row.put(r, i);
            }
            Integer prevCol = col.get(c);
            if (prevCol != null) {
                dsu.union(i, prevCol);
            } else {
                col.put(c, i);
            }
        }

        return n - dsu.components;
    }

    private static final class DSU {
        private final int[] parent;
        private final int[] rank;
        private int components;

        DSU(int n) {
            this.parent = new int[n];
            this.rank = new int[n];
            this.components = n;
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }

        int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        }

        void union(int a, int b) {
            int ra = find(a);
            int rb = find(b);
            if (ra == rb) {
                return;
            }
            if (rank[ra] < rank[rb]) {
                parent[ra] = rb;
            } else if (rank[ra] > rank[rb]) {
                parent[rb] = ra;
            } else {
                parent[rb] = ra;
                rank[ra]++;
            }
            components--;
        }
    }
}
