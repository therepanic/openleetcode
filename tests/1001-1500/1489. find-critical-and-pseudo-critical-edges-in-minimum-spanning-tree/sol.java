class Solution {
    private class UnionFind {
        int[] parent;
        UnionFind(int n) {
            parent = new int[n];
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        int findParent(int p) {
            if (parent[p] == p) return p;
            parent[p] = findParent(parent[p]);
            return parent[p];
        }
        void union(int u, int v) {
            int pu = findParent(u);
            int pv = findParent(v);
            parent[pu] = pv;
        }
    }

    private int findMST(int n, int[][] edges, int block, int e) {
        UnionFind uf = new UnionFind(n);
        int weight = 0;
        if (e != -1) {
            weight += edges[e][2];
            uf.union(edges[e][0], edges[e][1]);
        }
        for (int i = 0; i < edges.length; i++) {
            if (i == block) continue;
            if (uf.findParent(edges[i][0]) == uf.findParent(edges[i][1])) continue;
            uf.union(edges[i][0], edges[i][1]);
            weight += edges[i][2];
        }
        for (int i = 0; i < n; i++) {
            if (uf.findParent(i) != uf.findParent(0)) return Integer.MAX_VALUE;
        }
        return weight;
    }

    public List<List<Integer>> findCriticalAndPseudoCriticalEdges(int n, int[][] edges) {
        List<Integer> critical = new ArrayList<>();
        List<Integer> pseudoCritical = new ArrayList<>();
        int m = edges.length;
        int[][] edgesWithIdx = new int[m][4];
        for (int i = 0; i < m; i++) {
            edgesWithIdx[i][0] = edges[i][0];
            edgesWithIdx[i][1] = edges[i][1];
            edgesWithIdx[i][2] = edges[i][2];
            edgesWithIdx[i][3] = i;
        }
        Arrays.sort(edgesWithIdx, (a, b) -> Integer.compare(a[2], b[2]));
        int mstwt = findMST(n, edgesWithIdx, -1, -1);
        for (int i = 0; i < m; i++) {
            if (mstwt < findMST(n, edgesWithIdx, i, -1)) {
                critical.add(edgesWithIdx[i][3]);
            } else if (mstwt == findMST(n, edgesWithIdx, -1, i)) {
                pseudoCritical.add(edgesWithIdx[i][3]);
            }
        }
        List<List<Integer>> result = new ArrayList<>();
        result.add(critical);
        result.add(pseudoCritical);
        return result;
    }
}
