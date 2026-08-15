using System;
using System.Collections.Generic;

public class Solution {
    public int[] CountSubgraphsForEachDiameter(int n, int[][] edges) {
        var graph = new List<int>[n];
        for (int i = 0; i < n; i++) graph[i] = new List<int>();
        foreach (var e in edges) {
            int u = e[0] - 1, v = e[1] - 1;
            graph[u].Add(v);
            graph[v].Add(u);
        }
        int[] answer = new int[n - 1];
        for (int mask = 1; mask < (1 << n); mask++) {
            if (BitCount(mask) <= 1) continue;
            int b = mask & -mask;
            int s = 0;
            while ((b >> s) > 1) s++;
            bool[] seen = new bool[n];
            seen[s] = true;
            int cnt = 1;
            Queue<int> q = new Queue<int>();
            q.Enqueue(s);
            while (q.Count > 0) {
                int u = q.Dequeue();
                foreach (int v in graph[u]) {
                    if (((mask >> v) & 1) == 1 && !seen[v]) {
                        seen[v] = true;
                        cnt++;
                        q.Enqueue(v);
                    }
                }
            }
            if (cnt != BitCount(mask)) continue;
            var bfs = new Func<int, (int, int)>(start => {
                int[] dist = new int[n];
                for (int i = 0; i < n; i++) dist[i] = -1;
                dist[start] = 0;
                Queue<int> q = new Queue<int>();
                q.Enqueue(start);
                int last = start;
                while (q.Count > 0) {
                    int u = q.Dequeue();
                    last = u;
                    foreach (int v in graph[u]) {
                        if (((mask >> v) & 1) == 1 && dist[v] == -1) {
                            dist[v] = dist[u] + 1;
                            q.Enqueue(v);
                        }
                    }
                }
                return (last, dist[last]);
            });
            var (a, _) = bfs(s);
            var (_, d) = bfs(a);
            if (d >= 1) answer[d - 1]++;
        }
        return answer;
    }
    
    private int BitCount(int x) {
        int count = 0;
        while (x > 0) {
            count += x & 1;
            x >>= 1;
        }
        return count;
    }
}
