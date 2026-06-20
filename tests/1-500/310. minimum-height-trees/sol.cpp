class Solution {
public:
    vector<int> findMinHeightTrees(int n, vector<vector<int>>& edges) {
        if (n < 3) {
            vector<int> result(n);
            iota(result.begin(), result.end(), 0);
            return result;
        }

        vector<unordered_set<int>> adjacencyList(n);
        for (const auto& edge : edges) {
            int a = edge[0], b = edge[1];
            adjacencyList[a].insert(b);
            adjacencyList[b].insert(a);
        }

        vector<int> leaves;
        for (int i = 0; i < n; ++i) {
            if (adjacencyList[i].size() == 1) {
                leaves.push_back(i);
            }
        }

        int remainingNodes = n;
        while (remainingNodes > 2) {
            remainingNodes -= leaves.size();
            vector<int> newLeaves;
            for (int leaf : leaves) {
                int neighbor = *adjacencyList[leaf].begin();
                adjacencyList[neighbor].erase(leaf);
                if (adjacencyList[neighbor].size() == 1) {
                    newLeaves.push_back(neighbor);
                }
            }
            leaves = newLeaves;
        }

        return leaves;
    }
};
