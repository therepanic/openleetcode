public class Solution {
    public int CheckWays(int[][] pairs) {
        var graph = new Dictionary<int, HashSet<int>>();
        foreach (var p in pairs) {
            if (!graph.ContainsKey(p[0])) graph[p[0]] = new HashSet<int>();
            if (!graph.ContainsKey(p[1])) graph[p[1]] = new HashSet<int>();
            graph[p[0]].Add(p[1]);
            graph[p[1]].Add(p[0]);
        }
        if (graph.Count == 0) return 0;
        int root = -1;
        int maxSize = -1;
        foreach (var kv in graph) {
            if (kv.Value.Count > maxSize) {
                maxSize = kv.Value.Count;
                root = kv.Key;
            }
        }
        if (graph[root].Count != graph.Count - 1) return 0;

        int ans = 1;
        foreach (var kv in graph) {
            int node = kv.Key;
            var neighbors = kv.Value;
            if (node == root) continue;
            var parents = neighbors.Where(cand => graph[cand].Count >= neighbors.Count).ToList();
            if (parents.Count == 0) return 0;
            int parent = parents[0];
            foreach (int cand in parents) {
                if (graph[cand].Count < graph[parent].Count) parent = cand;
            }
            var union = new HashSet<int>(graph[parent]);
            union.Add(parent);
            if (!union.IsSupersetOf(neighbors)) return 0;
            if (neighbors.Count == graph[parent].Count) ans = 2;
        }
        return ans;
    }
}
