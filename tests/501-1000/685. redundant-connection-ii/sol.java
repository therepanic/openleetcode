class Solution {
    private int[] parent;
    private int[] rank;
    
    private int find(int u) {
        if (parent[u] != u) {
            parent[u] = find(parent[u]);
        }
        return parent[u];
    }
    
    private boolean union(int u, int v) {
        int pu = find(u);
        int pv = find(v);
        if (pu == pv) return false;
        if (rank[pu] < rank[pv]) {
            parent[pu] = pv;
        } else if (rank[pv] < rank[pu]) {
            parent[pv] = pu;
        } else {
            parent[pu] = pv;
            rank[pv]++;
        }
        return true;
    }
    
    public int[] findRedundantDirectedConnection(int[][] edges) {
        int n = edges.length;
        parent = new int[n + 1];
        rank = new int[n + 1];
        int[] parentArr = new int[n + 1];
        for (int i = 0; i <= n; i++) {
            parent[i] = i;
        }
        
        int[] candidate1 = null;
        int[] candidate2 = null;
        
        for (int[] edge : edges) {
            int u = edge[0], v = edge[1];
            if (parentArr[v] != 0) {
                candidate1 = new int[]{parentArr[v], v};
                candidate2 = new int[]{u, v};
                break;
            }
            parentArr[v] = u;
        }
        
        for (int[] edge : edges) {
            int u = edge[0], v = edge[1];
            if (candidate2 != null && edge[0] == candidate2[0] && edge[1] == candidate2[1]) {
                continue;
            }
            if (!union(u, v)) {
                return candidate1 != null ? candidate1 : new int[]{u, v};
            }
        }
        
        return candidate2;
    }
}
