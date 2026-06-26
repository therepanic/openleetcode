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
    int diameterOfBinaryTree(TreeNode* root) {
        return diameter(root);
    }
    
private:
    int height(TreeNode* node) {
        if (node == nullptr) return 0;
        return 1 + max(height(node->left), height(node->right));
    }
    
    int diameter(TreeNode* node) {
        if (node == nullptr) return 0;
        int diameterThroughNode = height(node->left) + height(node->right);
        int leftDiameter = diameter(node->left);
        int rightDiameter = diameter(node->right);
        return max(diameterThroughNode, max(leftDiameter, rightDiameter));
    }
};
