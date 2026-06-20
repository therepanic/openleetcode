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
    int kthSmallest(TreeNode* root, int k) {
        vector<int> sortedElements = inorderTraversal(root);
        return sortedElements[k - 1];
    }
    
private:
    vector<int> inorderTraversal(TreeNode* node) {
        if (!node) return {};
        vector<int> left = inorderTraversal(node->left);
        vector<int> right = inorderTraversal(node->right);
        left.push_back(node->val);
        left.insert(left.end(), right.begin(), right.end());
        return left;
    }
};
