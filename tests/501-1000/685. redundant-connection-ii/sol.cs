public class Solution {
    private int[] parent;
    private int[] rank;
    
    private int Find(int u) {
        if (parent[u] != u) {
            parent[u] = Find(parent[u]);
        }
        return parent[u];
    }
    
    private bool Union(int u, int v) {
        int pu = Find(u);
        int pv = Find(v);
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
    
    public int[] FindRedundantDirectedConnection(int[][] edges) {
        int n = edges.Length;
        parent = new int[n + 1];
        rank = new int[n + 1];
        int[] parentArr = new int[n + 1];
        
        for (int i = 0; i <= n; i++) {
            parent[i] = i;
        }
        
        int[] candidate1 = null;
        int[] candidate2 = null;
        
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1];
            if (parentArr[v] != 0) {
                candidate1 = new int[] { parentArr[v], v };
                candidate2 = new int[] { u, v };
                break;
            }
            parentArr[v] = u;
        }
        
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1];
            if (candidate2 != null && u == candidate2[0] && v == candidate2[1]) {
                continue;
            }
            if (!Union(u, v)) {
                return candidate1 != null ? candidate1 : new int[] { u, v };
            }
        }
        
        return candidate2;
    }
}
