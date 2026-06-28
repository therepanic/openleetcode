public class Solution {
    public bool IsBipartite(int[][] graph) {
        int N = graph.Length;
        int[] colors = new int[N];
        for (int i = 0; i < N; i++) {
            colors[i] = -1;
        }
        
        for (int u = 0; u < N; u++) {
            if (colors[u] == -1) {
                if (!CheckBipartite(u, 0, colors, graph)) {
                    return false;
                }
            }
        }
        return true;
    }
    
    private bool CheckBipartite(int u, int currColor, int[] colors, int[][] graph) {
        colors[u] = currColor;
        foreach (int v in graph[u]) {
            if (colors[v] == -1) {
                if (!CheckBipartite(v, 1 - currColor, colors, graph)) {
                    return false;
                }
            } else {
                if (colors[v] == currColor) {
                    return false;
                }
            }
        }
        return true;
    }
}
