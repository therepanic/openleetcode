class Solution {
public:
    long long sumNumbers(TreeNode* root) {
        return dfs(root, 0);
    }

    long long dfs(TreeNode* node, long long current) {
        if (node == nullptr) {
            return 0;
        }
        current = current * 10 + node->val;
        if (node->left == nullptr && node->right == nullptr) {
            return current;
        }
        return dfs(node->left, current) + dfs(node->right, current);
    }
};
