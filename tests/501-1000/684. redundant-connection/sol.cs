public class Solution {
    public int[] FindRedundantConnection(int[][] edges) {
        int n = edges.Length;
        List<int>[] matrix = new List<int>[n + 1];
        for (int i = 0; i <= n; i++) {
            matrix[i] = new List<int>();
        }
        foreach (var edge in edges) {
            int a = edge[0], b = edge[1];
            matrix[a].Add(b);
            matrix[b].Add(a);
        }

        HashSet<int> visited = new HashSet<int>();
        HashSet<int> path = new HashSet<int>();
        int cycleStart = -1;

        Func<int, int, bool> dfs = null;
        dfs = (i, parent) => {
            if (visited.Contains(i)) return false;
            visited.Add(i);
            foreach (int node in matrix[i]) {
                if (!visited.Contains(node)) {
                    if (dfs(node, i)) {
                        if (cycleStart != -1) {
                            path.Add(node);
                        }
                        if (node == cycleStart) {
                            cycleStart = -1;
                        }
                        return true;
                    }
                } else if (node != parent) {
                    path.Add(node);
                    cycleStart = node;
                    return true;
                }
            }
            return false;
        };

        for (int i = n; i >= 1; i--) {
            if (dfs(i, -1)) break;
        }

        for (int k = n - 1; k >= 0; k--) {
            int a = edges[k][0], b = edges[k][1];
            if (path.Contains(a) && path.Contains(b)) {
                return new int[] { a, b };
            }
        }
        return new int[0];
    }
}
