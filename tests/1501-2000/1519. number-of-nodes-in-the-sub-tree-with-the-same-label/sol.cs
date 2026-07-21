public class Solution {
    public int[] CountSubTrees(int n, int[][] edges, string labels) {
        var matrix = new List<int>[n];
        for (int i = 0; i < n; i++) {
            matrix[i] = new List<int>();
        }
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1];
            matrix[u].Add(v);
            matrix[v].Add(u);
        }

        var parent = new int[n];
        Array.Fill(parent, -1);
        var order = new List<int> { 0 };
        for (int i = 0; i < order.Count; i++) {
            int node = order[i];
            foreach (int child in matrix[node]) {
                if (child != parent[node]) {
                    parent[child] = node;
                    order.Add(child);
                }
            }
        }

        var counts = new int[n][];
        for (int i = 0; i < n; i++) {
            counts[i] = new int[26];
        }
        var ans = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int node = order[i];
            int label = labels[node] - 'a';
            counts[node][label]++;
            ans[node] = counts[node][label];
            if (parent[node] != -1) {
                for (int j = 0; j < 26; j++) {
                    counts[parent[node]][j] += counts[node][j];
                }
            }
        }
        return ans;
    }
}
