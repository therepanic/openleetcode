class Solution {
    private int INF = Integer.MAX_VALUE;
    private List<List<Integer>> adj;
    private int[][] count;
    private int[] vis;
    private String colors;
    
    public int largestPathValue(String colors, int[][] edges) {
        this.colors = colors;
        int n = colors.length();
        adj = new ArrayList<>();
        for (int i = 0; i < n; i++) adj.add(new ArrayList<>());
        for (int[] e : edges) {
            adj.get(e[0]).add(e[1]);
        }
        count = new int[n][26];
        vis = new int[n];
        
        int ans = 0;
        for (int i = 0; i < n; i++) {
            int val = dfs(i);
            if (val == INF) return -1;
            ans = Math.max(ans, val);
        }
        return ans;
    }
    
    private int dfs(int node) {
        if (vis[node] == 1) return INF;
        if (vis[node] == 2) return count[node][colors.charAt(node) - 'a'];
        
        vis[node] = 1;
        for (int nxt : adj.get(node)) {
            int res = dfs(nxt);
            if (res == INF) return INF;
            for (int c = 0; c < 26; c++) {
                count[node][c] = Math.max(count[node][c], count[nxt][c]);
            }
        }
        
        int col = colors.charAt(node) - 'a';
        count[node][col]++;
        vis[node] = 2;
        return count[node][col];
    }
}
