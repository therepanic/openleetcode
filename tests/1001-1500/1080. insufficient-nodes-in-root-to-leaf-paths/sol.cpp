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
    TreeNode* sufficientSubset(TreeNode* root, int limit) {
        function<bool(TreeNode*, int)> dfs = [&](TreeNode* node, int pathSum) -> bool {
            if (!node) {
                return false;
            }
            
            int curr = pathSum + node->val;
            
            if (!node->left && !node->right) {
                return curr >= limit;
            }
            
            bool leftGood = dfs(node->left, curr);
            bool rightGood = dfs(node->right, curr);
            
            if (!leftGood) {
                node->left = nullptr;
            }
            if (!rightGood) {
                node->right = nullptr;
            }
            
            return leftGood || rightGood;
        };
        
        return dfs(root, 0) ? root : nullptr;
    }
};
