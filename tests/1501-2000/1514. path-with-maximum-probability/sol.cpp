class Solution {
public:
    double maxProbability(int n, vector<vector<int>>& edges, vector<double>& succProb, int start_node, int end_node) {
        vector<double> dist(n, 0.0);
        dist[start_node] = 1.0;
        
        for (int k = 0; k < n - 1; ++k) {
            bool updated = false;
            for (int i = 0; i < edges.size(); ++i) {
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
};
