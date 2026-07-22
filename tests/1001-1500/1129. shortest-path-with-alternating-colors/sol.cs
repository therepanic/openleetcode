public class Solution {
    public int[] ShortestAlternatingPaths(int n, int[][] redEdges, int[][] blueEdges) {
        int[] ans = new int[n];
        Array.Fill(ans, -1);
        
        List<(int, int)>[] graph = new List<(int, int)>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<(int, int)>();
        }
        
        foreach (var e in redEdges) {
            graph[e[0]].Add((e[1], 1)); // 1 = red
        }
        foreach (var e in blueEdges) {
            graph[e[0]].Add((e[1], 2)); // 2 = blue
        }
        
        Queue<(int, int)> q = new Queue<(int, int)>(); // (node, prevColor): 0=init
        q.Enqueue((0, 0));
        
        int step = 0;
        while (q.Count > 0) {
            int size = q.Count;
            for (int i = 0; i < size; i++) {
                var (u, prevColor) = q.Dequeue();
                if (ans[u] == -1) {
                    ans[u] = step;
                }
                for (int j = 0; j < graph[u].Count; j++) {
                    var (v, edgeColor) = graph[u][j];
                    if (v == -1 || edgeColor == prevColor) continue;
                    q.Enqueue((v, edgeColor));
                    graph[u][j] = (-1, edgeColor);
                }
            }
            step++;
        }
        return ans;
    }
}
