class Solution {
    public double maxProbability(int n, int[][] edges, double[] succProb, int start_node, int end_node) {
        double[] dist = new double[n];
        dist[start_node] = 1.0;
        
        for (int k = 0; k < n - 1; k++) {
            boolean updated = false;
            for (int i = 0; i < edges.length; i++) {
                int u = edges[i][0];
                int v = edges[i][1];
                if (dist[u] * succProb[i] > dist[v]) {
                    dist[v] = dist[u] * succProb[i];
                    updated = true;
                }
                if (dist[v] * succProb[i] > dist[u]) {
                    dist[u] = dist[v] * succProb[i];
                    updated = true;
                }
            }
            if (!updated) break;
        }
        
        return dist[end_node];
    }
}
