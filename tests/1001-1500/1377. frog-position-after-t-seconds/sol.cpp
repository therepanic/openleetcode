class Solution {
public:
    double frogPosition(int n, vector<vector<int>>& edges, int t, int target) {
        unordered_map<int, unordered_set<int>> neighbors;
        for (int i = 1; i <= n; i++) {
            neighbors[i] = unordered_set<int>();
        }
        for (const auto& edge : edges) {
            int a = edge[0], b = edge[1];
            neighbors[a].insert(b);
            neighbors[b].insert(a);
        }
        
        unordered_set<int> visited;
        double probability = 0.0;
        
        function<void(int, double, int)> dfs = [&](int vertex, double chance, int elapsed) {
            if (elapsed == t) {
                if (vertex == target) {
                    probability = chance;
                }
                return;
            }
            visited.insert(vertex);
            vector<int> choices;
            for (int child : neighbors[vertex]) {
                if (visited.find(child) == visited.end()) {
                    choices.push_back(child);
                }
            }
            
            if (choices.empty()) {
                dfs(vertex, chance, elapsed + 1);
            } else {
                for (int child : choices) {
                    dfs(child, chance / choices.size(), elapsed + 1);
                }
            }
        };
        
        dfs(1, 1.0, 0);
        return probability;
    }
};
