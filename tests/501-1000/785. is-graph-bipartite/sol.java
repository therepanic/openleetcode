class Solution {
    public boolean isBipartite(int[][] graph) {
        int N = graph.length;
        int[] colors = new int[N];
        for (int i = 0; i < N; i++) {
            colors[i] = -1;
        }
        
        for (int u = 0; u < N; u++) {
            if (colors[u] == -1) {
                if (!checkBipartite(u, 0, colors, graph)) {
                    return false;
                }
            }
        }
        return true;
    }
    
    private boolean checkBipartite(int u, int currColor, int[] colors, int[][] graph) {
        colors[u] = currColor;
        for (int v : graph[u]) {
            if (colors[v] == -1) {
                if (!checkBipartite(v, 1 - currColor, colors, graph)) {
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
