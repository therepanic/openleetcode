using System;

public class Solution {
    public int MinCostConnectPoints(int[][] points) {
        int n = points.Length;
        int minCost = 0;
        bool[] visited = new bool[n];
        int[] best = new int[n];
        for (int i = 0; i < n; i++) best[i] = int.MaxValue;
        best[0] = 0;

        for (int step = 0; step < n; step++) {
            int u = -1;
            for (int i = 0; i < n; i++) {
                if (!visited[i] && (u == -1 || best[i] < best[u])) u = i;
            }
            visited[u] = true;
            minCost += best[u];
            for (int v = 0; v < n; v++) {
                if (!visited[v]) {
                    int dist = Math.Abs(points[u][0] - points[v][0]) + Math.Abs(points[u][1] - points[v][1]);
                    if (dist < best[v]) best[v] = dist;
                }
            }
        }
        return minCost;
    }
}
