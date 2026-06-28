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
    int prev = -1;
    int minDiff = INT_MAX;
    
    void inorder(TreeNode* root) {
        if (!root) return;
        inorder(root->left);
        if (prev != -1) {
            int diff = root->val - prev;
            if (diff < minDiff) {
                minDiff = diff;
            }
        }
        prev = root->val;
        inorder(root->right);
    }
    
public:
    int minDiffInBST(TreeNode* root) {
        inorder(root);
        return minDiff;
    }
};
