class Solution {
public:
    vector<vector<int>> criticalConnections(int n, vector<vector<int>>& connections) {
        vector<vector<int>> graph(n);
        for (auto& edge : connections) {
            int u = edge[0], v = edge[1];
            graph[u].push_back(v);
            graph[v].push_back(u);
        }
        
        vector<int> disc(n, -1), low(n, 0);
        int timer = 0;
        vector<vector<int>> bridges;
        vector<int> iterIdx(n, 0);
        
        for (int start = 0; start < n; start++) {
            if (disc[start] != -1) continue;
            
            vector<pair<int, int>> stack;
            disc[start] = low[start] = timer++;
            stack.push_back({start, -1});
            
            while (!stack.empty()) {
                auto [node, parent] = stack.back();
                auto& neighbors = graph[node];
                
                if (iterIdx[node] < neighbors.size()) {
                    int nb = neighbors[iterIdx[node]++];
                    if (nb == parent) continue;
                    
                    if (disc[nb] == -1) {
                        disc[nb] = low[nb] = timer++;
                        stack.push_back({nb, node});
                    } else {
                        low[node] = min(low[node], disc[nb]);
                    }
                } else {
                    stack.pop_back();
                    if (!stack.empty()) {
                        int par = stack.back().first;
                        low[par] = min(low[par], low[node]);
                        if (low[node] > disc[par]) {
                            bridges.push_back({par, node});
                        }
                    }
                }
            }
        }
        
        return bridges;
    }
};
