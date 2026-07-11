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
    TreeNode* bstToGst(TreeNode* root) {
        int sum = 0;
        traversal(root, sum);
        return root;
    }
    
private:
    void traversal(TreeNode* node, int& sum) {
        if (node->right) {
            traversal(node->right, sum);
        }
        sum += node->val;
        node->val = sum;
        if (node->left) {
            traversal(node->left, sum);
        }
    }
};
