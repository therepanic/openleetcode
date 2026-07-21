class Solution {
public:
    vector<int> shortestAlternatingPaths(int n, vector<vector<int>>& redEdges, vector<vector<int>>& blueEdges) {
        vector<int> ans(n, -1);
        vector<vector<pair<int, int>>> graph(n); // (to, color): 1=red, 2=blue
        
        for (auto& e : redEdges) {
            graph[e[0]].push_back({e[1], 1});
        }
        for (auto& e : blueEdges) {
            graph[e[0]].push_back({e[1], 2});
        }
        
        queue<pair<int, int>> q; // (node, prevColor): 0=init
        q.push({0, 0});
        
        int step = 0;
        while (!q.empty()) {
            int size = q.size();
            for (int i = 0; i < size; i++) {
                auto [u, prevColor] = q.front();
                q.pop();
                if (ans[u] == -1) {
                    ans[u] = step;
                }
                for (int j = 0; j < graph[u].size(); j++) {
                    auto& [v, edgeColor] = graph[u][j];
                    if (v == -1 || edgeColor == prevColor) continue;
                    q.push({v, edgeColor});
                    v = -1;
                }
            }
            step++;
        }
        return ans;
    }
};
