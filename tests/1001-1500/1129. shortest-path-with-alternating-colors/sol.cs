public class Solution {
    public int[] ShortestAlternatingPaths(int n, int[][] redEdges, int[][] blueEdges) {
        int[] ans = new int[n];
        Array.Fill(ans, -1);
        
        List<(int, int)>[] graph = new List<(int, int)>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<(int, int)>();
        }
        
        foreach (var edge in redEdges) {
            graph[edge[0]].Add((edge[1], 1)); // 1-red
        }
        foreach (var edge in blueEdges) {
            graph[edge[0]].Add((edge[1], 2)); // 2-blue
        }
        
        Queue<(int, int)> q = new Queue<(int, int)>();
        q.Enqueue((0, 0)); // (node, prevColor): 0-init, 1-red, 2-blue
        
        int step = 0;
        while (q.Count > 0) {
            int size = q.Count;
            for (int i = 0; i < size; i++) {
                var (u, prevColor) = q.Dequeue();
                if (ans[u] == -1) {
                    ans[u] = step;
                }
                var neighbors = graph[u];
                for (int j = 0; j < neighbors.Count; j++) {
                    var (v, edgeColor) = neighbors[j];
                    if (v == -1 || edgeColor == prevColor) continue;
                    q.Enqueue((v, edgeColor));
                    neighbors[j] = (-1, edgeColor);
                }
            }
            step++;
        }
        return ans;
    }
}
