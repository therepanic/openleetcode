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
    int findSecondMinimumValue(TreeNode* root) {
        int first = root->val;
        long long second = LLONG_MAX;
        
        function<void(TreeNode*)> dfs = [&](TreeNode* node) {
            if (!node) return;
            if (first < node->val && node->val < second) {
                second = node->val;
            }
            dfs(node->left);
            dfs(node->right);
        };
        
        dfs(root);
        return second == LLONG_MAX ? -1 : (int)second;
    }
};
