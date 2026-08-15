class Solution {
    public int maxNumEdgesToRemove(int n, int[][] edges) {
        Arrays.sort(edges, (a, b) -> b[0] - a[0]);
        int[] parentA = new int[n + 1];
        int[] parentB = new int[n + 1];
        for (int i = 0; i <= n; i++) {
            parentA[i] = i;
            parentB[i] = i;
        }
        int[] rankA = new int[n + 1];
        int[] rankB = new int[n + 1];

        java.util.function.BiFunction<int[], Integer, Integer> find = new java.util.function.BiFunction<int[], Integer, Integer>() {
            @Override
            public Integer apply(int[] parent, Integer x) {
                if (parent[x] != x) {
                    parent[x] = apply(parent, parent[x]);
                }
                return parent[x];
            }
        };

        java.util.function.BiFunction<int[], int[], Boolean> union = new java.util.function.BiFunction<int[], int[], Boolean>() {
            @Override
            public Boolean apply(int[] parent, int[] rank) {
                return false;
            }
        };
        // need a closure-like approach; use a helper method would be cleaner but this is fine
        class UnionHelper {
            boolean union(int[] parent, int[] rank, int x, int y) {
                int rootX = find.apply(parent, x);
                int rootY = find.apply(parent, y);
                if (rootX == rootY) return false;
                if (rank[rootX] < rank[rootY]) {
                    parent[rootX] = rootY;
                } else if (rank[rootX] > rank[rootY]) {
                    parent[rootY] = rootX;
                } else {
                    parent[rootX] = rootY;
                    rank[rootY]++;
                }
                return true;
            }
        }
        UnionHelper helper = new UnionHelper();

        int removed = 0;
        int aliceEdges = 0, bobEdges = 0;
        for (int[] e : edges) {
            if (e[0] == 3) {
                if (helper.union(parentA, rankA, e[1], e[2])) {
                    helper.union(parentB, rankB, e[1], e[2]);
                    aliceEdges++;
                    bobEdges++;
                } else {
                    removed++;
                }
            } else if (e[0] == 2) {
                if (helper.union(parentB, rankB, e[1], e[2])) {
                    bobEdges++;
                } else {
                    removed++;
                }
            } else {
                if (helper.union(parentA, rankA, e[1], e[2])) {
                    aliceEdges++;
                } else {
                    removed++;
                }
            }
        }
        return (bobEdges == n - 1 && aliceEdges == n - 1) ? removed : -1;
    }
}
