public class Solution {
    public int NetworkDelayTime(int[][] times, int n, int k) {
        var graph = new List<int[]>[n + 1];
        for (int i = 0; i <= n; i++) {
            graph[i] = new List<int[]>();
        }
        foreach (var edge in times) {
            graph[edge[0]].Add(new[] { edge[1], edge[2] });
        }

        var dist = new int[n + 1];
        var used = new bool[n + 1];
        for (int i = 0; i <= n; i++) dist[i] = int.MaxValue / 2;
        dist[k] = 0;

        for (int step = 1; step <= n; step++) {
            int node = -1;
            for (int i = 1; i <= n; i++) {
                if (!used[i] && (node == -1 || dist[i] < dist[node])) {
                    node = i;
                }
            }
            if (node == -1 || dist[node] >= int.MaxValue / 2) break;
            used[node] = true;
            foreach (var next in graph[node]) {
                int v = next[0], w = next[1];
                if (dist[node] + w < dist[v]) {
                    dist[v] = dist[node] + w;
                }
            }
        }

        int ans = 0;
        for (int i = 1; i <= n; i++) {
            if (dist[i] >= int.MaxValue / 2) return -1;
            if (dist[i] > ans) ans = dist[i];
        }
        return ans;
    }
}
