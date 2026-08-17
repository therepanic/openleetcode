public class Solution {
    public int MinTrioDegree(int n, int[][] edges) {
        int[,] adj = new int[n+1,n+1];
        int[] deg = new int[n+1];
        foreach (var e in edges) {
            adj[e[0],e[1]] = 1;
            adj[e[1],e[0]] = 1;
            deg[e[0]]++;
            deg[e[1]]++;
        }
        int ans = int.MaxValue;
        foreach (var e in edges) {
            int u=e[0], v=e[1];
            for (int w=1; w<=n; w++) {
                if (adj[u,w]==1 && adj[v,w]==1) {
                    ans = Math.Min(ans, deg[u]+deg[v]+deg[w]-6);
                }
            }
        }
        return ans==int.MaxValue ? -1 : ans;
    }
}
