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
    TreeNode* lcaDeepestLeaves(TreeNode* root) {
        return dfs(root, 0).first;
    }
    
private:
    pair<TreeNode*, int> dfs(TreeNode* node, int depth) {
        if (!node) {
            return {nullptr, depth};
        }
        
        auto left = dfs(node->left, depth + 1);
        auto right = dfs(node->right, depth + 1);
        
        if (left.second > right.second) {
            return {left.first, left.second};
        } else if (right.second > left.second) {
            return {right.first, right.second};
        } else {
            return {node, left.second};
        }
    }
};
