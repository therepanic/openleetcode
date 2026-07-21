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
    int goodNodes(TreeNode* root) {
        function<int(TreeNode*, int)> dfs = [&](TreeNode* node, int maxSoFar) -> int {
            if (!node) return 0;
            int count = node->val >= maxSoFar ? 1 : 0;
            int newMax = max(maxSoFar, node->val);
            count += dfs(node->left, newMax);
            count += dfs(node->right, newMax);
            return count;
        };
        return dfs(root, root->val);
    }
};
