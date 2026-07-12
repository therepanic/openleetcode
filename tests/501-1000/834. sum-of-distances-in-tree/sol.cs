public class Solution {
    public int[] SumOfDistancesInTree(int n, int[][] edges) {
        List<int>[] adj = new List<int>[n];
        for (int i = 0; i < n; i++) {
            adj[i] = new List<int>();
        }
        foreach (int[] e in edges) {
            int u = e[0], v = e[1];
            adj[u].Add(v);
            adj[v].Add(u);
        }
        
        int[] count = new int[n];
        int[] ans = new int[n];
        for (int i = 0; i < n; i++) count[i] = 1;
        
        void DfsIn(int node, int parent) {
            foreach (int child in adj[node]) {
                if (child != parent) {
                    DfsIn(child, node);
                    count[node] += count[child];
                    ans[node] += ans[child] + count[child];
                }
            }
        }
        
        void DfsOut(int node, int parent) {
            foreach (int child in adj[node]) {
                if (child != parent) {
                    ans[child] = ans[node] - count[child] + (n - count[child]);
                    DfsOut(child, node);
                }
            }
        }
        
        DfsIn(0, -1);
        DfsOut(0, -1);
        return ans;
    }
}
