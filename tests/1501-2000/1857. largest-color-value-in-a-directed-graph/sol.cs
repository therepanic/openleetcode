public class Solution {
    private int INF = int.MaxValue;
    private List<int>[] adj;
    private int[][] count;
    private int[] vis;
    private string colors;
    
    public int LargestPathValue(string colors, int[][] edges) {
        this.colors = colors;
        int n = colors.Length;
        adj = new List<int>[n];
        for (int i = 0; i < n; i++) adj[i] = new List<int>();
        foreach (var e in edges) {
            adj[e[0]].Add(e[1]);
        }
        count = new int[n][];
        for (int i = 0; i < n; i++) count[i] = new int[26];
        vis = new int[n];
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            int val = Dfs(i);
            if (val == INF) return -1;
            ans = Math.Max(ans, val);
        }
        return ans;
    }
    
    private int Dfs(int node) {
        if (vis[node] == 1) return INF;
        if (vis[node] == 2) return count[node][colors[node] - 'a'];
        
        vis[node] = 1;
        foreach (int nxt in adj[node]) {
            int res = Dfs(nxt);
            if (res == INF) return INF;
            for (int c = 0; c < 26; c++) {
                count[node][c] = Math.Max(count[node][c], count[nxt][c]);
            }
        }
        
        int col = colors[node] - 'a';
        count[node][col]++;
        vis[node] = 2;
        return count[node][col];
    }
}
