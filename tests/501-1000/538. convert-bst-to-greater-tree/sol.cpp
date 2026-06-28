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
private:
    int total = 0;
    
    void traverse(TreeNode* node) {
        if (!node) {
            return;
        }
        traverse(node->right);
        total += node->val;
        node->val = total;
        traverse(node->left);
    }
    
public:
    TreeNode* convertBST(TreeNode* root) {
        traverse(root);
        return root;
    }
};
