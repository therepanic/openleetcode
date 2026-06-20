class Solution {
public:
    int best;

    int dfs(TreeNode* node) {
        if (node == nullptr) {
            return 0;
        }
        int left = max(0, dfs(node->left));
        int right = max(0, dfs(node->right));
        best = max(best, node->val + left + right);
        return node->val + max(left, right);
    }

    int maxPathSum(TreeNode* root) {
        best = root->val;
        dfs(root);
        return best;
    }
};
