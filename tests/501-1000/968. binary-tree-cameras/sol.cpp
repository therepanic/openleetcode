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
    int minCameraCover(TreeNode* root) {
        function<int(TreeNode*)> dfs = [&](TreeNode* node) -> int {
            if (!node) return 0;
            int res = dfs(node->left) + dfs(node->right);
            int curr = INT_MAX;
            if (node->left) curr = min(curr, node->left->val);
            if (node->right) curr = min(curr, node->right->val);
            if (curr == 0) {
                node->val = 1;
                res += 1;
            } else if (curr == 1) {
                node->val = 2;
            }
            return res;
        };
        return dfs(root) + (root->val == 0 ? 1 : 0);
    }
};
