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
    TreeNode* insertIntoMaxTree(TreeNode* root, int val) {
        function<TreeNode*(TreeNode*)> dfs = [&](TreeNode* node) -> TreeNode* {
            if (!node) {
                return new TreeNode(val);
            }
            if (node->val > val) {
                node->right = dfs(node->right);
                return node;
            }
            TreeNode* temp = new TreeNode(val);
            temp->left = node;
            return temp;
        };
        return dfs(root);
    }
};
