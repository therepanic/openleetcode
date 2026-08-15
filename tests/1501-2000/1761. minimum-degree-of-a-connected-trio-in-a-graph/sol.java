class Solution {
    public int minTrioDegree(int n, int[][] edges) {
        int[][] adj = new int[n+1][n+1];
        int[] deg = new int[n+1];
        for (int[] e : edges) {
            adj[e[0]][e[1]]=1;
            adj[e[1]][e[0]]=1;
            deg[e[0]]++;
            deg[e[1]]++;
        }
        int ans = Integer.MAX_VALUE;
        for (int[] e : edges) {
            int u=e[0], v=e[1];
            for (int w=1; w<=n; w++) {
                if (adj[u][w]==1 && adj[v][w]==1) {
                    ans = Math.min(ans, deg[u]+deg[v]+deg[w]-6);
                }
            }
        }
        return ans==Integer.MAX_VALUE ? -1 : ans;
    }
}
