class Solution {
    public boolean[] distanceLimitedPathsExist(int n, int[][] edgeList, int[][] queries) {
        int[] parent = new int[n];
        int[] rank = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
        
        java.util.function.IntUnaryOperator find = new java.util.function.IntUnaryOperator() {
            public int applyAsInt(int x) {
                if (parent[x] != x) {
                    parent[x] = applyAsInt(parent[x]);
                }
                return parent[x];
            }
        };
        
        java.util.function.BiConsumer<Integer, Integer> union = (x, y) -> {
            int xroot = find.applyAsInt(x);
            int yroot = find.applyAsInt(y);
            if (xroot == yroot) return;
            if (rank[xroot] < rank[yroot]) {
                parent[xroot] = yroot;
            } else if (rank[xroot] > rank[yroot]) {
                parent[yroot] = xroot;
            } else {
                parent[yroot] = xroot;
                rank[xroot]++;
            }
        };
        
        // add index to queries
        int[][] queriesWithIdx = new int[queries.length][4];
        for (int i = 0; i < queries.length; i++) {
            queriesWithIdx[i][0] = queries[i][0];
            queriesWithIdx[i][1] = queries[i][1];
            queriesWithIdx[i][2] = queries[i][2];
            queriesWithIdx[i][3] = i;
        }
        
        java.util.Arrays.sort(queriesWithIdx, (a, b) -> Integer.compare(a[2], b[2]));
        java.util.Arrays.sort(edgeList, (a, b) -> Integer.compare(a[2], b[2]));
        
        int i = 0;
        boolean[] res = new boolean[queries.length];
        for (int[] q : queriesWithIdx) {
            while (i < edgeList.length && edgeList[i][2] < q[2]) {
                union.accept(edgeList[i][0], edgeList[i][1]);
                i++;
            }
            if (find.applyAsInt(q[0]) == find.applyAsInt(q[1])) {
                res[q[3]] = true;
            }
        }
        return res;
    }
}
