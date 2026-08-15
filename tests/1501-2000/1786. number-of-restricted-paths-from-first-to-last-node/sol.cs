public class Solution {
    public int CountRestrictedPaths(int n, int[][] edges) {
        const int MOD = 1_000_000_007;
        var graph = new List<(int, int)>[n + 1];
        for (int i = 0; i <= n; i++) graph[i] = new List<(int, int)>();
        foreach (var e in edges) {
            graph[e[0]].Add((e[1], e[2]));
            graph[e[1]].Add((e[0], e[2]));
        }

        var dist = new long[n + 1];
        Array.Fill(dist, long.MaxValue);
        dist[n] = 0;
        var pq = new SortedSet<(long, int)>();
        pq.Add((0, n));
        while (pq.Count > 0) {
            var cur = pq.Min; pq.Remove(cur);
            long d = cur.Item1; int node = cur.Item2;
            if (d > dist[node]) continue;
            foreach (var (next, w) in graph[node]) {
                long nd = d + w;
                if (nd < dist[next]) {
                    dist[next] = nd;
                    pq.Add((nd, next));
                }
            }
        }

        var dp = new long[n + 1];
        dp[n] = 1;
        var nodes = new int[n];
        for (int i = 1; i <= n; i++) nodes[i-1] = i;
        Array.Sort(nodes, (a, b) => dist[a].CompareTo(dist[b]));
        foreach (int u in nodes) {
            foreach (var (v, _) in graph[u]) {
                if (dist[u] > dist[v]) {
                    dp[u] = (dp[u] + dp[v]) % MOD;
                }
            }
        }
        return (int)(dp[1] % MOD);
    }
}
