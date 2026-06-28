class Solution {
public:
    bool isBipartite(vector<vector<int>>& graph) {
        int N = graph.size();
        vector<int> colors(N, -1);
        
        for (int u = 0; u < N; u++) {
            if (colors[u] == -1) {
                if (!checkBipartite(u, 0, colors, graph)) {
                    return false;
                }
            }
        }
        return true;
    }
    
private:
    bool checkBipartite(int u, int currColor, vector<int>& colors, vector<vector<int>>& graph) {
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
};
