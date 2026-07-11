class Solution {
public:
    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        int target = graph.size() - 1;
        vector<vector<int>> result;
        queue<pair<int, vector<int>>> q;
        q.push({0, {0}});
        
        while (!q.empty()) {
            auto [node, path] = q.front();
            q.pop();
            
            if (node == target) {
                result.push_back(path);
                continue;
            }
            
            for (int neighbor : graph[node]) {
                vector<int> newPath = path;
                newPath.push_back(neighbor);
                q.push({neighbor, newPath});
            }
        }
        
        return result;
    }
};
