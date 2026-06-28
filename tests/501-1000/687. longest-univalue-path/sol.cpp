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
    int longestUnivaluePath(TreeNode* root) {
        int ans = 0;
        function<int(TreeNode*)> solve = [&](TreeNode* node) -> int {
            if (!node) return 0;
            int left = solve(node->left);
            int right = solve(node->right);
            int leftPath = 0;
            int rightPath = 0;
            if (node->left && node->left->val == node->val) {
                leftPath = left + 1;
            }
            if (node->right && node->right->val == node->val) {
                rightPath = right + 1;
            }
            ans = max(ans, leftPath + rightPath);
            return max(leftPath, rightPath);
        };
        solve(root);
        return ans;
    }
};
