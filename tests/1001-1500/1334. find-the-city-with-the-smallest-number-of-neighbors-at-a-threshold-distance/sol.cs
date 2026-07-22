public class Solution {
    public int FindTheCity(int n, int[][] edges, int distanceThreshold) {
        const int INF = int.MaxValue / 2;
        int[,] matrix = new int[n, n];
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i, j] = INF;
            }
            matrix[i, i] = 0;
        }
        
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1], w = edge[2];
            matrix[u, v] = w;
            matrix[v, u] = w;
        }
        
        for (int via = 0; via < n; via++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (matrix[i, via] + matrix[via, j] < matrix[i, j]) {
                        matrix[i, j] = matrix[i, via] + matrix[via, j];
                    }
                }
            }
        }
        
        int minReachable = n;
        int ans = -1;
        
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                if (matrix[i, j] <= distanceThreshold) {
                    count++;
                }
            }
            if (count <= minReachable) {
                minReachable = count;
                ans = i;
            }
        }
        
        return ans;
    }
}
