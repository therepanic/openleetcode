class Solution {
public:
    bool possibleBipartition(int n, vector<vector<int>>& dislikes) {
        unordered_map<int, vector<int>> graph;
        for (auto& edge : dislikes) {
            int u = edge[0], v = edge[1];
            graph[u].push_back(v);
            graph[v].push_back(u);
        }
        
        vector<int> color(n + 1, 0);
        
        for (int node = 1; node <= n; node++) {
            if (color[node] != 0 || graph.find(node) == graph.end()) {
                continue;
            }
            
            queue<int> q;
            q.push(node);
            color[node] = 1;
            
            while (!q.empty()) {
                int curr = q.front();
                q.pop();
                
                for (int neighbor : graph[curr]) {
                    if (color[neighbor] == color[curr]) {
                        return false;
                    }
                    
                    if (color[neighbor] == 0) {
                        color[neighbor] = -color[curr];
                        q.push(neighbor);
                    }
                }
            }
        }
        
        return true;
    }
};
