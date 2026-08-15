public class Solution {
    public int MinCost(int maxTime, int[][] edges, int[] passingFees) {
        int n = passingFees.Length;
        var graph = new List<(int,int)>[n];
        for (int i = 0; i < n; i++) graph[i] = new List<(int,int)>();
        foreach (var e in edges) {
            graph[e[0]].Add((e[1], e[2]));
            graph[e[1]].Add((e[0], e[2]));
        }
        int[] times = new int[n];
        int[] costs = new int[n];
        Array.Fill(times, maxTime + 1);
        Array.Fill(costs, int.MaxValue);
        times[0] = 0;
        costs[0] = passingFees[0];
        var pq = new SortedSet<(int cost, int time, int city)>();
        pq.Add((passingFees[0], 0, 0));
        while (pq.Count > 0) {
            var cur = pq.Min;
            pq.Remove(cur);
            int cost = cur.cost, time = cur.time, city = cur.city;
            if (city == n - 1) return cost;
            foreach (var nb in graph[city]) {
                int nxt = nb.Item1, t = nb.Item2;
                int nt = time + t;
                if (nt > maxTime) continue;
                int nc = cost + passingFees[nxt];
                if (nc < costs[nxt] || nt < times[nxt]) {
                    costs[nxt] = nc;
                    times[nxt] = nt;
                    pq.Add((nc, nt, nxt));
                }
            }
        }
        return -1;
    }
}
