class Solution {
public:
    int checkWays(vector<vector<int>>& pairs) {
        unordered_map<int, unordered_set<int>> graph;
        for (auto& p : pairs) {
            graph[p[0]].insert(p[1]);
            graph[p[1]].insert(p[0]);
        }
        if (graph.empty()) return 0;
        int root = -1;
        int maxSize = -1;
        for (auto& [node, neighbors] : graph) {
            if ((int)neighbors.size() > maxSize) {
                maxSize = neighbors.size();
                root = node;
            }
        }
        if ((int)graph[root].size() != (int)graph.size() - 1) return 0;

        int ans = 1;
        for (auto& [node, neighbors] : graph) {
            if (node == root) continue;
            vector<int> parents;
            for (int cand : neighbors) {
                if ((int)graph[cand].size() >= (int)neighbors.size()) parents.push_back(cand);
            }
            if (parents.empty()) return 0;
            int parent = parents[0];
            for (int cand : parents) {
                if (graph[cand].size() < graph[parent].size()) parent = cand;
            }
            unordered_set<int> unionSet = graph[parent];
            unionSet.insert(parent);
            for (int n : neighbors) {
                if (!unionSet.count(n)) return 0;
            }
            if (neighbors.size() == graph[parent].size()) ans = 2;
        }
        return ans;
    }
};
