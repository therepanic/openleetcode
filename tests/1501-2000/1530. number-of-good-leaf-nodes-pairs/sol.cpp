/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int countPairs(TreeNode* root, int distance) {
        unordered_map<TreeNode*, vector<TreeNode*>> graph;
        function<void(TreeNode*, TreeNode*)> dfs = [&](TreeNode* node, TreeNode* parent) {
            if (!node) return;
            if (parent) {
                graph[parent].push_back(node);
                graph[node].push_back(parent);
            }
            dfs(node->left, node);
            dfs(node->right, node);
        };
        dfs(root, nullptr);

        vector<TreeNode*> leaves;
        for (auto& [node, _] : graph) {
            if (!node->left && !node->right) leaves.push_back(node);
        }

        int ans = 0;
        for (int i = 0; i < leaves.size(); i++) {
            TreeNode* leaf = leaves[i];
            queue<pair<TreeNode*, int>> q;
            unordered_set<TreeNode*> visited;
            q.push({leaf, 0});
            visited.insert(leaf);

            while (!q.empty()) {
                auto [node, dist] = q.front(); q.pop();
                if (dist >= distance) continue;
                for (auto& nei : graph[node]) {
                    if (!visited.count(nei)) {
                        visited.insert(nei);
                        q.push({nei, dist + 1});
                        if (!nei->left && !nei->right) {
                            auto it = find(leaves.begin(), leaves.end(), nei);
                            if (it - leaves.begin() > i) ans++;
                        }
                    }
                }
            }
        }
        return ans;
    }
};
