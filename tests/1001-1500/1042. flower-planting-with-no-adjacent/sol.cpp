class Solution {
public:
    vector<int> gardenNoAdj(int n, vector<vector<int>>& paths) {
        unordered_map<int, vector<int>> graph;
        
        for (auto& path : paths) {
            int u = path[0];
            int v = path[1];
            graph[u].push_back(v);
            graph[v].push_back(u);
        }
        
        for (int node = 1; node <= n; node++) {
            if (graph.find(node) == graph.end()) {
                graph[node] = vector<int>();
            }
        }
        
        vector<int> answer(n + 1, 0);
        
        for (int i = 1; i <= n; i++) {
            unordered_set<int> used;
            for (int nei : graph[i]) {
                used.insert(answer[nei]);
            }
            
            for (int flower = 1; flower <= 4; flower++) {
                if (used.find(flower) == used.end()) {
                    answer[i] = flower;
                    break;
                }
            }
        }
        
        return vector<int>(answer.begin() + 1, answer.end());
    }
};
