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
    vector<vector<int>> verticalTraversal(TreeNode* root) {
        vector<tuple<int, int, int>> nodes;
        
        function<void(TreeNode*, int, int)> dfs = [&](TreeNode* node, int row, int col) {
            if (!node) return;
            nodes.emplace_back(col, row, node->val);
            dfs(node->left, row + 1, col - 1);
            dfs(node->right, row + 1, col + 1);
        };
        
        dfs(root, 0, 0);
        
        sort(nodes.begin(), nodes.end());
        
        vector<vector<int>> res;
        int prev_col = INT_MIN;
        
        for (const auto& [col, row, val] : nodes) {
            if (col != prev_col) {
                res.push_back({});
                prev_col = col;
            }
            res.back().push_back(val);
        }
        
        return res;
    }
};
