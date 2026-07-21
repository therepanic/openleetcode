public class Solution {
    public int MinTime(int n, int[][] edges, IList<bool> hasApple) {
        List<int>[] adj = new List<int>[n];
        int[] degree = new int[n];
        for (int i = 0; i < n; i++) {
            adj[i] = new List<int>();
        }

        foreach (var e in edges) {
            int u = e[0], v = e[1];
            adj[u].Add(v);
            adj[v].Add(u);
            degree[u]++;
            degree[v]++;
        }

        Queue<int> q = new Queue<int>();
        for (int i = 1; i < n; i++) {
            if (degree[i] == 1 && !hasApple[i]) {
                q.Enqueue(i);
            }
        }

        bool[] keep = new bool[n];
        Array.Fill(keep, true);

        while (q.Count > 0) {
            int u = q.Dequeue();
            keep[u] = false;

            foreach (int v in adj[u]) {
                degree[v]--;
                if (v != 0 && keep[v] && !hasApple[v] && degree[v] == 1) {
                    q.Enqueue(v);
                }
            }
        }

        int activeNodes = 0;
        foreach (bool k in keep) {
            if (k) activeNodes++;
        }

        return Math.Max(0, (activeNodes - 1) * 2);
    }
}
