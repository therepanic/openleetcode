using System;
using System.Collections.Generic;

public class Solution {
    public int CountPaths(int n, int[][] roads) {
        var graph = new List<List<(int, int)>>();
        for (int i = 0; i < n; i++) {
            graph.Add(new List<(int, int)>());
        }
        foreach (var road in roads) {
            int u = road[0], v = road[1], time = road[2];
            graph[u].Add((v, time));
            graph[v].Add((u, time));
        }
        
        var dist = new long[n];
        var ways = new int[n];
        for (int i = 0; i < n; i++) dist[i] = long.MaxValue;
        dist[0] = 0;
        ways[0] = 1;
        
        var pq = new SortedSet<(long, int)>();
        pq.Add((0, 0));
        
        const int MOD = 1_000_000_007;
        
        while (pq.Count > 0) {
            var (d, node) = pq.Min;
            pq.Remove(pq.Min);
            
            if (d > dist[node]) continue;
            
            foreach (var (neighbor, time) in graph[node]) {
                if (dist[node] + time < dist[neighbor]) {
                    dist[neighbor] = dist[node] + time;
                    ways[neighbor] = ways[node];
                    pq.Add((dist[neighbor], neighbor));
                } else if (dist[node] + time == dist[neighbor]) {
                    ways[neighbor] = (ways[neighbor] + ways[node]) % MOD;
                }
            }
        }
        
        return ways[n - 1];
    }
}
